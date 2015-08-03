/*
* Introduces special spawn behavior for hunt-able characters.
*/
#pragma once

class C2HuntableCharacter {
  public:
    /* Implement unique huntable characteristics. */
    void spawn();
    void kill();
};

void C2HuntableCharacter::spawn()
{
	// Choose a good spawn location.
	return;
}

void C2HuntableCharacter::kill()
{
	// Was I killed by player? If so, add credit and call pickup ship
	return;
}
