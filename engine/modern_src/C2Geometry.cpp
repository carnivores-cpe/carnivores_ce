#include "C2Geometry.h"

#include "Hunt.h"

C2Geometry::C2Geometry(TModel& model_data)
{
  m_model_data = model_data;
}

C2Geometry::~C2Geometry()
{
}

TModel* C2Geometry::getCModelData()
{
  return &m_model_data; // AHHHHH!!!!
}