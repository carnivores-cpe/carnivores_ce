#pragma once

/*
* Responsible for movement and animations.
* AI is responsible for telling us how to act.
*
* This is basically an OOP wrapper to TCharacter in hunt.h.
*/
#include <time.h>
#include <memory>
#include <string>
#include "C2AnimatableModel.h"

class CE_ArtificialIntelligence;
typedef struct _TCharacter TCharacter;
typedef struct _TCharacterInfo TCharacterInfo;

class C2Character: public C2AnimatableModel {
  time_t last_update;

  // Store the character state using the old method for state tracking. Eventually, break the details out into this class.
  std::unique_ptr<TCharacter> _character_state;

  public:
    CE_ArtificialIntelligence* intelligence; // = & AI SUBCLASS

    /* (De)Constructor */
	C2Character(CE_ArtificialIntelligence* intelligence_strategy, TCharacterInfo* character_info);
	~C2Character();

	void place(float x, float z, float y);

	TCharacter* getCharacterState();

    /* Create a morphed representation of the character based on current time */
    void morphedModel();

	/* Reset current state and set initial values */
	void resetState();

    /* Primary loop. Handle animation and AI hook */
    void updateWithTimestamp(time_t timestamp);

    // Spawn and killed behavior should be defined in derived class
  	virtual void spawn() = 0;
  	virtual void kill() = 0;

	// Debug info should be extended in derived class
	virtual void printDebuggingInfo(std::string& output);
	const char* debuggingInfoCString();

    /* Game Animations hooks. Note that only a few of these are provided in the general
    * implementation, such as walk, run, and die. Derived class should implement others.
    * These commands can be triggered on the character from the command line,
    * internally within the Character class, or by AI.
    */
    virtual void performWalkAction();
    virtual void performRunAction();
    virtual void performEatAction();
    virtual void performJumpAction();
    virtual void performSwimAction();
    virtual void performAttackAction();
    virtual void performDeathAction();
    virtual void performIdleAction();
};
//typedef std::tr1::shared_ptr<C2Character> C2CharacterPtr;
