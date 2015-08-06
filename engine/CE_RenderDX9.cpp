#ifdef _dx9
/**
* DX9 Renderer for Carnivores
* @author tminard
* @date 8.04.09
*/

/* References */
#include "hunt.h"
#include <d3d9.h>
#include <d3dx9.h>
#include <xstring>
#pragma comment (lib, "d3d9.lib")
#pragma comment (lib, "d3dx9.lib")

/* Defines */
#define SCREEN_WIDTH  1024
#define SCREEN_HEIGHT 768

/* Variables */
LPDIRECT3D9 d3d;    // the pointer to our Direct3D interface
LPDIRECT3DDEVICE9 d3ddev;    // the pointer to the device class

D3DPRESENT_PARAMETERS d3dpp;    // create a struct to hold various device information

bool TestBool;
int zs;

/* Required functions */

/**
* Init directX9
*/
void Init3DHardware(void)
{
    d3d = Direct3DCreate9(D3D_SDK_VERSION);    // create the Direct3D interface

    ZeroMemory(&d3dpp, sizeof(d3dpp));    // clear out the struct for use
    d3dpp.Windowed = FALSE;    // program windowed, not fullscreen
    d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;    // discard old frames
    d3dpp.hDeviceWindow = hwndMain;    // set the window to be used by Direct3D
    d3dpp.BackBufferFormat = D3DFMT_R5G6B5;    // set the back buffer format to 32-bit
    d3dpp.BackBufferWidth = SCREEN_WIDTH;    // set the width of the buffer
    d3dpp.BackBufferHeight = SCREEN_HEIGHT;    // set the height of the buffer

    // create a device class using this information and information from the d3dpp stuct
    d3d->CreateDevice(D3DADAPTER_DEFAULT,
                      D3DDEVTYPE_HAL,
                      hwndMain,
                      D3DCREATE_SOFTWARE_VERTEXPROCESSING,
                      &d3dpp,
                      &d3ddev);
    d3ddev->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_XRGB(0, 40, 100), 1.0f, 0);
	d3ddev->BeginScene();    // begins the 3D scene
}


IDirect3DSurface9* getSurfaceFromBitmap(std::string filename)
{
	HRESULT hResult;
	IDirect3DSurface9* surface = NULL;
	D3DXIMAGE_INFO imageInfo; // holds details concerning this bitmap
	// Get the width and height info from this bitmap
	hResult = D3DXGetImageInfoFromFile(filename.c_str(), &imageInfo);
	// Make sure that the call to D3DXGetImageInfoFromFile succeeded
	if FAILED (hResult)
		return NULL;
	// Create the offscreen surface that will hold the bitmap
	hResult = d3ddev->CreateOffscreenPlainSurface( SCREEN_WIDTH,
		SCREEN_HEIGHT,
		D3DFMT_X8R8G8B8,
		D3DPOOL_DEFAULT,
		&surface,
		NULL );
		// Make sure that this function call did not fail; if it did,
		// exit this function
		if ( FAILED( hResult ) )
			return NULL;
	// Load the bitmap into the surface that was created earlier
	hResult = D3DXLoadSurfaceFromFile( surface,
		NULL,
		NULL,
		filename.c_str( ),
		NULL,
		D3DX_DEFAULT,
		0,
		NULL );
	if ( FAILED( hResult ) )
		return NULL;
	return surface;
}

/**
* Activate DirectX9 for rendering.
* This is for resetting a lost device
*/
void Activate3DHardware(void)
{
	//d3ddev->Reset(&d3dpp);
    //d3ddev->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_XRGB(0, 40, 100), 1.0f, 0);
	//d3ddev->BeginScene();    // begins the 3D scene
}

void RenderElements(void)
{
}

void RenderWater(void)
{
}

void Render3DHardwarePosts(void)
{
}

void RenderModelsList(void)
{
}

