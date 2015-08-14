// == Message Console Code by Adelphos Pro == //

// -> Controls a game console to enable commands to be entered
// 4.17.9

#include "hunt.h"

#include <vector>
#include "modern_src\C2CarFilePreloader.h"
#include "modern_src\C2CarFile.h"
#include "modern_src\CE_Allosaurus.h"

// -> External Functions accessed
void CallSupply();
void SwitchMode(LPSTR lps, BOOL& b);
void Console_ClearLog();
void Console_ToggleCheat(LPSTR cheat_text, BOOL & cheat_bool);
bool Console_TypedTextParseCheck(LPSTR IsCommand);
void SaveScreenShot();

void Test_PlaceMPlayer();

int ResetCharacter(TCharacter *cptr);

// -> Local
void Console_DropFirstMessage(bool ConsoleReset = false);


void Console_PlaceBody()
{
	PrintLog("Placing Dead Player Model...");
	//human_model_ch = ChCount;
	Characters[ChCount].CType = 0;
	Characters[ChCount].AI = AI_BODY;
	Characters[ChCount].pos.x = PlayerX;
	Characters[ChCount].pos.z = PlayerZ;
	Characters[ChCount].pos.y = GetLandH(Characters[ChCount].pos.x, 
		Characters[ChCount].pos.z);
	//Characters[ChCount].tgx = Characters[ChCount].pos.x;
	//Characters[ChCount].tgz = Characters[ChCount].pos.z;
	//Characters[ChCount].tgtime = 0;
	ResetCharacter(&Characters[ChCount]);
	Characters[ChCount].Phase = HUNT_FALL;
	Characters[ChCount].SetPhase = HUNT_FALL;
	ChCount++;
	PrintLog("Done\n");
}

void Console_PlaceMPlayer()
{
	Test_PlaceMPlayer();
}

void Console_PlaceJeep()
{
	if (!DEBUG) {
		Console_PrintLog("Jeep placement disabled by development team");
		return;
	}
	PrintLog("Placing Jeep...");
	//human_model_ch = ChCount;
	Characters[ChCount].CType = 0;
	Characters[ChCount].AI = AI_LANDJEEP;
	Characters[ChCount].pos.x = PlayerX;
	Characters[ChCount].pos.z = PlayerZ;
	Characters[ChCount].pos.y = GetLandH(Characters[ChCount].pos.x, 
		Characters[ChCount].pos.z) + 250;
	//Characters[ChCount].tgx = Characters[ChCount].pos.x;
	//Characters[ChCount].tgz = Characters[ChCount].pos.z;
	//Characters[ChCount].tgtime = 0;
	ResetCharacter(&Characters[ChCount]);
	Characters[ChCount].Phase = 0;
	Characters[ChCount].SetPhase = 0;
	ChCount++;
	wsprintf(logt, "Placed jeep with ChCount of %d", ChCount - 1);
	Console_PrintLog(logt);
}

void Console_PrintLogString(std::string);
void Console_LoadManagedAllo()
{
	C2CarFilePreloader* mcarloader = CarFileManager.get();
	std::shared_ptr<C2CarFile> allo_car = mcarloader->fetch("HUNTDAT\\ALLO.CAR");

	Console_PrintLogString("Allo loaded.");
	return;
}

// Insert an allo at the player position
void Console_PlaceManagedAllo()
{
	//std::unique_ptr<CE_Allosaurus> allo = std::unique_ptr<CE_Allosaurus>(new CE_Allosaurus(CarFileManager.get(), "HUNTDAT\\ALLO.CAR"));
	ManagedCharacters.push_back(std::unique_ptr<CE_Allosaurus>(new CE_Allosaurus(CarFileManager.get(), "HUNTDAT\\ALLO.CAR")));

	C2Character* nChar = ManagedCharacters.at(ManagedCharacters.size()-1).get();
	nChar->setScale(2.f);
	nChar->setPosition(PlayerX, PlayerZ, PlayerY);
	nChar->performWalkAction();
	wsprintf(logt, "Added new allo to managed stack");
	Console_PrintLog(logt);
}

void Console_PrintManagedCharacterStats()
{
	int numberOfManagedCharacters = ManagedCharacters.size();
	wsprintf(logt, "Number of managed characters: %d", numberOfManagedCharacters);
	Console_PrintLog(logt);
}

