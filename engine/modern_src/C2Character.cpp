#include "C2Character.h"

#include "CE_ArtificialIntelligence.h"
#include "Hunt.h"

#include "C2CarFile.h"

C2Character::C2Character(CE_ArtificialIntelligence* intelligence_strategy, C2CarFile* carFile)
	: intelligence(intelligence_strategy), C2AnimatableModel(carFile)
{
}

C2Character::C2Character()
{
}

void C2Character::setAI(CE_ArtificialIntelligence* ai)
{
	delete this->intelligence;
	this->intelligence = ai;
}

C2Character::~C2Character()
{
}

void C2Character::updateWithTimestamp(int time_delta)
{
  // Tick the AI
  intelligence->think(time_delta);

  // Loop animation if nearing completion
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
