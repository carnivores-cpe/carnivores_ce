//============ Adelphos Pro ================//
//-> Improved AI code to replace functions defined in Characters.cpp

#include "hunt.h"

//-> Extern Functions
void ThinkY_Beta_Gamma(TCharacter *cptr, float blook, float glook, float blim, float glim);
void ProcessPrevPhase(TCharacter *cptr);
void ActivateCharacterFx(TCharacter *cptr);

void AnimateGenericDead(TCharacter *cptr)
{
	//======== Adelphos Pro ===========//
	//-> Generic Death Animation Code.
	//-> Special characteristics will be based on 
	//external data editible in the res files.
	//-> This code animates dealth for all creatures

	if (cptr->Phase!=cptr->pinfo->DIE[0] && cptr->Phase!=cptr->pinfo->SLEEP[0]) {
		if (cptr->PPMorphTime>128) {
			cptr->PrevPhase = cptr->Phase;
			cptr->PrevPFTime  = cptr->FTime;
			cptr->PPMorphTime = 0; 
		}    
		cptr->FTime = 0;
		cptr->Phase = cptr->pinfo->DIE[0];   
		ActivateCharacterFx(cptr);
	} else {   
    ProcessPrevPhase(cptr);

    cptr->FTime+=TimeDt;      
    if (cptr->FTime >= cptr->pinfo->Animation[cptr->Phase].AniTime)
		if (Tranq) {
			cptr->FTime=0;
			cptr->Phase = cptr->pinfo->SLEEP[0];
			ActivateCharacterFx(cptr);
		} else
        cptr->FTime = cptr->pinfo->Animation[cptr->Phase].AniTime-1;
  }

//======= movement ===========//
   DeltaFunc(cptr->vspeed, 0, TimeDt / 800.f);          
   cptr->pos.x+=cptr->lookx * cptr->vspeed * TimeDt;
   cptr->pos.z+=cptr->lookz * cptr->vspeed * TimeDt;
   //--ADP---
   //-> Check if the dinosaur is on water and not on the ground... if so, add float down animation...
   if ((cptr->pos.y+280*cptr->scale) - GetLandH(cptr->pos.x, cptr->pos.z) > 280 * cptr->scale) {
	   //Sink....
	   cptr->pos.y -= 0.5*TimeDt;
	   //-> Keep looping the dealth animation
	/*   if (cptr->FTime == cptr->pinfo->Animation[cptr->Phase].AniTime-1) {
		   cptr->FTime = 0;
	   }*/
   } else {
		ThinkY_Beta_Gamma(cptr, 100, 96, 0.6f, 0.5f);
		DeltaFunc(cptr->gamma, cptr->tggamma, TimeDt / 1600.f);
   }
}


/**
* CharacterAnimation class
* Load the animation information.
* This code does not manage the actual model animating. This is a child of CharacterModel, and therefore only 
* contains ONE animation data (which may contain several frames within itself).
* It does, however, contain its own sound and manages the playing of it(maybe?).
* Each animation has only one sound at the moment.
* Access is public, because CharacterAnimation is primarily a container of information. It does not manage its 'models'
* animation process.
*/
class CharacterAnimation
{
public:
	char aniName[32];
	int aniKPS, FramesCount, AniTime;
	short int* aniData;

	/* Sound */
	int  SoundLength;
	short int* SoundData;

	/**
	* Process the animation.
	* 1) Play the sound if needed
	*/
	void Process()
	{
	}
};

/**
* CharacterModel class
* Contains Animation and model data for the model. The model hasMany animations and hasOne model data.
* This class only manages animation and model data, not sounds or AI characteristics.
*/
class CharacterModel
{
protected:
	char Name[32];
	/* Animation */
	int AniCount,SfxCount;
	int AniCurrentPhase;
	CharacterAnimation Animation[128];  

	/* Internal model data */
	TModel* mptr;

