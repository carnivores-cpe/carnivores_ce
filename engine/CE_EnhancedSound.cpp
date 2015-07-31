// == Sound Source File == //
// -> 4.18.09

// -> Controls sound using a different engine to produce higher quality audio

#include "hunt.h"
#include "irrklang/irrKlang.h"
using namespace irrklang;

#pragma comment(lib, "irrklang/irrKlang.lib") // link with irrKlang.dll

// -> Extern Vars used by code...

// -> Extern Functions used by code...

// -> Local Vars used by code...
ISoundEngine* sndEngine;

bool InitSoundEngine() {
	// -> Load Sound Engine
	sndEngine = createIrrKlangDevice();
	if (!sndEngine) {
		PrintLog("Irrklang Failed to Load\n");
		return false;
	}

	PrintLog("IrrkLang Loaded OK\n");
	return true;
}

void ShutdownSoundEngine() {
	// -> Shutdown sound engine
	if (!sndEngine)
		return;
	PrintLog("IrrkLang Shutdown OK\n");
	sndEngine->drop(); // delete engine
	return;
}

void PlaySound2d(char fname[128]) {
	sndEngine->play2D(fname, false);
}