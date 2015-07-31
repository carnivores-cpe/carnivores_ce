#define _MAIN_
#include "Hunt.h"
#include "stdio.h"

float rav=0;
float rbv=0;

#ifdef _soft
BOOL PHONG = FALSE;
BOOL GOUR  = FALSE;
BOOL ENVMAP = FALSE;
#else
BOOL PHONG = TRUE;
BOOL GOUR  = TRUE;
BOOL ENVMAP = TRUE;
#endif

BOOL NeedRVM = TRUE;
float BinocularPower  = 2.5;
float wpshy = 0;
float wpshz = 0;
float wpnb  = 0;
int wpnlight;
int flashWarningTime;

void HideWeapon();
void PrintText(LPSTR s, int x, int y, int rgb);

char cheatcode[16] = "DEBUGUP";
int  cheati = 0;


void ResetMousePos()
{	
   SetCursorPos(VideoCX, VideoCY);    
}



float CalcFogLevel(Vector3d v)
{  
  if (!FOGON) return 0;
  BOOL vinfog = TRUE;
  int cf;  
  if (!UNDERWATER) {
	  cf = FogsMap[ ((int)(v.z + CameraZ))>>9 ][ ((int)(v.x + CameraX))>>9 ];
      if ((!cf) && CAMERAINFOG) { cf = CameraFogI; vinfog = FALSE; }	  
  } else cf = 127;	        
	  

  if (! (CAMERAINFOG | cf) ) return 0;
  TFogEntity *fptr;
  fptr = &FogsList[cf];
  CurFogColor = fptr->fogRGB;
  
  float d = VectorLength(v);

  v.y+=CameraY;
  
  float fla= -(v.y     - fptr->YBegin*ctHScale) / ctHScale;
  if (!vinfog) if (fla>0) fla=0;

  float flb = -(CameraY - fptr->YBegin*ctHScale) / ctHScale;
  if (!CAMERAINFOG) if (flb>0) flb=0;
  
  if (fla<0 && flb<0) return 0;    
  
  if (fla<0) { d*= flb / (flb-fla); fla = 0; }
  if (flb<0) { d*= fla / (fla-flb); flb = 0; }

  float fl = (fla + flb);

  fl *= (d+(fptr->Transp/2)) / fptr->Transp;
  
  return min(fl, fptr->FLimit);
}



void PreCashGroundModel()
{
   SKYDTime = RealTime>>1;
   int x,y;
   
   int kx = SKYDTime & 255;
   int ky = SKYDTime & 255;
   int SKYDT = SKYDTime>>8;

   VideoCX16 = VideoCX * 16;
   VideoCY16 = VideoCY * 16;
   VideoCXf  = (float)VideoCX;
   VideoCYf  = (float)VideoCY;
   CameraW16 = CameraW * 16;
   CameraH16 = CameraH * 16;

   BOOL FogFound = FALSE;
   NeedWater = FALSE;
   
   MapMinY = 10241024;
   Vector3d rv;


   for (y=-(ctViewR+3); y<(ctViewR+3); y++)
	for (x=-(ctViewR+3); x<(ctViewR+3); x++) {
  					
	  int r = max((max(y,-y)), (max(x,-x)));
	  if ( r>ctViewR1+4 )
	    if ( (x & 1) + (y & 1) > 0) continue; 	  

	  int xx = (CCX + x) & 1023;
	  int yy = (CCY + y) & 1023;      

	  v[0].x = xx*256 - CameraX;
      v[0].z = yy*256 - CameraZ;	  
	  v[0].y = (float)((int)HMap[yy][xx])*ctHScale - CameraY;


//========= water section ===========//

	//if (RunMode) 
	  if ((FMap[yy][xx] & fmWaterA)>0) {
		  rv = v[0];
		  rv.y = WaterList[ WMap[yy][xx] ].wlevel*ctHScale - CameraY; 

		  float wdelta = (float)sin(-pi/2 + RandomMap[yy & 31][xx & 31]/128+RealTime/200.f);          

		  if ( (FMap[yy][xx] & fmWater) && (r < ctViewR1-4)) {
           rv.x+=(float)sin(xx+yy + RealTime/200.f) * 16.f;
           rv.z+=(float)sin(pi/2.f + xx+yy + RealTime/200.f) * 16.f;
		  }

          rv = RotateVector(rv);
		  VMap2[128+y][128+x].v = rv;
	      
		  if (fabs(rv.x) > -rv.z + 1524) {		      
		   VMap2[128+y][128+x].DFlags = 128;		  
		  } else {
			NeedWater = TRUE;
			VMap2[128+y][128+x].Light = 168-(int)(wdelta*24);
			
			float Alpha;
			if (UNDERWATER) {				
				Alpha =	160 - VectorLength(rv)* 160 / 220 / ctViewR;
				if (Alpha<10) Alpha=10;
			} else
            if (r < ctViewR1+2) {		
			 int wi = WMap[yy][xx];
			 Alpha = (float)((WaterList[wi].wlevel - HMap[yy][xx])*2+4)*WaterList[wi].transp;
			 Alpha+=VectorLength(rv) / 256;
			 Alpha+=wdelta*2;
			 if (Alpha<0) Alpha=0;
			 Vector3d va = v[0]; 
			 NormVector(va,1.0f); va.y=-va.y;
			 if (va.y<0) va.y=0;
			 Alpha*=6.f/(va.y+0.1f);
			 if (Alpha>255) Alpha=255.f;
			} else Alpha = 255.f;

			VMap2[128+y][128+x].ALPHA=(int)Alpha;
			VMap2[128+y][128+x].Fog = 0;

			if (rv.z>-256.0) VMap2[128+y][128+x].DFlags=128; else {
#ifdef _soft
	          VMap2[128+y][128+x].scrx = VideoCX - (int)(rv.x / rv.z * CameraW);
	          VMap2[128+y][128+x].scry = VideoCY + (int)(rv.y / rv.z * CameraH);			  
			  			  
			  int DF = 0;
              if (VMap2[128+y][128+x].scrx < 0)     DF+=1;
	          if (VMap2[128+y][128+x].scrx > WinEX) DF+=2;
	          if (VMap2[128+y][128+x].scry < 0)     DF+=4;
	          if (VMap2[128+y][128+x].scry > WinEY) DF+=8;
#endif
#ifdef _3dfx
			  VMap2[128+y][128+x].scrx = VideoCX16 - (int)(rv.x / rv.z * CameraW16);
	          VMap2[128+y][128+x].scry = VideoCY16 + (int)(rv.y / rv.z * CameraH16);			  
			  			  
			  int DF = 0;
              if (VMap2[128+y][128+x].scrx < 0)        DF+=1;
	          if (VMap2[128+y][128+x].scrx > WinEX*16) DF+=2;
	          if (VMap2[128+y][128+x].scry < 0)        DF+=4;
	          if (VMap2[128+y][128+x].scry > WinEY*16) DF+=8;
#endif
#ifdef _d3d
			  VMap2[128+y][128+x].scrx = VideoCXf - (rv.x / rv.z * CameraW);
	          VMap2[128+y][128+x].scry = VideoCYf + (rv.y / rv.z * CameraH);			  
			  			  
			  int DF = 0;
              if (VMap2[128+y][128+x].scrx < 0)        DF+=1;
	          if (VMap2[128+y][128+x].scrx > WinEX)    DF+=2;
	          if (VMap2[128+y][128+x].scry < 0)        DF+=4;
	          if (VMap2[128+y][128+x].scry > WinEY)    DF+=8;
#endif
#ifdef _dx9
			  VMap2[128+y][128+x].scrx = VideoCXf - (rv.x / rv.z * CameraW);
	          VMap2[128+y][128+x].scry = VideoCYf + (rv.y / rv.z * CameraH);			  
			  			  
			  int DF = 0;
              if (VMap2[128+y][128+x].scrx < 0)        DF+=1;
	          if (VMap2[128+y][128+x].scrx > WinEX)    DF+=2;
	          if (VMap2[128+y][128+x].scry < 0)        DF+=4;
	          if (VMap2[128+y][128+x].scry > WinEY)    DF+=8;
#endif

			  VMap2[128+y][128+x].DFlags = DF;

			} 	              
		  }			  
	  }



#ifdef _soft
#else	  
	  if (r>ctViewR1-20 && r<ctViewR1+8)
		 if ( (x & 1) + (y & 1) > 0)
	  {
	   float y1;
	   float zd = (float)sqrt(v[0].x*v[0].x + v[0].z*v[0].z) / 256.f;
	   float k = (zd - (ctViewR1-8)) / 4.f;
	   if (k<0) k=0;
	   if (k>1) k=1;

	   if ((y & 1)==0) y1 = (float)((int)HMap[yy][xx-1]+HMap[yy][xx+1])*ctHScale/2 - CameraY; else
	   if ((x & 1)==0) y1 = (float)((int)HMap[yy-1][xx]+HMap[yy+1][xx])*ctHScale/2 - CameraY; else
		               y1 = (float)((int)HMap[yy-1][xx-1]+HMap[yy+1][xx+1])*ctHScale/2 - CameraY;

	   v[0].y = ((v[0].y+2) * (1-k) + (y1+8) * k);
	  }
#endif

      rv = RotateVector(v[0]);

	  
      if (fabs(rv.x * FOVK) > -rv.z + 1600) {
		  VMap[128+y][128+x].v = rv;   
		  VMap[128+y][128+x].DFlags = 128;
		  continue;
	  }
      

  	  if (HARD3D) 	
		if (  ((FMap[yy][xx] & fmWater)==0) || UNDERWATER)
		  VMap[128+y][128+x].Fog = CalcFogLevel(v[0]); else
		  VMap[128+y][128+x].Fog = 0;

      VMap[128+y][128+x].ALPHA = 255;

      v[0]=rv;	  

	  if (v[0].z<1024)
	   if (FOGENABLE)
	 	 if (FogsMap[yy>>1][xx>>1]) FogFound = TRUE;      
      	  
	  VMap[128+y][128+x].v = v[0];      
            
      int  DF = 0;
      int  db = 0;

      if (v[0].z<256) {
       if (Clouds) {
	    int shmx = (xx + SKYDT) & 127;
	    int shmy = (yy + SKYDT) & 127;
	   
	    int db1 = SkyMap[shmy * 128 + shmx ];
	    int db2 = SkyMap[shmy * 128 + ((shmx+1) & 127) ];
	    int db3 = SkyMap[((shmy+1) & 127) * 128 + shmx ];
	    int db4 = SkyMap[((shmy+1) & 127) * 128 + ((shmx+1) & 127) ];
	    db = (db1 * (256 - kx) + db2 * kx) * (256-ky) +
	         (db3 * (256 - kx) + db4 * kx) * ky;     
        db>>=17;
	    db = db - 40;
	    if (db<0) db=0;
	    if (db>48) db=48;
	   } 
      
       int clt = LMap[yy][xx];
	   clt= max(64, clt-db);
       VMap[128+y][128+x].Light = clt;	   
      }	  

	  

	  if (v[0].z>-256.0) DF+=128; else { 	   		  	                

#ifdef _soft
	   VMap[128+y][128+x].scrx = VideoCX - (int)(v[0].x / v[0].z * CameraW);
	   VMap[128+y][128+x].scry = VideoCY + (int)(v[0].y / v[0].z * CameraH);

	   if (VMap[128+y][128+x].scrx < 0)        DF+=1;
	   if (VMap[128+y][128+x].scrx > WinEX)    DF+=2;
	   if (VMap[128+y][128+x].scry < 0)        DF+=4;
	   if (VMap[128+y][128+x].scry > WinEY)    DF+=8;
#endif
#ifdef _3dfx
	   VMap[128+y][128+x].scrx = VideoCX16 - (int)(v[0].x / v[0].z * CameraW16);
	   VMap[128+y][128+x].scry = VideoCY16 + (int)(v[0].y / v[0].z * CameraH16);

	   if (VMap[128+y][128+x].scrx < 0)        DF+=1;
	   if (VMap[128+y][128+x].scrx > WinEX*16) DF+=2;
	   if (VMap[128+y][128+x].scry < 0)        DF+=4;
	   if (VMap[128+y][128+x].scry > WinEY*16) DF+=8;
#endif
#ifdef _d3d
	   VMap[128+y][128+x].scrx = VideoCXf - (v[0].x / v[0].z * CameraW);
	   VMap[128+y][128+x].scry = VideoCYf + (v[0].y / v[0].z * CameraH);

	   if (VMap[128+y][128+x].scrx < 0)        DF+=1;
	   if (VMap[128+y][128+x].scrx > WinEX)    DF+=2;
	   if (VMap[128+y][128+x].scry < 0)        DF+=4;
	   if (VMap[128+y][128+x].scry > WinEY)    DF+=8;
#endif       
	  }
	   
      VMap[128+y][128+x].DFlags = DF;
	}

	FOGON = FogFound || UNDERWATER;
}




