#include "C2Geometry.h"
#include <iterator>

void BrightenTexture(WORD* A, int L);
void DATASHIFT(WORD* d, int cnt);
void GenerateModelMipMaps(TModel *mptr);
void GenerateAlphaFlags(TModel *mptr);
void CorrectModel(TModel *mptr);

C2Geometry::C2Geometry(std::vector<TPoint3d> vertex_data, std::vector<TFace> face_data, std::vector<WORD> texture_data, int texture_height)
  : m_vertices(vertex_data), m_faces(face_data)
{
  this->_generate_textures(texture_data, texture_height);
  this->_generate_old_model_data();
}

C2Geometry::~C2Geometry()
{
	delete this->m_old_model_data;
}

void C2Geometry::_generate_textures(std::vector<WORD> texture_data, int texture_height)
{
  m_texture_data_a = texture_data;
  m_texture_height = texture_height;

  // brighten texture
  //  datashift
}

TModel* C2Geometry::getTModel()
{
	return this->m_old_model_data;
}

void C2Geometry::syncOldVerticeData()
{
	std::copy(this->m_vertices.begin(), this->m_vertices.end(), this->m_old_model_data->gVertex);
}

void C2Geometry::_generate_old_model_data()
{
	if (this->m_old_model_data) {
		delete this->m_old_model_data;
	}
	this->m_old_model_data = new TModel();

	this->m_old_model_data->VCount = this->m_vertices.size();
	this->m_old_model_data->FCount = this->m_faces.size();
	this->m_old_model_data->TextureSize = this->m_texture_data_a.size();
	this->m_old_model_data->TextureHeight = this->m_texture_height;
	std::copy(this->m_faces.begin(), this->m_faces.end(), this->m_old_model_data->gFace);
	std::copy(this->m_vertices.begin(), this->m_vertices.end(), this->m_old_model_data->gVertex);
	memcpy(this->m_old_model_data->VLight, this->m_vertice_light, sizeof(float)*4*1024);
	this->m_old_model_data->lpTexture = new WORD[this->m_old_model_data->TextureSize];
	std::copy(this->m_texture_data_a.begin(), this->m_texture_data_a.end(), this->m_old_model_data->lpTexture);

	BrightenTexture(this->m_old_model_data->lpTexture, this->m_old_model_data->TextureSize/2);

	DATASHIFT(this->m_old_model_data->lpTexture, this->m_old_model_data->TextureSize);
	GenerateModelMipMaps(this->m_old_model_data);
	GenerateAlphaFlags(this->m_old_model_data);

	CorrectModel(this->m_old_model_data);
}

/*
BrightenTexture(chinfo.mptr->lpTexture, ts/2);

DATASHIFT(chinfo.mptr->lpTexture, chinfo.mptr->TextureSize);
GenerateModelMipMaps(chinfo.mptr);
GenerateAlphaFlags(chinfo.mptr);*/
/*

int VCount, FCount, TextureSize, TextureHeight;
TPoint3d gVertex[1024];
union {
TFace    gFace  [1024];
TFacef   gFacef [1024];
};
WORD     *lpTexture, *lpTexture2, *lpTexture3;
float    VLight[4][1024];
*/
