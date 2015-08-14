#include "C2Geometry.h"

C2Geometry::C2Geometry(std::vector<TPoint3d> vertex_data, std::vector<TFace> face_data, std::vector<WORD> texture_data, int texture_height)
  : m_vertices(vertex_data), m_faces(face_data)
{
  this->_generate_textures(texture_data, texture_height);
}

C2Geometry::~C2Geometry()
{
}

void C2Geometry::_generate_textures(std::vector<WORD> texture_data, int texture_height)
{
  m_texture_data_a = texture_data;
  m_texture_height = texture_height;
}
