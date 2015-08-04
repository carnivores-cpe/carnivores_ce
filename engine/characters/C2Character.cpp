#include "C2Character.h"

#include "CE_ArtificialIntelligence.h"
#include <Hunt.h>

C2Character::C2Character(CE_ArtificialIntelligence* intelligence_strategy, TCharacterInfo* character_info)
	: intelligence(intelligence_strategy), C2AnimatableModel(character_info)
{
  _character_state = std::make_unique<TCharacter>();
	resetState();
}

/* Release resources */
C2Character::~C2Character()
{
	// AI
	delete intelligence;

	// State object
  // _character_state auto-cleaned by unique_ptr

	// Model(s)
	// TODO:use smart pointer
  // character_info (pinfo) is managed by hunt.h

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
	_character_state->AI = DinoInfo[_character_state->CType][0].AI;
	_character_state->SUBAI = 0;
	//_character_state->.pinfo = already set in constructor. Ref to ChInfo
	_character_state->State = 0;
	_character_state->StateF = 0;
	_character_state->Phase = 0;
	_character_state->FTime = 0;
	_character_state->PrevPhase = 0;
	_character_state->PrevPFTime = 0;
	_character_state->PPMorphTime = 0;
	_character_state->alpha = 0;
	_character_state->beta = 0;
	_character_state->gamma = 0;
	_character_state->tggamma = 0;
	_character_state->bend = 0;
	_character_state->rspeed = 0;
	_character_state->AfraidTime = 0;
	_character_state->BloodTTime = 0;
	_character_state->BloodTime = 0;

	_character_state->lookx = (float)cos(_character_state->alpha);
	_character_state->lookz = (float)sin(_character_state->alpha);

	_character_state->Health = DinoInfo[_character_state->CType][0].Health0;
	if (OptAgres>128) _character_state->Health = (_character_state->Health*OptAgres) / 128;

	_character_state->scale = (float)(DinoInfo[_character_state->CType][0].Scale0 + rRand(DinoInfo[_character_state->CType][0].ScaleA)) / 1000.f;
	return;
}

void C2Character::printDebuggingInfo(std::string& output)
{
	output = "C2Character abstract class debugging info.";
}

const char* C2Character::debuggingInfoCString()
{
	std::string debuggingString = "";
	this->printDebuggingInfo(debuggingString);

	return debuggingString.c_str();
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
