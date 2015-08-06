#include <Hunt.h> // sorry... need it for std::map
#include <memory>
#include <map>

/*
* Cache to store the model details of dinosaurs. TODO: refactor this into a singleton, and make generic to hold other models.
*/
//typedef struct _TCharacterInfo TCharacterInfo;
//typedef std::map<int, std::unique_ptr<TCharacterInfo>> TCharacterInfoCacheMap; //store objects with AI has the key

class TCharacterInfoCache {
private:
	std::map<int, std::unique_ptr<TCharacterInfo>> _objects;
public:
  TCharacterInfoCache();
  ~TCharacterInfoCache();
  TCharacterInfo* getInfoByAI(int AI_CODE);
};