	/**
	* Generate alpha transparency for model textures
	* NOTE: Only in D3d or Glide mode; not in software
	* @access protected
	*/
	void _generateAlphaFlags(TModel *mptr)
	{
#ifdef _soft
#else

		int w;
		BOOL Opacity = FALSE;
		WORD* tptr = mptr->lpTexture;    

		for (w=0; w<mptr->FCount; w++)
			if ((mptr->gFace[w].Flags & sfOpacity)>0) Opacity = TRUE;

		if (Opacity) {
			for (w=0; w<256*256; w++)
				if ( *(tptr+w)>0 ) *(tptr+w)=(*(tptr+w)) + 0x8000; }
		else 
			for (w=0; w<256*256; w++)
				*(tptr+w)=(*(tptr+w)) + 0x8000;

		tptr = mptr->lpTexture2;    
		if (tptr==NULL) return;

		if (Opacity) {
			for (w=0; w<128*128; w++)
				if ( (*(tptr+w))>0 ) *(tptr+w)=(*(tptr+w)) + 0x8000; }
		else 
			for (w=0; w<128*128; w++)
				*(tptr+w)=(*(tptr+w)) + 0x8000;

		tptr = mptr->lpTexture3;    
		if (tptr==NULL) return;

		if (Opacity) {
			for (w=0; w<64*64; w++)
				if ( (*(tptr+w))>0 ) *(tptr+w)=(*(tptr+w)) + 0x8000; }
		else 
			for (w=0; w<64*64; w++)
				*(tptr+w)=(*(tptr+w)) + 0x8000;

#endif  
	}

	/**
	* Generate the models mipmaps on the textures
	* @access protected
	*/
	void _generateModelMipMaps(TModel *mptr)
	{
		int th = (mptr->TextureHeight) / 2;        
		mptr->lpTexture2 = 
			(WORD*) _HeapAlloc(Heap, HEAP_ZERO_MEMORY , (1+th)*128*2);                
		this->__CreateMipMapMT(mptr->lpTexture2, mptr->lpTexture, th);        

		th = (mptr->TextureHeight) / 4;        
		mptr->lpTexture3 = 
			(WORD*) _HeapAlloc(Heap, HEAP_ZERO_MEMORY , (1+th)*64*2);
		this->__CreateMipMapMT2(mptr->lpTexture3, mptr->lpTexture2, th);        
	}
	void __CreateMipMapMT(WORD* dst, WORD* src, int H)
	{
		for (int y=0; y<H; y++) 
			for (int x=0; x<127; x++) {
				int C1 = *(src + (x*2+0) + (y*2+0)*256);
				int C2 = *(src + (x*2+1) + (y*2+0)*256);
				int C3 = *(src + (x*2+0) + (y*2+1)*256);
				int C4 = *(src + (x*2+1) + (y*2+1)*256);

				if (!HARD3D) { C1>>=1; C2>>=1; C3>>=1; C4>>=1; }

				/*if (C1 == 0 && C2!=0) C1 = C2;
				if (C1 == 0 && C3!=0) C1 = C3;
				if (C1 == 0 && C4!=0) C1 = C4;*/

				if (C1 == 0) { *(dst + x + y*128) = 0; continue; }

				//C4 = C1; 

				if (!C2) C2=C1;
				if (!C3) C3=C1;
				if (!C4) C4=C1;

				int B = ( ((C1>> 0) & 31) + ((C2 >>0) & 31) + ((C3 >>0) & 31) + ((C4 >>0) & 31) +2 ) >> 2;
				int G = ( ((C1>> 5) & 31) + ((C2 >>5) & 31) + ((C3 >>5) & 31) + ((C4 >>5) & 31) +2 ) >> 2;
				int R = ( ((C1>>10) & 31) + ((C2>>10) & 31) + ((C3>>10) & 31) + ((C4>>10) & 31) +2 ) >> 2;
				if (!HARD3D) *(dst + x + y * 128) = HiColor(R,G,B)*2;
				else *(dst + x + y * 128) = HiColor(R,G,B);
			}
	}
	void __CreateMipMapMT2(WORD* dst, WORD* src, int H)
	{
		for (int y=0; y<H; y++) 
			for (int x=0; x<63; x++) {
				int C1 = *(src + (x*2+0) + (y*2+0)*128);
				int C2 = *(src + (x*2+1) + (y*2+0)*128);
				int C3 = *(src + (x*2+0) + (y*2+1)*128);
				int C4 = *(src + (x*2+1) + (y*2+1)*128);

				if (!HARD3D) { C1>>=1; C2>>=1; C3>>=1; C4>>=1; }         

				if (C1 == 0) { *(dst + x + y*64) = 0; continue; }

				//C2 = C1; 

				if (!C2) C2=C1;
				if (!C3) C3=C1;
				if (!C4) C4=C1;

				int B = ( ((C1>> 0) & 31) + ((C2 >>0) & 31) + ((C3 >>0) & 31) + ((C4 >>0) & 31) +2 ) >> 2;
				int G = ( ((C1>> 5) & 31) + ((C2 >>5) & 31) + ((C3 >>5) & 31) + ((C4 >>5) & 31) +2 ) >> 2;
				int R = ( ((C1>>10) & 31) + ((C2>>10) & 31) + ((C3>>10) & 31) + ((C4>>10) & 31) +2 ) >> 2;
				if (!HARD3D) *(dst + x + y * 64) = HiColor(R,G,B)*2;
				else *(dst + x + y * 64) = HiColor(R,G,B);
			}
	}

