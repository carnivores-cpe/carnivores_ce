/*
By: AdelphosPro (Tyler Minard)

Info:
This file contains the code that controls the network system of the engine.
It is split up in a way like the renderd3d.cpp file, where the code simply calls basic commands 
and this file takes care of the rest.

Global Functions: (Called by game or hunt)
InitNetwork()
ShutdownNetwork()
Connect()
Start()
Send()
Receive()

You can leave game by calling: network->CloseConnection(0,true,0);


Uses Rakk
*/

// ======================== Main Headers ============================ //
#include "hunt.h"

#include "rak\MessageIdentifiers.h"
//#include "rak\RakNetworkFactory.h"
#include "rak\RakPeerInterface.h"
#include "rak\RakNetStatistics.h"
#include "rak\RakNetTypes.h"
#include "rak\BitStream.h"
#include "rak\Kbhit.h"
// == Done == //

// Internal Functions dependance //
void Test_PlaceMPlayer();

// ========================= Devices for Network ==================== //
RakNet::RakPeerInterface *network;
RakNet::Packet *packet;


// ========================= Enums ============================= //
enum {
	ID_SERVERID = ID_USER_PACKET_ENUM,
	ID_PLAYERLOAD = ID_USER_PACKET_ENUM+1,
	ID_PLAYERSTATE = ID_USER_PACKET_ENUM+2,
	ID_PLAYERFIRE = ID_USER_PACKET_ENUM+3,
	ID_ELEMENT = ID_USER_PACKET_ENUM+4,
	ID_DINO = ID_USER_PACKET_ENUM+5,
	ID_SHOTSERVER = ID_USER_PACKET_ENUM+6,
	// More enums....
};
// ========================= Structs =========================== //

#pragma pack(push, 1)

struct ServerIDPacket {
	// This packet should remain the same
	// in ALL version. It contains version
	// and things like that. Before connecting,
	// this is checked to verify the server is 
	// the same version.
	unsigned char typeId; // ID_A
	bool DidGet;
	int theirID; //Their "NETID"
};

struct PlayerLoadPacket {
	// == Sends packet with default information concerning name and model == //
	unsigned char typeId; // ID_A
	int PlayerID; //Player ID
	int SubAI; //Player model: 0 = poacher model
	char* Name;
};

struct PlayerStatePacket {
	// == Sends a packet with local player information == //
	unsigned char typeId; // ID_A
	int PlayerID; //Player ID
	float x,y,z;
	float alpha,beta;
	int CurrentPhase; //Running, standing, shooting, swimming etc. See global defines
	int damage,health;
	//Does not need to know about ammo?
};

struct PlayerPointsPacket {
	unsigned char typeId; // ID_A
	int PlayerID; //Player ID
	int Kills,Deaths;
	int Health, Energy;
};

struct PlayerFirePacket {
	// == Sends a packet with player fire information == //
	unsigned char typeId; // ID_A
	int PlayerID; //Player ID who fired the bullet
	float x,y,z; //Starting x,y, and z of bullet
	float bx,by,bz; //Target direction of bullet
	int GunType; //Weapons[#]
};

struct PlayerServerShotPacket {
	// == Sends a packet with the note that the client shot the server == //
	unsigned char typeId; // ID_A
	int PlayerID;
	float playerx,playery,playerz;
	float serverx,servery,serverz;
	int GunType;
};

struct ElementPacket {
	// == Sends a packet with particle placement data (Blood, dirt, etc) == //
	// == Send clients the command to create an element == //
	unsigned char typeId; // ID_A
	float x, y, z;
	int etype, cnt;
};

#pragma pack(pop)
// == Done == //

// ========================= Global Vars and Defines ================ //
#define MAX_CLIENTS 30
#define SERVER_PORT 60000

#define PRIORITY_PLAYER 0
#define PRIORITY_DINO	1
#define PRIORITY_FIRE	2
#define PRIORITY_ELEMENT 3

// == Player Phases == //
//#define PHASE_WALK 1
#define PHASE_RUN 1
#define PHASE_IDLE 2
#define PHASE_FIRE 3
//#define PHASE_RELOAD 4
#define PHASE_DIE 5
// == Done == //

