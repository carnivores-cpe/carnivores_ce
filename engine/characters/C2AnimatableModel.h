/*
* Responsible for loading a 3D model with animations.
*/
#ifndef CANIMATABLE_MODEL
#define CANIMATABLE_MODEL

#include <string>
#include <Hunt.h>

class C2AnimatableModel {
  TCharacterInfo* pinfo; //TODO: Use a resource manager to share pointers to mesh and animation data. For now, points to row in ChInfo array

  public:
    C2AnimatableModel(TCharacterInfo* character_info): pinfo(character_info) {} //&ChInfo[cptr->CType][subai];
};

#endif