	/**
	* Not sure what this does
	* @access protected
	*/
	void _DATASHIFT(WORD* d, int cnt)
	{
		cnt>>=1;
		/*
		for (int l=0; l<cnt; l++) 
		*(d+l)=(*(d+l)) & 0x3e0;
		*/
		if (HARD3D) return;

		for (int l=0; l<cnt; l++) 
			*(d+l)*=2;

	}

	/**
	* Brighten the texture according to user settings. Also, if its night time then apply the green effect as well
	* @access protected
	*/
	void _brightenTexture(WORD* A, int L)
	{
		int factor=OptBrightness + 128;
		//if (factor > 256) factor = (factor-256)*3/2 + 256;
		for (int c=0; c<L; c++) {
			WORD w = *(A +  c);
			int B = (w>> 0) & 31; 
			int G = (w>> 5) & 31; 
			int R = (w>>10) & 31; 
			B = (B * factor) >> 8; if (B > 31) B = 31;
			G = (G * factor) >> 8; if (G > 31) G = 31;
			R = (R * factor) >> 8; if (R > 31) R = 31;

			if (OptDayNight==2) { B=G>>3; R=G>>3; }

			*(A + c) = (B) + (G<<5) + (R<<10);
		}
	}

	/**
	* Release memory to loaded data and reset loaded data
	* @access protected
	*/
	void _releaseData()
	{
		/* Test that the model has been loaded... */
		if (!this->mptr) return;

		_HeapFree(Heap, 0, this->mptr);
		this->mptr = NULL;

		/* Release sounds */
		for (int c = 0; c<64; c++) {
			if (!this->Animation[c].SoundData) break;
			_HeapFree(Heap, 0, this->Animation[c].SoundData);
			this->Animation[c].SoundData = NULL;
		}

		/* Release animation data */
		for (int c = 0; c<64; c++) {
			if (!this->Animation[c].aniData) break;
			_HeapFree(Heap, 0, this->Animation[c].aniData);
			this->Animation[c].aniData = NULL;
		}


		this->AniCount = 0;
	}

