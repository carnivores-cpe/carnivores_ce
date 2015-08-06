#include <TCharacterInfoCache.h>

void LoadCharacterInfo(TCharacterInfo &chinfo, char* FName); // Resources.cpp

TCharacterInfoCache::TCharacterInfoCache() {}

TCharacterInfoCache::~TCharacterInfoCache() {}

TCharacterInfo* TCharacterInfoCache::getInfoByAI(int AI_CODE)
{
	std::map<int, std::unique_ptr<TCharacterInfo>>::iterator it = _objects.find(AI_CODE);

  if (it != _objects.end()) {
    return it->second.get();
  }

  // Object doesn't exist... let's load it
  _objects[AI_CODE] = std::make_unique<TCharacterInfo>();
  TCharacterInfo* theNewModel = _objects[AI_CODE].get();

  // Use old code to load the model
  wsprintf(logt, "HUNTDAT\\%s", DinoInfo[AI_to_CIndex[AI_CODE]][0].FName);
  LoadCharacterInfo(*theNewModel, logt);

  return theNewModel;
}

