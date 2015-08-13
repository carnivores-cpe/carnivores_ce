//
//  C2CarFile.cpp
//  CE Character Lab
//
//  Created by Tyler Minard on 8/6/15.
//  Copyright (c) 2015 Tyler Minard. All rights reserved.
//

#include "C2CarFile.h"

#include "C2Geometry.h"
#include "C2Animation.h"
#include "C2SoundFX.h"

#include <iostream>
#include <fstream>

#include "g_shared.h"

void Console_PrintLogString(std::string log_msg);

template <typename T, typename... Args>
auto make_unique(Args&&... args) -> std::unique_ptr<T>
{
  return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
}

C2CarFile::C2CarFile(std::string file_name)
{
	Console_PrintLogString("Loading file " + file_name);
	this->m_character_info = new TCharacterInfo();
	this->m_model_data = new TModel();
	this->load_file(file_name);
}

C2CarFile::~C2CarFile()
{
	delete this->m_character_info;
	delete this->m_model_data;
}

C2Geometry* C2CarFile::getGeometry()
{
  return this->m_geometry.get();
}

C2Animation* C2CarFile::getAnimationByName(std::string animation_name)
{
  return this->m_animations[animation_name].get();
}


void C2CarFile::generate_animations()
{
  for (int a = 0; a < this->m_character_info->AniCount; a++) {
    std::string animation_name = this->m_character_info->Animation[a].aniName;
    int animation_KPS = this->m_character_info->Animation[a].aniKPS;
    
    int animation_data_length = (this->m_model_data->VCount*this->m_character_info->Animation[a].FramesCount*6);
    std::vector<short int> animation_data;

    for (int a_d = 0; a_d < animation_data_length; a_d++)
    {
      animation_data.push_back(this->m_character_info->Animation[a].aniData[a_d]);
    }

    //std::cout << "Animation loaded: " << animation_name << "\n";
    this->m_animations[animation_name] = std::make_unique<C2Animation>(animation_name, animation_KPS,
                                                              this->m_character_info->Animation[a].FramesCount,this->m_character_info->Animation[a].AniTime,animation_data);

  }
}

void C2CarFile::load_file(std::string file_name)
{
  std::ifstream infile;
  infile.exceptions(std::ifstream::failbit | std::ifstream::badbit);
  try {
  infile.open(file_name.c_str(), std::ios::binary | std::ios::in);
  
  infile.read(this->m_character_info->ModelName, 32);

  infile.read(reinterpret_cast<char *>(&this->m_character_info->AniCount), 4);
  infile.read(reinterpret_cast<char *>(&this->m_character_info->SfxCount), 4);
  
  infile.read(reinterpret_cast<char *>(&this->m_model_data->VCount), 4);
  infile.read(reinterpret_cast<char *>(&this->m_model_data->FCount), 4);
  infile.read(reinterpret_cast<char *>(&this->m_model_data->TextureSize), 4);
  this->m_model_data->TextureHeight = this->m_model_data->TextureSize >> 9;

  infile.read(reinterpret_cast<char *>(&this->m_model_data->gFace), this->m_model_data->FCount<<6);
  infile.read(reinterpret_cast<char *>(&this->m_model_data->gVertex), this->m_model_data->VCount<<4);
  
  int tsize = this->m_model_data->TextureSize;
  this->m_model_data->TextureHeight = tsize>>9;

  this->m_model_data->TextureSize = this->m_model_data->TextureHeight*512;
  
  this->m_model_data->lpTexture = new WORD[tsize];
  

  infile.read(reinterpret_cast<char *>(this->m_model_data->lpTexture), tsize);

  for (int ani = 0; ani < this->m_character_info->AniCount; ani++) {
    infile.read(this->m_character_info->Animation[ani].aniName, 32);
    infile.read(reinterpret_cast<char *>(&this->m_character_info->Animation[ani].aniKPS), 4);
    infile.read(reinterpret_cast<char *>(&this->m_character_info->Animation[ani].FramesCount), 4);
    
    this->m_character_info->Animation[ani].AniTime = (this->m_character_info->Animation[ani].FramesCount * 1000) / this->m_character_info->Animation[ani].aniKPS;
    int aniDataSize = (this->m_model_data->VCount*this->m_character_info->Animation[ani].FramesCount*6);
    this->m_character_info->Animation[ani].aniData = new short int[aniDataSize];
    
    infile.read(reinterpret_cast<char *>(this->m_character_info->Animation[ani].aniData), aniDataSize);
  }
  
  char soundNameBuffer[32];
  for (int soundfx = 0; soundfx < this->m_character_info->SfxCount; soundfx++) {
    infile.read(soundNameBuffer, 32);
    infile.read(reinterpret_cast<char *>(&this->m_character_info->SoundFX[soundfx].length), 4);
    
    this->m_character_info->SoundFX[soundfx].lpData = new short int[this->m_character_info->SoundFX[soundfx].length];
    
    infile.read(reinterpret_cast<char *>(this->m_character_info->SoundFX[soundfx].lpData), this->m_character_info->SoundFX[soundfx].length);
  }
  
  infile.read(reinterpret_cast<char *>(&this->m_character_info->Anifx), 64*4);
  
  // brighten texture
  // scale base model
  infile.close();
  }
  catch (std::ifstream::failure e) {
	  Console_PrintLogString("Failed to load " + file_name + ": " + strerror(errno));
	  std::cerr << "Exception opening/reading/closing file\n";
  }

  Console_PrintLogString("Loaded " + file_name);

  // data correction
  this->_correct_model_and_animations();

  // load instance
  this->m_geometry = make_unique<C2Geometry>(*this->m_model_data);
  this->generate_animations();
}

void C2CarFile::_correct_model_and_animations()
{
	for (int v = 0; v<this->m_model_data->VCount; v++) {
		this->m_model_data->gVertex[v].x *= 2.f;
		this->m_model_data->gVertex[v].y *= 2.f;
		this->m_model_data->gVertex[v].z *= -2.f;
	}
}
