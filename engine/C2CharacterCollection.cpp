#include "C2CharacterCollection.h"


C2CharacterCollection::C2CharacterCollection()
{

}


C2CharacterCollection::~C2CharacterCollection()
{
}

C2Character* C2CharacterCollection::at(int index)
{
	return collection.at(index).get();
}

void C2CharacterCollection::add(C2Character* character)
{
	collection.push_back(std::unique_ptr<C2Character>(character));
}

int C2CharacterCollection::size()
{
	return collection.size();
}
