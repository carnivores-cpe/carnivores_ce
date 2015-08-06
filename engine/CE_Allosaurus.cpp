#include "CE_Allosaurus.h"
#include "characters\AI_Allosaurus.h"
#include <Hunt.h>

CE_Allosaurus::CE_Allosaurus(): C2Character(new AI_Allosaurus(), &ChInfo[AI_ALLO][0]) {
	this->intelligence->character = this;
}

void CE_Allosaurus::spawn()
{
	C2HuntableCharacter::spawn();
}

void CE_Allosaurus::kill()
{
	C2HuntableCharacter::kill();
}

void CE_Allosaurus::printDebuggingInfo(std::string& output)
{
	int AI = getCharacterState()->AI;
	int aniCount = getCharacterState()->pinfo->AniCount;
	output = "Class Name: CE_Allosaurus\n\n"
		"AI Class: AI_Allo\n:::" + std::to_string(AI) + ":: anicount: " + std::to_string(aniCount);
}