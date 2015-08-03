#pragma once
#include "CE_ArtificialIntelligence.h"

class AI_Allosaurus: public CE_ArtificialIntelligence {
  public:
    void tick(time_t timestamp);
};

/*
* Allo behavior characteristics:
* - Wanders around randomly.
* - Upon finding player, moderately aggressive.
* - Easy to scare away, but forgets quickly.
*
* Can: swim, jump
*/
void AI_Allosaurus::tick(time_t timestamp)
{
	// find a target
	// decide what to do
	return;
}