void AddShadowCircle(int x, int y, int R, int D)
{
  if (UNDERWATER) return;
  
  int cx = x / 256;
  int cy = y / 256;
  int cr = 1 + R / 256;
  for (int yy=-cr; yy<=cr; yy++)
   for (int xx=-cr; xx<=cr; xx++) {
     int tx = (cx+xx)*256;
     int ty = (cy+yy)*256;
     int r = (int)sqrt( float(tx-x)*float(tx-x) + float(ty-y)*float(ty-y) );
     if (r>R) continue;
     VMap[cy+yy - CCY + 128][cx+xx - CCX + 128].Light-= D * (R-r) / R;     
	 if (VMap[cy+yy - CCY + 128][cx+xx - CCX + 128].Light < 32)
		 VMap[cy+yy - CCY + 128][cx+xx - CCX + 128].Light = 32;
   }
}





void DrawScene()
{       
   dFacesCount = 0;

   ca = (float)cos(CameraAlpha);
   sa = (float)sin(CameraAlpha);      

   cb = (float)cos(CameraBeta);
   sb = (float)sin(CameraBeta);
   
   CCX = ((int)CameraX / 512) * 2;
   CCY = ((int)CameraZ / 512) * 2;

   PreCashGroundModel();         

#ifdef _soft
   CreateChRenderList();
#endif
   
   RenderSkyPlane();   

   cb = (float)cos(CameraBeta);
   sb = (float)sin(CameraBeta);   
   
   RenderGround();
   RenderModelsList();

   Render3DHardwarePosts();
    if (NeedWater) RenderWater();
   

   RenderElements();
}




void DrawOpticCross( int v)
{
   int sx =  VideoCX + (int)(rVertex[v].x / (-rVertex[v].z) * CameraW);
   int sy =  VideoCY - (int)(rVertex[v].y / (-rVertex[v].z) * CameraH); 

   if (  (fabs(float(VideoCX - sx)) > WinW / 2) ||
	     (fabs(float(VideoCY - sy)) > WinH / 4) ) return;

   Render_Cross(sx, sy,(WinW/12)/16,false);
}



void ScanLifeForms()
{
	int li = -1;
	float dm = (float)(ctViewR+2)*256;
	for (int c=0; c<ChCount; c++) {
		TCharacter *cptr = &Characters[c];
		if (!cptr->Health) continue;
		if (cptr->rpos.z > -512) continue;
		float d = (float)sqrt( cptr->rpos.x*cptr->rpos.x + cptr->rpos.y*cptr->rpos.y + cptr->rpos.z*cptr->rpos.z );
		if (d > ctViewR*256) continue;
        float r = (float)(fabs(cptr->rpos.x) + fabs(cptr->rpos.y)) / d;
		if (r > 0.15) continue;
        if (d<dm) 
		  if (!TraceLook(cptr->pos.x, cptr->pos.y+220, cptr->pos.z,
			             CameraX, CameraY, CameraZ) ) {
		
          dm = d;
		  li = c;
		}

	}

    if (li==-1) return;
	Render_LifeInfo(li);
}

int GetCharacterIndexOnLook()
{
	/**
	* Return the index to the character that the player is looking at, or -1
	*/
	int li = -1;
	float dm = (float)(ctViewR+2)*256;
	float playerdx,playerdz, pdist;

	for (int c=0; c<ChCount; c++) {
		TCharacter *cptr = &Characters[c];
		/*	if (!TraceLook(cptr->pos.x, cptr->pos.y+220, cptr->pos.z,
				CameraX, CameraY, CameraZ) ) {

					dm = d;
					li = c;
			}*/
			playerdx = PlayerX - cptr->pos.x - cptr->lookx * 108;
			playerdz = PlayerZ - cptr->pos.z - cptr->lookz * 108;
			pdist = (float)sqrt( playerdx * playerdx + playerdz * playerdz );  
			if (pdist<350 && (max(PlayerY, cptr->pos.y) - min(PlayerY, cptr->pos.y)) < 300) {
				if (cptr->Health) {
					return c;
				} else {
					li = c;
				}
				//if (fabs(PlayerY - cptr->pos.y - 120) < 256) { 	   
				//	li = c;   
				//	return li;
				//}
			}

	}
	return li;
}