void RenderGround(void)
{
	   for (r=ctViewR; r>=ctViewR1; r-=2) {
     
     for (int x=r; x>0; x-=2) {
      ProcessMap2(CCX-x, CCY+r, r);
      ProcessMap2(CCX+x, CCY+r, r);
	  ProcessMap2(CCX-x, CCY-r, r); 		
      ProcessMap2(CCX+x, CCY-r, r); 	
     }    
    
     ProcessMap2(CCX, CCY-r, r); 	
     ProcessMap2(CCX, CCY+r, r); 	

	 for (int y=r-2; y>0; y-=2) {
      ProcessMap2(CCX+r, CCY-y, r);
      ProcessMap2(CCX+r, CCY+y, r);
      ProcessMap2(CCX-r, CCY+y, r); 
      ProcessMap2(CCX-r, CCY-y, r);
     }
     ProcessMap2(CCX-r, CCY, r);
     ProcessMap2(CCX+r, CCY, r);
     
   } 

   
   r = ctViewR1-1;
   for (int x=r; x>-r; x--) {
	   ProcessMap(CCX+r, CCY+x, r);
	   ProcessMap(CCX+x, CCY+r, r);
   }

   for (r=ctViewR1-2; r>0; r--) {
     
     for (int x=r; x>0; x--) {
      ProcessMap(CCX-x, CCY+r, r);
      ProcessMap(CCX+x, CCY+r, r);
	  ProcessMap(CCX-x, CCY-r, r); 		
      ProcessMap(CCX+x, CCY-r, r); 	
     }    	 
    
     ProcessMap(CCX, CCY-r, r); 	
     ProcessMap(CCX, CCY+r, r); 	

	 for (int y=r-1; y>0; y--) {
      ProcessMap(CCX+r, CCY-y, r);
      ProcessMap(CCX+r, CCY+y, r);
      ProcessMap(CCX-r, CCY+y, r); 
      ProcessMap(CCX-r, CCY-y, r);
     }
     ProcessMap(CCX-r, CCY, r);
     ProcessMap(CCX+r, CCY, r);
   
   } 

   ProcessMap(CCX, CCY, 0);  
}

void RenderSkyPlane(void)
{
}

void Render_Cross(int x,int y,float sizeUnknown,bool findvalueUnknown)
{
}

void Render_LifeInfo(int)
{
}

void DrawTrophyText(int x,int y)
{
}

void FXPutBitMap(int x0, int y0, int w, int h, int smw, LPVOID lpData)
{  
	IDirect3DSurface9* backbuffer = NULL;
	IDirect3DSurface9* image = NULL;
	RECT destRect, srcRect;

	 srcRect.left = 0;
     srcRect.top = w;
     srcRect.bottom = h;
     srcRect.right = srcRect.left + w;
	 destRect.left = 0;
	 destRect.top = 0;
     destRect.bottom = 0 + h;
     destRect.right = 0 + w;

     if (FAILED(d3ddev->GetBackBuffer(0,0,D3DBACKBUFFER_TYPE_MONO, &backbuffer))) 
		 DoHalt("Error getting backbuffer\n");

	 HRESULT hResult = d3ddev->CreateOffscreenPlainSurface( SCREEN_WIDTH,
		 SCREEN_HEIGHT,
		 D3DFMT_R5G6B5,
		 D3DPOOL_DEFAULT,
		 &image,
		 NULL );
	HRESULT res = D3DXLoadSurfaceFromMemory(image,NULL, NULL,lpData,D3DFMT_R5G6B5,NULL,NULL,NULL,D3DX_DEFAULT,0);
	//image = getSurfaceFromBitmap("huntdat\\menu\\EXIT.TGA");

	 srcRect.left = 0;
     srcRect.top = 0;
     srcRect.bottom = h;
     srcRect.right = w;

	 destRect.left = x0;
	 destRect.top = y0;
     destRect.bottom = y0 + h;
     destRect.right = x0 + w;
		 
    
     d3ddev->StretchRect(image, &srcRect, backbuffer, &destRect, D3DTEXF_NONE);
	
}

void DrawPicture(int x,int y,TPicture &pic)
{
	FXPutBitMap(x, y, pic.W, pic.H, pic.W, pic.lpImage);
}

void RenderModelClipEnvMap(TagMODEL *model,float aUnknown,float bUnknown,float cUnknown,float dUnknown,float eUnknown)
{
}

void RenderModelClipPhongMap(TagMODEL *model,float aUnknown,float bUnknown,float cUnknown,float dUnknown,float eUnknown)
{
}

void RenderNearModel(TagMODEL *model,float aUnk,float bUnk,float cUnk,int dUnk,float eUnk,float fUnk)
{
}

void Hardware_ZBuffer(int aUnk)
{
}

void ShutDown3DHardware(void)
{
	if (d3ddev != NULL)
		d3ddev->Release();    // close and release the 3D device

	if (d3d != NULL)
		d3d->Release();    // close and release Direct3D
}

void ShowVideo(void)
{
    d3ddev->EndScene();    // ends the 3D scene
    d3ddev->Present(NULL, NULL, NULL, NULL);   // displays the created frame on the screen

	// clear the window to a deep blue
    //d3ddev->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_XRGB(0, 40, 100), 1.0f, 0);
	d3ddev->BeginScene();    // begins the 3D scene
}