ServerIDPacket ServerID;
PlayerLoadPacket MyLoadID;
PlayerStatePacket MyPlayerStats;
PlayerStatePacket MyLastPlayerStats; //Checks to see if you already sent an updated packet
int NET_MYUSERID; //Assigned by server. This is your player number. AKA "NETID"
int UNQ_NETIDS; //Unique net id count. ALWAYS goes up.

unsigned char packetIdentifier;

// == Done == //

// ========================= Functions ========================= //
void ReceivePacket();
void SendState();
int GetLOCfromID(int pid);
void ProcessAdvancedHealthSystem(TCharacter *cptr, int dmg);
unsigned char GetPacketIdentifier(RakNet::Packet *p);

// == Done == //

// ========================= Game Code ========================= //
/* 

Remember to call SetServer() first before starting the network. 
Otherwise, the network will be started as client. 

*/

void InitNetwork() { 
	//==== Global Function ==== //
	// -> Init RakNet...
	if (!NetworkEnabled)
		return;
	PrintLog("Network: Init Network...\n");
	network = RakNet::RakPeerInterface::GetInstance();
	// == Reset MPlayers... == //
	for (int i = 0; i < 201; i++) {
		MPLocalData[i].NetID = -1;
	}
	if (!IsServer)
	{
		PrintLog("Network: Running as Client\n");
		network->Startup(1,&RakNet::SocketDescriptor(), 1);
		// == Place the server's man == //
		//PlaceHuman(999);
		Test_PlaceMPlayer();
		//PingLimit = 30;
	} else {
		PrintLog("Network: Running as Server\n");
		network->Startup(MAX_CLIENTS, &RakNet::SocketDescriptor(SERVER_PORT,0), 1);
		network->SetMaximumIncomingConnections(MAX_CLIENTS);
		NET_MYUSERID = 999;
		// === Place my own model, that way shots at me can be traced === //
		//PlaceHuman(999);

	}

	// -> Now set network variable and return...
	NetworkEnabled = true;
	ServerID.typeId = ID_SERVERID;
	ServerID.DidGet = true;
}


void DestroyNetwork() {
	//==== Global Function ==== //
	if (!NetworkEnabled)
		return;
	// -> First, send server notice!
	PrintLog("Network: Shutting Down Network...\n");
	// -> Shutdown RakNet...
	RakNet::RakPeerInterface::DestroyInstance(network);
}

bool ConnectToServer(char * server) {
	//==== Global Function ====//
	// -> Connect to server; Return state; Tries a few times, then fails
	char tmp[128];
	bool result;
	ServerIDPacket theIDp;

	result = network->Connect(server, SERVER_PORT, 0,0);
	if (result == true) {
		// -> Now attempt to get a gamestate packet
		while (1) {
			sprintf(tmp,"Network: Attempting to connect to IP Address: %s...\n",server);
			PrintLog(tmp);
			packet=network->Receive();
			packetIdentifier = GetPacketIdentifier(packet);
			if (packet)
			{
				switch (packetIdentifier)
				{
				case ID_CONNECTION_REQUEST_ACCEPTED:
					PrintLog("Network Connect: Connection request has been accepted.\nWaiting for ServerID...\n");
					// == Now Wait for ServerID packet == //
					//network->DeallocatePacket(packet);
					//return true;
					break;
				case ID_CONNECTION_ATTEMPT_FAILED:
					// == Connection Failed == //
					PrintLog("Network Connect: Connection request has FAILED\n");
					network->DeallocatePacket(packet);
					return false;
					break;
				case ID_NO_FREE_INCOMING_CONNECTIONS:
					PrintLog("Network Connect: The server is full.\n");
					network->DeallocatePacket(packet);
					return false;
					break;
				case ID_CONNECTION_LOST:
					PrintLog("Network Connect: Lost Connection.\n");
					network->DeallocatePacket(packet);
					return false;
					break;
				case ID_SERVERID: 
					PrintLog("Network Connect: Received ServerID\n");
					// == Process ServerPacket, then return... == //
					RakNet::BitStream bitstream(packet->data, packet->length, false);
					bitstream.Read(theIDp);
					//theIDp = (ServerIDPacket*)&packet->data;
					//memcpy(&thep,&packet->data,sizeof(ServerIDPacket));
					if (theIDp.DidGet == false) DoHalt("Network Connect: Received corrupt NetStat");
					NET_MYUSERID = theIDp.theirID;
					network->DeallocatePacket(packet);
					return true;
					break;
					//default:
					//	PrintLog("Network Connect: No Handled Packet Received: ");
					//	sprintf(tmp,"%s\n",packet->data);
					//	PrintLog(tmp);
					// === Test: remove the return function in release version === //
					//network->DeallocatePacket(packet);
					//return true;
					//	break;
				}

				//} else {
				//PrintLog("\n");
				//PrintLog("Network Connect: No Packet\n");
			}
			//Sleep(30); //Pause 1000, then try again...
		}
	}
	PrintLog("Network Connect: FAILED to Create Connection\n");
	return false;
}