void DrawPostObjects()
{ 
  float b;  
  TWeapon* wptr = &Weapon;

  Hardware_ZBuffer(FALSE);  

  if (DemoPoint.DemoTime) goto SKIPWEAPON;

  GlassL = 0;
  if (BINMODE && !Weapon.state) {
   RenderNearModel(Binocular, 0, 0, 2*(216-72 * BinocularPower), 192,  0,0);
   ScanLifeForms();
   MapMode = FALSE;
  }

  //goto SKIPWIND;
  if (BINMODE || OPTICMODE) goto SKIPWIND;

  if (!TrophyMode)
   if (!KeyboardState[VK_CAPITAL] & 1) {
    BOOL lr = LOWRESTX;
    LOWRESTX = TRUE;
    VideoCX = WinW / 5;    
	VideoCY = WinH - (WinH * 10 / 23);
    VideoCXf= (float)VideoCX;
	VideoCYf= (float)VideoCY;
	VideoCX16 = VideoCX * 16; 
	VideoCY16 = VideoCY * 16;
	CreateMorphedModel(WindModel.mptr, &WindModel.Animation[0], (int)(Wind.speed*50.f), 1.0);
    RenderNearModel(WindModel.mptr, -10, -37, -96, 192,  CameraAlpha-Wind.alpha,0);     

	VideoCX = WinW - (WinW / 5);    
	VideoCY = WinH - (WinH * 10 / 23);
    VideoCXf= (float)VideoCX;
	VideoCYf= (float)VideoCY;
	VideoCX16 = VideoCX * 16; 
	VideoCY16 = VideoCY * 16;
    RenderNearModel(CompasModel, +8, -38, -96, 192,  CameraAlpha,0);     

    VideoCX = WinW / 2;
    VideoCY = WinH / 2;
    VideoCXf= (float)VideoCX;
	VideoCYf= (float)VideoCY;
    VideoCX16 = VideoCX * 16; 
    VideoCY16 = VideoCY * 16;
	LOWRESTX = lr;
  }

SKIPWIND:  

{  
  if (wptr->state == 0) goto SKIPWEAPON;

  //MapMode = FALSE;
  
  //wptr->shakel+= TimeDt / 10000.f;
  //if (wptr->shakel > 4.0f) wptr->shakel = 4.0f; 

  if (SprintMode) {
	  // == Note == These values affect the crosshairs
	  // if your sprinting or going sprint, then....
	  if (wptr->shakel < 14)
		wptr->shakel += 1;
	  if (wptr->shakel > 14)
		  wptr->shakel = 14;
  } else if (wptr->ironsights != 3 && wptr->ironsights != 2) {
	  //If Crouching...
	  if (CrouchMode) {
		  if (wptr->shakel > 0.2)
			  wptr->shakel -= 1;
		  if (wptr->shakel < 0.2)
			  wptr->shakel = 0.2;
	  } else {
		  //If Standing...
		  if (wptr->shakel > 0.5)
			  wptr->shakel -= 1;
		  if (wptr->shakel < 0.5)
			  wptr->shakel = 0.5;
	  }
	  //If moving, add some
	  if (VSpeed != 0 || SSpeed != 0 || YSpeed != 0) {
		  if (wptr->shakel < 2)
		     wptr->shakel = 2;
		  if (wptr->shakel > 2)
			  wptr->shakel -= 1;
	  }
  } else if (wptr->ironsights == 3 || wptr->ironsights == 2) {
	  //if aiming...
	  if (CrouchMode) {
		wptr->shakel = 0;
	  } else {
		  wptr->shakel = 0.3;
	  }
  }

  if (wptr->state == 1) {
	  wptr->FTime+=TimeDt;
	  if (wptr->FTime >= wptr->chinfo[CurrentWeapon].Animation[0].AniTime) {
		  wptr->FTime = 0;
		  wptr->state = 2;
	  }
  }
  if (wptr->state == 4) {
    wptr->FTime+=TimeDt;
    if (wptr->FTime >= wptr->chinfo[CurrentWeapon].Animation[3].AniTime) {
      wptr->FTime = 0;
      wptr->state = 2;
    }
  }

  if (wptr->state == 2 && wptr->FTime>0) {
    wptr->FTime+=TimeDt;
    //if (wptr->FTime >= wptr->chinfo[CurrentWeapon].Animation[1].AniTime) {
	// -> Adelphospro, 4.18.09, weapon fire delay enhancement: don't animate past fire time or animation time
	if ((WeapInfo[CurrentWeapon].FTime > 0 && wptr->FTime >= WeapInfo[CurrentWeapon].FTime) || wptr->FTime >= wptr->chinfo[CurrentWeapon].Animation[1].AniTime) {
      wptr->FTime = 0;
      wptr->state = 2;


	  if (WeapInfo[CurrentWeapon].Reload)
		  if ( (ShotsLeft[CurrentWeapon] % WeapInfo[CurrentWeapon].Reload) == 0 ) 
		  if ( (ShotsLeft[CurrentWeapon]>0) || (AmmoMag[CurrentWeapon]>0) ) 
		  {
		 	  wptr->state = 4;
		      wptr->FTime = 1;
		      AddVoicev(wptr->chinfo[CurrentWeapon].SoundFX[3].length,
                        wptr->chinfo[CurrentWeapon].SoundFX[3].lpData, 256);
		  }


	  if (!ShotsLeft[CurrentWeapon]) 
		  if (AmmoMag[CurrentWeapon]) {
		  AmmoMag[CurrentWeapon]--;
		  ShotsLeft[CurrentWeapon] = WeapInfo[CurrentWeapon].Shots;
		  if (wptr->chinfo[CurrentWeapon].Animation[3].AniTime)  {          
          wptr->state = 4;
		  wptr->FTime = 1;
		  AddVoicev(wptr->chinfo[CurrentWeapon].SoundFX[3].length,
                    wptr->chinfo[CurrentWeapon].SoundFX[3].lpData, 256);
		  }
	  }
    }
  }
  
  if (wptr->state == 3) {
    wptr->FTime+=TimeDt;
    if (wptr->FTime >= wptr->chinfo[CurrentWeapon].Animation[2].AniTime) {
      wptr->FTime = 0;
      wptr->state = 0;
	  if (CurrentWeapon != TargetWeapon) {
	   CurrentWeapon = TargetWeapon;
	   HideWeapon();
	  }
      goto SKIPWEAPON;
    }
  }


  if (!ShotsLeft[CurrentWeapon]) 
  if (!AmmoMag[CurrentWeapon])
  {
	  HideWeapon();
	  for (int w=0; w<10; w++) 
		  if (ShotsLeft[w]) { TargetWeapon=w; break; }
  }
  
  CreateMorphedModel(wptr->chinfo[CurrentWeapon].mptr, 
	                &wptr->chinfo[CurrentWeapon].Animation[wptr->state-1], wptr->FTime, 1.0);

  b = (float)sin((float)RealTime / 300.f) / 100.f;     
  wpnDAlpha = wptr->shakel * (float)sin((float)RealTime / 300.f+pi/2) / 200.f;
  wpnDBeta  = wptr->shakel * (float)sin((float)RealTime / 300.f) / 400.f;
  nv.z = 0;
  
  //==================== render weapon ===================//
   

   Vector3d v = Sun3dPos;
   Sun3dPos = RotateVector(Sun3dPos);  
   CalcNormals(wptr->chinfo[CurrentWeapon].mptr, wptr->normals);
   //CalcGouraud(wptr->chinfo[CurrentWeapon].mptr, wptr->normals);

   if (GOUR)
    CalcGouraud(wptr->chinfo[CurrentWeapon].mptr, wptr->normals);   
   else
	for (int c=0; c<1000; c++)
		wptr->chinfo[CurrentWeapon].mptr->VLight[0][c] = 0;

   if (HARD3D) wpnlight = (int)(96 + GetLandLt(PlayerX, PlayerZ) / 4);
          else wpnlight = 200;

   // == 4.13.09, Adelphospro, added weapon offset application to code
		  // -> Animate offset based on ironsights (if in ironsights, slowly fix x and y offsets till they equal 0,0; if going to rest position then
		  // slowly fix x and y offsets until they equal the weapon's default x and y offsets

		  float weapXOff = wptr->xplace;
		  float weapYOff = wptr->yplace;
		  // == Process Sprint Animation
		  if ((SprintMode || MeleeTime > 0) && wptr->ironsights != 100) {
			  wptr->ironsights = 99;
		  } else if (!SprintMode && MeleeTime == 0 && wptr->ironsights == 100 || wptr->ironsights == 99) {
			  wptr->ironsights = 1;
		  }

		  switch (wptr->ironsights) {
			  case 0: //In rest
				  weapYOff = WeapInfo[CurrentWeapon].yoffset;
				  weapXOff = WeapInfo[CurrentWeapon].xoffset;
				  Render_Cross(VideoCX, VideoCY,WinW / 12 / 6,true);
				  break;
			  case 1: //Going rest
				  Render_Cross(VideoCX, VideoCY,WinW / 12 / 6,true);
			  case 2: //Going aim
			  case 99://Going Sprint Mode
				  //==Determine Goal locations...
				  float GoalX,GoalY;
				  int GoalState;
				  switch(wptr->ironsights) {
					case 1: //going rest
						GoalX = WeapInfo[CurrentWeapon].xoffset;
						GoalY = WeapInfo[CurrentWeapon].yoffset;
						GoalState = 0; // 0 means 'in rest'
					break;
					case 2: //going aim
						GoalX = 0;
						GoalY = 0;
						GoalState = 3; // 0 means 'in aim'
						BinocularPower = 1.2; //StartZoom
					break;
					case 99: //Going Sprint
						GoalX = WeapInfo[CurrentWeapon].xoffset;
						GoalY = -80;
						GoalState = 100; //100 means 'in sprint'
						Render_Cross(VideoCX, VideoCY,WinW / 12 / 6,true);
					}
				  //==Translate On X Axis...
				  if (wptr->xplace != GoalX) {
					  // if you are not in goalx on x axis, then go closer...
					  if (wptr->xplace > GoalX) {
						  // if where you are is bigger than where you want to be on x axis, count down....
						  wptr->xplace -= 15;
					  } else {
						  // else, count up
						  wptr->xplace += 15;
					  }
				  }
				  if ( max(wptr->xplace,GoalX) - min(wptr->xplace,GoalX) <= 5) {
					  // If the distance to where you want to be on X is under or equal to A FIXED INT, then consider the weapon in goal state on X axis
					  wptr->xplace = GoalX;
				  }
				  weapXOff = wptr->xplace;
				  //==Translate On Y Axis...
				  if (wptr->yplace != GoalY) {
					  // if you are not in goaly on y axis, then go closer...
					  if (wptr->yplace > GoalY) {
						  // if where you are is bigger than where you want to be on y axis, count up....
						  wptr->yplace -= 8;
					  } else {
						  // else, count down
						  wptr->yplace += 8;
					  }
				  }
				  if ( max(wptr->yplace,GoalY) - min(wptr->xplace,GoalY) <= 5) {
					  // If the distance to where you want to be on Y is under or equal to A FIXED INT, then consider the weapon in goal state on Y axis
					  wptr->yplace = GoalY;
				  }
				  weapYOff = wptr->yplace;
				  //== Check if both x and y are done animating....
				  if (wptr->yplace == GoalY && wptr->xplace == GoalX) {
					  wptr->ironsights = GoalState; // 0 means 'in full rest', 3 means 'in full aim'
				  }
				  break;
			  case 3: //In Aim
				  weapXOff = 0;
				  weapYOff = 0;
				  break;
			  case 100: //In Sprint
				  weapXOff = WeapInfo[CurrentWeapon].xoffset;
				  weapYOff = -80;
				  Render_Cross(VideoCX, VideoCY,WinW / 12 / 6,true);
		  }

		  // Melee test offsets...
		  if (MeleeTime > 0) {
			  if (MeleeTime == 1) {
				  // Process Bash
				  // -> Play swing sound
				  PlaySound2d("HUNTDAT\\SOUNDFX\\melee_swing.wav");
				  int dinoISee = GetCharacterIndexOnLook();
				  if (dinoISee != -1) {
					  // -> Play bash hit sound
					  PlaySound2d("HUNTDAT\\SOUNDFX\\melee_hit.wav");
					  Characters[dinoISee].Health -= WeapInfo[CurrentWeapon].Power/2;
				  }
			  }
			  MeleeTime += TimeDt;
			  if (MeleeTime > 400) {
				  //Stop it
				  MeleeTime = 0;
				  wpnb = 0;
				  LastMeleeTime = RealTime;
			  } else if (MeleeTime > 0 && MeleeTime <= 200) {
				  //Going out
				  wpnb += 0.1;
			  } else if (MeleeTime > 200) {
				  //Going back
					wpnb -= 0.2;
			  }
		  }
		  // -> Display it
   RenderNearModel(wptr->chinfo[CurrentWeapon].mptr, weapXOff, wpshy+weapYOff, wpshz, wpnlight,
                   -wpnDAlpha, -wpnDBeta + wpnb);


#ifdef _soft
#else
   if (PHONG) {
    CalcPhongMapping(wptr->chinfo[CurrentWeapon].mptr, wptr->normals);
    RenderModelClipPhongMap(wptr->chinfo[CurrentWeapon].mptr, weapXOff, wpshy+weapYOff, wpshz, -wpnDAlpha, -wpnDBeta+wpnb);
   }

   if (ENVMAP) {       	   
	   CalcEnvMapping(wptr->chinfo[CurrentWeapon].mptr, wptr->normals);
	   RenderModelClipEnvMap(wptr->chinfo[CurrentWeapon].mptr, weapXOff, wpshy+weapYOff, wpshz, -wpnDAlpha, -wpnDBeta+wpnb);	   
   }
#endif
  
   Sun3dPos = v;
   

  //Render_Cross(VideoCX, VideoCY);
  if (OPTICMODE) DrawOpticCross(wptr->chinfo[CurrentWeapon].mptr->VCount-1);
  
}	  

SKIPWEAPON:

  if (ChCallTime) {
   ChCallTime-=TimeDt;
   if (ChCallTime<0) ChCallTime=0;
   DrawPicture(WinW - 10 - DinoInfo[ AI_to_CIndex[TargetCall] ][0].CallIcon.W, 7, 
	           DinoInfo[ AI_to_CIndex[TargetCall] ][0].CallIcon);
  }

  Hardware_ZBuffer(TRUE);

  if (Weapon.state) {
  int y0 = 5;
  if (AmmoMag[CurrentWeapon]) {
	  for (int bl=0; bl<WeapInfo[CurrentWeapon].Shots; bl++) 
	    DrawPicture(6 + bl*Weapon.BulletPic[CurrentWeapon].W, y0, Weapon.BulletPic[CurrentWeapon]);
	  y0+=Weapon.BulletPic[CurrentWeapon].H+4;
  }

  for (int bl=0; bl<ShotsLeft[CurrentWeapon]; bl++) 
	 DrawPicture(6 + bl*Weapon.BulletPic[CurrentWeapon].W, y0, Weapon.BulletPic[CurrentWeapon]);
  }
  
  
  if (TrophyMode)
	DrawPicture( VideoCX - TrophyExit.W / 2, 2, TrophyExit);

  if (EXITMODE)
	DrawPicture( (WinW - ExitPic.W) / 2, (WinH - ExitPic.H) / 2, ExitPic);


  if (PAUSE)   
	DrawPicture( (WinW - PausePic.W) / 2, (WinH - PausePic.H) / 2, PausePic);

  if (TrophyMode || TrophyTime)
	  if (TrophyBody!=-1) {
		int x0 = WinW - TrophyPic.W - 16;
		int y0 = WinH - TrophyPic.H - 12;
		if (!TrophyMode) 
			x0 = VideoCX - TrophyPic.W / 2;
		    
        DrawPicture( x0, y0, TrophyPic);		
        DrawTrophyText(x0, y0);		

		if (TrophyTime) {
			TrophyTime-=TimeDt;
			if (TrophyTime<0) {
				TrophyTime=0;
				TrophyBody = -1;
			}
		}
	  }	
}





void SwitchMode(LPSTR lps, BOOL& b)
{
  b = !b;
  char buf[200];
  if (b) wsprintf(buf,"%s is ON", lps);
    else wsprintf(buf,"%s is OFF", lps);
  MessageBeep(0xFFFFFFFF);
  AddMessage(buf);
}


void ChangeViewR(int d1, int d2, int d3)
{
  char buf[200];
  ctViewR +=d1;
  ctViewR1+=d2;
  ctViewRM+=d3;
  if (ctViewR<20) ctViewR = 20;
  if (ctViewR>122) ctViewR = 122;

  if (ctViewR1 < 12) ctViewR1=12;
  if (ctViewR1 > ctViewR-10) ctViewR1=ctViewR-10;
  if (ctViewRM <  4) ctViewRM = 4;
  if (ctViewRM > 60) ctViewRM = 60;
  
  wsprintf(buf,"ViewR = %d (%d + %d) BMP at %d", ctViewR, ctViewR1, ctViewR-ctViewR1, ctViewRM);
  //MessageBeep(0xFFFFFFFF);
  AddMessage(buf);
  
}


void ChangeCall()
{
	if (!TargetDino) return;
	if (ChCallTime)
	for (int t=0; t<32; t++) {
		TargetCall++;
		if (TargetCall>32) TargetCall=10;
		if (TargetDino & (1<<TargetCall)) break;
	}
	//wsprintf(logt,"Call: %s", DinoInfo[ AI_to_CIndex[TargetCall] ].Name);
	//AddMessage(logt);
	//CallLockTime+= 1024;
	ChCallTime = 2048;
}


void CallSupply()
{
	if (!Supply) return;
    //if (SupplyUsed) return;
    //SupplyUsed = TRUE;
	if (TrophyRoom.Score < 102) {
		AddMessage("Request denied by base. Check credit balance");
		return;
	}
	if (SupplyShip.State) {
		AddMessage("Request denied by base");
		return;
	}
	AddMessage("Supplies Requested... Stand By");
    AddVoicev(SShipModel.SoundFX[1].length,
		      SShipModel.SoundFX[1].lpData, 256);
    
    SupplyShip.pos.x = PlayerX - (ctViewR+4)*256; if (SupplyShip.pos.x < 256) SupplyShip.pos.x = PlayerX + (ctViewR+4)*256; 
	SupplyShip.pos.z = PlayerZ - (ctViewR+4)*256; if (SupplyShip.pos.z < 256) SupplyShip.pos.z = PlayerZ + (ctViewR+4)*256; 	
	SupplyShip.pos.y = GetLandUpH(SupplyShip.pos.x, SupplyShip.pos.z)  + 2048;

	SupplyShip.tgpos.x = PlayerX;
	SupplyShip.tgpos.z = PlayerZ;
    SupplyShip.tgpos.y = GetLandUpH(SupplyShip.tgpos.x, SupplyShip.tgpos.z) + 2048;
	SupplyShip.State = 1;

	SupplyShip.retpos = SupplyShip.pos;
	//->Charge the player for the ammo...
	TrophyRoom.Score -= 2;
}


