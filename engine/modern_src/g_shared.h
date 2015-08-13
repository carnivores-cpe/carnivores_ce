//
//  g_shared.h
//  CE Character Lab
//
//  Created by Tyler Minard on 8/11/15.
//  Copyright (c) 2015 Tyler Minard. All rights reserved.
//

#ifndef CE_Character_Lab_g_shared_h
#define CE_Character_Lab_g_shared_h

typedef struct TagVector3d {
  float x,y,z;
} Vector3d;

typedef struct _Point3d {
  float x;
  float y;
  float z;
  short owner;
  short hide;
} TPoint3d;

typedef unsigned short WORD;

typedef struct _Face {
  int v1, v2, v3;
  int   tax, tbx, tcx, tay, tby, tcy;
  WORD Flags,DMask;
  int Distant, Next, group;
  char reserv[12];
} TFace;


typedef struct _Facef {
  int v1, v2, v3;
  float tax, tbx, tcx, tay, tby, tcy;
  WORD Flags,DMask;
  int Distant, Next, group;
  char reserv[12];
} TFacef;

typedef struct {
  int VCount, FCount, TextureSize, TextureHeight;
  TPoint3d gVertex[1024];
  union {
    TFace    gFace  [1024];
    TFacef   gFacef [1024];
  };
  WORD     *lpTexture, *lpTexture2, *lpTexture3;
  float    VLight[4][1024];
} TModel;

typedef struct _Animation {
  char aniName[32];
  int aniKPS, FramesCount, AniTime;
  short int* aniData;
} TAni;

typedef struct _SoundFX {
  int  length;
  short int* lpData;
} TSFX;

typedef struct _TCharacterInfo {
  char ModelName[32];
  int AniCount,SfxCount;
  TModel* mptr;
  TAni Animation[64];
  TSFX SoundFX[64];
  
  //cross-reference for animations and sounds
  int  Anifx[64];
  //-> Animation IDs...
  int DIE[10];
  int WALK[10];
  int SLEEP[10];
  int EAT[10];
  int IDLE[10];
  int ATTACK[10];
  int SLIDE[10];
  int RUN[10];
  int SWIM[10];
} TCharacterInfo;

#endif
