/*
* This class exists only to demonstrate how to initiate a hard-coded dinosaur type.
* This class determines how to respond to common behavior, as dictated by the AI.
*
* About: Allosaurus is moderately aggressive carnivore.
* Has custom 'slide' animations to smooth turning.
*/
#pragma once
#include "characters\AI_Allosaurus.h"
#include "characters\C2HuntableCharacter.h"
#include "characters\C2Character.h"

class CE_Allosaurus :
	public C2Character, public C2HuntableCharacter
{
public:
	CE_Allosaurus()
    : C2Character(new AI_Allosaurus(), &ChInfo[AI_ALLO][0]) {
		this->intelligence->character = this;
	}
};