	/**
	* Make final corrections/optimiztions to loaded model data.
	* @access protected
	*/
	void _correct()
	{
		TFace tface[1024];

		for (int f=0; f<this->mptr->FCount; f++) {	 
			if (!(this->mptr->gFace[f].Flags & sfDoubleSide))
				this->mptr->gFace[f].Flags |= sfNeedVC;
#ifdef _soft
			this->mptr->gFace[f].tax = (this->mptr->gFace[f].tax<<16) + 0x8000;
			this->mptr->gFace[f].tay = (this->mptr->gFace[f].tay<<16) + 0x8000;
			this->mptr->gFace[f].tbx = (this->mptr->gFace[f].tbx<<16) + 0x8000;
			this->mptr->gFace[f].tby = (this->mptr->gFace[f].tby<<16) + 0x8000;
			this->mptr->gFace[f].tcx = (this->mptr->gFace[f].tcx<<16) + 0x8000;
			this->mptr->gFace[f].tcy = (this->mptr->gFace[f].tcy<<16) + 0x8000;
#else
/*			fp_conv(&mptr->gFace[f].tax);
			fp_conv(&mptr->gFace[f].tay);
			fp_conv(&mptr->gFace[f].tbx);
			fp_conv(&mptr->gFace[f].tby);
			fp_conv(&mptr->gFace[f].tcx);
			fp_conv(&mptr->gFace[f].tcy); */    
#endif
		}

		int fp = 0;
		for (int f=0; f<this->mptr->FCount; f++) 
			if ( (this->mptr->gFace[f].Flags & (sfOpacity | sfTransparent))==0)
			{
				tface[fp] = this->mptr->gFace[f];
				fp++;
			}

			for (int f=0; f<this->mptr->FCount; f++) 
				if ( (this->mptr->gFace[f].Flags & sfOpacity)!=0)
				{
					tface[fp] = this->mptr->gFace[f];
					fp++;
				}

				for (int f=0; f<this->mptr->FCount; f++) 
					if ( (this->mptr->gFace[f].Flags & sfTransparent)!=0)
					{
						tface[fp] = this->mptr->gFace[f];
						fp++;
					}

					memcpy( this->mptr->gFace, tface, sizeof(tface) );
	}

public:
	/* Init a new model */
	CharacterModel()
	{
	}

	/**
	* Load from file
	*/
	bool Load(char* FName)
	{
		DWORD  l;

		this->_releaseData();

		HANDLE hfile = CreateFile(FName,
			GENERIC_READ, FILE_SHARE_READ,
			NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);

		if (hfile==INVALID_HANDLE_VALUE) {
			char sz[512];
			wsprintf( sz, "Error opening character file:\n%s.", FName );
			//DoHalt(sz);
			return false;
		}

		ReadFile(hfile, this->Name, 32, &l, NULL);
		ReadFile(hfile, &this->AniCount,  4, &l, NULL);
		ReadFile(hfile, &this->SfxCount,  4, &l, NULL);

		//============= read model =================//

		this->mptr = (TModel*) _HeapAlloc(Heap, 0, sizeof(TModel));

		ReadFile( hfile, &this->mptr->VCount,      4,         &l, NULL );
		ReadFile( hfile, &this->mptr->FCount,      4,         &l, NULL );
		ReadFile( hfile, &this->mptr->TextureSize, 4,         &l, NULL );
		ReadFile( hfile, this->mptr->gFace,       this->mptr->FCount<<6, &l, NULL );
		ReadFile( hfile, this->mptr->gVertex,      this->mptr->VCount<<4, &l, NULL );

		int ts = this->mptr->TextureSize;
		if (HARD3D) this->mptr->TextureHeight = 256;
		else  this->mptr->TextureHeight = this->mptr->TextureSize>>9;    
		this->mptr->TextureSize = this->mptr->TextureHeight*512;

		this->mptr->lpTexture = (WORD*) _HeapAlloc(Heap, 0, this->mptr->TextureSize);    

		ReadFile(hfile, this->mptr->lpTexture, ts, &l, NULL);

		this->_brightenTexture(this->mptr->lpTexture, ts/2);

		this->_DATASHIFT(this->mptr->lpTexture, this->mptr->TextureSize);
		//TODO:::
		this->_generateModelMipMaps(this->mptr);
		this->_generateAlphaFlags(this->mptr);

		//============= read animations =============//
		for (int a=0; a<this->AniCount; a++) {
			ReadFile(hfile, this->Animation[a].aniName, 32, &l, NULL);
			ReadFile(hfile, &this->Animation[a].aniKPS, 4, &l, NULL);
			ReadFile(hfile, &this->Animation[a].FramesCount, 4, &l, NULL);
			this->Animation[a].AniTime = (this->Animation[a].FramesCount * 1000) / this->Animation[a].aniKPS;
			this->Animation[a].aniData = (short int*) 
				_HeapAlloc(Heap, 0, (this->mptr->VCount*this->Animation[a].FramesCount*6) );

			ReadFile(hfile, this->Animation[a].aniData, (this->mptr->VCount*this->Animation[a].FramesCount*6), &l, NULL);
		}

		//============= read sound fx ==============//
		BYTE tmp[32];
		for (int s=0; s<this->SfxCount; s++) {
			ReadFile(hfile, tmp, 32, &l, NULL);
			ReadFile(hfile, &this->Animation[s].SoundLength, 4, &l, NULL);
			this->Animation[s].SoundData = (short int*) _HeapAlloc(Heap, 0, this->Animation[s].SoundLength);
			ReadFile(hfile, this->Animation[s].SoundData, this->Animation[s].SoundLength, &l, NULL);
		}

		for (int v=0; v<this->mptr->VCount; v++) {
			this->mptr->gVertex[v].x*=2.f;
			this->mptr->gVertex[v].y*=2.f;
			this->mptr->gVertex[v].z*=-2.f;
		}

		this->_correct();

		int tmpFX[64];
		ReadFile(hfile, tmpFX, 64*4, &l, NULL);
		if (l!=256)
			for (l=0; l<64; l++) tmpFX[l] = -1;
		CloseHandle(hfile);
		return true;
	}