void ToggleBinocular()
{
  if (Weapon.state) return;
  if (UNDERWATER) return;
  if (!MyHealth) return;
  BINMODE = !BINMODE;  
  MapMode = FALSE;
}


void ToggleRunMode()
{
	RunMode = !RunMode;
    if (RunMode) 
        AddMessage("Run mode is ON");
	else AddMessage("Run mode is OFF");
}

void EnableSprint() {
	// == Added 4.13.09 by Adelphospro == //
	// Enables Sprint Mode feature after some 
	// preliminary tests are passed, such as energy and health level check
	if (!SWIM && !CrouchMode && MyEnergy >= (MAX_ENERGY*.15) && (VSpeed != 0 || SSpeed != 0) /*&& !YSpeed*/) {
		SprintMode = TRUE;
		Weapon.ironsights = 99;
	}
}

void DisableSprint() {
	// == Added 4.14.09 by Adelphospro == //
	// Disables sprint and sets animation codes
	SprintMode = FALSE;
    // -> set to 1 (going rest animation)
	Weapon.ironsights = 1;
}

void ToggleCrouchMode()
{
	CrouchMode = !CrouchMode;
	if (CrouchMode) AddMessage("Crouch mode is ON");
	else AddMessage("Crouch mode is OFF");
}


void ToggleMapMode()
{
	if (!MyHealth) return;
	if (BINMODE) return;
	if (Weapon.state || SprintMode) return;
	MapMode = !MapMode;	
}




void ShowShifts()
{
	sprintf(logt, "Y=%3.4f  Z=%3.4f  A=%3.4f", wpshy/2, wpshz/2, wpnb*180/3.1415);
	AddMessage(logt);
}

//void TypedText_clear() {
//	TypingMode = FALSE;
//	memset(TypedText, 0, sizeof(TypedText));
//	TypedTextLength = 0;
//}

LONG APIENTRY MainWndProc( HWND hWnd, UINT message, UINT wParam, LONG lParam)
{  
	BOOL A = (GetActiveWindow() == hWnd);			

	if (A!=blActive) {
		blActive = A;	   	   

		// alacn
		if (blActive)
#ifdef __high_priority_process
			SetPriorityClass( GetCurrentProcess(), HIGH_PRIORITY_CLASS);
#else
			SetPriorityClass( GetCurrentProcess(), NORMAL_PRIORITY_CLASS);
#endif
		else
			SetPriorityClass( GetCurrentProcess(), IDLE_PRIORITY_CLASS);	   

		if (!blActive) {		  
			ShutDown3DHardware();		  
			NeedRVM = TRUE;
		}

		if (blActive) {           
			Audio_Restore();		   		   
			NeedRVM = TRUE;
		}

	}
	TypingJustExit = false;
	if (message == WM_KEYDOWN) {
		if (TypingMode) {
			//if (Weapon.state)
				//HideWeapon();
			//Process Typed Word
			switch ((int)wParam) {
				case 192: // -> Little key next to 1
				case VK_ESCAPE: 
					//== Clear all text ==
					//AddVoicev(TypeSound[0].length, 
					  //TypeSound[0].lpData, 128);
					PlaySound2d("HUNTDAT\\SOUNDFX\\type.wav");
					TypingJustExit = true;
					Console_Clear();
					TypingMode = FALSE;
					ResetMousePos();
					break;
				case VK_BACK: 
					//== Backspace ==
					//AddVoicev(TypeSound[0].length, 
					  //TypeSound[0].lpData, 128);
					PlaySound2d("HUNTDAT\\SOUNDFX\\type.wav");
					if (TypedTextLength == 0) break;
					TypedText[TypedTextLength-1] = 0;
					TypedTextLength--;
					break;
				case VK_RETURN: 
					//== Process Typed Text ==
					Console_ProcessInput(NULL);
					break;
				case VK_DOWN:
					//Move index down
					if (CommandLogCnt < ((256-16)/16)) break; //((256-16)/16)) = what fits on screen
					if (CommandLogIndex == -1)
						CommandLogIndex = max(CommandLogCnt - ((256-16)/16),0);
					CommandLogIndex = min(CommandLogIndex + 1, (CommandLogCnt - ((256-16)/16)));
					break;
				case VK_UP:
					//Move index up
					if (CommandLogCnt < ((256-16)/16)) break;
					if (CommandLogIndex == -1)
						CommandLogIndex = max(CommandLogCnt - ((256-16)/16),0);
					CommandLogIndex = max(CommandLogIndex - 1, 0);
					break;
				default: //Update Text
					{
					HKL keybLayout = GetKeyboardLayout(NULL);
					BYTE kbdState [256];
					GetKeyboardState(kbdState);
					char keyBuff[4];
					int resULT = ToUnicodeEx(wParam,NULL,kbdState,(LPWSTR)keyBuff,sizeof(keyBuff),NULL,keybLayout);
					if (int(wParam) >= 32 && (int)wParam < 126 || (int)wParam == 189) {
						// -> Is a valid key...
						wsprintf(logt,"%s",keyBuff);

						TypedText[TypedTextLength] = logt[0];
						TypedTextLength++;
						//AddVoicev(TypeSound[0].length, 
								//TypeSound[0].lpData, 128);
						PlaySound2d("HUNTDAT\\SOUNDFX\\type.wav");
					} else if (DEBUG) {
						wsprintf(logt,"TypingMode->KeyCode Entered: %d",wParam);
						AddMessage(logt);
					}
					return (DefWindowProc(hWnd, message, wParam, lParam));
					break;
					}
			}
			
		} else {
		if ((int)wParam == KeyMap.fkBinoc) ToggleBinocular();
		if ((int)wParam == KeyMap.fkCCall) ChangeCall();

		if ((int)wParam == KeyMap.fkSupply) CallSupply();

		if ((int)wParam == KeyMap.fkRun  ) ToggleRunMode();
		if ((int)wParam == KeyMap.fkCrouch) ToggleCrouchMode();
		//if ((int)wParam == cheatcode[cheati]) {
		//	cheati++;
		//	if (cheati>6) {	cheati=0; SwitchMode("Debug mode",DEBUG); }
		//} else cheati=0;
		}
	}


	switch (message) {        	    
		case WM_CREATE: return 0;                        


		case WM_KEYDOWN: {
			BOOL CTRL = (GetKeyState(VK_SHIFT) & 0x8000);
			if (!TypingMode) {
				switch( (int)wParam ) {
		case '1': 
		case '2': 
		case '3': 
		case '4': 
		case '5': 
		case '6':
		case '7': 
		case '8': 
		case '9': {			  
			if (Weapon.FTime) break;
			int w = ((int)wParam ) - '1';
			if (!ShotsLeft[w]) {
				AddMessage("No weapon");
				break;
			}
			TargetWeapon = w;
			if (!Weapon.state) 
				CurrentWeapon = TargetWeapon;
			HideWeapon();
			break; 
						  }

		//case 'U': if (DEBUG) ChangeViewR(0, 0, -2); break;
		//case 'I': if (DEBUG) ChangeViewR(0, 0, +2); break;
			//case 'O': if (DEBUG) ChangeViewR(0, -2, 0); break;
			//case 'P': if (DEBUG) ChangeViewR(0, +2, 0); break;
		//case 219: if (DEBUG) ChangeViewR(-2, 0, 0); break;
		//case 221: if (DEBUG) ChangeViewR(+2, 0, 0); break;

			/*
			case '0': wpshy=0; wpshz=0; wpnb=0; break;
			case '7': if (CTRL) wpshy-=0.25; else wpshy+=0.25;
			ShowShifts();
			break;
			case '8': if (CTRL) wpshz-=0.25; else wpshz+=0.25; 
			ShowShifts();
			break;
			case '9': if (CTRL) wpnb-=0.005; else wpnb+=0.005; 
			ShowShifts();
			break;*/
		case 192: //Little key next to 1
			if (!TypingMode && !TypingJustExit) {
				//MessageBeep(MB_ICONQUESTION);
				TypingMode = TRUE;
				if (Weapon.state)
					HideWeapon();
				//AddVoicev(TypeSound[0].length, TypeSound[0].lpData, 128);
				PlaySound2d("HUNTDAT\\SOUNDFX\\type.wav");
			}
			break;

		case 'E': if (DEBUG && CTRL) SwitchMode("Env.Mapping",ENVMAP);
			break;					
		case 'G': if (DEBUG && CTRL) SwitchMode("Gour.Mapping",GOUR);
			break;					
		case 'P': if (DEBUG && CTRL) SwitchMode("Phong Mapping",PHONG);
				  else if (DEBUG) ChangeViewR(0, +2, 0); 
				  break;

		case VK_TAB:
			if (!TrophyMode) ToggleMapMode();				  
			break;

		case VK_PAUSE: 
			PAUSE = !PAUSE; EXITMODE = FALSE; ResetMousePos();			   
			break;

		case 'N':
			if (EXITMODE) EXITMODE = FALSE;
			break;

		case VK_ESCAPE:	
			if (TypingJustExit == true) {
				TypingJustExit = false;
			} else {
				if (TrophyMode) 
				{
					SaveTrophy();
					ExitTime = 1;
				} else {		
					if (PAUSE) PAUSE = FALSE; 
					else EXITMODE = !EXITMODE;
					if (ExitTime) EXITMODE = FALSE;
					ResetMousePos(); 
				}
			}
			break;

		case 'Y':
		case VK_RETURN: 
			if (EXITMODE ) {
				if (MyHealth) {
					ExitTime = 3000 + (int)sqrt( (PlayerX/256.f)*(PlayerX/256.f) + (PlayerZ/256.f)*(PlayerZ/256.f))*3.5; 
					FADING = 64;
				} else {
					ExitTime = 1;
				}
				EXITMODE = FALSE;
			}
			break;

		case 'R':			  
			if (TrophyBody!=-1) RemoveCurrentTrophy();
			if (EXITMODE) {
				LoadTrophy();	
				RestartMode = TRUE;		
				FADING = 64;
				//_GameState = 0;
				//DoHalt("");
			}
			break;

		//case VK_F9:
		//	if (!DEBUG) break;
		//	ShutDown3DHardware();
		//	AudioStop();
		//	DoHalt("");              
		//	break; 

		case VK_F12: SaveScreenShot();              break;

				}   // switch  
			}

			break;     }                                

		case WM_DESTROY:       
			PostQuitMessage(0);			
			break;
			/*
			case WM_PAINT:
			case WM_ERASEBKGND:
			case WM_NCPAINT   : break;
			*/
			/*case WM_PAINT: {
			PAINTSTRUCT ps;
			HDC  hdc =  BeginPaint(hWnd, &ps );         		  
			EndPaint(hWnd, &ps);        		  		  
			return 0; 
			} */
		default:
			return (DefWindowProc(hWnd, message, wParam, lParam));
	}
	return 0;
}




