#pragma once
#include <time.h>

/*
* This class is responsible for processing a characters' surroundings and triggering certain behavior.
* Exact behavior must be implemented by derived class.
*
* Shared 'awareness' methods (such as 'iCanSee?()') can be added here to make available to all
* derived classes.
*/

class C2Character;

class CE_ArtificialIntelligence
{
private:
	time_t last_update;
	C2Character* target; // weak. Tracks target. Actual AI tells character to 'move to' target, rather than exposing target.
	float distance_to_target();

public:
	C2Character* character; // weak

	CE_ArtificialIntelligence();
	~CE_ArtificialIntelligence();
	virtual void tick(time_t timestamp) = 0;
};
typedef std::tr1::shared_ptr<CE_ArtificialIntelligence> CE_ArtificialIntelligencePtr;

