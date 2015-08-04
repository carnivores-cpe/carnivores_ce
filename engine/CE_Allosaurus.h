/*
* This class exists only to demonstrate how to initiate a hard-coded dinosaur type.
* This class determines how to respond to common behavior, as dictated by the AI.
*
* About: Allosaurus is moderately aggressive carnivore.
* Has custom 'slide' animations to smooth turning.
*/
#pragma once
#include "characters\C2HuntableCharacter.h"
#include "characters\C2Character.h"

class CE_Allosaurus :
	public C2Character, public C2HuntableCharacter
{
public:
	CE_Allosaurus();

	void spawn();
	void kill();
	void printDebuggingInfo(std::string& output);
};