BOOL CreateMainWindow()
{
	PrintLog("Creating main window...");
    WNDCLASS wc;
    wc.style = CS_OWNDC;
    wc.lpfnWndProc = (WNDPROC)MainWndProc; 
    wc.cbClsExtra = 0;                  
    wc.cbWndExtra = 0;                  
    wc.hInstance = (HINSTANCE)hInst;
    wc.hIcon = wc.hIcon = (HICON)LoadIcon((HINSTANCE)hInst,"ACTION");
    wc.hCursor = NULL;
	wc.hbrBackground = (HBRUSH)GetStockObject( BLACK_BRUSH );
    wc.lpszMenuName = NULL;
    //wc.lpfnWndProc  = NULL;
	wc.lpszClassName = "HuntRenderWindow";
    if (!RegisterClass(&wc)) return FALSE;
    
#ifndef _dx9
    hwndMain = CreateWindow(
        "HuntRenderWindow","Carnivores 2 Renderer",
  		WS_VISIBLE |  WS_POPUP,
		0, 0, 0, 0, NULL,  NULL, (HINSTANCE)hInst, NULL );
#else
	    hwndMain = CreateWindow(
        "HuntRenderWindow","Carnivores 2 Renderer",
  		WS_VISIBLE | WS_POPUP,
		0, 0, 1024, 768, NULL,  NULL, (HINSTANCE)hInst, NULL );
#endif

	if (hwndMain)
	  PrintLog("Ok.\n");

    return TRUE;
}




void ProcessShootThreaded(void*) {
	// == Adelphos pro == //
	// -> 4.16.09
	// -> Threaded ProcessShoot of moving bullet
	for (int s=0; s<=WeapInfo[CurrentWeapon].TraceC; s++) {
		float rA = 0;
		float rB = 0;

		rA = siRand(128) * 0.00010f * (2.f - WeapInfo[CurrentWeapon].Prec);
		rB = siRand(128) * 0.00010f * (2.f - WeapInfo[CurrentWeapon].Prec);

		float ca = (float)cos(PlayerAlpha + wpnDAlpha + rA);
		float sa = (float)sin(PlayerAlpha + wpnDAlpha + rA);
		float cb = (float)cos(PlayerBeta + wpnDBeta + rB);
		float sb = (float)sin(PlayerBeta + wpnDBeta + rB);

		nv.x=sa;
		nv.y=0; 
		nv.z=-ca;

		nv.x*=cb;
		nv.y=-sb;
		nv.z*=cb;

		MakeShot(PlayerX, PlayerY+HeadY, PlayerZ,
			PlayerX+nv.x * 256*ctViewR, 
			PlayerY+nv.y * 256*ctViewR + HeadY, 
			PlayerZ+nv.z * 256*ctViewR);
	}
}


void ProcessShoot()
{
   //if (HeadBackR) return;  // <- lol. Left over from C1, where your "head bounce back" controlled how fast you could shoot.

   if (SprintMode) return; //Don't allow firing in sprint mode
   if (!ShotsLeft[CurrentWeapon]) return;
   TWeapon *wptr = &Weapon;
   if (UNDERWATER) {
	   HideWeapon();
	   return;   }

   if (wptr->state == 2 && wptr->FTime==0) {   
	 wptr->FTime = 1;     
	 HeadBackR=64;
	 //if (HeadBackR>64) HeadBackR=64;

	 if ((int)strlen(WeapInfo[CurrentWeapon].SFName) > 0)
		 PlaySound2d(WeapInfo[CurrentWeapon].SFName);
	 else 
		AddVoicev(wptr->chinfo[CurrentWeapon].SoundFX[1].length,
               wptr->chinfo[CurrentWeapon].SoundFX[1].lpData, 256);

	 TrophyRoom.Last.smade++;
	 Weapon.TPA = RealTime;
	 if (USE_THREADS) {
		_beginthread(ProcessShootThreaded,0,NULL);
	 } else {
		 ProcessShootThreaded(NULL);
	 }

	 Vector3d v;
	 v.x = PlayerX;
	 v.y = PlayerY;
	 v.z = PlayerZ;
	 MakeNoise(v, ctViewR*200 * WeapInfo[CurrentWeapon].Loud);
	 if (!CHEAT_FREEAMMO)
		ShotsLeft[CurrentWeapon]--;
   }
}


void ProcessSlide()
{
  if (NOCLIP || UNDERWATER) return;
  if (IN_VEHICLE == TRUE) {
	  TVehicle::process_slide();
	  return;
  }
	float ch = GetLandQHNoObj(PlayerX, PlayerZ);
	float mh = ch;
	float chh;
	int   sd = 0;

	chh=GetLandQHNoObj(PlayerX - 16, PlayerZ); if (chh<mh) { mh = chh; sd = 1; }
	chh=GetLandQHNoObj(PlayerX + 16, PlayerZ); if (chh<mh) { mh = chh; sd = 2; }
	chh=GetLandQHNoObj(PlayerX, PlayerZ - 16); if (chh<mh) { mh = chh; sd = 3; }
	chh=GetLandQHNoObj(PlayerX, PlayerZ + 16); if (chh<mh) { mh = chh; sd = 4; }

	chh=GetLandQHNoObj(PlayerX - 12, PlayerZ - 12); if (chh<mh) { mh = chh; sd = 5; }
	chh=GetLandQHNoObj(PlayerX + 12, PlayerZ - 12); if (chh<mh) { mh = chh; sd = 6; }
	chh=GetLandQHNoObj(PlayerX - 12, PlayerZ + 12); if (chh<mh) { mh = chh; sd = 7; }
	chh=GetLandQHNoObj(PlayerX + 12, PlayerZ + 12); if (chh<mh) { mh = chh; sd = 8; }

	if (!NOCLIP)
		if (mh<ch-16) {
			float delta = (ch-mh) / 4;
			if (sd == 1) { PlayerX -= delta; }
			if (sd == 2) { PlayerX += delta; }
			if (sd == 3) { PlayerZ -= delta; }
			if (sd == 4) { PlayerZ += delta; }

			delta*=0.7f;
			if (sd == 5) { PlayerX -= delta; PlayerZ -= delta; }
			if (sd == 6) { PlayerX += delta; PlayerZ -= delta; }
			if (sd == 7) { PlayerX -= delta; PlayerZ += delta; }
			if (sd == 8) { PlayerX += delta; PlayerZ += delta; }  
			// AddMessage(char(sd));
			//wsprintf(t,"%d", sd);
			// AddMessage(LPSTR(sd));
		}    
}



void ProcessPlayerMovement()
{
	if (IN_VEHICLE) {
		TVehicle::process_movement();
		return;
	}
   POINT ms;
   
    GetCursorPos(&ms);
	if (REVERSEMS) ms.y = -ms.y+VideoCY*2;
    rav += (float)(ms.x-VideoCX) * (OptMsSens+64) / 600.f / 192.f;
    rbv += (float)(ms.y-VideoCY) * (OptMsSens+64) / 600.f / 192.f;
    if (KeyFlags & kfStrafe) 
		SSpeed+= (float)rav * 10; else 
		PlayerAlpha += rav;   
		PlayerBeta  += rbv;



    rav/=(2.f + (float)TimeDt/20.f);
    rbv/=(2.f + (float)TimeDt/20.f);
	if (!LooseMouse) {
		ResetMousePos();
	} //else {
		//POINT newMouse;
		//newMouse.x = ms.x;
		//newMouse.y = ms.y;
		//if (DEBUG) {
		//	wsprintf(logt,"MouseX: %d", ms.x);
		//	AddMessage(logt);
		//}
		//if (ms.x - VideoCX > 0 ) {
		//	newMouse.x -= 1;
		//}

		//if (ms.x - VideoCX < 0) {
		//	newMouse.x += 1;
		//}
		//if (ms.y - VideoCY > 0) {
		//	newMouse.y -= 1;
		//}
		//if (ms.y - VideoCY < 0) {
		//	newMouse.y += 1;
		//}

		//if (max(newMouse.x,VideoCX) - min(newMouse.x, VideoCX) > 15) {
		//	newMouse.x = VideoCX;
		//}
		//if (max(newMouse.y,VideoCY) - min(newMouse.y, VideoCY) > 15) {
		//	newMouse.y = VideoCY;
		//}

		//SetCursorPos(newMouse.x, newMouse.y);  

		//if (ms.x > VideoCX) {
		//	ms.x -= 0.00000004;
		//} else if (ms.x < VideoCX) {
		//	ms.x += 0.00000004;
		//}
		//if (max(ms.x,VideoCX) - min(ms.x,VideoCX) < 0.0000000004) {
		//	ms.x = 0;
		//}
		//SetCursorPos(ms.x, ms.y);  
	//}

   if (TypingMode) return;

   if ( !(KeyFlags & (kfForward | kfBackward))) 
	if (VSpeed>0) VSpeed=max(0,VSpeed-DeltaT*2);
	         else VSpeed=min(0,VSpeed+DeltaT*2);

   if ( !(KeyFlags & (kfSLeft | kfSRight))) 
	if (SSpeed>0) SSpeed=max(0,SSpeed-DeltaT*2);
	         else SSpeed=min(0,SSpeed+DeltaT*2);
	 
   if (KeyFlags & kfForward)  if (VSpeed>0) VSpeed+=DeltaT; else VSpeed+=DeltaT*4; 
   if (KeyFlags & kfBackward) if (VSpeed<0) VSpeed-=DeltaT; else VSpeed-=DeltaT*4; 

   if (KeyFlags & kfSRight )  if (SSpeed>0) SSpeed+=DeltaT; else SSpeed+=DeltaT*4; 
   if (KeyFlags & kfSLeft  )  if (SSpeed<0) SSpeed-=DeltaT; else SSpeed-=DeltaT*4; 

   //Average Human Speed:
   //-> Walk = 3-3.5 mph
   //-> Brisk Walk = 4mph
   //-> Jog = 6mph
   //-> Human Record = 12mph
	float CHEAT_MULTFACTOR = 1.0f;
		if (CHEAT_FASTWALK)
			CHEAT_MULTFACTOR = 3.0f;
   if (!SprintMode) {
	   //Normal Movement Processing here...
	   if (SWIM) {
		   if (VSpeed > 0.25f * CHEAT_MULTFACTOR) VSpeed = 0.25f * CHEAT_MULTFACTOR;
		   if (VSpeed <-0.25f * CHEAT_MULTFACTOR) VSpeed =-0.25f * CHEAT_MULTFACTOR;    
		   if (SSpeed > 0.25f * CHEAT_MULTFACTOR) SSpeed = 0.25f * CHEAT_MULTFACTOR;
		   if (SSpeed <-0.25f * CHEAT_MULTFACTOR) SSpeed =-0.25f * CHEAT_MULTFACTOR;
	   }
	   if ( RunMode && (HeadY > 190.f) && Weapon.ironsights != 3) {
		   if (VSpeed > 0.90f * CHEAT_MULTFACTOR) VSpeed = 0.90f * CHEAT_MULTFACTOR;
		   if (VSpeed <-0.90f * CHEAT_MULTFACTOR) VSpeed =-0.90f * CHEAT_MULTFACTOR;        
		   if (SSpeed > 0.90f * CHEAT_MULTFACTOR) SSpeed = 0.90f * CHEAT_MULTFACTOR;
		   if (SSpeed <-0.90f * CHEAT_MULTFACTOR) SSpeed =-0.90f * CHEAT_MULTFACTOR; 
	   } else {
		   if (VSpeed > 0.45f * CHEAT_MULTFACTOR) VSpeed = 0.45f * CHEAT_MULTFACTOR;
		   if (VSpeed <-0.45f * CHEAT_MULTFACTOR) VSpeed =-0.45f * CHEAT_MULTFACTOR;    
		   if (SSpeed > 0.45f * CHEAT_MULTFACTOR) SSpeed = 0.45f * CHEAT_MULTFACTOR;
		   if (SSpeed <-0.45f * CHEAT_MULTFACTOR) SSpeed =-0.45f * CHEAT_MULTFACTOR;  
	   }
   }

   /* == FEATURE: SprintMode core application system here == */
   if (SprintMode) {
	   // == ADP -> Preform Checks to force a detoggle of sprint mode...
	   if (SWIM || CrouchMode || MyEnergy <= 0 || (VSpeed == 0 && SSpeed == 0) || YSpeed > 600) {
		   DisableSprint();
	   } else {
		   // == Now Apply Sprinting if hunter passed checks
		   if (VSpeed > 1.25f * CHEAT_MULTFACTOR) VSpeed = 1.25f * CHEAT_MULTFACTOR;
		   if (VSpeed <-1.25f * CHEAT_MULTFACTOR) VSpeed =-1.25f * CHEAT_MULTFACTOR;        
		   if (SSpeed > 1.25f * CHEAT_MULTFACTOR) SSpeed = 1.25f * CHEAT_MULTFACTOR;
		   if (SSpeed <-1.25f * CHEAT_MULTFACTOR) SSpeed =-1.25f * CHEAT_MULTFACTOR;  
		   // == Drain Energy
		   MyEnergy-=TimeDt*10;
	   }
   }
	   
   

   if (KeyboardState [KeyMap.fkFire] & 128) {
	   if ((WeapInfo[CurrentWeapon].semiauto && !Weapon.TPA) || !WeapInfo[CurrentWeapon].semiauto)
				ProcessShoot(); //4.16.09: ProcessShoot now multithreaded within function
   } else {
	   Weapon.TPA = 0;
   }
     
   
   if (KeyboardState [KeyMap.fkShow] & 128) HideWeapon();

   if (BINMODE) {
	   if (KeyboardState[VK_ADD     ] & 128) BinocularPower+=BinocularPower * TimeDt / 4000.f;
	   if (KeyboardState[VK_SUBTRACT] & 128) BinocularPower-=BinocularPower * TimeDt / 4000.f;
	   if (BinocularPower < 1.5f) BinocularPower = 1.5f;
	   if (BinocularPower > 3.0f) BinocularPower = 3.0f;
   }

   if (KeyFlags & kfCall) MakeCall();
       
  if (DEBUG)   
   if (KeyboardState [VK_CONTROL] & 128) 
    if (KeyFlags & kfBackward) VSpeed =-8; else VSpeed = 8;

   if (KeyFlags & kfJump) 
     if (YSpeed == 0 && !SWIM) {      
       YSpeed = 600 + (float)fabs(VSpeed) * 600;
	   AddVoicev(fxJump.length, fxJump.lpData, 256);
     }

//=========  rotation =========//   
   if (KeyFlags & kfRight)  PlayerAlpha+=DeltaT*1.5f;
   if (KeyFlags & kfLeft )  PlayerAlpha-=DeltaT*1.5f;
   if (KeyFlags & kfLookUp) PlayerBeta-=DeltaT;
   if (KeyFlags & kfLookDn) PlayerBeta+=DeltaT;


//========= movement ==========//

   ca = (float)cos(PlayerAlpha);
   sa = (float)sin(PlayerAlpha);   
   cb = (float)cos(PlayerBeta);
   sb = (float)sin(PlayerBeta);   

   nv.x=sa;
   nv.y=0; 
   nv.z=-ca;

   
   PlayerNv = nv;
   if (UNDERWATER || FLY) {
    nv.x*=cb;
    nv.y=-sb;
    nv.z*=cb;
    PlayerNv = nv;
   } else {
    PlayerNv.x*=cb;
    PlayerNv.y=-sb;
    PlayerNv.z*=cb;
   }   
   
   Vector3d sv = nv;
   nv.x*=(float)TimeDt*VSpeed;
   nv.y*=(float)TimeDt*VSpeed;
   nv.z*=(float)TimeDt*VSpeed;

   sv.x*=(float)TimeDt*SSpeed;
   sv.y=0;
   sv.z*=(float)TimeDt*SSpeed;

   if (!TrophyMode) {
     TrophyRoom.Last.path+=(TimeDt*VSpeed) / 128.f;
     TrophyRoom.Last.time+=TimeDt/1000.f;
   }

 if (SWIM & (VSpeed>0.1) & (sb>0.60)) HeadY-=40;

   int mvi = 1 + TimeDt / 16;   

   for (int mvc = 0; mvc<mvi; mvc++) {
    PlayerX+=nv.x / mvi;   
    PlayerY+=nv.y / mvi;
    PlayerZ+=nv.z / mvi;

	PlayerX-=sv.z / mvi;       
    PlayerZ+=sv.x / mvi;
     
    if (!NOCLIP) CheckCollision(PlayerX, PlayerZ);    

    if (PlayerY <= GetLandQHNoObj(PlayerX, PlayerZ)+16) {
       ProcessSlide();
       ProcessSlide(); }
   }

   if (PlayerY <= GetLandQHNoObj(PlayerX, PlayerZ)+16) {
    ProcessSlide();
    ProcessSlide(); }
//===========================================================      
}


