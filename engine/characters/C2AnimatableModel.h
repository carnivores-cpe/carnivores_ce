/*
* Responsible for loading a 3D model with animations.
*/
#pragma once

#include <string>

typedef struct _TCharacterInfo TCharacterInfo;

class C2AnimatableModel {
  TCharacterInfo* pinfo; //TODO: Use a resource manager to share pointers to mesh and animation data. For now, points to row in ChInfo array

  public:
	  C2AnimatableModel(TCharacterInfo* character_info); //&ChInfo[cptr->CType][subai];
};

