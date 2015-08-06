/*
* Responsible for loading a 3D model with animations.
*/
#pragma once

#include <string>
#include <memory>

typedef struct _TCharacterInfo TCharacterInfo; // store model meta data, 3d model (with texture + versions), animation data, and sound data

class C2AnimatableModel {
  std::unique_ptr<TCharacterInfo> pinfo; //TODO: Use a resource manager to share pointers to mesh and animation data. For now, points to row in ChInfo array

  public:
	  C2AnimatableModel(TCharacterInfo* character_info); //Use with &ChInfo[cptr->CType][subai];
};