void Disconnect() {
	// == Global Function == //
	// -> Simply leave the server, but let the server know first so it can remove your person
	network->CloseConnection(RakNet::UNASSIGNED_SYSTEM_ADDRESS,true,0);
}

void SetServer(bool beserver) {
	//==== Global Function ====//
	// -> Set Value...
	IsServer = beserver;
}


void PreformNetworkSystem() { // == Core and main entry of Network Code == //
	//==== Global Function ====//
	// -> Send or receive current state
	//Server: Get states from players and process them. Process dino movements. 
	// --> Send dino and player layouts back to clients.
	//Client: Get dino and player layout. 
	// --> Send back your state (fire, move, etc)
	//If a player is hit by a bullet, the server should somehow notify the impact:
	//SendNotifyPlayerHit(PlayerID,damage)?
	// - OR -
	//Process damage and: SendOverrideState(PlayerID,PlayerStatePacket)?

	// ======== Priorities ========== //
	//0: Player placement and state gets TOP
	//1: Dino placement gets 2ND
	//2: Player shooting gets 3RD
	//3: Elements

	switch (IsServer) {
		case true: // == Server == //
			// = First, Get data from clients, then process it and send results back out = //
			SendState(); //Change to SendAllState to send ALL clients ALL the players situation
			//SendDinoLayout();
			for (int i = 0; i < 50; i++) {
				ReceivePacket();
			}
			break;
		case false: // == Client == //
			// = First, Get data from server, then process it, then send current situation (Such as key presses, and the like) = //
			//Process a bunch of packets at once to fix packet delay...
			for (int i = 0; i < 100; i++) {
				ReceivePacket();
			}
			SendState();
			break;
	}
}

void NetSendShotServer(float serverx, float servery, float serverz, int GunType) {
	// == Global Function == //
	// -> Tell server that I shot him!
	RakNet::BitStream outStream;
	PlayerServerShotPacket sendshot;
	sendshot.GunType = GunType;
	sendshot.PlayerID = NET_MYUSERID;
	sendshot.serverx = serverx;
	sendshot.servery = servery;
	sendshot.serverz = serverz;

	sendshot.typeId = ID_SHOTSERVER;
	// == Send the Data == //
	outStream.Write(sendshot);
	network->Send(&outStream,HIGH_PRIORITY,RELIABLE_ORDERED,PRIORITY_FIRE,RakNet::UNASSIGNED_SYSTEM_ADDRESS,true);

}

void NetSendShotPlayer(int pid, int damage) {
	// == GLobal function == //
	// -> Tell a client he was shot by sending out a statepacket with new health info
	int phealth = Characters[MPLocalData[pid].ChCount].Health;
	RakNet::BitStream outStream;
	PlayerStatePacket shotp;
	shotp.PlayerID = pid;
	shotp.damage = damage;
	// == Populate other data so as not to confuse other clients == //
	shotp.alpha = Characters[MPLocalData[pid].ChCount].alpha;
	shotp.beta = Characters[MPLocalData[pid].ChCount].beta;
	shotp.CurrentPhase = Characters[MPLocalData[pid].ChCount].SetPhase;
	shotp.x = Characters[MPLocalData[pid].ChCount].pos.x;
	shotp.y = Characters[MPLocalData[pid].ChCount].pos.y;
	shotp.z = Characters[MPLocalData[pid].ChCount].pos.z;
	shotp.typeId = ID_PLAYERSTATE;
	outStream.Write(shotp);
	network->Send(&outStream,HIGH_PRIORITY,RELIABLE_ORDERED,PRIORITY_FIRE,RakNet::UNASSIGNED_SYSTEM_ADDRESS,true);

}