void ProcessDemoMovement()
{  
  BINMODE = FALSE;
  
  PAUSE = FALSE;
  MapMode = FALSE;

  if (DemoPoint.DemoTime>6*1000)
	if (!PAUSE) {       
	   EXITMODE = TRUE; 
	   ResetMousePos(); 
	  }

  if (DemoPoint.DemoTime>12*1000) { 
	//ResetMousePos();
    //DemoPoint.DemoTime = 0;
	//LoadTrophy();
	DoHalt("");
	return;  }

  VSpeed = 0.f;

  DemoPoint.pos = Characters[DemoPoint.CIndex].pos;
#ifdef _iceage // alacn
  if (Characters[DemoPoint.CIndex].AI == AI_MAMM) DemoPoint.pos.y+=512;
#else
  if (Characters[DemoPoint.CIndex].AI==AI_TREX) DemoPoint.pos.y+=512;
#endif
  DemoPoint.pos.y+=256;  

  Vector3d nv = SubVectors(DemoPoint.pos,  CameraPos);
  Vector3d pp = DemoPoint.pos;
  pp.y = CameraPos.y;
  float l = VectorLength( SubVectors(pp,  CameraPos) );
  float base = 824;
#ifdef _iceage // alacn
  if (Characters[DemoPoint.CIndex].AI == AI_MAMM) base+=512;
#else
  if (Characters[DemoPoint.CIndex].AI==AI_TREX) base=1424;
#endif
  
  if (DemoPoint.DemoTime==1)
   if (l < base) DemoPoint.DemoTime = 2; 
  NormVector(nv, 1.0f);
  
  if (DemoPoint.DemoTime == 1) {
   DeltaFunc(CameraX, DemoPoint.pos.x, (float)fabs(nv.x) * TimeDt * 3.f);  
   DeltaFunc(CameraZ, DemoPoint.pos.z, (float)fabs(nv.z) * TimeDt * 3.f);  
  } else {
   DemoPoint.DemoTime+=TimeDt;
   CameraAlpha+=TimeDt / 1224.f;
   ca = (float)cos(CameraAlpha);
   sa = (float)sin(CameraAlpha);         
   //float k = (base - l) / 350.f;
   DeltaFunc(CameraX, DemoPoint.pos.x  - sa * base, (float)TimeDt );
   DeltaFunc(CameraZ, DemoPoint.pos.z  + ca * base, (float)TimeDt );
  }

  float b = FindVectorAlpha( (float)
			  sqrt ( (DemoPoint.pos.x - CameraX)*(DemoPoint.pos.x - CameraX) +
			         (DemoPoint.pos.z - CameraZ)*(DemoPoint.pos.z - CameraZ) ),
			  DemoPoint.pos.y - CameraY - 400.f);
  if (b>pi) b = b - 2*pi;
  DeltaFunc(CameraBeta, -b , TimeDt / 4000.f);



  float h = GetLandQH(CameraX, CameraZ);    
  DeltaFunc(CameraY, h+128, TimeDt / 8.f);
  if (CameraY < h + 80) CameraY = h + 80;    
}




