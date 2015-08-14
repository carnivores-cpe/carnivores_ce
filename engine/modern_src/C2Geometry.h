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
#include <vector>

#include "g_shared.h"

class C2Geometry {
private:
  int m_texture_height;

  float m_vertice_light[4][1024]; // not sure how to store this in vector.

  std::vector<TFace> m_faces;
  std::vector<WORD> m_texture_data_a; //lpTexture
  std::vector<WORD> m_texture_data_b; //lpTextur2
  std::vector<WORD> m_texture_data_c; //lpTextur3

  TModel* m_old_model_data;

  void _generate_textures(std::vector<WORD> texture_data, int texture_height);
  void _generate_old_model_data();

public:
	std::vector<TPoint3d> m_vertices; //TODO: Protect this. make it const
  C2Geometry(std::vector<TPoint3d> vertex_data, std::vector<TFace> face_data, std::vector<WORD> texture_data, int texture_height);
  ~C2Geometry();

  void syncOldVerticeData(); // make the old Tmodel vertice data synced
  TModel* getTModel();
};

