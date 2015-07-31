#include "Hunt.h"

#pragma once

/**
* Vehicle constructor
*/
TVehicle::TVehicle(void)
{
}

/**
* Vehicle destructor
*/
TVehicle::~TVehicle(void)
{
}

/**
* Process jeep movement and animation
* @type Static function
* @author adelphospro
* @date 9.19.2009
*/
void TVehicle::process(TCharacter *cptr)
{
	//Sit idle until human comes near...
   float playerdx = PlayerX - cptr->pos.x;
   float playerdz = PlayerZ - cptr->pos.z;

   float pdist = (float)sqrt( playerdx * playerdx + playerdz * playerdz );  
   cptr->pos.y = GetLandH(cptr->pos.x, 
		                                  cptr->pos.z) + 450;
	//Prompt entry if out
   if (pdist < 1000) {
	   PlayerX = cptr->pos.x;
	   PlayerY = GetLandH(cptr->pos.x, cptr->pos.z) + 150;
	   PlayerZ = cptr->pos.z;
	   PlayerAlpha = cptr->alpha - 110;
	   IN_VEHICLE = TRUE;
	   NOCLIP = TRUE;
	   HeadY = 0;
	   Vehicles[0].ch_index = CurDino;
	   //strcpy(USE_MESSAGE,"Press 'F' to enter jeep");
   }
	//Else, process exit commands or move
}

/**
* Process gravity in vehicle
*/
void TVehicle::process_slide()
{
	return;
}

void TVehicle::process_movement()
{
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

   		   if (VSpeed > 3.90f) VSpeed = 3.90f;
		   if (VSpeed <-3.90f) VSpeed =-3.90f;        
		   if (SSpeed > 3.90f) SSpeed = 3.90f;
		   if (SSpeed <-3.90f) SSpeed =-3.90f; 

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

   int mvi = 1 + TimeDt / 16;   

   for (int mvc = 0; mvc<mvi; mvc++) {
    Characters[Vehicles[0].ch_index].pos.x = PlayerX+=nv.x / mvi;   
    Characters[Vehicles[0].ch_index].pos.y = PlayerY+=nv.y / mvi;
    PlayerZ+=nv.z / mvi;

	Characters[Vehicles[0].ch_index].pos.x = PlayerX-=sv.z / mvi;       
    PlayerZ+=sv.x / mvi;
   }
	return;
}