void ProcessControls()
{      
   int _KeyFlags = KeyFlags;
   KeyFlags = 0;
   GetKeyboardState(KeyboardState);   

   /* == Feature Addition, 4.19.09, ADP: Sprint Mode == */
   if ( (KeyboardState [KeyMap.fkSprint] & 128) && ( (KeyboardState [KeyMap.fkForward ] & 128) || (KeyboardState [KeyMap.fkBackward] & 128) || (KeyboardState [KeyMap.fkLeft ]& 128) || (KeyboardState [KeyMap.fkRight ]& 128)) ) {
	   EnableSprint(); // Preform Checks before enabling sprint mode, such as engery level etc
   } else {
	   DisableSprint(); //Disengage sprint system
   }

   if (USE_MELEE && (KeyboardState [KeyMap.fkAim] & 128) && MeleeTime == 0 && Weapon.state && (RealTime - LastMeleeTime > 250)) {
	   // Melee test
	   MeleeTime = 1;
	}

   /* == Feature Addition, 4.13.09, ADP: Weapon Ironsights == */
   if (!USE_MELEE && (KeyboardState [KeyMap.fkAim] & 128) && Weapon.state) {
	   //-> If player is pressing aim key and not in aim, then go aim. Else, return to rest or stay in position
	   if (Weapon.ironsights != 2 && Weapon.ironsights != 3 && WeapInfo[CurrentWeapon].Optic != 1)
		   // if weapon is not going aim and is not in aim, then go aim
			Weapon.ironsights = 2; //2 means 'going aim'
   } else {
	   if (Weapon.ironsights != 1 && Weapon.ironsights != 0)
		   // if weapon is not going rest or in rest, then go rest
			Weapon.ironsights = 1; //1 means 'going rest'
   }


   if (KeyboardState [KeyMap.fkStrafe] & 128) KeyFlags+=kfStrafe;   

   if (KeyboardState [KeyMap.fkForward ] & 128) KeyFlags+=kfForward;  
   if (KeyboardState [KeyMap.fkBackward] & 128) KeyFlags+=kfBackward;   
   
   if (KeyboardState [KeyMap.fkUp   ] & 128)  KeyFlags+=kfLookUp;  
   if (KeyboardState [KeyMap.fkDown ] & 128)  KeyFlags+=kfLookDn;

   if (KeyFlags & kfStrafe) {
    if (KeyboardState [KeyMap.fkLeft ] & 128)  KeyFlags+=kfSLeft;  
    if (KeyboardState [KeyMap.fkRight] & 128) KeyFlags+=kfSRight;   
   } else {
	if (KeyboardState [KeyMap.fkLeft ] & 128)  KeyFlags+=kfLeft;  
    if (KeyboardState [KeyMap.fkRight] & 128) KeyFlags+=kfRight;   
   }

   if (KeyboardState [KeyMap.fkSLeft]  & 128) KeyFlags+=kfSLeft;   
   if (KeyboardState [KeyMap.fkSRight] & 128) KeyFlags+=kfSRight;   
   

   if (KeyboardState [KeyMap.fkJump] & 128) KeyFlags+=kfJump;   
   
   if (KeyboardState [KeyMap.fkCall] & 128) 
	 if (!(_KeyFlags & kfCall)) KeyFlags+=kfCall;

   DeltaT = (float)TimeDt / 1000.f;

   if ( DemoPoint.DemoTime) ProcessDemoMovement();
   if (!DemoPoint.DemoTime) ProcessPlayerMovement();      

   if (IN_VEHICLE)
	   goto SKIPYMOVE;
//======= Y movement ===========//   
   HeadAlpha = HeadBackR / 20000;
   HeadBeta =-HeadBackR / 10000;
   if (HeadBackR) {
    HeadBackR-=DeltaT*(80 + (32-(float)fabs(HeadBackR - 32))*4);
    if (HeadBackR<=0) { HeadBackR = 0; HeadBSpeed = 0; }
   }

   if (CrouchMode | (UNDERWATER) ) {
     if (HeadY<110.f) HeadY = 110.f;
     HeadY-=DeltaT*(60 + (HeadY-110)*5);
     if (HeadY<110.f) HeadY = 110.f;
   } else { 
     if (HeadY>220.f) HeadY = 220.f;
     HeadY+=DeltaT*(60 + (220 - HeadY) * 5);
     if (HeadY>220.f) HeadY = 220.f;
   }
  

  float h  = GetLandQH(PlayerX, PlayerZ);
  float hu = GetLandCeilH(PlayerX, PlayerZ)-64;
  float hwater = GetLandUpH(PlayerX, PlayerZ);

  if (DemoPoint.DemoTime) goto SKIPYMOVE;  
  if (PlayerPainTime != 0 && (UNDERWATER || SWIM)) {
	  if (SWIM == TRUE) {
		PlayerY = hwater - 250;
		SWIM = FALSE;
		goto SKIPYMOVE;
	  }
	  LooseMouse = TRUE;
	  PlayerY = hwater - (150 + rRand(120));
	  goto SKIPYMOVE;
  } else if (LooseMouse == TRUE) {
	  LooseMouse = FALSE;
  }

  if (!UNDERWATER) {
   if (PlayerY>h) YSpeed-=DeltaT*3000; 
  } else if (PlayerPainTime == 0)
	  if (YSpeed<0) {
        YSpeed+=DeltaT*4000;
        if (YSpeed>0) YSpeed=0;
     }
  
  if (FLY) YSpeed=0;
  PlayerY+=YSpeed*DeltaT;

 
  if (PlayerY+HeadY>hu) {
	 if (YSpeed>0) YSpeed=-1;
     PlayerY = hu - HeadY;
	 if (PlayerY<h) {
       PlayerY = h;
	   HeadY = hu - PlayerY;
	   if (HeadY<110) HeadY = 110;
	 }
  }
//Jump Sounds when you hit the ground
  if (PlayerY<h) { 
    if (YSpeed<-800) HeadY+=YSpeed/100;          
    if (PlayerY < h-80) PlayerY = h - 80;
    PlayerY+=(h-PlayerY+32)*DeltaT*4;
    if (PlayerY>h) PlayerY = h;
	if (YSpeed<-600) { //orig -600
		AddVoicev(fxStep[(RealTime % 3)].length, 
	              fxStep[(RealTime % 3)].lpData, 64);
	}

	YSpeed = 0;  
  }

SKIPYMOVE:

  SWIM = FALSE;
  if (!UNDERWATER && (KeyFlags & kfJump) && PlayerPainTime == 0)
      if (PlayerY<hwater-148) { SWIM = TRUE; PlayerY = hwater-148; YSpeed = 0; }
    
  float _s = stepdy;

  if (SWIM) {
	  stepdy = (float)sin((float)RealTime / 360) * 20;
  } else {
	 // stepdy = (float)min(1.f,fabs(VSpeed) + (float)fabs(SSpeed)) * (float)sin((float)RealTime / 80.f) * 22.f;
	  // y = Amplitude * sin(X)
	  // -> Amp is found by multiplying 1 or 0 (whether your moving or not) * 22f.
	  // -> This in conjunction with the trig function sin finds the camera height
	  if (VSpeed != 0 || SSpeed != 0)
		  stepsoundtime += TimeDt;
     stepdy = (float)min(1.f,fabs(VSpeed) + (float)fabs(SSpeed)) * 22.f * (float)sin((float)RealTime / 80.f);
  }
  float d = stepdy - _s;

  bool DoPlaySound = false;
  if (stepsoundtime >= 500 && (VSpeed != 0 || SSpeed != 0)) {
	  DoPlaySound = true;
	  stepsoundtime = 0;
	  //wsprintf(logt,"Step %d",stepdy);
	 // AddMessage(logt);
  }


  //Walking sounds
  // ->Adelphospro
  // ->Find where stepdy equals lowest value possible

  if (!UNDERWATER) {
	  if (PlayerY<h+64) { //orig 64
		  //if (d<0 && stepdd >= 0 )  {
		  if (DoPlaySound)  {
			  if (ONWATER) {
				  AddWCircle(CameraX, CameraZ, 1.2f);	   
				  AddVoicev(fxStepW[(RealTime % 3)].length, 
					  fxStepW[(RealTime % 3)].lpData, 64+(int)(VSpeed*30.f));
			  } else {
				  AddVoicev(fxStep[(RealTime % 3)].length, 
					  fxStep[(RealTime % 3)].lpData, 24+int(VSpeed*50.f));
			  }
		  }
	  }
  }
  stepdd = d;

  if (PlayerBeta> 1.46f) PlayerBeta= 1.46f;
  if (PlayerBeta<-1.26f) PlayerBeta=-1.26f;


//======== set camera pos ===================//
  //-> Adelphospro: Added slight side (x) head bobbing
  //if (VSpeed != 0 || SSpeed != 0 || XFootStepTime != 0) {
	 // int tWalkTime; //How long it takes in MS to take 2 steps
	 // float StepVolume = 24+int(VSpeed*50.f); //How loud the sound
	 // float stepintcount; //How fast the camera moves to the right and left each frame
	 // XFootStepTime += TimeDt;
	 // // -> First, calculate time required to make 2 steps
	 // //  the slower you go, the fast you complete your steps.
	 // // -> Crouching
	 // if (!SprintMode && CrouchMode && !SWIM && !UNDERWATER) {
		//  tWalkTime = 333;
		//  StepVolume = 0;
		//  stepintcount = 0.0007;
	 // }
	 // // -> Walking = 1 steps per second
	 // if (!RunMode && !SprintMode && !CrouchMode && !SWIM && !UNDERWATER ) {
		//  tWalkTime = 600;
		//  StepVolume = 24+int(VSpeed*25.f);
		//  stepintcount = 0.002;
	 // }
	 // // -> Running = ~ steps per second
	 // if (RunMode && !SprintMode && !CrouchMode && !SWIM && !UNDERWATER) {
		//  tWalkTime = 800;
		//  StepVolume = 24+int(VSpeed*50.f);
		//  stepintcount = 0.005;
	 // }
	 // // -> Sprinting = 2 steps (Larger steps)
	 // if (SprintMode && !UNDERWATER && !SWIM) {
		//  tWalkTime = 1000;
		//  StepVolume = 24+int(VSpeed*80.f);
		//  stepintcount = 0.005;
	 // }
	 // // -> Now, walk!
	 // if (XFootStepTime > tWalkTime/2 && XFootStepTime < tWalkTime) {
		//  //Right Foot
		//  XFootStep += stepintcount;
		//  if (stepsoundtime != 2) {
		//	  DoPlaySound = true;
		//	  stepsoundtime = 2;
		//  }
	 // } else if (XFootStepTime <= tWalkTime/2) {
		//  //Left foot
		//  XFootStep -= stepintcount;
  //		  if (stepsoundtime != 1) {
		//	  DoPlaySound = true;
		//	  stepsoundtime = 1;
		//  }
	 // } else {
		//  //Restart
		//  XFootStep = 0;
		//  XFootStepTime = 0;
		//  stepsoundtime = 0;
	 // } 
	 // if (DoPlaySound) {
		//  if (ONWATER) {
		//	  AddWCircle(CameraX, CameraZ, 1.2f);	   
		//	  AddVoicev(fxStepW[(RealTime % 3)].length, 
		//		  fxStepW[(RealTime % 3)].lpData, 64+(int)(VSpeed*30.f));
		//  } else {
		//	  AddVoicev(fxStep[(RealTime % 3)].length, 
		//		  fxStep[(RealTime % 3)].lpData, StepVolume);
		//  }
	 // }
  //}


  if (!DemoPoint.DemoTime) {
   CameraAlpha = PlayerAlpha + HeadAlpha;// + PainAlpha;// + XFootStep;
   CameraBeta  = PlayerBeta  + HeadBeta;// + Weapon.ClimbBeta;
  // PainAlpha = 0;

   //-> Reduce climb of weapon
  // if (CameraBeta < Weapon.StartBeta && !Weapon.FTime) {
	 //  Weapon.ClimbBeta += WeapInfo[CurrentWeapon].MaxWClimb*0.01;
  // } else if (Weapon.ClimbBeta != 0) {
	 //  Weapon.ClimbBeta = 0;
  //}

   CameraX = PlayerX - sa * HeadBackR;
   CameraY = PlayerY + HeadY + stepdy;// + 2024;
   CameraZ = PlayerZ + ca * HeadBackR;   
  }

  if (CLIP3D) {
   if (sb<0) BackViewR = 320.f - 1024.f * sb;
        else BackViewR = 320.f + 512.f * sb;
   BackViewRR = 380 + (int)(1024 * fabs(sb));
   if (UNDERWATER) BackViewR -= 512.f * (float)min(0,sb);
  } else {
   BackViewR = 300;
   BackViewRR = 380;
  }

  
//==================== SWIM & UNDERWATER =========================//
  ONWATER = (GetLandUpH(CameraX, CameraZ) > GetLandH(CameraX, CameraZ)) &&
            (PlayerY < GetLandUpH(CameraX, CameraZ));
  
  if (UNDERWATER) {
   UNDERWATER = (GetLandUpH(CameraX, CameraZ)-4>= CameraY);
   if (!UNDERWATER && !POTHEAD) { 
	   HeadY+=20; CameraY+=20; 
	   AddVoicev(fxWaterOut.length, fxWaterOut.lpData, 256);	   
	   AddWCircle(CameraX, CameraZ, 2.0);	   
   }
  } else {
   UNDERWATER = (GetLandUpH(CameraX, CameraZ)+28 >= CameraY);
   if (UNDERWATER || POTHEAD) { 
	   HeadY-=20; CameraY-=20; 
	   BINMODE = FALSE;
	   AddVoicev(fxWaterIn.length, fxWaterIn.lpData, 256);
	   AddWCircle(CameraX, CameraZ, 2.0);	   
   }
  }

  if (MyHealth)
  if (UNDERWATER && !CHEAT_GOD) {
	  MyHealth-=TimeDt*12;
	  //if ( !(Takt & 31)) AddElements(CameraX + sa*64*cb, CameraY - 32 - sb*64, CameraZ - ca*64*cb, 4);
	  if (MyHealth<=0)
	      AddDeadBody(NULL, HUNT_BREATH);
  }
 
  if (UNDERWATER)
	  if (Weapon.state) HideWeapon();

  if (!UNDERWATER) UnderWaterT = 0;
              else if (UnderWaterT<512) UnderWaterT += TimeDt; else UnderWaterT = 512;

  if (UNDERWATER || POTHEAD) {
    CameraW = (float)VideoCX*(1.25f + (1.f+(float)cos(RealTime/180.f)) / 30  + (1.f - (float)sin(UnderWaterT/512.f*pi/2)) / 1.5f  );
    CameraH = (float)VideoCX*(1.25f + (1.f+(float)sin(RealTime/180.f)) / 30  - (1.f - (float)sin(UnderWaterT/512.f*pi/2)) / 16.f  );
	CameraH *=(WinH*1.3333f / WinW);
    
    CameraAlpha+=(float)cos(RealTime/360.f) / 120;
    CameraBeta +=(float)sin(RealTime/360.f) / 100;    
    CameraY-=(float)sin(RealTime/360.f) * 4;    
	int w = WMap[(((int)(CameraZ))>>8) ][ (((int)(CameraX))>>8) ];
	FogsList[127].YBegin = (float)WaterList[w].wlevel;
	FogsList[127].fogRGB = WaterList[w].fogRGB;
  } else {
   CameraW = (float)VideoCX*1.25f;
   CameraH = CameraW * (WinH*1.3333f / WinW);
  }
  
  
  if (BINMODE || (Weapon.state && (Weapon.ironsights == 2 || Weapon.ironsights == 3)) ) {  
   CameraW*=BinocularPower;
   CameraH*=BinocularPower;
  } else if (OPTICMODE) {  
   CameraW*=3.0f;
   CameraH*=3.0f;
  }

  FOVK =  CameraW / (VideoCX*1.25f);
    
  InitClips();

  if (SWIM) {
   if (!(Takt & 31)) AddWCircle(CameraX, CameraZ, 1.5);
   CameraBeta -=(float)cos(RealTime/360.f) / 80;
   PlayerX+=DeltaT*32;
   PlayerZ+=DeltaT*32;
  }


  CameraFogI = FogsMap [((int)CameraZ)>>9][((int)CameraX)>>9];
  if (UNDERWATER) CameraFogI=127;
  if (FogsList[CameraFogI].YBegin*ctHScale> CameraY)
     CAMERAINFOG = (CameraFogI>0);
  else
	 CAMERAINFOG = FALSE;

  if (CAMERAINFOG)
	if (MyHealth)
	  if (FogsList[CameraFogI].Mortal && !CHEAT_GOD) {
		  if (MyHealth>100000) MyHealth = 100000;
		  MyHealth-=TimeDt*64;
		  if (MyHealth<=0)
			  AddDeadBody(NULL, HUNT_EAT); 			  		  
	  }

  int CameraAmb = AmbMap [((int)CameraZ)>>9][((int)CameraX)>>9];


  if (UNDERWATER || POTHEAD) {
	  SetAmbient(fxUnderwater.length,
	             fxUnderwater.lpData,
				 240); 
	  Audio_SetEnvironment(8, ctViewR*256.0f);
  } else  {
   SetAmbient(Ambient[CameraAmb].sfx.length, 
              Ambient[CameraAmb].sfx.lpData,
 	          Ambient[CameraAmb].AVolume);
   Audio_SetEnvironment(Ambient[CameraAmb].rdata[0].REnvir, ctViewR*256.0f);


   if (Ambient[CameraAmb].RSFXCount) {
       Ambient[CameraAmb].RndTime-=TimeDt;	   
    if (Ambient[CameraAmb].RndTime<=0) {
      Ambient[CameraAmb].RndTime = (Ambient[CameraAmb].rdata[0].RFreq / 2 + rRand(Ambient[CameraAmb].rdata[0].RFreq)) * 1000;
	  int rr = (rand() % Ambient[CameraAmb].RSFXCount);
	  int r = Ambient[CameraAmb].rdata[rr].RNumber;
	  AddVoice3dv(RandSound[r].length, RandSound[r].lpData,
		          CameraX + siRand(4096),
                  CameraY + siRand(256),
			      CameraZ + siRand(4096) ,
			      Ambient[CameraAmb].rdata[rr].RVolume);
	}
   }
  }
  

  if (NOCLIP) CameraY+=1024;
  //======= results ==========//
  if (CameraBeta> 1.46f) CameraBeta= 1.46f;
  if (CameraBeta<-1.26f) CameraBeta=-1.26f;

  PlayerPos.x = PlayerX;
  PlayerPos.y = PlayerY;
  PlayerPos.z = PlayerZ;
  	 /*Characters[human_model_ch].pos.x = PlayerX;
     Characters[human_model_ch].pos.z = PlayerZ;
	 Characters[human_model_ch].pos.y = PlayerY;*/
  CameraPos.x = CameraX;
  CameraPos.y = CameraY;
  CameraPos.z = CameraZ;
    
}











