/*
* This object is responsible for storing immutable geometry (vertices, indices, etc),
* and textures (eventually "C2Material").
*
* Currently just wraps Carnivores' TModel struct until elements can be broken
* out into modern 3D.
*
* Equivalent to SceneKit's SCNGeometry.
*/
#pragma once

#include <memory>

#include "g_shared.h"

class C2Geometry {
private:
  TModel m_model_data;
public:
  C2Geometry(TModel& model_data);
  ~C2Geometry();
  TModel* getCModelData();
};