void Console_ProcessInput(void*) {
	// == Process Console Input Commands and Vars == //
	//AddVoicev(TypeSound[1].length, 
	//TypeSound[1].lpData, 128);
	PlaySound2d("HUNTDAT\\SOUNDFX\\typego.wav");

	/* -> List <- */
	// -> Developer Toggles/Tools
	if (Console_TypedTextParseCheck("mchar load_allo"))
		Console_LoadManagedAllo();
	if (Console_TypedTextParseCheck("mchar place_allo"))
		Console_PlaceManagedAllo();
	if (Console_TypedTextParseCheck("mchar stat"))
		Console_PrintManagedCharacterStats();
	if (Console_TypedTextParseCheck("place jeep"))
		Console_PlaceJeep();
	if (Console_TypedTextParseCheck("place body"))
		Console_PlaceBody();
	if (Console_TypedTextParseCheck("place player"))
		Console_PlaceMPlayer();
	if (strncmp(TypedText,"chinfo ",7) == 0) {
		int cId;
		cId = Console_ProcessIntValue("chinfo", TypedText,-1);
		if (cId > ChCount) {
			Console_PrintLog("ChCount value larger than existing creatures");
		} else if (cId < 0) {
			Console_PrintLog("Invalid ChCount value");
		} else {
			//Print creature info...
			Console_PrintLog("+ Creature Information");
			wsprintf(logt, "    Creature Name: %s", DinoInfo[Characters[cId].CType][Characters[cId].SUBAI].Name);
			Console_PrintLog(logt);
			wsprintf(logt, "    Creature Health: %d of %d", Characters[cId].Health, DinoInfo[Characters[cId].CType][Characters[cId].SUBAI].Health0);
			Console_PrintLog(logt);
			wsprintf(logt, "    AI: %d SubAI: %d", Characters[cId].AI, Characters[cId].SUBAI);
			Console_PrintLog(logt);
		}
	}
	if (Console_TypedTextParseCheck("heapinfo")) {
		wsprintf(logt, "Heap Allocated: %d bytes - %d mb", HeapAllocated, (HeapAllocated/1024/1024));
		Console_PrintLog(logt);
		wsprintf(logt, "Heap Released: %d bytes - %d mb", HeapReleased, (HeapReleased/1024/1024));
		Console_PrintLog(logt);
	}
	if (Console_TypedTextParseCheck("mapinfo")) {
		Console_PrintLog("+ Map Statistics");
		wsprintf(logt, "     Character Count: %d", ChCount);
		Console_PrintLog(logt);
	}
	if (Console_TypedTextParseCheck("clear console")) {
		//Same as console.track, plus clear all current logs
		CommandLogIndex = -1;
		Console_ClearLog();
	}
	if (strcmp(TypedText,"track console") == 0) {
		//Cause the console to display latest messages again
		CommandLogIndex = -1;
	}
	if (DEBUG_ASKFORPASS) {
		DEBUG_PASSOK = FALSE;
		if (strcmp(TypedText,"kamikazi") == 0) {
			SwitchMode("Developer Mode",DEBUG);
			CHEAT_ENABLED = TRUE;
			DEBUG_PASSOK = TRUE;
		}
		DEBUG_ASKFORPASS = FALSE;
	}
	if (strcmp(TypedText,"dev_mode") == 0) {
		if (!DEBUG) { //-> Ask for password
			DEBUG_ASKFORPASS = TRUE;
			Console_PrintLog("Password is required for debug mode");
		} else {
			SwitchMode("Developer Mode",DEBUG);
		}
	}

	if (strcmp(TypedText,"loosemouse") == 0) SwitchMode("Loose Mouse", LooseMouse);
	if (strcmp(TypedText,"dev_drawfps") == 0) SwitchMode("Draw FPS",TIMER);

	// -> Gameplay Stuff (ie, "Request supplies")
	if (strcmp(TypedText,"request exit") == 0) {
		if (DEBUG) {
			ExitTime = 1;
		} else { 
			//-> You could find distance to left-corner of map and use that to change the time required to exit.
			ExitTime = 3000 + (int)sqrt( (PlayerX/256.f)*(PlayerX/256.f) + (PlayerZ/256.f)*(PlayerZ/256.f))*3.5;
			FADING = 64;
		}
	}
	if (strcmp(TypedText,"request supplies") == 0) {
		CallSupply();
	}

	if (strcmp(TypedText,"killall") == 0) {
		//-> Kill life
		for (int c=0; c < ChCount; c++)
			Characters[c].Health = 0;
	}
	if (strcmp(TypedText,"easter") == 0) {
		//-> Kill life
		for (int c=0; c < ChCount; c++)
			Characters[c].Health = DinoInfo[Characters[c].CType][Characters[c].SUBAI].Health0;
	}
	if (strcmp(TypedText,"noah") == 0 && DEBUG) {
		//SwitchMode("Flood Mode",Noah);
		AddMessage("Flood Activated...");
		//->Flood the earth....
		for (int y = 0; y < 1024; y++)
			for (int x = 0; x < 1024; x++) {
				//-> Set the whole map to water and place the water kinda high
				if (HMap[y][x] <= 128+5) {
					WaterList[1].wlevel = 128;
					//WaterList[1].tindex = 0;
					FMap[y][x] |= fmWaterA;
					FMap[y][x] |= fmWater2;
					WMap[y][x] = 1;
					OMap[y][x] = 255;
				}
			}
			//-> Kill life
			for (int c=0; c < ChCount; c++)
				if (Characters[c].Health && Characters[c].AI <14)
					Characters[c].Health = 0;
			//-> Generate new map image
			GenerateMapImage();
	}

	if (strcmp(TypedText,"rainbow") == 0 && DEBUG) {
		//SwitchMode("Flood Mode",Noah);
		AddMessage("Flood Draining...");
		//->DeFlood the earth....
		for (int y = 0; y < 1024; y++)
			for (int x = 0; x < 1024; x++) {
				//-> Set the whole map to water and place the water kinda high
				TMap1[y][x] = 1;
				TMap2[y][x] = 1;
				FMap[y][x] -= fmWaterA;
				WMap[y][x] = 0;
			}

			//-> Bring all creatures back down to ground level
			for (int c=0; c < ChCount; c++) {
				Characters[c].Health = 0;
			}
			//-> Generate new map image
			GenerateMapImage();
	}

	if (strcmp(TypedText,"request balance") == 0) {
		//-> Show the hunter his points
		wsprintf(logt,"Current Balance for Hunter [%s]: %d",TrophyRoom.PlayerName,TrophyRoom.Score);
		AddMessage(logt);
	}
	// -> Video Engine Toggles
	if (DEBUG && strcmp(TypedText,"toggle models") == 0) SwitchMode("3D Models",MODELS);
	if (DEBUG && strcmp(TypedText,"toggle fog") == 0) SwitchMode("Fog",FOGENABLE);
	if (DEBUG && strcmp(TypedText,"toggle clouds") == 0) SwitchMode("Cloud Shaddows",Clouds);
	if (Console_TypedTextParseCheck("toggle sky")) SwitchMode("Sky",SKY);
	if (Console_TypedTextParseCheck("toggle pothead")) SwitchMode("Pothead",POTHEAD);
	if (strcmp(TypedText,"screenshot") == 0) SaveScreenShot();

	// -> System Toggles
	if (strcmp(TypedText,"sys_threaded") == 0 && DEBUG) SwitchMode("Thread System",USE_THREADS);
	if (strncmp(TypedText,"sys_maxfps",10) == 0) {
		int getFPS;
		getFPS = Console_ProcessIntValue("sys_maxfps", TypedText,MAX_FPS);
		if (getFPS >= 0) {
			MAX_FPS = getFPS;
			wsprintf(logt,"Max FPS changed to %d",getFPS);
			AddMessage(logt);
		}
	}

	// -> Cheats
	//CHEAT_NOFEAR
	if (strcmp(TypedText,"STOP") == 0) Console_ToggleCheat("Freeze Cheat",CHEAT_FREEZE);
	if (strcmp(TypedText,"wuss") == 0) Console_ToggleCheat("Lock Ammo Cheat",CHEAT_FREEAMMO);
	if (strcmp(TypedText,"nofear") == 0) Console_ToggleCheat("No Fear Cheat",CHEAT_NOFEAR);
	if (strcmp(TypedText,"flapyourwings") == 0) Console_ToggleCheat("Fly Cheat",FLY);
	if (strcmp(TypedText,"chucknorris") == 0) Console_ToggleCheat("God Cheat",CHEAT_GOD);
	if (strcmp(TypedText,"starbucksaddict") == 0) Console_ToggleCheat("Fast Walk Cheat",CHEAT_FASTWALK);
	if (strcmp(TypedText,"chillpill") == 0) Console_ToggleCheat("Slow Mode Cheat",SLOW);
	if (strncmp(TypedText,"portto ",7) == 0) {
		//Portal to the X, Y
		int x,y;
		x = Console_ProcessIntValue("portto", TypedText,0);
		y = x;
		// -> Check and go
		if (x > 0 && x < 1024 && y > 0 && y < 1024) {
			PlayerX = (float)x*256.f;
			PlayerZ = (float)y*256.f;
			AddMessage("Character Relocated");
		} else {
			wsprintf(logt,"Portto must contain a value in between 0 and 1024 in the form: portto 512",x,y);
			AddMessage(logt);
		}
	}

	// -> Misc
	if (strncmp(TypedText,"sys_messageheight",17) == 0) {
		int getHeight;
		getHeight = Console_ProcessIntValue("sys_messageheight", TypedText,MESSAGELIST_MAXLENGTH);

		if (getHeight != MESSAGELIST_MAXLENGTH) {
			getHeight = max(min(getHeight,20),1);
			MESSAGELIST_MAXLENGTH = getHeight;
			while (MessageListCnt > MESSAGELIST_MAXLENGTH)
				DropFirstMessage();
		}
	}
	if (DEBUG && strncmp(TypedText,"player_setscore",13) == 0 && CHEAT_ENABLED) {
		int chargeAmount;
		chargeAmount = Console_ProcessIntValue("player_setscore", TypedText,TrophyRoom.Score);

		if (chargeAmount >= 100) {
			TrophyRoom.Score = chargeAmount;
			Console_PrintLog("Player score changed");
		} else {
			AddMessage("Invalid Score or Too Low");
		}
	}

	// -> Tests
	if (strcmp(TypedText,"toggle melee") == 0) {
		/* Melee toggle */
		SwitchMode("Melee",USE_THREADS);
		Console_PrintLog("Press 'AIM' to use");
	}

	if (strcmp(TypedText,"dinoattack") == 0) {
		/* Dino attack! */
		ANIMAL_ATTACK_MODE = !ANIMAL_ATTACK_MODE;
	}

	if (strcmp(TypedText,"help") == 0) {
		// -> Display game commands
		int CmdCnt = 4; //Number of commands in total
		char CmdList[4][128] = {"request exit - Begin Evacuation", "request supplies - Order a refill on ammo (costs 2 points)", "request balance - Print total points", "Also try: 'help sys', 'help vid', or 'help dev'"};
		int delayTime = 0; //Delay time to add too per loop

		for (int cmdNum = 0; cmdNum < CmdCnt; cmdNum++) {
			AddMessage(CmdList[cmdNum]);
		}
	}
	if (strcmp(TypedText,"help dev") == 0) {
		// -> Display dev commands
		int CmdCnt = 2; //Number of commands in total
		char CmdList[2][128] = {"dev_mode - Toggle Developer Mode (debug)", "dev_drawfps - Display current FPS"};
		int delayTime = 0; //Delay time to add too per loop

		for (int cmdNum = 0; cmdNum < CmdCnt; cmdNum++) {
			AddMessage(CmdList[cmdNum]);
		}
	}
	if (strcmp(TypedText,"help vid") == 0) {
		// -> Display video commands
		int CmdCnt = 4; //Number of commands in total
		char CmdList[4][128] = {"toggle models - Toggle Draw 3D Models", "toggle sky", "toggle fog - Toggle fog", "toggle clouds - Draw cloud shadows on the ground"};
		int delayTime = 0; //Delay time to add too per loop

		for (int cmdNum = 0; cmdNum < CmdCnt; cmdNum++) {
			AddMessage(CmdList[cmdNum]);
		}
	}
	if (strcmp(TypedText,"help sys") == 0) {
		// -> Display system commands
		int CmdCnt = 3; //Number of commands in total
		char CmdList[3][128] = {"sys_threaded - Toggle Multithreading for AI and Bullet Processing", "sys_maxfps - Set the max fps. Use: sys_maxfps #. 0 = no limit", "sys_messageheight - Max amount of messages to display on screen. Use: sys_messageheight #"};
		int delayTime = 0; //Delay time to add too per loop

		for (int cmdNum = 0; cmdNum < CmdCnt; cmdNum++) {
			AddMessage(CmdList[cmdNum]);
		}
	}


	/* -> End <- */
	TypingJustExit = true;
	Console_Clear();
}

