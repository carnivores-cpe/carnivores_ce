#include "C2Character.h"

/* Release resources */
C2Character::~C2Character()
{
	// AI
	delete intelligence;

	// Model(s)

	// Art and Sounds

	// Misc
}

void C2Character::updateWithTimestamp(time_t timestamp)
{
  // Tick the AI
  intelligence->tick(timestamp);
  last_update = timestamp;

  // Loop animation if nearing completion
  return;
}

void C2Character::resetState()
{
	_legacy_tcharacter_info.AI = DinoInfo[_legacy_tcharacter_info.CType][0].AI;
	_legacy_tcharacter_info.SUBAI = 0;
	//_legacy_tcharacter_info.pinfo = already set in constructor. Ref to ChInfo
	_legacy_tcharacter_info.State = 0;
	_legacy_tcharacter_info.StateF = 0;
	_legacy_tcharacter_info.Phase = 0;
	_legacy_tcharacter_info.FTime = 0;
	_legacy_tcharacter_info.PrevPhase = 0;
	_legacy_tcharacter_info.PrevPFTime = 0;
	_legacy_tcharacter_info.PPMorphTime = 0;
	_legacy_tcharacter_info.alpha = 0;
	_legacy_tcharacter_info.beta = 0;
	_legacy_tcharacter_info.gamma = 0;
	_legacy_tcharacter_info.tggamma = 0;
	_legacy_tcharacter_info.bend = 0;
	_legacy_tcharacter_info.rspeed = 0;
	_legacy_tcharacter_info.AfraidTime = 0;
	_legacy_tcharacter_info.BloodTTime = 0;
	_legacy_tcharacter_info.BloodTime = 0;

	_legacy_tcharacter_info.lookx = (float)cos(_legacy_tcharacter_info.alpha);
	_legacy_tcharacter_info.lookz = (float)sin(_legacy_tcharacter_info.alpha);

	_legacy_tcharacter_info.Health = DinoInfo[_legacy_tcharacter_info.CType][0].Health0;
	if (OptAgres>128) _legacy_tcharacter_info.Health = (_legacy_tcharacter_info.Health*OptAgres) / 128;

	_legacy_tcharacter_info.scale = (float)(DinoInfo[_legacy_tcharacter_info.CType][0].Scale0 + rRand(DinoInfo[_legacy_tcharacter_info.CType][0].ScaleA)) / 1000.f;
	return;
}

void C2Character::morphedModel()
{
  return;
}

void C2Character::performWalkAction()
{
  return;
}

void C2Character::performRunAction()
{
  return;
}

void C2Character::performEatAction()
{
  return;
}

void C2Character::performJumpAction()
{
  return;
}

void C2Character::performSwimAction()
{
  return;
}

void C2Character::performAttackAction()
{
  return;
}

void C2Character::performDeathAction()
{
  return;
}

void C2Character::performIdleAction()
{
  return;
}