void ShowControlElements(void)
{
}

void DrawHMap(void)
{
}

void CopyHARDToDIB(void)
{
}


/* INTERNAL FUNCTIONS */

void ProcessMap(int x, int y, int r)
{ 
   if (x>=ctMapSize-1 || y>=ctMapSize-1 ||
	   x<0 || y<0) return;   

   float BackR = BackViewR;

   if (OMap[y][x]!=255) BackR+=MObjects[OMap[y][x]].info.BoundR;

   ev[0] = VMap[y-CCY+128][x-CCX+128];
   if (ev[0].v.z>BackR) return;        
   
   int t1 = TMap1[y][x];   
   ReverseOn = (FMap[y][x] & fmReverse);   
   TDirection = (FMap[y][x] & 3);
             
   x = x - CCX + 128;
   y = y - CCY + 128;

   ev[1] = VMap[y][x+1];            

   if (ReverseOn) ev[2] = VMap[y+1][x];          
             else ev[2] = VMap[y+1][x+1];          

           
   float xx = (ev[0].v.x + VMap[y+1][x+1].v.x) / 2;
   float yy = (ev[0].v.y + VMap[y+1][x+1].v.y) / 2;
   float zz = (ev[0].v.z + VMap[y+1][x+1].v.z) / 2;   

   if ( fabs(xx*FOVK) > -zz + BackR) return;
   
    
   zs = (int)sqrt( xx*xx + zz*zz + yy*yy);          
   
  
   //if (!LOWRESTX) {
   //  if (zs > 256 * 20) d3dSetTexture(Textures[t1]->DataC, 32, 32); else
   //  if (zs > 256 * 10) d3dSetTexture(Textures[t1]->DataB, 64, 64);
   //                else d3dSetTexture(Textures[t1]->DataA, 128, 128);
   //} else {
   // if (zs > 256 * 10) d3dSetTexture(Textures[t1]->DataC, 32, 32);
   //               else d3dSetTexture(Textures[t1]->DataB, 64, 64);
   //}

   //if (r>8) DrawTPlane(FALSE);
   //    else DrawTPlaneClip(FALSE);    

   if (ReverseOn) { ev[0] = ev[2]; ev[2] = VMap[y+1][x+1]; } 
             else { ev[1] = ev[2]; ev[2] = VMap[y+1][x];   }

   //if (r>8) DrawTPlane(TRUE);
   //    else DrawTPlaneClip(TRUE);
     
   x = x + CCX - 128;
   y = y + CCY - 128;

   if (OMap[y][x]==255) return;   
   
  /* if (zz<BackR)
      RenderObject(x, y);*/

}



void ProcessMap2(int x, int y, int r)
{ 
   //WATERREVERSE = FALSE;
   if (x>=ctMapSize-1 || y>=ctMapSize-1 ||
	   x<0 || y<0) return;   

   ev[0] = VMap[y-CCY+128][x-CCX+128];            
   if (ev[0].v.z>BackViewR) return;        
   
   int t1 = TMap2[y][x];         
   TDirection = ((FMap[y][x]>>8) & 3);
   ReverseOn = FALSE;   
             
   x = x - CCX + 128;
   y = y - CCY + 128;

   ev[1] = VMap[y][x+2];
   if (ReverseOn) ev[2] = VMap[y+2][x];          
             else ev[2] = VMap[y+2][x+2];          
           
   float xx = (ev[0].v.x + VMap[y+2][x+2].v.x) / 2;
   float yy = (ev[0].v.y + VMap[y+2][x+2].v.y) / 2;
   float zz = (ev[0].v.z + VMap[y+2][x+2].v.z) / 2;   

   if ( fabs(xx*FOVK) > -zz + BackViewR) return;
       
   zs = (int)sqrt( xx*xx + zz*zz + yy*yy);          
   if (zs>ctViewR*256) return;
      
   //d3dSetTexture(Textures[t1]->DataB, 64, 64);   

   //DrawTPlane(FALSE);
       
   if (ReverseOn) { ev[0] = ev[2]; ev[2] = VMap[y+2][x+2]; } 
             else { ev[1] = ev[2]; ev[2] = VMap[y+2][x];   }

   //DrawTPlane(TRUE);
   
     
   x = x + CCX - 128;
   y = y + CCY - 128;

 /*  RenderObject(x  , y);
   RenderObject(x+1, y);
   RenderObject(x  , y+1);
   RenderObject(x+1, y+1);*/
}
#endif