	void Animate()
	{
	}

};

/**
* Generic Class for creatures. Includes basic AI, which can be overridden by each creature type
*/
class Creature
{
protected:
	CharacterModel ModelData;
	TDinoInfo BaseInfo;

	int Health;

	/* Member functions */
public:
	/**
	* Constructor 
	*/
	Creature()
	{
		/* Autoload a creature by default? */
	}

	/**
	* Load character information and characteristics
	*/
	bool Load(char* ScriptName)
	{
		// Load BaseInfo
		char* ModelFileName = ScriptName;
		char* AIFileName	= ScriptName;

		// Load Model
		this->ModelData.Load(ModelFileName);

		// Load character AI and data (health, points, power, etc)
		// TDinoInfo this->BaseInfo = GameResources::LoadDinoScript();

		// Reset current information to loaded data
		this->Reset();

		return true;
	}

	/**
	* Reset character information to the defaults. Totally blanks the creature and sets to default data
	*/
	void Reset()
	{
		this->Health = this->BaseInfo.Health0;
	}

	/**
	* Place the character at the specified location. Return true if OK. False if failed
	*/
	bool Place(float x, float y) 
	{
		return true;
	}

	/**
	* Update and process AI characteristics and move the character in response
	*/
	void Update()
	{
	}
};


class MemoryObject
{
protected:
	char* title;
	char* unique_id;
	void* size;
	void* attributes;

public:
	MemoryObject()
	{
		this->Load();
	}

	void Load()
	{
	}

	void AddAttribute(char* humanable_ident, char* quality)
	{
		CopyMemory(this->attributes, (void*)quality, sizeof(quality));
	}

	void* Dump()
	{
		return (void*)this;
	}
};

class CreatureBrain
{
protected:
	void* storage_memory;
	void* state_memory;

public:
	CreatureBrain()
	{
		this->Boot();
	}

	void Process()
	{
	}

	/**
	* Load main storage "memory" and temp/current_state "memory"
	*/
	void Boot()
	{
		FillMemory(this->state_memory, sizeof(this->state_memory), 0);
		FillMemory(this->storage_memory, sizeof(this->storage_memory), 0);

		this->LoadSampleStateMemory();
	}

	void Post(void* data)
	{
		CopyMemory(this->state_memory, data, sizeof(data));
	}

	void TestPokeBrain()
	{
		this->Post("[self]{from:cell_sensor;location:143;data:&3884753}");
	}

	void LoadSampleStateMemory()
	{
		MemoryObject sample_object;
		sample_object.AddAttribute("name","cell");

		CopyMemory(this->storage_memory, sample_object.Dump(), sizeof(sample_object));
	}
};