void NetSendFireCommand(float ax, float ay, float az,float bx, float by, float bz, int GunType) {
	// == Global Function == //
	// == Send the server the command to fire == //

	RakNet::BitStream outStream;
	PlayerFirePacket sendfire;

	sendfire.GunType = GunType;
	sendfire.PlayerID = NET_MYUSERID;
	sendfire.x = ax;
	sendfire.y = ay;
	sendfire.z = az;
	sendfire.bx = bx;
	sendfire.by = by;
	sendfire.bz = bz;

	sendfire.typeId = ID_PLAYERFIRE;
	// == Send the Data == //
	outStream.Write(sendfire);
	network->Send(&outStream,HIGH_PRIORITY,RELIABLE_ORDERED,PRIORITY_FIRE,RakNet::UNASSIGNED_SYSTEM_ADDRESS,true);
}

void SendState() {
	//==== Local Function ====//
	// == First compare to see if your stats need to be updated == //
	//if (IsServer) {
	//	// == Update my local guy == //
	//	Characters[MPLocalData[200].ChCount].pos.x = CameraX;
	//	Characters[MPLocalData[200].ChCount].pos.z = CameraZ;
	//	Characters[MPLocalData[200].ChCount].pos.y = (CameraY-GetLandH(CameraX, CameraZ)-HeadY)+GetLandH(CameraX, CameraZ);
	//	Characters[MPLocalData[200].ChCount].alpha = CameraAlpha - 900;
	//	Characters[MPLocalData[200].ChCount].beta = CameraBeta;
	//}
	if (DemoPoint.DemoTime) return; //Don't send death camera rotation to the server
	if (MyLastPlayerStats.alpha == (CameraAlpha-900) && MyLastPlayerStats.health == MyHealth && MyLastPlayerStats.x == CameraX && MyLastPlayerStats.z == CameraZ) return;

	RakNet::BitStream outStream;
	// -> Update & Send MyPlayerStats, and if need be (if you update your name, for example) send MyLoadID
	MyPlayerStats.alpha = CameraAlpha-900; //Replace -900 with the offset from res file
	MyPlayerStats.beta = CameraBeta;
	int setphase = PHASE_IDLE; //Default 2 = breath and standstill
	if (VSpeed || SSpeed) { //If player is moving, play walk animation....	
		setphase = PHASE_RUN;
	} 
	if (Weapon.state == 2 && Weapon.FTime>0) { //If weapon is open and firing...
		setphase = PHASE_FIRE;
	} 
	if (!MyHealth) setphase = PHASE_DIE;
	MyPlayerStats.CurrentPhase = setphase;
	MyPlayerStats.PlayerID = NET_MYUSERID;
	MyPlayerStats.x = CameraX;
	MyPlayerStats.z = CameraZ;
	MyPlayerStats.health = MyHealth;
	MyPlayerStats.y = (CameraY-GetLandH(CameraX, CameraZ)-HeadY)+GetLandH(MyPlayerStats.x, MyPlayerStats.z);
	if (CrouchMode) MyPlayerStats.y -= 100; //Crouch the dude
	// == Send the Data == //
	MyPlayerStats.typeId = ID_PLAYERSTATE;
	MyLastPlayerStats = MyPlayerStats;
	outStream.Write(MyPlayerStats);
	if (IsServer) {
		// == Update myself == //
		network->Send(&outStream,HIGH_PRIORITY,RELIABLE_ORDERED,PRIORITY_PLAYER,RakNet::UNASSIGNED_SYSTEM_ADDRESS,true);
	} else {
		network->Send(&outStream,HIGH_PRIORITY,RELIABLE_ORDERED,PRIORITY_PLAYER,RakNet::UNASSIGNED_SYSTEM_ADDRESS,true);
	}

}

