#pragma once
#include "characters\C2Character.h"
#include <memory>
#include <vector>

class C2CharacterCollection
{
private:
	std::vector < std::unique_ptr<C2Character> > collection;
public:
	C2CharacterCollection();
	~C2CharacterCollection();
	C2Character* at(int index);
	void add(C2Character* character);
	int size();
};