/**
* Draw a warning HUD if dangerous dinosaurs are nearby
* @author tminard
*/
void DrawWarningHUD()
{
	//float pdist,playerdx,playerdz;
	if (!DEBUG) return; //disabled
	if (!RadarMode || !MyHealth) return;

	int pdistFt;
	int closestC = -1;
	int closestFt = 0;

	for (int c = 0; c < ChCount; c++) {
		//playerdx = PlayerX - Characters[c].pos.x - Characters[c].lookx * 108;
		//playerdz = PlayerZ - Characters[c].pos.z - Characters[c].lookz * 108;
		pdistFt = (int)(VectorLength( SubVectors(Characters[c].pos, PlayerPos) )*3 / 64.f);
		if (pdistFt < 500 && Characters[c].Health > 0 && DinoInfo[Characters[c].CType][Characters[c].SUBAI].DangerCall == TRUE) {
			if (pdistFt < closestFt || closestC == -1) {
				closestC = c;
				closestFt = pdistFt;
				
				if (Characters[c].AfraidTime) {
					wsprintf(logt,"WARNING: %s distance %dft and closing", DinoInfo[Characters[c].CType][Characters[c].SUBAI].Name, pdistFt);
				} else {
					wsprintf(logt,"WARNING: %s distance %dft", DinoInfo[Characters[c].CType][Characters[c].SUBAI].Name, pdistFt);
				}
			}
		}
	}

	if (closestC != -1) {
		flashWarningTime += TimeDt;
		if (flashWarningTime < 256) {
			int x,y;
			x = VideoCX - (WinW / 64);
			y = VideoCY;
			PrintText(logt, x, y, (int)RGB(254,0,0));
			//wsprintf(logt,"Health: %dHP", Characters[closestC].Health);
			//PrintText(logt, x, y+19, (int)RGB(200,0,0));
		} else if (flashWarningTime > 256) { //set to 500~+ to enable flash
			flashWarningTime = 0;
		}
	}
}


void ProcessGame()
{
	// -> Check if Max FPS is set, and if so then process it...
	if (MAX_FPS) {
		// -> Only process if the current FPS is larger than it should be...
		if (ENGINE_FPS > MAX_FPS) {
			Sleep(1000/MAX_FPS);
		}
	}
	if (RestartMode && FADING == 0) {
		ShutDown3DHardware();
		AudioStop();
		NeedRVM = TRUE;
		FADE_IN		 = TRUE;
	}

    if (!_GameState) {				
		PrintLog("Entered game\n");		        
		ReInitGame();						
        while (ShowCursor(FALSE)>=0);        
	}

    _GameState = 1;
	strcpy(USE_MESSAGE, "");

    if (NeedRVM) {		
		SetWindowPos(hwndMain, HWND_TOP, 0,0,0,0,  SWP_SHOWWINDOW);
		SetFocus(hwndMain);							    
		Activate3DHardware();		
		NeedRVM = FALSE;
	}
	
    ProcessSyncro();

	if (!PAUSE || !MyHealth) {
		ProcessControls();
		AudioSetCameraPos(CameraX, CameraY, CameraZ, CameraAlpha, CameraBeta);
		// -> Run AI thread
		if (USE_THREADS) {
			if (!AI_THREAD_ACTIVE) {
				AI_THREAD_ACTIVE = TRUE;
				_beginthread( AnimateCharacters,0,NULL);
			}
		} else {
			AnimateCharacters(NULL);
		}
		AnimateProcesses();
	}
		    
    if (DEBUG || ObservMode || TrophyMode) 
		if (MyHealth) MyHealth = MAX_HEALTH;
	if (DEBUG) ShotsLeft[CurrentWeapon] = WeapInfo[CurrentWeapon].Shots-1;
    
	DrawScene();  
	
	if (!TrophyMode)
     if (MapMode) DrawHMap();

	DrawWarningHUD();

    DrawPostObjects(); 
	
    ShowControlElements();
	        
    ShowVideo();    
}



int PASCAL WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
			       LPSTR lpszCmdLine, int nCmdShow)
{
    MSG msg;	
	
	hInst = hInstance;    
	CreateLog();
	   
	CreateMainWindow();            
	
	Init3DHardware();
	InitEngine();    	
	InitAudioSystem(hwndMain, hlog, OptSound);	
	InitSoundEngine(); //Init secondary sound engine
	InitNetwork(); //YAY!

	StartLoading();    
	PrintLoad("Loading...");
    
	PrintLog("== Loading resources ==\n");
    hcArrow = LoadCursor(NULL, IDC_ARROW);


	PrintLog("Loading common resources:");
	PrintLoad("Loading common resources...");

	if (OptDayNight==2)
	  LoadModelEx(SunModel,    "HUNTDAT\\MOON.3DF");
	else
	  LoadModelEx(SunModel,    "HUNTDAT\\SUN2.3DF");
	LoadModelEx(CompasModel, "HUNTDAT\\COMPAS.3DF");
	LoadModelEx(Binocular,   "HUNTDAT\\BINOCUL.3DF");

	PrintLog("Loading common character info...");
	LoadCharacterInfo(WCircleModel , "HUNTDAT\\WCIRCLE2.CAR"); 	
	LoadCharacterInfo(ShipModel, "HUNTDAT\\ship2a.car"); 
	LoadCharacterInfo(WindModel, "HUNTDAT\\WIND.CAR");

    LoadCharacterInfo(SShipModel, "HUNTDAT\\sship1.car"); 
    LoadCharacterInfo(AmmoModel, "HUNTDAT\\bag1.car"); 
	PrintLog("done\n");

	//-> Only display this if in software mode...
	//LoadCharacterInfo(ExploCar,"HUNTDAT\\EXPLO.car");

	LoadWav("HUNTDAT\\SOUNDFX\\a_underw.wav",  fxUnderwater);

	LoadWav("HUNTDAT\\SOUNDFX\\STEPS\\hwalk1.wav",  fxStep[0]);
	LoadWav("HUNTDAT\\SOUNDFX\\STEPS\\hwalk2.wav",  fxStep[1]);
	LoadWav("HUNTDAT\\SOUNDFX\\STEPS\\hwalk3.wav",  fxStep[2]);

	LoadWav("HUNTDAT\\SOUNDFX\\STEPS\\footw1.wav",  fxStepW[0]);
	LoadWav("HUNTDAT\\SOUNDFX\\STEPS\\footw2.wav",  fxStepW[1]);
	LoadWav("HUNTDAT\\SOUNDFX\\STEPS\\footw3.wav",  fxStepW[2]);

	LoadWav("HUNTDAT\\SOUNDFX\\hum_die1.wav",  fxScream[0]);
	LoadWav("HUNTDAT\\SOUNDFX\\hum_die2.wav",  fxScream[1]);
	LoadWav("HUNTDAT\\SOUNDFX\\hum_die3.wav",  fxScream[2]);
	LoadWav("HUNTDAT\\SOUNDFX\\hum_die4.wav",  fxScream[3]);		

	//== Adelphospro == //
	// -> These sounds are now played by 2ndarry sound engine
	//LoadWav("HUNTDAT\\SOUNDFX\\type.wav",  TypeSound[0]); //Typing...
	//LoadWav("HUNTDAT\\SOUNDFX\\typego.wav",  TypeSound[1]); //Click enter
	
	LoadPictureTGA(PausePic,   "HUNTDAT\\MENU\\pause.tga");       conv_pic(PausePic);
	LoadPictureTGA(ExitPic,    "HUNTDAT\\MENU\\exit.tga");        conv_pic(ExitPic);
	LoadPictureTGA(TrophyExit, "HUNTDAT\\MENU\\trophy_e.tga");    conv_pic(TrophyExit);		
	LoadPictureTGA(MapPic,     "HUNTDAT\\MENU\\mapframe.tga");    conv_pic(MapPic);
	LoadPictureTGA(ConsolePic,   "HUNTDAT\\MENU\\console.tga");	  conv_pic(ConsolePic);
		
	LoadPictureTGA(TFX_ENVMAP,    "HUNTDAT\\FX\\envmap.tga");   ApplyAlphaFlags(TFX_ENVMAP.lpImage, TFX_ENVMAP.W*TFX_ENVMAP.W);
	LoadPictureTGA(TFX_SPECULAR,  "HUNTDAT\\FX\\specular.tga"); ApplyAlphaFlags(TFX_SPECULAR.lpImage, TFX_SPECULAR.W*TFX_SPECULAR.W);

	
	PrintLog(" Done.\n");
    
	PrintLoad("Loading area...");
	LoadResources();

	PrintLoad("Starting game...");
	PrintLog("Loading area: Done.\n");	
	
	EndLoading();	

	ProcessSyncro();	
	blActive = TRUE;

    PrintLog("Entering messages loop.\n");
    for( ; ; )
   	  if( PeekMessage( &msg, NULL, NULL, NULL, PM_REMOVE ) ) {
        if (msg.message == WM_QUIT)  break;
		TranslateMessage( &msg );
		DispatchMessage( &msg );
	  } else {
        if (QUITMODE==1) {
			ShutDown3DHardware();
            Audio_Shutdown();
			ShutdownSoundEngine();
			DestroyWindow(hwndMain);
			QUITMODE=2;
		}
		if (!QUITMODE)
        if (blActive) ProcessGame();                  
                 else Sleep(100); 
	  }

     
     DestroyNetwork();
     ShutDownEngine();    
     ShowCursor(TRUE);   
	 PrintLog("Game normal shutdown.\n");
	 
	 CloseLog();
     return msg.wParam;	 
}