void NetSendElementPacket(float x, float y, float z, int type, int count) {
	// == Global Function == //
	// -> Sents Element command to all clients 
	ElementPacket elp;
	RakNet::BitStream outStream;

	elp.typeId = ID_ELEMENT;
	elp.cnt = count;
	elp.etype = type;
	elp.z = z;
	elp.x = x;
	elp.y = y;

	outStream.Write(elp);
	network->Send(&outStream,LOW_PRIORITY,RELIABLE_ORDERED,PRIORITY_ELEMENT,RakNet::UNASSIGNED_SYSTEM_ADDRESS,true);
}


void ProcessServerShotPacket() {
	PlayerServerShotPacket tp;
	RakNet::BitStream bitstream(packet->data, packet->length, false);
	bitstream.Read(tp);
	if (max(CameraX,tp.serverx) - min(CameraX,tp.serverx) < 50) { //Helps prevent lag kills on the server
		//MyHealth -= WeapInfo[tp.GunType].Power*1000;
		ProcessAdvancedHealthSystem(&Characters[0], WeapInfo[tp.GunType].Power*1280);
		//HurtPlayer(&Characters[0],WeapInfo[tp.GunType].Power*1280); //Multiplying by 1280 makes the power relate to the health as if the health were 100. (So a weap power of 50 takes away half the player's health)
		// Note that server cannot be killed by a mortal shot :/ This should be fixed in the future
		 if (MyHealth < 0) {
			 MyHealth = 1;
			 AddDeadBody(NULL,HUNT_EAT);
		 }
	}
}

void ProcessElementPacket() {
	ElementPacket elp;
	RakNet::BitStream bitstream(packet->data, packet->length, false);
	bitstream.Read(elp);
	AddElements(elp.x, elp.y, elp.z, elp.etype, elp.cnt);
}


void ProcessPlayerFirePacket() {
	PlayerFirePacket fp;
	RakNet::BitStream bitstream(packet->data, packet->length, false);
	bitstream.Read(fp);
	// -> Below calls modded in-game function: MakeShot
	MakeShot(fp.x, fp.y, fp.z,fp.bx, fp.by, fp.bz);//,fp.GunType,fp.PlayerID);
}

void ProcessPlayerStatePacket() {
	// == Local Function == //
	// -> Process player state packet and update local machine data
	PlayerStatePacket thep;
	RakNet::BitStream bitstream(packet->data, packet->length, false);
	int pID;
	
	bitstream.Read(thep);
	if (thep.PlayerID == NET_MYUSERID && !IsServer) {
		// == It was me, set my health == //
		ProcessAdvancedHealthSystem(&Characters[0],thep.damage);
		//HurtPlayer(&Characters[0],thep.damage);
		if (MyHealth < 0) {
			 MyHealth = 1;
			 AddDeadBody(NULL,HUNT_EAT);
		 }
		return;
	}
	pID = GetLOCfromID(thep.PlayerID);
	if (pID == -1) {
		if (DEBUG) PrintLog("Network: Adding new player...\n");
		//PlaceHuman(thep.PlayerID);
		Test_PlaceMPlayer();
		// -> get address...
		pID = GetLOCfromID(thep.PlayerID);
		if (pID != -1) {
			// == Update... == //
			if (DEBUG) PrintLog("Network (DEBUG): Updating new player...\n");
			Characters[MPLocalData[pID].ChCount].alpha = thep.alpha;
			Characters[MPLocalData[pID].ChCount].beta = thep.beta;
			Characters[MPLocalData[pID].ChCount].SetPhase = thep.CurrentPhase;
			Characters[MPLocalData[pID].ChCount].pos.x = thep.x;
			Characters[MPLocalData[pID].ChCount].pos.y = thep.y;
			Characters[MPLocalData[pID].ChCount].pos.z = thep.z;
			Characters[MPLocalData[pID].ChCount].Health = thep.health;
			if (DEBUG) PrintLog("Network (DEBUG): Updated New Player Pos!\n");
		} else {
			PrintLog("Network: Problem placing human!\n");
		}
	} else {
		Characters[MPLocalData[pID].ChCount].alpha = thep.alpha;
		Characters[MPLocalData[pID].ChCount].beta = thep.beta;
		Characters[MPLocalData[pID].ChCount].SetPhase = thep.CurrentPhase;
		Characters[MPLocalData[pID].ChCount].pos.x = thep.x;
		Characters[MPLocalData[pID].ChCount].pos.y = thep.y;
		Characters[MPLocalData[pID].ChCount].pos.z = thep.z;
		Characters[MPLocalData[pID].ChCount].Health = thep.health;
	}
}