/**
* Parse text using string compare and return true if comand is the requested command
* @author adelphospro
* @date 11.15.2009
*/
bool Console_TypedTextParseCheck(LPSTR IsCommand)
{
	if (strcmp(TypedText,IsCommand) == 0) return true;
	return false;
}

int Console_ProcessIntValue(char command[128], char fullstring[128],int originalValue) {
	// -> Find the int value from a string...
	int stringLength = (int)strlen(command);
	if (stringLength == (int)strlen(fullstring)) {
		//Then show command value...
		wsprintf(logt,"%s = %d",command,originalValue);
		AddMessage(logt);
		return originalValue;
	}
	char numinChar[128];
	for (int gi = stringLength; gi < (int)strlen(fullstring); gi++) {
		if (fullstring[gi] == 0) continue;
		numinChar[gi-stringLength] = fullstring[gi];

	}
	return (int)atoi(numinChar);
}

/** 
* Provides us with a central place to enable cheats.
* This allows us to easily disable any commands
* considered a cheat for multiplayer games abd such
* @author adelphospro
* @date 11.14.2009
*/
void Console_ToggleCheat(LPSTR cheat_text, BOOL & cheat_bool) {
	if (cheat_bool == FALSE && CHEAT_ENABLED == TRUE) {
		SwitchMode(cheat_text,cheat_bool);
	} else if (cheat_bool == TRUE) {
		SwitchMode(cheat_text,cheat_bool);
		//Safty precation
		if (cheat_bool == TRUE)
			cheat_bool = FALSE;
	} else {
		//This can be a security risk, since hacker could location where in the compiled code we block cheats based on this string of text
		AddMessage("Cheats are not allowed in this mode or are disabled");
	}
}