void ReceivePacket() {
	//==== Local Function ====//
	// -> Primary Packet Handling Goes here
	// Note that sometimes custom packet handling is needed (See Connect)
	// -> Simply gets the packet and processes it
	//tryagain:
	packet=network->Receive();
	//char tmp[2048];
	bool TalkedToServer = false;
	RakNet::BitStream outStream;

	if (packet)
	{
		switch (packet->data[0])
		{
		case ID_REMOTE_DISCONNECTION_NOTIFICATION:
			PrintLog("Network: Another client has disconnected.\n");
			// -> Server: Remove the player and delete his place
			break;
		case ID_REMOTE_CONNECTION_LOST:
			PrintLog("Network: Another client has lost the connection.\n");
			// -> Server: Remove the player and delete his place
			break;
		case ID_REMOTE_NEW_INCOMING_CONNECTION:
			PrintLog("Network: Another client has connected.\n");
			// -> Server: Init the player and place him in the game someplace
			break;
		case ID_CONNECTION_REQUEST_ACCEPTED:
			PrintLog("Network: Our connection request has been accepted.\n");
			// -> Client: Accept placement data
			// Step 2: this happens after an incoming connection on the server
			break;

		case ID_NEW_INCOMING_CONNECTION:
			PrintLog("Network: A connection is incoming.\n");
			// -> Server: Simply let the users know a player is coming: ie: "Player Tyler is Preparing to Join..."
			// == Send Client the ServerIDPacket data == //
			AddMessage("Console: a player is connecting...");
			bool result;
			// == Send serverID to the player == //
			UNQ_NETIDS++;
			ServerID.DidGet = true;
			ServerID.theirID = UNQ_NETIDS;
			//I want to only send the ID to the client...
			outStream.Write(ServerID);
			result = network->Send(&outStream,HIGH_PRIORITY,RELIABLE,0,RakNet::UNASSIGNED_SYSTEM_ADDRESS,true);
			if (!result) {
				PrintLog("Network: Failed to send ServerState to client...\n"); 
			} else {
				PrintLog("Network: Sent ServerState to client...\n");
			}
			break;
		case ID_NO_FREE_INCOMING_CONNECTIONS:
			PrintLog("Network: The server is full.\n");
			// -> Client: Kill the game and let the user know why
			break;
		case ID_DISCONNECTION_NOTIFICATION:
				PrintLog("Network: A client has disconnected.\n");
				AddMessage("Console: a player has disconnected");
			break;
		case ID_CONNECTION_LOST:
				PrintLog("Network: A client lost the connection.\n");
				AddMessage("Console: a player has been disconnected");
			break;
		case ID_PLAYERLOAD:
			// == First time user data == //
			// -> Contains name and such
			break;
		case ID_PLAYERSTATE:
			ProcessPlayerStatePacket();
			break;
		case ID_PLAYERFIRE:
			if (IsServer)
				ProcessPlayerFirePacket();
			break;
		case ID_ELEMENT:
			// == Process element == //
			if (!IsServer)
				ProcessElementPacket();
			break;
		case ID_SHOTSERVER:
				if (IsServer)
					ProcessServerShotPacket();
			break;
		}

		network->DeallocatePacket(packet);
	}
}

int GetLOCfromID(int pid) {
	// == Local Function == //
	// -> This takes the perm NetID of a player and finds its local model. Returns -1 if it doesn't exist
	int returnvalue = -1;
	for (int i = 0; i <= MPlayersCount; i++ ){
		if (MPLocalData[i].NetID == pid) return i;
	}
	return returnvalue;
}

unsigned char GetPacketIdentifier(RakNet::Packet *p)
{
	// == Local Function == //
	if (p==0)
		return 255;

	if ((unsigned char)p->data[0] == ID_TIMESTAMP)
	{
		assert(p->length > sizeof(unsigned char) + sizeof(unsigned long));
		return (unsigned char) p->data[sizeof(unsigned char) + sizeof(unsigned long)];
	}
	else
		return (unsigned char) p->data[0];
}