void Console_Clear() {
	//TypingMode = FALSE;
	memset(TypedText, 0, sizeof(TypedText));
	TypedTextLength = 0;
}

/**
* Clear all logs
* @author adelphospro
* @date 11.14.2009
*/
void Console_ClearLog() {
	for (int consoleid = 0; consoleid < CommandLogCnt; consoleid++) {
		lstrcpy(CommandLog[CommandLogCnt].mtext, "");
	}
	CommandLogCnt = 0;
	//Just in case...
	CommandLogIndex = -1;
}

/**
* Print text to the log. This is the best place to store debug messages.
* Note there is no time expire on these.
* @author adelphospro
* @date 11.14.2009
*/
void Console_PrintLog(LPSTR l) {

	if (CommandLogCnt < 512) {
		lstrcpy(CommandLog[CommandLogCnt].mtext, l);
		CommandLogCnt++;
	} else {
		//-> Force expire the first message
		Console_DropFirstMessage(); //Drop the first message and resort the array
		//-> Now Add it
		lstrcpy(CommandLog[CommandLogCnt].mtext, l);
		CommandLogCnt++;
	}
}

void Console_PrintLogString(std::string log_msg)
{
	if (CommandLogCnt < 512) {
		lstrcpy(CommandLog[CommandLogCnt].mtext, log_msg.c_str());
		CommandLogCnt++;
	}
	else {
		//-> Force expire the first message
		Console_DropFirstMessage(); //Drop the first message and resort the array
		//-> Now Add it
		lstrcpy(CommandLog[CommandLogCnt].mtext, log_msg.c_str());
		CommandLogCnt++;
	}
}

/**
* Drop the latest log on the list to clear room
* @author adelphospro
* @param [bool]ConsoleReset = [default] false - If true, function will reset console tracking index. 
*											Useful if you drop first message but do not add a new one
* @date 11.14.2009
*/
void Console_DropFirstMessage(bool ConsoleReset) {
	for (int msid = 0; msid < CommandLogCnt; msid++) {
		if (strlen(CommandLog[msid+1].mtext) > 0) {
			lstrcpy(CommandLog[msid].mtext,CommandLog[msid+1].mtext);
		} else {
			lstrcpy(CommandLog[msid].mtext,"");
		}
	}
	CommandLogCnt--;

	if (ConsoleReset == true)
		CommandLogIndex = -1;
}