<?xml version="1.0"?><doc>
<members>
<member name="T:OutOfBandIdentifiers" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="11">
\file
\brief All the message identifiers used by RakNet.  Message identifiers comprise the first byte of any message.

</member>
<member name="F:ID_CONNECTED_PING" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="57">
These types are never returned to the user.
Ping from a connected system.  Update timestamps (internal use only)
</member>
<member name="F:ID_UNCONNECTED_PING" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="60">
Ping from an unconnected system.  Reply but do not update timestamps. (internal use only)
</member>
<member name="F:ID_UNCONNECTED_PING_OPEN_CONNECTIONS" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="62">
Ping from an unconnected system.  Only reply if we have open connections. Do not update timestamps. (internal use only)
</member>
<member name="F:ID_CONNECTED_PONG" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="64">
Pong from a connected system.  Update timestamps (internal use only)
</member>
<member name="F:ID_DETECT_LOST_CONNECTIONS" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="66">
A reliable packet to detect lost connections (internal use only)
</member>
<member name="F:ID_OPEN_CONNECTION_REQUEST_1" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="68">
C2S: Initial query: Header(1), OfflineMesageID(16), Protocol number(1), Pad(toMTU), sent with no fragment set.
If protocol fails on server, returns ID_INCOMPATIBLE_PROTOCOL_VERSION to client
</member>
<member name="F:ID_OPEN_CONNECTION_REPLY_1" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="71">
S2C: Header(1), OfflineMesageID(16), server GUID(8), HasSecurity(1), Cookie(4, if HasSecurity)
, public key (if do security is true), MTU(2). If public key fails on client, returns ID_PUBLIC_KEY_MISMATCH
</member>
<member name="F:ID_OPEN_CONNECTION_REQUEST_2" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="74">
C2S: Header(1), OfflineMesageID(16), Cookie(4, if HasSecurity is true on the server), clientSupportsSecurity(1 bit),
handshakeChallenge (if has security on both server and client), remoteBindingAddress(6), MTU(2), client GUID(8)
Connection slot allocated if cookie is valid, server is not full, GUID and IP not already in use.
</member>
<member name="F:ID_OPEN_CONNECTION_REPLY_2" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="78">
S2C: Header(1), OfflineMesageID(16), server GUID(8), mtu(2), doSecurity(1 bit), handshakeAnswer (if do security is true)
</member>
<member name="F:ID_CONNECTION_REQUEST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="80">
C2S: Header(1), GUID(8), Timestamp, HasSecurity(1), Proof(32)
</member>
<member name="F:ID_REMOTE_SYSTEM_REQUIRES_PUBLIC_KEY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="82">
RakPeer - Remote system requires secure connections, pass a public key to RakPeerInterface::Connect()
</member>
<member name="F:ID_OUR_SYSTEM_REQUIRES_SECURITY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="84">
RakPeer - We passed a public key to RakPeerInterface::Connect(), but the other system did not have security turned on
</member>
<member name="F:ID_PUBLIC_KEY_MISMATCH" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="86">
RakPeer - Wrong public key passed to RakPeerInterface::Connect()
</member>
<member name="F:ID_OUT_OF_BAND_INTERNAL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="88">
RakPeer - Same as ID_ADVERTISE_SYSTEM, but intended for internal use rather than being passed to the user.
Second byte indicates type. Used currently for NAT punchthrough for receiver port advertisement. See ID_NAT_ADVERTISE_RECIPIENT_PORT
</member>
<member name="F:ID_SND_RECEIPT_ACKED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="91">
If RakPeerInterface::Send() is called where PacketReliability contains _WITH_ACK_RECEIPT, then on a later call to
RakPeerInterface::Receive() you will get ID_SND_RECEIPT_ACKED or ID_SND_RECEIPT_LOSS. The message will be 5 bytes long,
and bytes 1-4 inclusive will contain a number in native order containing a number that identifies this message.
This number will be returned by RakPeerInterface::Send() or RakPeerInterface::SendList(). ID_SND_RECEIPT_ACKED means that
the message arrived
</member>
<member name="F:ID_SND_RECEIPT_LOSS" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="97">
If RakPeerInterface::Send() is called where PacketReliability contains UNRELIABLE_WITH_ACK_RECEIPT, then on a later call to
RakPeerInterface::Receive() you will get ID_SND_RECEIPT_ACKED or ID_SND_RECEIPT_LOSS. The message will be 5 bytes long,
and bytes 1-4 inclusive will contain a number in native order containing a number that identifies this message. This number
will be returned by RakPeerInterface::Send() or RakPeerInterface::SendList(). ID_SND_RECEIPT_LOSS means that an ack for the
message did not arrive (it may or may not have been delivered, probably not). On disconnect or shutdown, you will not get
ID_SND_RECEIPT_LOSS for unsent messages, you should consider those messages as all lost.
</member>
<member name="F:ID_CONNECTION_REQUEST_ACCEPTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="110">
RakPeer - In a client/server environment, our connection request to the server has been accepted.
</member>
<member name="F:ID_CONNECTION_ATTEMPT_FAILED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="112">
RakPeer - Sent to the player when a connection request cannot be completed due to inability to connect. 
</member>
<member name="F:ID_ALREADY_CONNECTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="114">
RakPeer - Sent a connect request to a system we are currently connected to.
</member>
<member name="F:ID_NEW_INCOMING_CONNECTION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="116">
RakPeer - A remote system has successfully connected.
</member>
<member name="F:ID_NO_FREE_INCOMING_CONNECTIONS" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="118">
RakPeer - The system we attempted to connect to is not accepting new connections.
</member>
<member name="F:ID_DISCONNECTION_NOTIFICATION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="120">
RakPeer - The system specified in Packet::systemAddress has disconnected from us.  For the client, this would mean the
server has shutdown. 
</member>
<member name="F:ID_CONNECTION_LOST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="123">
RakPeer - Reliable packets cannot be delivered to the system specified in Packet::systemAddress.  The connection to that
system has been closed. 
</member>
<member name="F:ID_CONNECTION_BANNED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="126">
RakPeer - We are banned from the system we attempted to connect to.
</member>
<member name="F:ID_INVALID_PASSWORD" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="128">
RakPeer - The remote system is using a password and has refused our connection because we did not set the correct password.
</member>
<member name="F:ID_IP_RECENTLY_CONNECTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="135">
RakPeer::SetLimitIPConnectionFrequency()
</member>
<member name="F:ID_TIMESTAMP" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="137">
RakPeer - The sizeof(RakNetTime) bytes following this byte represent a value which is automatically modified by the difference
in system times between the sender and the recipient. Requires that you call SetOccasionalPing.
</member>
<member name="F:ID_UNCONNECTED_PONG" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="140">
RakPeer - Pong from an unconnected system.  First byte is ID_UNCONNECTED_PONG, second sizeof(RakNet::TimeMS) bytes is the ping,
following bytes is system specific enumeration data.
Read using bitstreams
</member>
<member name="F:ID_ADVERTISE_SYSTEM" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="144">
RakPeer - Inform a remote system of our IP/Port. On the recipient, all data past ID_ADVERTISE_SYSTEM is whatever was passed to
the data parameter
</member>
<!-- Discarding badly formed XML document comment for member 'F:ID_DOWNLOAD_PROGRESS'. -->
<member name="F:ID_REMOTE_DISCONNECTION_NOTIFICATION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="153">
ConnectionGraph2 plugin - In a client/server environment, a client other than ourselves has disconnected gracefully.
  Packet::systemAddress is modified to reflect the systemAddress of this client.
</member>
<member name="F:ID_REMOTE_CONNECTION_LOST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="156">
ConnectionGraph2 plugin - In a client/server environment, a client other than ourselves has been forcefully dropped.
 Packet::systemAddress is modified to reflect the systemAddress of this client.
</member>
<member name="F:ID_REMOTE_NEW_INCOMING_CONNECTION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="159">
ConnectionGraph2 plugin: Bytes 1-4 = count. for (count items) contains {SystemAddress, RakNetGUID, 2 byte ping}
</member>
<member name="F:ID_FILE_LIST_TRANSFER_HEADER" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="162">
FileListTransfer plugin - Setup data
</member>
<member name="F:ID_FILE_LIST_TRANSFER_FILE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="164">
FileListTransfer plugin - A file
</member>
<member name="F:ID_DDT_DOWNLOAD_REQUEST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="169">
DirectoryDeltaTransfer plugin - Request from a remote system for a download of a directory
</member>
<member name="F:ID_TRANSPORT_STRING" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="172">
RakNetTransport plugin - Transport provider message, used for remote console
</member>
<member name="F:ID_REPLICA_MANAGER_CONSTRUCTION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="175">
ReplicaManager plugin - Create an object
</member>
<member name="F:ID_REPLICA_MANAGER_SCOPE_CHANGE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="177">
ReplicaManager plugin - Changed scope of an object
</member>
<member name="F:ID_REPLICA_MANAGER_SERIALIZE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="179">
ReplicaManager plugin - Serialized data of an object
</member>
<member name="F:ID_REPLICA_MANAGER_DOWNLOAD_STARTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="181">
ReplicaManager plugin - New connection, about to send all world objects
</member>
<member name="F:ID_REPLICA_MANAGER_DOWNLOAD_COMPLETE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="183">
ReplicaManager plugin - Finished downloading all serialized objects
</member>
<member name="F:ID_RAKVOICE_OPEN_CHANNEL_REQUEST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="186">
RakVoice plugin - Open a communication channel
</member>
<member name="F:ID_RAKVOICE_OPEN_CHANNEL_REPLY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="188">
RakVoice plugin - Communication channel accepted
</member>
<member name="F:ID_RAKVOICE_CLOSE_CHANNEL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="190">
RakVoice plugin - Close a communication channel
</member>
<member name="F:ID_RAKVOICE_DATA" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="192">
RakVoice plugin - Voice data
</member>
<member name="F:ID_AUTOPATCHER_GET_CHANGELIST_SINCE_DATE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="195">
Autopatcher plugin - Get a list of files that have changed since a certain date
</member>
<member name="F:ID_AUTOPATCHER_CREATION_LIST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="197">
Autopatcher plugin - A list of files to create
</member>
<member name="F:ID_AUTOPATCHER_DELETION_LIST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="199">
Autopatcher plugin - A list of files to delete
</member>
<member name="F:ID_AUTOPATCHER_GET_PATCH" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="201">
Autopatcher plugin - A list of files to get patches for
</member>
<member name="F:ID_AUTOPATCHER_PATCH_LIST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="203">
Autopatcher plugin - A list of patches for a list of files
</member>
<member name="F:ID_AUTOPATCHER_REPOSITORY_FATAL_ERROR" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="205">
Autopatcher plugin - Returned to the user: An error from the database repository for the autopatcher.
</member>
<member name="F:ID_AUTOPATCHER_CANNOT_DOWNLOAD_ORIGINAL_UNMODIFIED_FILES" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="207">
Autopatcher plugin - Returned to the user: The server does not allow downloading unmodified game files.
</member>
<member name="F:ID_AUTOPATCHER_FINISHED_INTERNAL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="209">
Autopatcher plugin - Finished getting all files from the autopatcher
</member>
<member name="F:ID_AUTOPATCHER_RESTART_APPLICATION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="212">
Autopatcher plugin - Returned to the user: You must restart the application to finish patching.
</member>
<member name="F:ID_NAT_PUNCHTHROUGH_REQUEST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="215">
NATPunchthrough plugin: internal
</member>
<member name="F:ID_NAT_CONNECT_AT_TIME" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="217">
NATPunchthrough plugin: internal
NATPunchthrough plugin: internal
NATPunchthrough plugin: internal
</member>
<member name="F:ID_NAT_GET_MOST_RECENT_PORT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="223">
NATPunchthrough plugin: internal
</member>
<member name="F:ID_NAT_CLIENT_READY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="225">
NATPunchthrough plugin: internal
</member>
<member name="F:ID_NAT_TARGET_NOT_CONNECTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="227">
NATPunchthrough plugin: internal
NATPunchthrough plugin: Destination system is not connected to the server. Bytes starting at offset 1 contains the
 RakNetGUID destination field of NatPunchthroughClient::OpenNAT().
</member>
<member name="F:ID_NAT_TARGET_UNRESPONSIVE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="233">
NATPunchthrough plugin: Destination system is not responding to ID_NAT_GET_MOST_RECENT_PORT. Possibly the plugin is not installed.
 Bytes starting at offset 1 contains the RakNetGUID  destination field of NatPunchthroughClient::OpenNAT().
</member>
<member name="F:ID_NAT_CONNECTION_TO_TARGET_LOST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="236">
NATPunchthrough plugin: The server lost the connection to the destination system while setting up punchthrough.
 Possibly the plugin is not installed. Bytes starting at offset 1 contains the RakNetGUID  destination
 field of NatPunchthroughClient::OpenNAT().
</member>
<member name="F:ID_NAT_ALREADY_IN_PROGRESS" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="240">
NATPunchthrough plugin: This punchthrough is already in progress. Possibly the plugin is not installed.
 Bytes starting at offset 1 contains the RakNetGUID destination field of NatPunchthroughClient::OpenNAT().
</member>
<member name="F:ID_NAT_PUNCHTHROUGH_FAILED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="243">
NATPunchthrough plugin: This message is generated on the local system, and does not come from the network.
 packet::guid contains the destination field of NatPunchthroughClient::OpenNAT(). Byte 1 contains 1 if you are the sender, 0 if not
</member>
<member name="F:ID_NAT_PUNCHTHROUGH_SUCCEEDED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="246">
NATPunchthrough plugin: Punchthrough succeeded. See packet::systemAddress and packet::guid. Byte 1 contains 1 if you are the sender,
 0 if not. You can now use RakPeer::Connect() or other calls to communicate with this system.
</member>
<member name="F:ID_READY_EVENT_SET" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="250">
ReadyEvent plugin - Set the ready state for a particular system
First 4 bytes after the message contains the id
</member>
<member name="F:ID_READY_EVENT_UNSET" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="253">
ReadyEvent plugin - Unset the ready state for a particular system
First 4 bytes after the message contains the id
</member>
<member name="F:ID_READY_EVENT_ALL_SET" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="256">
All systems are in state ID_READY_EVENT_SET
First 4 bytes after the message contains the id
</member>
<member name="F:ID_READY_EVENT_QUERY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="259">
\internal, do not process in your game
ReadyEvent plugin - Request of ready event state - used for pulling data when newly connecting
</member>
<member name="F:ID_LOBBY_GENERAL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="263">
Lobby packets. Second byte indicates type.
</member>
<member name="F:ID_RPC_PLUGIN" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="268">
Plugin based replacement for RPC system
</member>
<member name="F:ID_FILE_LIST_REFERENCE_PUSH" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="271">
FileListTransfer transferring large files in chunks that are read only when needed, to save memory
</member>
<member name="F:ID_READY_EVENT_FORCE_ALL_SET" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="273">
Force the ready event to all set
</member>
<member name="F:ID_ROOMS_EXECUTE_FUNC" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="276">
Rooms function
</member>
<member name="F:ID_LOBBY2_SEND_MESSAGE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="281">
Lobby2 message
</member>
<member name="F:ID_FCM2_NEW_HOST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="285">
Informs user of a new host GUID. Packet::Guid contains this new host RakNetGuid. The old host can be read out using BitStream-&gt;Read(RakNetGuid) starting on byte 1
This is not returned until connected to a remote system
If the oldHost is UNASSIGNED_RAKNET_GUID, then this is the first time the host has been determined
</member>
<member name="F:ID_FCM2_REQUEST_FCMGUID" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="289">
\internal For FullyConnectedMesh2 plugin
</member>
<member name="F:ID_FCM2_RESPOND_CONNECTION_COUNT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="291">
\internal For FullyConnectedMesh2 plugin
</member>
<member name="F:ID_FCM2_INFORM_FCMGUID" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="293">
\internal For FullyConnectedMesh2 plugin
</member>
<member name="F:ID_FCM2_UPDATE_MIN_TOTAL_CONNECTION_COUNT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="295">
\internal For FullyConnectedMesh2 plugin
</member>
<member name="F:ID_FCM2_VERIFIED_JOIN_START" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="297">
A remote system (not necessarily the host) called FullyConnectedMesh2::StartVerifiedJoin() with our system as the client
Use FullyConnectedMesh2::GetVerifiedJoinRequiredProcessingList() to read systems
For each system, attempt NatPunchthroughClient::OpenNAT() and/or RakPeerInterface::Connect()
When this has been done for all systems, the remote system will automatically be informed of the results
\note Only the designated client gets this message
\note You won't get this message if you are already connected to all target systems
\note If you fail to connect to a system, this does not automatically mean you will get ID_FCM2_VERIFIED_JOIN_FAILED as that system may have been shutting down from the host too
\sa FullyConnectedMesh2::StartVerifiedJoin()
</member>
<member name="F:ID_FCM2_VERIFIED_JOIN_CAPABLE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="306">
\internal The client has completed processing for all systems designated in ID_FCM2_VERIFIED_JOIN_START
</member>
<member name="F:ID_FCM2_VERIFIED_JOIN_FAILED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="308">
Client failed to connect to a required systems notified via FullyConnectedMesh2::StartVerifiedJoin()
RakPeerInterface::CloseConnection() was automatically called for all systems connected due to ID_FCM2_VERIFIED_JOIN_START 
Programmer should inform the player via the UI that they cannot join this session, and to choose a different session
\note Server normally sends us this message, however if connection to the server was lost, message will be returned locally
\note Only the designated client gets this message
</member>
<member name="F:ID_FCM2_VERIFIED_JOIN_ACCEPTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="314">
The system that called StartVerifiedJoin() got ID_FCM2_VERIFIED_JOIN_CAPABLE from the client and then called RespondOnVerifiedJoinCapable() with true
AddParticipant() has automatically been called for this system
Use GetVerifiedJoinAcceptedAdditionalData() to read any additional data passed to RespondOnVerifiedJoinCapable()
\note All systems in the mesh get this message
\sa RespondOnVerifiedJoinCapable()
</member>
<member name="F:ID_FCM2_VERIFIED_JOIN_REJECTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="320">
The system that called StartVerifiedJoin() got ID_FCM2_VERIFIED_JOIN_CAPABLE from the client and then called RespondOnVerifiedJoinCapable() with false
CloseConnection() has been automatically called for each system connected to since ID_FCM2_VERIFIED_JOIN_START.
The connection is NOT automatically closed to the original host that sent StartVerifiedJoin()
Use GetVerifiedJoinRejectedAdditionalData() to read any additional data passed to RespondOnVerifiedJoinCapable()
\note Only the designated client gets this message
\sa RespondOnVerifiedJoinCapable()
</member>
<member name="F:ID_UDP_PROXY_GENERAL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="328">
UDP proxy messages. Second byte indicates type.
</member>
<member name="F:ID_SQLite3_EXEC" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="331">
SQLite3Plugin - execute
</member>
<member name="F:ID_SQLite3_UNKNOWN_DB" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="333">
SQLite3Plugin - Remote database is unknown
</member>
<member name="F:ID_SQLLITE_LOGGER" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="335">
Events happening with SQLiteClientLoggerPlugin
</member>
<member name="F:ID_NAT_TYPE_DETECTION_REQUEST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="338">
Sent to NatTypeDetectionServer
</member>
<member name="F:ID_NAT_TYPE_DETECTION_RESULT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="340">
Sent to NatTypeDetectionClient. Byte 1 contains the type of NAT detected.
</member>
<member name="F:ID_ROUTER_2_INTERNAL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="343">
Used by the router2 plugin
</member>
<member name="F:ID_ROUTER_2_FORWARDING_NO_PATH" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="345">
No path is available or can be established to the remote system
Packet::guid contains the endpoint guid that we were trying to reach
</member>
<member name="F:ID_ROUTER_2_FORWARDING_ESTABLISHED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="348">
\brief You can now call connect, ping, or other operations to the destination system.

Connect as follows:

RakNet::BitStream bs(packet-&gt;data, packet-&gt;length, false);
bs.IgnoreBytes(sizeof(MessageID));
RakNetGUID endpointGuid;
bs.Read(endpointGuid);
unsigned short sourceToDestPort;
bs.Read(sourceToDestPort);
char ipAddressString[32];
packet-&gt;systemAddress.ToString(false, ipAddressString);
rakPeerInterface-&gt;Connect(ipAddressString, sourceToDestPort, 0,0);
</member>
<member name="F:ID_ROUTER_2_REROUTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="362">
The IP address for a forwarded connection has changed
Read endpointGuid and port as per ID_ROUTER_2_FORWARDING_ESTABLISHED
</member>
<member name="F:ID_TEAM_BALANCER_INTERNAL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="366">
\internal Used by the team balancer plugin
</member>
<member name="F:ID_TEAM_BALANCER_REQUESTED_TEAM_FULL" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="368">
Cannot switch to the desired team because it is full. However, if someone on that team leaves, you will
 get ID_TEAM_BALANCER_TEAM_ASSIGNED later.
For TeamBalancer: Byte 1 contains the team you requested to join. Following bytes contain NetworkID of which member
</member>
<member name="F:ID_TEAM_BALANCER_REQUESTED_TEAM_LOCKED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="372">
Cannot switch to the desired team because all teams are locked. However, if someone on that team leaves,
 you will get ID_TEAM_BALANCER_SET_TEAM later.
For TeamBalancer: Byte 1 contains the team you requested to join.
</member>
<member name="F:ID_TEAM_BALANCER_TEAM_ASSIGNED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="377">
Team balancer plugin informing you of your team. Byte 1 contains the team you requested to join. Following bytes contain NetworkID of which member.
</member>
<member name="F:ID_LIGHTSPEED_INTEGRATION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="380">
Gamebryo Lightspeed integration
</member>
<member name="F:ID_XBOX_LOBBY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="383">
XBOX integration
</member>
<member name="F:ID_TWO_WAY_AUTHENTICATION_INCOMING_CHALLENGE_SUCCESS" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="386">
The password we used to challenge the other system passed, meaning the other system has called TwoWayAuthentication::AddPassword() with the same password we passed to TwoWayAuthentication::Challenge()
You can read the identifier used to challenge as follows:
RakNet::BitStream bs(packet-&gt;data, packet-&gt;length, false); bs.IgnoreBytes(sizeof(RakNet::MessageID)); RakNet::RakString password; bs.Read(password);
</member>
<member name="F:ID_TWO_WAY_AUTHENTICATION_INCOMING_CHALLENGE_FAILURE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="391">
A remote system sent us a challenge using TwoWayAuthentication::Challenge(), and the challenge failed.
If the other system must pass the challenge to stay connected, you should call RakPeer::CloseConnection() to terminate the connection to the other system. 
</member>
<member name="F:ID_TWO_WAY_AUTHENTICATION_OUTGOING_CHALLENGE_FAILURE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="394">
The other system did not add the password we used to TwoWayAuthentication::AddPassword()
You can read the identifier used to challenge as follows:
RakNet::BitStream bs(packet-&gt;data, packet-&gt;length, false); bs.IgnoreBytes(sizeof(MessageID)); RakNet::RakString password; bs.Read(password);
</member>
<member name="F:ID_TWO_WAY_AUTHENTICATION_OUTGOING_CHALLENGE_TIMEOUT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="398">
The other system did not respond within a timeout threshhold. Either the other system is not running the plugin or the other system was blocking on some operation for a long time.
You can read the identifier used to challenge as follows:
RakNet::BitStream bs(packet-&gt;data, packet-&gt;length, false); bs.IgnoreBytes(sizeof(MessageID)); RakNet::RakString password; bs.Read(password);
</member>
<member name="F:ID_TWO_WAY_AUTHENTICATION_NEGOTIATION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="402">
\internal
</member>
<member name="F:ID_CLOUD_POST_REQUEST" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="405">
CloudClient / CloudServer
</member>
<member name="T:DefaultMessageIDTypes" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\messageidentifiers.h" line="39">
You should not edit the file MessageIdentifiers.h as it is a part of RakNet static library
To define your own message id, define an enum following the code example that follows. 

\code
enum {
  ID_MYPROJECT_MSG_1 = ID_USER_PACKET_ENUM,
  ID_MYPROJECT_MSG_2, 
   ... 
};
\endcode 

\note All these enumerations should be casted to (unsigned char) before writing them to RakNet::BitStream
</member>
<member name="F:IMMEDIATE_PRIORITY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="23">
The highest possible priority. These message trigger sends immediately, and are generally not buffered or aggregated into a single datagram.
</member>
<member name="F:HIGH_PRIORITY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="26">
For every 2 IMMEDIATE_PRIORITY messages, 1 HIGH_PRIORITY will be sent.
Messages at this priority and lower are buffered to be sent in groups at 10 millisecond intervals to reduce UDP overhead and better measure congestion control. 
</member>
<member name="F:MEDIUM_PRIORITY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="30">
For every 2 HIGH_PRIORITY messages, 1 MEDIUM_PRIORITY will be sent.
Messages at this priority and lower are buffered to be sent in groups at 10 millisecond intervals to reduce UDP overhead and better measure congestion control. 
</member>
<member name="F:LOW_PRIORITY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="34">
For every 2 MEDIUM_PRIORITY messages, 1 LOW_PRIORITY will be sent.
Messages at this priority and lower are buffered to be sent in groups at 10 millisecond intervals to reduce UDP overhead and better measure congestion control. 
</member>
<member name="F:NUMBER_OF_PRIORITIES" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="38">
\internal
</member>
<member name="T:PacketPriority" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="11">
\file
\brief An interface for RakPeer.  Simply contains all user functions as pure virtuals.

\file
\brief This file contains enumerations for packet priority and reliability enumerations.

These enumerations are used to describe when packets are delivered.
</member>
<member name="F:UNRELIABLE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="48">
Same as regular UDP, except that it will also discard duplicate datagrams.  RakNet adds (6 to 17) + 21 bits of overhead, 16 of which is used to detect duplicate packets and 6 to 17 of which is used for message length.
</member>
<member name="F:UNRELIABLE_SEQUENCED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="51">
Regular UDP with a sequence counter.  Out of order messages will be discarded.
Sequenced and ordered messages sent on the same channel will arrive in the order sent.
</member>
<member name="F:RELIABLE" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="55">
The message is sent reliably, but not necessarily in any order.  Same overhead as UNRELIABLE.
</member>
<member name="F:RELIABLE_ORDERED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="58">
This message is reliable and will arrive in the order you sent it.  Messages will be delayed while waiting for out of order messages.  Same overhead as UNRELIABLE_SEQUENCED.
Sequenced and ordered messages sent on the same channel will arrive in the order sent.
</member>
<member name="F:RELIABLE_SEQUENCED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="62">
This message is reliable and will arrive in the sequence you sent it.  Out or order messages will be dropped.  Same overhead as UNRELIABLE_SEQUENCED.
Sequenced and ordered messages sent on the same channel will arrive in the order sent.
</member>
<member name="F:UNRELIABLE_WITH_ACK_RECEIPT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="66">
Same as UNRELIABLE, however the user will get either ID_SND_RECEIPT_ACKED or ID_SND_RECEIPT_LOSS based on the result of sending this message when calling RakPeerInterface::Receive(). Bytes 1-4 will contain the number returned from the Send() function. On disconnect or shutdown, all messages not previously acked should be considered lost.
</member>
<member name="F:RELIABLE_WITH_ACK_RECEIPT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="69">
Same as UNRELIABLE_SEQUENCED, however the user will get either ID_SND_RECEIPT_ACKED or ID_SND_RECEIPT_LOSS based on the result of sending this message when calling RakPeerInterface::Receive(). Bytes 1-4 will contain the number returned from the Send() function. On disconnect or shutdown, all messages not previously acked should be considered lost.
05/04/10 You can't have sequenced and ack receipts, because you don't know if the other system discarded the message, meaning you don't know if the message was processed
Same as RELIABLE. The user will also get ID_SND_RECEIPT_ACKED after the message is delivered when calling RakPeerInterface::Receive(). ID_SND_RECEIPT_ACKED is returned when the message arrives, not necessarily the order when it was sent. Bytes 1-4 will contain the number returned from the Send() function. On disconnect or shutdown, all messages not previously acked should be considered lost. This does not return ID_SND_RECEIPT_LOSS.
</member>
<member name="F:RELIABLE_ORDERED_WITH_ACK_RECEIPT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="76">
Same as RELIABLE_ORDERED_ACK_RECEIPT. The user will also get ID_SND_RECEIPT_ACKED after the message is delivered when calling RakPeerInterface::Receive(). ID_SND_RECEIPT_ACKED is returned when the message arrives, not necessarily the order when it was sent. Bytes 1-4 will contain the number returned from the Send() function. On disconnect or shutdown, all messages not previously acked should be considered lost. This does not return ID_SND_RECEIPT_LOSS.
</member>
<member name="F:NUMBER_OF_RELIABILITIES" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="79">
Same as RELIABLE_SEQUENCED. The user will also get ID_SND_RECEIPT_ACKED after the message is delivered when calling RakPeerInterface::Receive(). Bytes 1-4 will contain the number returned from the Send() function. On disconnect or shutdown, all messages not previously acked should be considered lost.
05/04/10 You can't have sequenced and ack receipts, because you don't know if the other system discarded the message, meaning you don't know if the message was processed
\internal
</member>
<member name="T:PacketReliability" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\packetpriority.h" line="42">
These enumerations are used to describe how packets are delivered.
\note  Note to self: I write this with 3 bits in the stream.  If I add more remember to change that
\note In ReliabilityLayer::WriteToBitStreamFromInternalPacket I assume there are 5 major types
\note Do not reorder, I check on &gt;= UNRELIABLE_WITH_ACK_RECEIPT
</member>
<member name="D:uint8_t" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="11">
\file
\brief Types used by RakNet, most of which involve user code.

Define __GET_TIME_64BIT to have RakNet::TimeMS use a 64, rather than 32 bit value.  A 32 bit value will overflow after about 5 weeks.
However, this doubles the bandwidth use for sending times, so don't do it unless you have a reason to.
Comment out if you are using the iPod Touch TG. See http://www.jenkinssoftware.com/forum/index.php?topic=2717.0
This must be the same on all systems, or they won't connect
Define __BITSTREAM_NATIVE_END to NOT support endian swapping in the BitStream class.  This is faster and is what you should use
unless you actually plan to have different endianness systems connect to each other
Enabled by default.
Maximum (stack) size to use with _alloca before using new and delete instead.
Uncomment to use RakMemoryOverride for custom memory tracking
See RakMemoryOverride.h. 
If defined, OpenSSL is enabled for the class TCPInterface
This is necessary to use the SendEmail class with Google POP servers
Note that OpenSSL carries its own license restrictions that you should be aware of. If you don't agree, don't enable this define
This also requires that you enable header search paths to DependentExtensions\openssl-1.0.0d
Threshold at which to do a malloc / free rather than pushing data onto a fixed stack for the bitstream class
Arbitrary size, just picking something likely to be larger than most packets
This controls the amount of memory used per connection.
This many datagrams are tracked by datagramNumber. If more than this many datagrams are sent, then an ack for an older datagram would be ignored
This results in an unnecessary resend in that case
This is the maximum number of reliable user messages that can be on the wire at a time
If this is too low, then high ping connections with a large throughput will be underutilized
This will be evident because RakNetStatistics::messagesInSend buffer will increase over time, yet at the same time the outgoing bandwidth per second is less than your connection supports
Uncomment if you want to link in the DLMalloc library to use with RakMemoryOverride
Workaround for http://support.microsoft.com/kb/274323
If two calls between RakNet::GetTime() happen farther apart than this time in microseconds, this delta will be returned instead
Note: This will cause ID_TIMESTAMP to be temporarily inaccurate if you set a breakpoint that pauses the UpdateNetworkLoop() thread in RakPeer
Define in RakNetDefinesOverrides.h to enable (non-zero) or disable (0)
</member>
<member name="T:RakNet.RakPeerInterface" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="36">
Forward declarations
</member>
<member name="F:IS_PENDING" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="71">
Connect() was called, but the process hasn't started yet
</member>
<member name="F:IS_CONNECTING" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="73">
Processing the connection attempt
</member>
<member name="F:IS_CONNECTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="75">
Is connected and able to communicate
</member>
<member name="F:IS_DISCONNECTING" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="77">
Was connected, but will disconnect as soon as the remaining messages are delivered
</member>
<member name="F:IS_SILENTLY_DISCONNECTING" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="79">
A connection attempt failed and will be aborted
</member>
<member name="F:IS_DISCONNECTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="81">
No longer connected
</member>
<member name="F:IS_NOT_CONNECTED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="83">
Was never connected, or else was disconnected long enough ago that the entry has been discarded
</member>
<member name="T:RakNet.ConnectionState" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="68">
Returned from RakPeerInterface::GetConnectionState()
</member>
<member name="D:RakNet.UniqueIDType" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="87">
Given a number of bits, return how many bytes are needed to represent that.
\sa NetworkIDObject.h
</member>
<member name="D:RakNet.MessageID" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="98">
First byte of a network message
</member>
<member name="F:PKM_INSECURE_CONNECTION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="112">
The connection is insecure. You can also just pass 0 for the pointer to PublicKey in RakPeerInterface::Connect()
</member>
<member name="F:PKM_ACCEPT_ANY_PUBLIC_KEY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="115">
Accept whatever public key the server gives us. This is vulnerable to man in the middle, but does not require
distribution of the public key in advance of connecting.
</member>
<member name="F:PKM_USE_KNOWN_PUBLIC_KEY" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="119">
Use a known remote server public key. PublicKey::remoteServerPublicKey must be non-zero.
This is the recommended mode for secure connections.
</member>
<member name="F:PKM_USE_TWO_WAY_AUTHENTICATION" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="123">
Use a known remote server public key AND provide a public key for the connecting client.
PublicKey::remoteServerPublicKey, myPublicKey and myPrivateKey must be all be non-zero.
The server must cooperate for this mode to work.
I recommend not using this mode except for server-to-server communication as it significantly increases the CPU requirements during connections for both sides.
Furthermore, when it is used, a connection password should be used as well to avoid DoS attacks.
</member>
<member name="T:RakNet.PublicKeyMode" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="109">
Used with the PublicKey structure
</member>
<member name="T:RakNet.PublicKey" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="131">
Passed to RakPeerInterface::Connect()
</member>
<member name="F:RakNet.PublicKey.publicKeyMode" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="134">
How to interpret the public key, see above
</member>
<member name="F:RakNet.PublicKey.remoteServerPublicKey" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="137">
Pointer to a public key of length cat::EasyHandshake::PUBLIC_KEY_BYTES. See the Encryption sample.
</member>
<member name="F:RakNet.PublicKey.myPublicKey" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="140">
(Optional) Pointer to a public key of length cat::EasyHandshake::PUBLIC_KEY_BYTES
</member>
<member name="F:RakNet.PublicKey.myPrivateKey" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="143">
(Optional) Pointer to a private key of length cat::EasyHandshake::PRIVATE_KEY_BYTES
</member>
<member name="T:RakNet.SocketDescriptor" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="147">
Describes the local socket to use for RakPeer::Startup
</member>
<member name="F:RakNet.SocketDescriptor.port" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="153">
The local port to bind to.  Pass 0 to have the OS autoassign a port.
</member>
<member name="F:RakNet.SocketDescriptor.hostAddress" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="156">
The local network card address to bind to, such as "127.0.0.1".  Pass an empty string to use INADDR_ANY.
</member>
<member name="F:RakNet.SocketDescriptor.socketFamily" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="159">
IP version: For IPV4, use AF_INET (default). For IPV6, use AF_INET6. To autoselect, use AF_UNSPEC.
IPV6 is the newer internet protocol. Instead of addresses such as natpunch.jenkinssoftware.com, you may have an address such as fe80::7c:31f7:fec4:27de%14.
Encoding takes 16 bytes instead of 4, so IPV6 is less efficient for bandwidth.
On the positive side, NAT Punchthrough is not needed and should not be used with IPV6 because there are enough addresses that routers do not need to create address mappings.
RakPeer::Startup() will fail if this IP version is not supported.
\pre RAKNET_SUPPORT_IPV6 must be set to 1 in RakNetDefines.h for AF_INET6
</member>
<member name="F:RakNet.SocketDescriptor.extraSocketOptions" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="183">
XBOX only: set IPPROTO_VDP if you want to use VDP. If enabled, this socket does not support broadcast to 255.255.255.255
</member>
<!-- Discarding badly formed XML document comment for member 'T:RakNet.SystemAddress'. -->
<member name="M:RakNet.SystemAddress.#ctor" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="196">
Constructors
</member>
<member name="F:RakNet.SystemAddress.debugPort" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="221">
This is not used internally, but holds a copy of the port held in the address union, so for debugging it's easier to check what port is being held
</member>
<member name="M:RakNet.SystemAddress.size" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="224">
\internal Return the size to write to a bitStream
</member>
<member name="M:RakNet.SystemAddress.ToInteger(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="227">
Hash the system address
</member>
<member name="M:RakNet.SystemAddress.GetIPVersion" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="230">
Return the IP version, either IPV4 or IPV6
\return Either 4 or 6
</member>
<member name="M:RakNet.SystemAddress.GetIPPROTO" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="234">
\internal Returns either IPPROTO_IP or IPPROTO_IPV6
\sa GetIPVersion
</member>
<member name="M:RakNet.SystemAddress.SetToLoopback" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="238">
Call SetToLoopback(), with whatever IP version is currently held. Defaults to IPV4
</member>
<member name="M:RakNet.SystemAddress.SetToLoopback(System.Byte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="241">
Call SetToLoopback() with a specific IP version
\param[in] ipVersion Either 4 for IPV4 or 6 for IPV6
</member>
<member name="M:RakNet.SystemAddress.IsLoopback" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="245">
\return If was set to 127.0.0.1 or ::1
</member>
<member name="M:RakNet.SystemAddress.FromString(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,System.Int32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="260">
Set the system address from a printable IP string, for example "192.0.2.1" or "2001:db8:63b3:1::3490"
You can write the port as well, using the portDelineator, for example "192.0.2.1|1234"
\param[in] str A printable IP string, for example "192.0.2.1" or "2001:db8:63b3:1::3490". Pass 0 for \a str to set to UNASSIGNED_SYSTEM_ADDRESS
\param[in] portDelineator if \a str contains a port, delineate the port with this character. portDelineator should not be '.', ':', '%', '-', '/', a number, or a-f
\param[in] ipVersion Only used if str is a pre-defined address in the wrong format, such as 127.0.0.1 but you want ip version 6, so you can pass 6 here to do the conversion
\note The current port is unchanged if a port is not specified in \a str
\return True on success, false on ipVersion does not match type of passed string
</member>
<member name="M:RakNet.SystemAddress.FromStringExplicitPort(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.Int32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="269">
Same as FromString(), but you explicitly set a port at the same time
</member>
<member name="M:RakNet.SystemAddress.CopyPort(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="272">
Copy the port from another SystemAddress structure
</member>
<member name="M:RakNet.SystemAddress.EqualsExcludingPort(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="275">
Returns if two system addresses have the same IP (port is not checked)
</member>
<member name="M:RakNet.SystemAddress.GetPort" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="278">
Returns the port in host order (this is what you normally use)
</member>
<member name="M:RakNet.SystemAddress.GetPortNetworkOrder" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="281">
\internal Returns the port in network order
</member>
<member name="M:RakNet.SystemAddress.SetPortHostOrder(System.UInt16)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="284">
Sets the port. The port value should be in host order (this is what you normally use)
Renamed from SetPort because of winspool.h http://edn.embarcadero.com/article/21494
</member>
<member name="M:RakNet.SystemAddress.SetPortNetworkOrder(System.UInt16)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="288">
\internal Sets the port. The port value should already be in network order.
</member>
<member name="M:RakNet.SystemAddress.SetBinaryAddress(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="291">
Old version, for crap platforms that don't support newer socket functions
</member>
<member name="M:RakNet.SystemAddress.ToString_Old(System.Boolean,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="293">
Old version, for crap platforms that don't support newer socket functions
</member>
<member name="M:RakNet.SystemAddress.FixForIPVersion(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="296">
\internal sockaddr_in6 requires extra data beyond just the IP and port. Copy that extra data from an existing SystemAddress that already has it
</member>
<member name="F:RakNet.SystemAddress.systemIndex" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="307">
\internal Used internally for fast lookup. Optional (use -1 to do regular lookup). Don't transmit this.
</member>
<member name="T:RakNet.RakNetGUID" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="317">
Uniquely identifies an instance of RakPeer. Use RakPeer::GetGuidFromSystemAddress() and RakPeer::GetSystemAddressFromGuid() to go between SystemAddress and RakNetGUID
Use RakPeer::GetGuidFromSystemAddress(UNASSIGNED_SYSTEM_ADDRESS) to get your own GUID
</member>
<member name="F:RakNet.UNASSIGNED_SYSTEM_ADDRESS" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="357">
Index of an invalid SystemAddress
</member>
<member name="T:RakNet.Packet" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="427">
This represents a user message from another system.
</member>
<member name="F:RakNet.Packet.systemAddress" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="430">
The system that send this packet.
</member>
<member name="F:RakNet.Packet.guid" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="433">
A unique identifier for the system that sent this packet, regardless of IP address (internal / external / remote system)
Only valid once a connection has been established (ID_CONNECTION_REQUEST_ACCEPTED, or ID_NEW_INCOMING_CONNECTION)
Until that time, will be UNASSIGNED_RAKNET_GUID
</member>
<member name="F:RakNet.Packet.length" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="438">
The length of the data in bytes
</member>
<member name="F:RakNet.Packet.bitSize" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="441">
The length of the data in bits
</member>
<member name="F:RakNet.Packet.data" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="444">
The data from the sender
</member>
<member name="F:RakNet.Packet.deleteData" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="447">
@internal
Indicates whether to delete the data, or to simply delete the packet.
</member>
<member name="F:RakNet.Packet.wasGeneratedLocally" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknettypes.h" line="451">
@internal
If true, this message is meant for the user, not for the plugins, so do not process it through plugins
</member>
<member name="T:RakNet.RakThread" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakthread.h" line="36">
To define a thread, use RAK_THREAD_DECLARATION(functionName);
</member>
<member name="M:RakNet.RakThread.Create(=FUNC:System.UInt32(System.Void*),System.Void*,System.Int32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakthread.h" line="56">
Create a thread, simplified to be cross platform without all the extra junk
To then start that thread, call RakCreateThread(functionName, arguments);
\param[in] start_address Function you want to call
\param[in] arglist Arguments to pass to the function
\return 0=success. &gt;0 = error code
</member>
<member name="T:RakNet.SimpleMutex" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\simplemutex.h" line="36">
\brief An easy to use mutex.

I wrote this because the version that comes with Windows is too complicated and requires too much code to use.
@remark Previously I used this everywhere, and in fact for a year or two RakNet was totally threadsafe.  While doing profiling, I saw that this function was incredibly slow compared to the blazing performance of everything else, so switched to single producer / consumer everywhere.  Now the user thread of RakNet is not threadsafe, but it's 100X faster than before.
</member>
<member name="M:RakNet.SocketLayerOverride.RakNetSendTo(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32,RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetsocket2.h" line="408">
Called when SendTo would otherwise occur.
</member>
<member name="M:RakNet.SocketLayerOverride.RakNetRecvFrom(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,RakNet.SystemAddress*,System.Boolean)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetsocket2.h" line="411">
Called when RecvFrom would otherwise occur. Return number of bytes read. Write data into dataOut
</member>
<member name="T:RakNet.RakPeerInterface" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="39">
The primary interface for RakNet, RakPeer contains all major functions for the library.
See the individual functions for what the class can do.
\brief The main interface for network communications
</member>
<member name="M:RakNet.RakPeerInterface.Dispose" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="48">
Destructor
</member>
<!-- Discarding badly formed XML document comment for member 'M:RakNet.RakPeerInterface.Startup(System.UInt32,RakNet.SocketDescriptor*,System.UInt32,System.Int32)'. -->
<member name="M:RakNet.RakPeerInterface.InitializeSecurity(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Boolean)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="66">
If you accept connections, you must call this or else security will not be enabled for incoming connections.
This feature requires more round trips, bandwidth, and CPU time for the connection handshake
x64 builds require under 25% of the CPU time of other builds
See the Encryption sample for example usage
\pre Must be called while offline
\pre LIBCAT_SECURITY must be defined to 1 in NativeFeatureIncludes.h for this function to have any effect
\param[in] publicKey A pointer to the public key for accepting new connections
\param[in] privateKey A pointer to the private key for accepting new connections
\param[in] bRequireClientKey: Should be set to false for most servers.  Allows the server to accept a public key from connecting clients as a proof of identity but eats twice as much CPU time as a normal connection
</member>
<member name="M:RakNet.RakPeerInterface.DisableSecurity" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="77">
Disables security for incoming connections.
\note Must be called while offline
</member>
<member name="M:RakNet.RakPeerInterface.AddToSecurityExceptionList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="81">
If secure connections are on, do not use secure connections for a specific IP address.
This is useful if you have a fixed-address internal server behind a LAN.
\note Secure connections are determined by the recipient of an incoming connection. This has no effect if called on the system attempting to connect.
\param[in] ip IP address to add. * wildcards are supported.
</member>
<member name="M:RakNet.RakPeerInterface.RemoveFromSecurityExceptionList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="87">
Remove a specific connection previously added via AddToSecurityExceptionList
\param[in] ip IP address to remove. Pass 0 to remove all IP addresses. * wildcards are supported.
</member>
<member name="M:RakNet.RakPeerInterface.IsInSecurityExceptionList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="91">
Checks to see if a given IP is in the security exception list
\param[in] IP address to check.
</member>
<member name="M:RakNet.RakPeerInterface.SetMaximumIncomingConnections(System.UInt16)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="95">
Sets how many incoming connections are allowed. If this is less than the number of players currently connected,
no more players will be allowed to connect.  If this is greater than the maximum number of peers allowed,
it will be reduced to the maximum number of peers allowed.
Defaults to 0, meaning by default, nobody can connect to you
\param[in] numberAllowed Maximum number of incoming connections allowed.
</member>
<!-- Discarding badly formed XML document comment for member 'M:RakNet.RakPeerInterface.GetMaximumIncomingConnections'. -->
<member name="M:RakNet.RakPeerInterface.NumberOfConnections" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="106">
Returns how many open connections there are at this time
\return the number of open connections
</member>
<member name="M:RakNet.RakPeerInterface.SetIncomingPassword(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="110">
Sets the password incoming connections must match in the call to Connect (defaults to none). Pass 0 to passwordData to specify no password
This is a way to set a low level password for all incoming connections.  To selectively reject connections, implement your own scheme using CloseConnection() to remove unwanted connections
\param[in] passwordData A data block that incoming connections must match.  This can be just a password, or can be a stream of data. Specify 0 for no password data
\param[in] passwordDataLength The length in bytes of passwordData
</member>
<member name="M:RakNet.RakPeerInterface.GetIncomingPassword(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.Int32*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="116">
Gets the password passed to SetIncomingPassword
\param[out] passwordData  Should point to a block large enough to hold the password data you passed to SetIncomingPassword()
\param[in,out] passwordDataLength Maximum size of the array passwordData.  Modified to hold the number of bytes actually written
</member>
<member name="M:RakNet.RakPeerInterface.Connect(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32,RakNet.PublicKey*,System.UInt32,System.UInt32,System.UInt32,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="121">
\brief Connect to the specified host (ip or domain name) and server port.
Calling Connect and not calling SetMaximumIncomingConnections acts as a dedicated client.
Calling both acts as a true peer. This is a non-blocking connection.
You know the connection is successful when GetConnectionState() returns IS_CONNECTED or Receive() gets a message with the type identifier ID_CONNECTION_REQUEST_ACCEPTED.
If the connection is not successful, such as a rejected connection or no response then neither of these things will happen.
\pre Requires that you first call Startup()
\param[in] host Either a dotted IP address or a domain name
\param[in] remotePort Which port to connect to on the remote machine.
\param[in] passwordData A data block that must match the data block on the server passed to SetIncomingPassword.  This can be a string or can be a stream of data.  Use 0 for no password.
\param[in] passwordDataLength The length in bytes of passwordData
\param[in] publicKey The public key the server is using. If 0, the server is not using security. If non-zero, the publicKeyMode member determines how to connect
\param[in] connectionSocketIndex Index into the array of socket descriptors passed to socketDescriptors in RakPeer::Startup() to send on.
\param[in] sendConnectionAttemptCount How many datagrams to send to the other system to try to connect.
\param[in] timeBetweenSendConnectionAttemptsMS Time to elapse before a datagram is sent to the other system to try to connect. After sendConnectionAttemptCount number of attempts, ID_CONNECTION_ATTEMPT_FAILED is returned. Under low bandwidth conditions with multiple simultaneous outgoing connections, this value should be raised to 1000 or higher, or else the MTU detection can overrun the available bandwidth.
\param[in] timeoutTime How long to keep the connection alive before dropping it on unable to send a reliable message. 0 to use the default from SetTimeoutTime(UNASSIGNED_SYSTEM_ADDRESS);
\return CONNECTION_ATTEMPT_STARTED on successful initiation. Otherwise, an appropriate enumeration indicating failure.
\note CONNECTION_ATTEMPT_STARTED does not mean you are already connected!
\note It is possible to immediately get back ID_CONNECTION_ATTEMPT_FAILED if you exceed the maxConnections parameter passed to Startup(). This could happen if you call CloseConnection() with sendDisconnectionNotificaiton true, then immediately call Connect() before the connection has closed.
</member>
<member name="M:RakNet.RakPeerInterface.ConnectWithSocket(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32,RakNet.RakNetSocket2*,RakNet.PublicKey*,System.UInt32,System.UInt32,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="141">
\brief Connect to the specified host (ip or domain name) and server port, using a shared socket from another instance of RakNet
\param[in] host Either a dotted IP address or a domain name
\param[in] remotePort Which port to connect to on the remote machine.
\param[in] passwordData A data block that must match the data block on the server passed to SetIncomingPassword.  This can be a string or can be a stream of data.  Use 0 for no password.
\param[in] passwordDataLength The length in bytes of passwordData
\param[in] socket A bound socket returned by another instance of RakPeerInterface
\param[in] sendConnectionAttemptCount How many datagrams to send to the other system to try to connect.
\param[in] timeBetweenSendConnectionAttemptsMS Time to elapse before a datagram is sent to the other system to try to connect. After sendConnectionAttemptCount number of attempts, ID_CONNECTION_ATTEMPT_FAILED is returned. Under low bandwidth conditions with multiple simultaneous outgoing connections, this value should be raised to 1000 or higher, or else the MTU detection can overrun the available bandwidth.
\param[in] timeoutTime How long to keep the connection alive before dropping it on unable to send a reliable message. 0 to use the default from SetTimeoutTime(UNASSIGNED_SYSTEM_ADDRESS);
\return CONNECTION_ATTEMPT_STARTED on successful initiation. Otherwise, an appropriate enumeration indicating failure.
\note CONNECTION_ATTEMPT_STARTED does not mean you are already connected!
</member>
<member name="M:RakNet.RakPeerInterface.Shutdown(System.UInt32,System.Byte,PacketPriority)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="154">
\brief Connect to the specified network ID (Platform specific console function)
\details Does built-in NAt traversal
\param[in] passwordData A data block that must match the data block on the server passed to SetIncomingPassword.  This can be a string or can be a stream of data.  Use 0 for no password.
\param[in] passwordDataLength The length in bytes of passwordData
\brief Stops the network threads and closes all connections.
\param[in] blockDuration How long, in milliseconds, you should wait for all remaining messages to go out, including ID_DISCONNECTION_NOTIFICATION.  If 0, it doesn't wait at all.
\param[in] orderingChannel If blockDuration &gt; 0, ID_DISCONNECTION_NOTIFICATION will be sent on this channel
\param[in] disconnectionNotificationPriority Priority to send ID_DISCONNECTION_NOTIFICATION on.
If you set it to 0 then the disconnection notification won't be sent
</member>
<member name="M:RakNet.RakPeerInterface.IsActive" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="167">
Returns if the network thread is running
\return true if the network thread is running, false otherwise
</member>
<member name="M:RakNet.RakPeerInterface.GetConnectionList(RakNet.SystemAddress*,System.UInt16*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="171">
Fills the array remoteSystems with the SystemAddress of all the systems we are connected to
\param[out] remoteSystems An array of SystemAddress structures to be filled with the SystemAddresss of the systems we are connected to. Pass 0 to remoteSystems to only get the number of systems we are connected to
\param[in, out] numberOfSystems As input, the size of remoteSystems array.  As output, the number of elements put into the array 
</member>
<member name="M:RakNet.RakPeerInterface.GetNextSendReceipt" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="176">
Returns the next uint32_t that Send() will return
\note If using RakPeer from multiple threads, this may not be accurate for your thread. Use IncrementNextSendReceipt() in that case.
\return The next uint32_t that Send() or SendList will return
</member>
<member name="M:RakNet.RakPeerInterface.IncrementNextSendReceipt" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="181">
Returns the next uint32_t that Send() will return, and increments the value by one
\note If using RakPeer from multiple threads, pass this to forceReceipt in the send function
\return The next uint32_t that Send() or SendList will return
</member>
<member name="M:RakNet.RakPeerInterface.Send(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32!System.Runtime.CompilerServices.IsConst,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst,System.Boolean,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="186">
Sends a block of data to the specified system that you are connected to.
This function only works while connected
The first byte should be a message identifier starting at ID_USER_PACKET_ENUM
\param[in] data The block of data to send
\param[in] length The size in bytes of the data to send
\param[in] priority What priority level to send on.  See PacketPriority.h
\param[in] reliability How reliability to send this data.  See PacketPriority.h
\param[in] orderingChannel When using ordered or sequenced messages, what channel to order these on. Messages are only ordered relative to other messages on the same stream
\param[in] systemIdentifier Who to send this packet to, or in the case of broadcasting who not to send it to.  Pass either a SystemAddress structure or a RakNetGUID structure. Use UNASSIGNED_SYSTEM_ADDRESS or to specify none
\param[in] broadcast True to send this packet to all connected systems. If true, then systemAddress specifies who not to send the packet to.
\param[in] forceReceipt If 0, will automatically determine the receipt number to return. If non-zero, will return what you give it.
\return 0 on bad input. Otherwise a number that identifies this message. If \a reliability is a type that returns a receipt, on a later call to Receive() you will get ID_SND_RECEIPT_ACKED or ID_SND_RECEIPT_LOSS with bytes 1-4 inclusive containing this number
</member>
<member name="M:RakNet.RakPeerInterface.SendLoopback(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="200">
"Send" to yourself rather than a remote system. The message will be processed through the plugins and returned to the game as usual
This function works anytime
The first byte should be a message identifier starting at ID_USER_PACKET_ENUM
\param[in] data The block of data to send
\param[in] length The size in bytes of the data to send
</member>
<member name="M:RakNet.RakPeerInterface.Send(RakNet.BitStream!System.Runtime.CompilerServices.IsConst*,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst,System.Boolean,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="207">
Sends a block of data to the specified system that you are connected to.  Same as the above version, but takes a BitStream as input.
\param[in] bitStream The bitstream to send
\param[in] priority What priority level to send on.  See PacketPriority.h
\param[in] reliability How reliability to send this data.  See PacketPriority.h
\param[in] orderingChannel When using ordered or sequenced messages, what channel to order these on. Messages are only ordered relative to other messages on the same stream
\param[in] systemIdentifier Who to send this packet to, or in the case of broadcasting who not to send it to. Pass either a SystemAddress structure or a RakNetGUID structure. Use UNASSIGNED_SYSTEM_ADDRESS or to specify none
\param[in] broadcast True to send this packet to all connected systems. If true, then systemAddress specifies who not to send the packet to.
\param[in] forceReceipt If 0, will automatically determine the receipt number to return. If non-zero, will return what you give it.
\return 0 on bad input. Otherwise a number that identifies this message. If \a reliability is a type that returns a receipt, on a later call to Receive() you will get ID_SND_RECEIPT_ACKED or ID_SND_RECEIPT_LOSS with bytes 1-4 inclusive containing this number
\note COMMON MISTAKE: When writing the first byte, bitStream-&gt;Write((unsigned char) ID_MY_TYPE) be sure it is casted to a byte, and you are not writing a 4 byte enumeration.
</member>
<!-- Discarding badly formed XML document comment for member 'M:RakNet.RakPeerInterface.SendList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst**,System.Int32!System.Runtime.CompilerServices.IsConst*,System.Int32!System.Runtime.CompilerServices.IsConst,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst,System.Boolean,System.UInt32)'. -->
<member name="M:RakNet.RakPeerInterface.Receive" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="241">
Gets a message from the incoming message queue.
Use DeallocatePacket() to deallocate the message after you are done with it.
User-thread functions, such as RPC calls and the plugin function PluginInterface::Update occur here.
\return 0 if no packets are waiting to be handled, otherwise a pointer to a packet.
\note COMMON MISTAKE: Be sure to call this in a loop, once per game tick, until it returns 0. If you only process one packet per game tick they will buffer up.
sa RakNetTypes.h contains struct Packet
</member>
<member name="M:RakNet.RakPeerInterface.DeallocatePacket(RakNet.Packet*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="249">
Call this to deallocate a message returned by Receive() when you are done handling it.
\param[in] packet The message to deallocate.	
</member>
<member name="M:RakNet.RakPeerInterface.GetMaximumNumberOfPeers" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="253">
Return the total number of connections we are allowed
</member>
<member name="M:RakNet.RakPeerInterface.CloseConnection(RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst,System.Boolean,System.Byte,PacketPriority)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="257">
Close the connection to another host (if we initiated the connection it will disconnect, if they did it will kick them out).
\param[in] target Which system to close the connection to.
\param[in] sendDisconnectionNotification True to send ID_DISCONNECTION_NOTIFICATION to the recipient.  False to close it silently.
\param[in] channel Which ordering channel to send the disconnection notification on, if any
\param[in] disconnectionNotificationPriority Priority to send ID_DISCONNECTION_NOTIFICATION on.
</member>
<member name="M:RakNet.RakPeerInterface.GetConnectionState(RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="264">
Returns if a system is connected, disconnected, connecting in progress, or various other states
\param[in] systemIdentifier The system we are referring to
\note This locks a mutex, do not call too frequently during connection attempts or the attempt will take longer and possibly even timeout
\return What state the remote system is in
</member>
<member name="M:RakNet.RakPeerInterface.CancelConnectionAttempt(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="270">
Cancel a pending connection attempt
If we are already connected, the connection stays open
\param[in] target Which system to cancel
</member>
<member name="M:RakNet.RakPeerInterface.GetIndexFromSystemAddress(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="275">
Given a systemAddress, returns an index from 0 to the maximum number of players allowed - 1.
\param[in] systemAddress The SystemAddress we are referring to
\return The index of this SystemAddress or -1 on system not found.
</member>
<member name="M:RakNet.RakPeerInterface.GetSystemAddressFromIndex(System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="280">
This function is only useful for looping through all systems
Given an index, will return a SystemAddress.
\param[in] index Index should range between 0 and the maximum number of players allowed - 1.
\return The SystemAddress
</member>
<member name="M:RakNet.RakPeerInterface.GetGUIDFromIndex(System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="286">
Same as GetSystemAddressFromIndex but returns RakNetGUID
\param[in] index Index should range between 0 and the maximum number of players allowed - 1.
\return The RakNetGUID
</member>
<member name="M:RakNet.RakPeerInterface.GetSystemList(DataStructures.List&lt;RakNet.SystemAddress&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,DataStructures.List&lt;RakNet.RakNetGUID&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="291">
Same as calling GetSystemAddressFromIndex and GetGUIDFromIndex for all systems, but more efficient
Indices match each other, so \a addresses[0] and \a guids[0] refer to the same system
\param[out] addresses All system addresses. Size of the list is the number of connections. Size of the list will match the size of the \a guids list.
\param[out] guids All guids. Size of the list is the number of connections. Size of the list will match the size of the \a addresses list.
</member>
<member name="M:RakNet.RakPeerInterface.AddToBanList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="297">
Bans an IP from connecting.  Banned IPs persist between connections but are not saved on shutdown nor loaded on startup.
param[in] IP Dotted IP address. Can use * as a wildcard, such as 128.0.0.* will ban all IP addresses starting with 128.0.0
\param[in] milliseconds how many ms for a temporary ban.  Use 0 for a permanent ban
</member>
<member name="M:RakNet.RakPeerInterface.RemoveFromBanList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="302">
Allows a previously banned IP to connect. 
param[in] Dotted IP address. Can use * as a wildcard, such as 128.0.0.* will banAll IP addresses starting with 128.0.0
</member>
<member name="M:RakNet.RakPeerInterface.ClearBanList" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="306">
Allows all previously banned IPs to connect.
</member>
<member name="M:RakNet.RakPeerInterface.IsBanned(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="309">
Returns true or false indicating if a particular IP is banned.
\param[in] IP - Dotted IP address.
\return true if IP matches any IPs in the ban list, accounting for any wildcards. False otherwise.
</member>
<member name="M:RakNet.RakPeerInterface.SetLimitIPConnectionFrequency(System.Boolean)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="314">
Enable or disable allowing frequent connections from the same IP adderss
This is a security measure which is disabled by default, but can be set to true to prevent attackers from using up all connection slots
\param[in] b True to limit connections from the same ip to at most 1 per 100 milliseconds.
</member>
<member name="M:RakNet.RakPeerInterface.Ping(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="320">
Send a ping to the specified connected system.
\pre The sender and recipient must already be started via a successful call to Startup()
\param[in] target Which system to ping
</member>
<member name="M:RakNet.RakPeerInterface.Ping(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.Boolean,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="325">
Send a ping to the specified unconnected system. The remote system, if it is Initialized, will respond with ID_PONG followed by sizeof(RakNet::TimeMS) containing the system time the ping was sent.(Default is 4 bytes - See __GET_TIME_64BIT in RakNetTypes.h
System should reply with ID_PONG if it is active
\param[in] host Either a dotted IP address or a domain name.  Can be 255.255.255.255 for LAN broadcast.
\param[in] remotePort Which port to connect to on the remote machine.
\param[in] onlyReplyOnAcceptingConnections Only request a reply if the remote system is accepting connections
\param[in] connectionSocketIndex Index into the array of socket descriptors passed to socketDescriptors in RakPeer::Startup() to send on.
\return true on success, false on failure (unknown hostname)
</member>
<member name="M:RakNet.RakPeerInterface.GetAveragePing(RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="334">
Returns the average of all ping times read for the specific system or -1 if none read yet
\param[in] systemAddress Which system we are referring to
\return The ping time for this system, or -1
</member>
<member name="M:RakNet.RakPeerInterface.GetLastPing(RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="339">
Returns the last ping time read for the specific system or -1 if none read yet
\param[in] systemAddress Which system we are referring to
\return The last ping time for this system, or -1
</member>
<member name="M:RakNet.RakPeerInterface.GetLowestPing(RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="344">
Returns the lowest ping time read or -1 if none read yet
\param[in] systemAddress Which system we are referring to
\return The lowest ping time for this system, or -1
</member>
<member name="M:RakNet.RakPeerInterface.SetOccasionalPing(System.Boolean)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="349">
Ping the remote systems every so often, or not. Can be called anytime.
By default this is true. Recommended to leave on, because congestion control uses it to determine how often to resend lost packets.
It would be true by default to prevent timestamp drift, since in the event of a clock spike, the timestamp deltas would no longer be accurate
\param[in] doPing True to start occasional pings.  False to stop them.
</member>
<member name="M:RakNet.RakPeerInterface.GetClockDifferential(RakNet.AddressOrGUID!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="355">
Return the clock difference between your system and the specified system
Subtract GetClockDifferential() from a time returned by the remote system to get that time relative to your own system
Returns 0 if the system is unknown
\param[in] systemIdentifier Which system we are referring to
</member>
<member name="M:RakNet.RakPeerInterface.SetOfflinePingResponse(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="362">
Sets the data to send along with a LAN server discovery or offline ping reply.
\a length should be under 400 bytes, as a security measure against flood attacks
\param[in] data a block of data to store, or 0 for none
\param[in] length The length of data in bytes, or 0 for none
\sa Ping.cpp
</member>
<member name="M:RakNet.RakPeerInterface.GetOfflinePingResponse(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte**,System.UInt32*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="369">
Returns pointers to a copy of the data passed to SetOfflinePingResponse
\param[out] data A pointer to a copy of the data passed to \a SetOfflinePingResponse()
\param[out] length A pointer filled in with the length parameter passed to SetOfflinePingResponse()
\sa SetOfflinePingResponse
</member>
<member name="M:RakNet.RakPeerInterface.GetInternalID(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst,System.Int32!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="376">
Return the unique address identifier that represents you or another system on the the network and is based on your local IP / port.
\note Not supported by the XBOX
\param[in] systemAddress Use UNASSIGNED_SYSTEM_ADDRESS to get your behind-LAN address. Use a connected system to get their behind-LAN address
\param[in] index When you have multiple internal IDs, which index to return? Currently limited to MAXIMUM_NUMBER_OF_INTERNAL_IDS (so the maximum value of this variable is MAXIMUM_NUMBER_OF_INTERNAL_IDS-1)
\return the identifier of your system internally, which may not be how other systems see if you if you are behind a NAT or proxy
</member>
<member name="M:RakNet.RakPeerInterface.SetInternalID(RakNet.SystemAddress,System.Int32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="383">
\brief Sets your internal IP address, for platforms that do not support reading it, or to override a value
\param[in] systemAddress. The address to set. Use SystemAddress::FromString() if you want to use a dotted string
\param[in] index When you have multiple internal IDs, which index to set?
</member>
<member name="M:RakNet.RakPeerInterface.GetExternalID(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="388">
Return the unique address identifier that represents you on the the network and is based on your externalIP / port
(the IP / port the specified player uses to communicate with you)
\param[in] target Which remote system you are referring to for your external ID.  Usually the same for all systems, unless you have two or more network cards.
</member>
<member name="M:RakNet.RakPeerInterface.GetMyGUID" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="393">
Return my own GUID
</member>
<member name="M:RakNet.RakPeerInterface.GetMyBoundAddress(System.Int32!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="396">
Return the address bound to a socket at the specified index
</member>
<member name="M:RakNet.RakPeerInterface.Get64BitUniqueRandomNumber" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="399">
Get a random number (to generate a GUID)
</member>
<member name="M:RakNet.RakPeerInterface.GetGuidFromSystemAddress(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="402">
Given a connected system, give us the unique GUID representing that instance of RakPeer.
This will be the same on all systems connected to that instance of RakPeer, even if the external system addresses are different
Currently O(log(n)), but this may be improved in the future. If you use this frequently, you may want to cache the value as it won't change.
Returns UNASSIGNED_RAKNET_GUID if system address can't be found.
If \a input is UNASSIGNED_SYSTEM_ADDRESS, will return your own GUID
\pre Call Startup() first, or the function will return UNASSIGNED_RAKNET_GUID
\param[in] input The system address of the system we are connected to
</member>
<member name="M:RakNet.RakPeerInterface.GetSystemAddressFromGuid(RakNet.RakNetGUID!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="411">
Given the GUID of a connected system, give us the system address of that system.
The GUID will be the same on all systems connected to that instance of RakPeer, even if the external system addresses are different
Currently O(log(n)), but this may be improved in the future. If you use this frequently, you may want to cache the value as it won't change.
If \a input is UNASSIGNED_RAKNET_GUID, will return UNASSIGNED_SYSTEM_ADDRESS
\param[in] input The RakNetGUID of the system we are checking to see if we are connected to
</member>
<member name="M:RakNet.RakPeerInterface.GetClientPublicKeyFromSystemAddress(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="418">
Given the SystemAddress of a connected system, get the public key they provided as an identity
Returns false if system address was not found or client public key is not known
\param[in] input The RakNetGUID of the system
\param[in] client_public_key The connected client's public key is copied to this address.  Buffer must be cat::EasyHandshake::PUBLIC_KEY_BYTES bytes in length.
</member>
<member name="M:RakNet.RakPeerInterface.SetTimeoutTime(System.UInt32,RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="424">
Set the time, in MS, to use before considering ourselves disconnected after not being able to deliver a reliable message.
Default time is 10,000 or 10 seconds in release and 30,000 or 30 seconds in debug.
Do not set different values for different computers that are connected to each other, or you won't be able to reconnect after ID_CONNECTION_LOST
\param[in] timeMS Time, in MS
\param[in] target Which system to do this for. Pass UNASSIGNED_SYSTEM_ADDRESS for all systems.
</member>
<member name="M:RakNet.RakPeerInterface.GetTimeoutTime(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="431">
\param[in] target Which system to do this for. Pass UNASSIGNED_SYSTEM_ADDRESS to get the default value
\return timeoutTime for a given system.
</member>
<member name="M:RakNet.RakPeerInterface.GetMTUSize(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="435">
Returns the current MTU size
\param[in] target Which system to get this for.  UNASSIGNED_SYSTEM_ADDRESS to get the default
\return The current MTU size
</member>
<member name="M:RakNet.RakPeerInterface.GetNumberOfAddresses" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="440">
Returns the number of IP addresses this system has internally. Get the actual addresses from GetLocalIP()
</member>
<member name="M:RakNet.RakPeerInterface.GetLocalIP(System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="443">
Returns an IP address at index 0 to GetNumberOfAddresses-1
\param[in] index index into the list of IP addresses
\return The local IP address at this index
</member>
<member name="M:RakNet.RakPeerInterface.IsLocalIP(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="448">
Is this a local IP?
\param[in] An IP address to check, excluding the port
\return True if this is one of the IP addresses returned by GetLocalIP
</member>
<member name="M:RakNet.RakPeerInterface.AllowConnectionResponseIPMigration(System.Boolean)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="453">
Allow or disallow connection responses from any IP. Normally this should be false, but may be necessary
when connecting to servers with multiple IP addresses.
\param[in] allow - True to allow this behavior, false to not allow. Defaults to false. Value persists between connections
</member>
<member name="M:RakNet.RakPeerInterface.AdvertiseSystem(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="458">
Sends a one byte message ID_ADVERTISE_SYSTEM to the remote unconnected system.
This will tell the remote system our external IP outside the LAN along with some user data.
\pre The sender and recipient must already be started via a successful call to Initialize
\param[in] host Either a dotted IP address or a domain name
\param[in] remotePort Which port to connect to on the remote machine.
\param[in] data Optional data to append to the packet.
\param[in] dataLength length of data in bytes.  Use 0 if no data.
\param[in] connectionSocketIndex Index into the array of socket descriptors passed to socketDescriptors in RakPeer::Startup() to send on.
\return false if IsActive()==false or the host is unresolvable. True otherwise
</member>
<member name="M:RakNet.RakPeerInterface.SetSplitMessageProgressInterval(System.Int32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="469">
Controls how often to return ID_DOWNLOAD_PROGRESS for large message downloads.
ID_DOWNLOAD_PROGRESS is returned to indicate a new partial message chunk, roughly the MTU size, has arrived
As it can be slow or cumbersome to get this notification for every chunk, you can set the interval at which it is returned.
Defaults to 0 (never return this notification)
\param[in] interval How many messages to use as an interval
</member>
<member name="M:RakNet.RakPeerInterface.GetSplitMessageProgressInterval" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="476">
Returns what was passed to SetSplitMessageProgressInterval()
\return What was passed to SetSplitMessageProgressInterval(). Default to 0.
</member>
<member name="M:RakNet.RakPeerInterface.SetUnreliableTimeout(System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="480">
Set how long to wait before giving up on sending an unreliable message
Useful if the network is clogged up.
Set to 0 or less to never timeout.  Defaults to 0.
\param[in] timeoutMS How many ms to wait before simply not sending an unreliable message.
</member>
<member name="M:RakNet.RakPeerInterface.SendTTL(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.Int32,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="486">
Send a message to host, with the IP socket option TTL set to 3
This message will not reach the host, but will open the router.
Used for NAT-Punchthrough
</member>
<member name="M:RakNet.RakPeerInterface.AttachPlugin(RakNet.PluginInterface2*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="492">
\brief Attaches a Plugin interface to an instance of the base class (RakPeer or PacketizedTCP) to run code automatically on message receipt in the Receive call.
If the plugin returns false from PluginInterface::UsesReliabilityLayer(), which is the case for all plugins except PacketLogger, you can call AttachPlugin() and DetachPlugin() for this plugin while RakPeer is active.
\param[in] messageHandler Pointer to the plugin to attach.
</member>
<member name="M:RakNet.RakPeerInterface.DetachPlugin(RakNet.PluginInterface2*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="497">
\brief Detaches a Plugin interface from the instance of the base class (RakPeer or PacketizedTCP) it is attached to.
\details This method disables the plugin code from running automatically on base class's updates or message receipt.
If the plugin returns false from PluginInterface::UsesReliabilityLayer(), which is the case for all plugins except PacketLogger, you can call AttachPlugin() and DetachPlugin() for this plugin while RakPeer is active.
\param[in] messageHandler Pointer to a plugin to detach.
</member>
<member name="M:RakNet.RakPeerInterface.PushBackPacket(RakNet.Packet*,System.Boolean)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="504">
Put a message back at the end of the receive queue in case you don't want to deal with it immediately
\param[in] packet The packet you want to push back.
\param[in] pushAtHead True to push the packet so that the next receive call returns it.  False to push it at the end of the queue (obviously pushing it at the end makes the packets out of order)
</member>
<member name="M:RakNet.RakPeerInterface.ChangeSystemAddress(RakNet.RakNetGUID,RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="509">
\internal
\brief For a given system identified by \a guid, change the SystemAddress to send to.
\param[in] guid The connection we are referring to
\param[in] systemAddress The new address to send to
</member>
<member name="M:RakNet.RakPeerInterface.AllocatePacket(System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="515">
\returns a packet for you to write to if you want to create a Packet for some reason.
You can add it to the receive buffer with PushBackPacket
\param[in] dataSize How many bytes to allocate for the buffer
\return A packet you can write to
</member>
<member name="M:RakNet.RakPeerInterface.GetSocket(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="521">
Get the socket used with a particular active connection
The smart pointer reference counts the RakNetSocket2 object, so the socket will remain active as long as the smart pointer does, even if RakNet were to shutdown or close the connection.
\note This sends a query to the thread and blocks on the return value for up to one second. In practice it should only take a millisecond or so.
\param[in] target Which system
\return A smart pointer object containing the socket information about the socket. Be sure to check IsNull() which is returned if the update thread is unresponsive, shutting down, or if this system is not connected
</member>
<member name="M:RakNet.RakPeerInterface.GetSockets(DataStructures.List&lt;RakNet.RakNetSocket2**&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="528">
Get all sockets in use
\note This sends a query to the thread and blocks on the return value for up to one second. In practice it should only take a millisecond or so.
\param[out] sockets List of RakNetSocket2 structures in use. Sockets will not be closed until \a sockets goes out of scope
</member>
<member name="M:RakNet.RakPeerInterface.SetUserUpdateThread(=FUNC:System.Void(RakNet.RakPeerInterface*,System.Void*),System.Void*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="536">
If you need code to run in the same thread as RakNet's update thread, this function can be used for that
\param[in] _userUpdateThreadPtr C callback function
\param[in] _userUpdateThreadData Passed to C callback function
</member>
<member name="M:RakNet.RakPeerInterface.SetIncomingDatagramEventHandler(=FUNC:System.Boolean(RakNet.RNS2RecvStruct*))" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="541">
Set a C callback to be called whenever a datagram arrives
Return true from the callback to have RakPeer handle the datagram. Return false and RakPeer will ignore the datagram.
This can be used to filter incoming datagrams by system, or to share a recvfrom socket with RakPeer
RNS2RecvStruct will only remain valid for the duration of the call
If the incoming datagram is not from your game at all, it is a RakNet packet.
If the incoming datagram has an IP address that matches a known address from your game, then check the first byte of data.
For RakNet connected systems, the first bit is always 1. So for your own game packets, make sure the first bit is always 0.
</member>
<member name="M:RakNet.RakPeerInterface.ApplyNetworkSimulator(System.Single,System.UInt16,System.UInt16)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="551">
Adds simulated ping and packet loss to the outgoing data flow.
To simulate bi-directional ping and packet loss, you should call this on both the sender and the recipient, with half the total ping and packetloss value on each.
You can exclude network simulator code with the _RELEASE #define to decrease code size
\deprecated Use http://www.jenkinssoftware.com/forum/index.php?topic=1671.0 instead.
\note Doesn't work past version 3.6201
\param[in] packetloss Chance to lose a packet. Ranges from 0 to 1.
\param[in] minExtraPing The minimum time to delay sends.
\param[in] extraPingVariance The additional random time to delay sends.
</member>
<member name="M:RakNet.RakPeerInterface.SetPerConnectionOutgoingBandwidthLimit(System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="561">
Limits how much outgoing bandwidth can be sent per-connection.
This limit does not apply to the sum of all connections!
Exceeding the limit queues up outgoing traffic
\param[in] maxBitsPerSecond Maximum bits per second to send.  Use 0 for unlimited (default). Once set, it takes effect immedately and persists until called again.
</member>
<member name="M:RakNet.RakPeerInterface.IsNetworkSimulatorActive" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="567">
Returns if you previously called ApplyNetworkSimulator
\return If you previously called ApplyNetworkSimulator
</member>
<member name="M:RakNet.RakPeerInterface.GetStatistics(RakNet.SystemAddress!System.Runtime.CompilerServices.IsConst,RakNet.RakNetStatistics*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="573">
Returns a structure containing a large set of network statistics for the specified system.
You can map this data to a string using the C style StatisticsToString() function
\param[in] systemAddress: Which connected system to get statistics for
\param[in] rns If you supply this structure, it will be written to it.  Otherwise it will use a static struct, which is not threadsafe
\return 0 on can't find the specified system.  A pointer to a set of data otherwise.
\sa RakNetStatistics.h
</member>
<member name="M:RakNet.RakPeerInterface.GetStatistics(System.UInt32!System.Runtime.CompilerServices.IsConst,RakNet.RakNetStatistics*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="580">
\brief Returns the network statistics of the system at the given index in the remoteSystemList.
\return True if the index is less than the maximum number of peers allowed and the system is active. False otherwise.
</member>
<member name="M:RakNet.RakPeerInterface.GetStatisticsList(DataStructures.List&lt;RakNet.SystemAddress&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,DataStructures.List&lt;RakNet.RakNetGUID&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,DataStructures.List&lt;RakNet.RakNetStatistics&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="583">
\brief Returns the list of systems, and statistics for each of those systems
Each system has one entry in each of the lists, in the same order
\param[out] addresses SystemAddress for each connected system
\param[out] guids RakNetGUID for each connected system
\param[out] statistics Calculated RakNetStatistics for each connected system
</member>
<member name="M:RakNet.RakPeerInterface.GetReceiveBufferSize" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="590">
\Returns how many messages are waiting when you call Receive()
</member>
<member name="M:RakNet.RakPeerInterface.RunUpdateCycle(RakNet.BitStream*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="595">
\internal
</member>
<member name="M:RakNet.RakPeerInterface.SendOutOfBand(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32,System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakpeerinterface.h" line="605">
\internal
</member>
<member name="F:USER_MESSAGE_BYTES_PUSHED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="29">
How many bytes per pushed via a call to RakPeerInterface::Send()
</member>
<member name="F:USER_MESSAGE_BYTES_SENT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="32">
How many user message bytes were sent via a call to RakPeerInterface::Send(). This is less than or equal to USER_MESSAGE_BYTES_PUSHED.
A message would be pushed, but not yet sent, due to congestion control
</member>
<member name="F:USER_MESSAGE_BYTES_RESENT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="36">
How many user message bytes were resent. A message is resent if it is marked as reliable, and either the message didn't arrive or the message ack didn't arrive.
</member>
<member name="F:USER_MESSAGE_BYTES_RECEIVED_PROCESSED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="39">
How many user message bytes were received, and returned to the user successfully.
</member>
<member name="F:USER_MESSAGE_BYTES_RECEIVED_IGNORED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="42">
How many user message bytes were received, but ignored due to data format errors. This will usually be 0.
</member>
<member name="F:ACTUAL_BYTES_SENT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="45">
How many actual bytes were sent, including per-message and per-datagram overhead, and reliable message acks
</member>
<member name="F:ACTUAL_BYTES_RECEIVED" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="48">
How many actual bytes were received, including overead and acks.
</member>
<member name="F:RNS_PER_SECOND_METRICS_COUNT" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="51">
\internal
</member>
<member name="T:RakNet.RakNetStatistics" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="55">
\brief Network Statisics Usage 

Store Statistics information related to network usage 
</member>
<member name="F:RakNet.RakNetStatistics.valueOverLastSecond" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="60">
For each type in RNSPerSecondMetrics, what is the value over the last 1 second?
</member>
<member name="F:RakNet.RakNetStatistics.runningTotal" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="63">
For each type in RNSPerSecondMetrics, what is the total value over the lifetime of the connection?
</member>
<member name="F:RakNet.RakNetStatistics.connectionStartTime" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="66">
When did the connection start?
\sa RakNet::GetTimeUS()
</member>
<member name="F:RakNet.RakNetStatistics.isLimitedByCongestionControl" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="70">
Is our current send rate throttled by congestion control?
This value should be true if you send more data per second than your bandwidth capacity
</member>
<member name="F:RakNet.RakNetStatistics.BPSLimitByCongestionControl" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="74">
If \a isLimitedByCongestionControl is true, what is the limit, in bytes per second?
</member>
<member name="F:RakNet.RakNetStatistics.isLimitedByOutgoingBandwidthLimit" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="77">
Is our current send rate throttled by a call to RakPeer::SetPerConnectionOutgoingBandwidthLimit()?
</member>
<member name="F:RakNet.RakNetStatistics.BPSLimitByOutgoingBandwidthLimit" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="80">
If \a isLimitedByOutgoingBandwidthLimit is true, what is the limit, in bytes per second?
</member>
<member name="F:RakNet.RakNetStatistics.messageInSendBuffer" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="83">
For each priority level, how many messages are waiting to be sent out?
</member>
<member name="F:RakNet.RakNetStatistics.bytesInSendBuffer" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="86">
For each priority level, how many bytes are waiting to be sent out?
</member>
<member name="F:RakNet.RakNetStatistics.messagesInResendBuffer" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="89">
How many messages are waiting in the resend buffer? This includes messages waiting for an ack, so should normally be a small value
If the value is rising over time, you are exceeding the bandwidth capacity. See BPSLimitByCongestionControl 
</member>
<member name="F:RakNet.RakNetStatistics.bytesInResendBuffer" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="93">
How many bytes are waiting in the resend buffer. See also messagesInResendBuffer
</member>
<member name="F:RakNet.RakNetStatistics.packetlossLastSecond" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="96">
Over the last second, what was our packetloss? This number will range from 0.0 (for none) to 1.0 (for 100%)
</member>
<member name="F:RakNet.RakNetStatistics.packetlossTotal" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="99">
What is the average total packetloss over the lifetime of the connection?
</member>
<member name="M:RakNet.StatisticsToString(RakNet.RakNetStatistics*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.Int32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\raknetstatistics.h" line="121">
Verbosity level currently supports 0 (low), 1 (medium), 2 (high)
\param[in] s The Statistical information to format out
\param[in] buffer The buffer containing a formated report
\param[in] verbosityLevel 
0 low
1 medium 
2 high 
3 debugging congestion control
</member>
<member name="T:_iobuf" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="11">
\file BitStream.h
\brief This class allows you to write and read native types as a string of bits.  
\details BitStream is used extensively throughout RakNet and is designed to be used by users as well.

</member>
<member name="T:RakNet.SimpleMutex" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="30">
Forward declarations
</member>
<member name="T:RakNet.RakString" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="34">
\brief String class
\details Has the following improvements over std::string
-Reference counting: Suitable to store in lists
-Variadic assignment operator
-Doesn't cause linker errors
</member>
<member name="M:RakNet.RakString.op_Implicit~System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="51">
Implicit return of const char*
</member>
<member name="M:RakNet.RakString.C_String" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="54">
Same as std::string::c_str
</member>
<member name="M:RakNet.RakString.op_Assign(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="61">
Assigment operators
</member>
<member name="M:RakNet.RakString.op_AdditionAssignment(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="69">
Concatenation
</member>
<member name="M:RakNet.RakString.op_Subscript(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="77">
Character index. Do not use to change the string however.
</member>
<member name="M:RakNet.RakString.Find(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="90">
String class find replacement
Searches the string for the content specified in stringToFind and returns the position of the first occurrence in the string.
Search only includes characters on or after position pos, ignoring any possible occurrences in previous locations.
\param[in] stringToFind The string to find inside of this object's string
\param[in] pos The position in the string to start the search
\return Returns the position of the first occurrence in the string.
</member>
<member name="M:RakNet.RakString.op_Equality(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="98">
Equality
</member>
<member name="M:RakNet.RakString.op_Inequality(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="109">
Inequality
</member>
<member name="M:RakNet.RakString.ToLower" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="114">
Change all characters to lowercase
</member>
<member name="M:RakNet.RakString.ToUpper" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="117">
Change all characters to uppercase
</member>
<member name="M:RakNet.RakString.Set(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,BTEllipsis)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="120">
Set the value of the string
</member>
<member name="M:RakNet.RakString.Assign(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32,System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="123">
Sets a copy of a substring of str as the new content. The substring is the portion of str 
that begins at the character position pos and takes up to n characters 
(it takes less than n if the end of str is reached before).
\param[in] str The string to copy in
\param[in] pos The position on str to start the copy
\param[in] n How many chars to copy
\return Returns the string, note that the current string is set to that value as well
</member>
<member name="M:RakNet.RakString.IsEmpty" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="132">
Returns if the string is empty. Also, C_String() would return ""
</member>
<member name="M:RakNet.RakString.GetLength" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="135">
Returns the length of the string
</member>
<member name="M:RakNet.RakString.Replace(System.UInt32,System.UInt32,System.Byte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="139">
Replace character(s) in starting at index, for count, with c
</member>
<member name="M:RakNet.RakString.SetChar(System.UInt32,System.Byte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="142">
Replace character at index with c
</member>
<member name="M:RakNet.RakString.SetChar(System.UInt32,RakNet.RakString)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="145">
Replace character at index with string s
</member>
<member name="M:RakNet.RakString.Truncate(System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="148">
Make sure string is no longer than \a length
</member>
<member name="M:RakNet.RakString.Erase(System.UInt32,System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="155">
Erase characters out of the string at index for count
</member>
<member name="M:RakNet.RakString.TerminateAtFirstCharacter(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="158">
Set the first instance of c with a NULL terminator
</member>
<member name="M:RakNet.RakString.TerminateAtLastCharacter(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="160">
Set the last instance of c with a NULL terminator
</member>
<member name="M:RakNet.RakString.GetCharacterCount(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="166">
Returns how many occurances there are of \a c in the string
</member>
<member name="M:RakNet.RakString.RemoveCharacter(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="169">
Remove all instances of c
</member>
<member name="M:RakNet.RakString.NonVariadic(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="172">
Create a RakString with a value, without doing printf style parsing
Equivalent to assignment operator
</member>
<member name="M:RakNet.RakString.ToInteger(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="176">
Hash the string into an unsigned int
</member>
<member name="M:RakNet.RakString.ReadIntFromSubstring(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32,System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="180">
\brief Read an integer out of a substring
\param[in] str The string
\param[in] pos The position on str where the integer starts
\param[in] n How many chars to copy
</member>
<member name="M:RakNet.RakString.StrCmp(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="189">
Compare strings (case sensitive)
</member>
<member name="M:RakNet.RakString.StrNCmp(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="192">
Compare strings (case sensitive), up to num characters
</member>
<member name="M:RakNet.RakString.StrICmp(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="195">
Compare strings (not case sensitive)
</member>
<member name="M:RakNet.RakString.Clear" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="198">
Clear the string
</member>
<member name="M:RakNet.RakString.Printf" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="201">
Print the string to the screen
</member>
<member name="M:RakNet.RakString.FPrintf(_iobuf*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="204">
Print the string to a file
</member>
<member name="M:RakNet.RakString.IPAddressMatch(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="207">
Does the given IP address match the IP address encoded into this string, accounting for wildcards?
</member>
<member name="M:RakNet.RakString.ContainsNonprintableExceptSpaces" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="210">
Does the string contain non-printable characters other than spaces?
</member>
<member name="M:RakNet.RakString.IsEmailAddress" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="213">
Is this a valid email address?
</member>
<member name="M:RakNet.RakString.URLEncode" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="216">
URL Encode the string. See http://www.codeguru.com/cpp/cpp/cpp_mfc/article.php/c4029/
</member>
<member name="M:RakNet.RakString.URLDecode" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="219">
URL decode the string
</member>
<member name="M:RakNet.RakString.SplitURI(RakNet.RakString*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,RakNet.RakString*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,RakNet.RakString*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="222">
https://servers.api.rackspacecloud.com/v1.0 to https://,  servers.api.rackspacecloud.com, /v1.0
</member>
<member name="M:RakNet.RakString.SQLEscape" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="225">
Scan for quote, double quote, and backslash and prepend with backslash
</member>
<member name="M:RakNet.RakString.FormatForPOST(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="228">
Format as a POST command that can be sent to a webserver
\param[in] uri For example, masterserver2.raknet.com/testServer
\param[in] contentType For example, text/plain; charset=UTF-8
\param[in] body Body of the post
\return Formatted string
</member>
<member name="M:RakNet.RakString.FormatForGET(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="236">
Format as a GET command that can be sent to a webserver
\param[in] uri For example, masterserver2.raknet.com/testServer?__gameId=comprehensivePCGame
\return Formatted string
</member>
<!-- Discarding badly formed XML document comment for member 'M:RakNet.RakString.FormatForDELETE(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)'. -->
<member name="M:RakNet.RakString.MakeFilePath" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="246">
Fix to be a file path, ending with /
</member>
<member name="M:RakNet.RakString.FreeMemory" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="249">
RakString uses a freeList of old no-longer used strings
Call this function to clear this memory on shutdown
</member>
<member name="M:RakNet.RakString.FreeMemoryNoMutex" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="252">
\internal
</member>
<member name="M:RakNet.RakString.Serialize(RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="255">
Serialize to a bitstream, uncompressed (slightly faster)
\param[out] bs Bitstream to serialize to
</member>
<member name="M:RakNet.RakString.Serialize(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="259">
Static version of the Serialize function
</member>
<member name="M:RakNet.RakString.SerializeCompressed(RakNet.BitStream*,System.Byte,System.Boolean)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="262">
Serialize to a bitstream, compressed (better bandwidth usage)
\param[out]  bs Bitstream to serialize to
\param[in] languageId languageId to pass to the StringCompressor class
\param[in] writeLanguageId encode the languageId variable in the stream. If false, 0 is assumed, and DeserializeCompressed will not look for this variable in the stream (saves bandwidth)
\pre StringCompressor::AddReference must have been called to instantiate the class (Happens automatically from RakPeer::Startup())
</member>
<member name="M:RakNet.RakString.SerializeCompressed(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,RakNet.BitStream*,System.Byte,System.Boolean)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="269">
Static version of the SerializeCompressed function
</member>
<member name="M:RakNet.RakString.Deserialize(RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="272">
Deserialize what was written by Serialize
\param[in] bs Bitstream to serialize from
\return true if the deserialization was successful
</member>
<member name="M:RakNet.RakString.Deserialize(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="277">
Static version of the Deserialize() function
</member>
<member name="M:RakNet.RakString.DeserializeCompressed(RakNet.BitStream*,System.Boolean)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="280">
Deserialize compressed string, written by SerializeCompressed
\param[in] bs Bitstream to serialize from
\param[in] readLanguageId If true, looks for the variable langaugeId in the data stream. Must match what was passed to SerializeCompressed
\return true if the deserialization was successful
\pre StringCompressor::AddReference must have been called to instantiate the class (Happens automatically from RakPeer::Startup())
</member>
<member name="M:RakNet.RakString.DeserializeCompressed(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,RakNet.BitStream*,System.Boolean)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="287">
Static version of the DeserializeCompressed() function
</member>
<member name="M:RakNet.RakString.GetSizeToAllocate(System.UInt32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="293">
\internal
</member>
<member name="T:RakNet.RakString.SharedString" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="303">
\internal
</member>
<member name="M:RakNet.RakString.#ctor(RakNet.RakString.SharedString*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="314">
\internal
</member>
<member name="F:RakNet.RakString.sharedString" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="317">
\internal
</member>
<member name="F:RakNet.RakString.emptyString" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="322">
\internal
</member>
<member name="F:RakNet.RakString.freeList" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakstring.h" line="327">
\internal
List of free objects to reduce memory reallocations
</member>
<member name="T:RakNet.RakWString" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="27">
\brief String class for Unicode
</member>
<member name="M:RakNet.RakWString.op_Implicit~System.Char*" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="39">
Implicit return of wchar_t*
</member>
<member name="M:RakNet.RakWString.C_String" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="42">
Same as std::string::c_str
</member>
<member name="M:RakNet.RakWString.op_Assign(RakNet.RakWString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="45">
Assignment operators
</member>
<member name="M:RakNet.RakWString.op_AdditionAssignment(RakNet.RakWString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="53">
Concatenation
</member>
<member name="M:RakNet.RakWString.op_Equality(RakNet.RakWString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="58">
Equality
</member>
<member name="M:RakNet.RakWString.op_Inequality(RakNet.RakWString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="67">
Inequality
</member>
<member name="M:RakNet.RakWString.Set(System.Char*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="70">
Set the value of the string
</member>
<member name="M:RakNet.RakWString.IsEmpty" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="73">
Returns if the string is empty. Also, C_String() would return ""
</member>
<member name="M:RakNet.RakWString.GetLength" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="76">
Returns the length of the string
</member>
<member name="M:RakNet.RakWString.ToInteger(RakNet.RakWString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="79">
Has the string into an unsigned int
</member>
<member name="M:RakNet.RakWString.StrCmp(RakNet.RakWString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="82">
Compare strings (case sensitive)
</member>
<member name="M:RakNet.RakWString.StrICmp(RakNet.RakWString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="85">
Compare strings (not case sensitive)
</member>
<member name="M:RakNet.RakWString.Clear" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="88">
Clear the string
</member>
<member name="M:RakNet.RakWString.Printf" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="91">
Print the string to the screen
</member>
<member name="M:RakNet.RakWString.FPrintf(_iobuf*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="94">
Print the string to a file
</member>
<member name="M:RakNet.RakWString.Serialize(RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="97">
Serialize to a bitstream, uncompressed (slightly faster)
\param[out] bs Bitstream to serialize to
</member>
<member name="M:RakNet.RakWString.Serialize(System.Char!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsConst,RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="101">
Static version of the Serialize function
</member>
<member name="M:RakNet.RakWString.Deserialize(RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="104">
Deserialize what was written by Serialize
\param[in] bs Bitstream to serialize from
\return true if the deserialization was successful
</member>
<member name="M:RakNet.RakWString.Deserialize(System.Char*,RakNet.BitStream*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\rakwstring.h" line="109">
Static version of the Deserialize() function
</member>
<member name="T:RakNet.BitStream" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="45">
This class allows you to write and read native types as a string of bits.  BitStream is used extensively throughout RakNet and is designed to be used by users as well.
\sa BitStreamSample.txt
</member>
<member name="M:RakNet.BitStream.#ctor" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="54">
Default Constructor
</member>
<member name="M:RakNet.BitStream.#ctor(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="57">
\brief Create the bitstream, with some number of bytes to immediately allocate.
\details There is no benefit to calling this, unless you know exactly how many bytes you need and it is greater than BITSTREAM_STACK_ALLOCATION_SIZE.
In that case all it does is save you one or more realloc calls.
\param[in] initialBytesToAllocate the number of bytes to pre-allocate.
</member>
<member name="M:RakNet.BitStream.#ctor(System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="63">
\brief Initialize the BitStream, immediately setting the data it contains to a predefined pointer.
\details Set \a _copyData to true if you want to make an internal copy of the data you are passing. Set it to false to just save a pointer to the data.
You shouldn't call Write functions with \a _copyData as false, as this will write to unallocated memory
99% of the time you will use this function to cast Packet::data to a bitstream for reading, in which case you should write something as follows:
\code
RakNet::BitStream bs(packet-&gt;data, packet-&gt;length, false);
\endcode
\param[in] _data An array of bytes.
\param[in] lengthInBytes Size of the \a _data.
\param[in] _copyData true or false to make a copy of \a _data or not.
</member>
<member name="M:RakNet.BitStream.Reset" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="78">
Resets the bitstream for reuse.
</member>
<member name="M:RakNet.BitStream.Serialize(System.Boolean,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="135">
\brief Bidirectional serialize/deserialize an array or casted stream or raw data.  This does NOT do endian swapping.
\param[in] writeToBitstream true to write from your data to this bitstream.  False to read from this bitstream and write to your data
\param[in] inOutByteArray a byte buffer
\param[in] numberOfBytes the size of \a input in bytes
\return true if \a writeToBitstream is true.  true if \a writeToBitstream is false and the read was successful.  false if \a writeToBitstream is false and the read was not successful.
</member>
<member name="M:RakNet.BitStream.SerializeFloat16(System.Boolean,System.Single*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Single,System.Single)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="142">
\brief Serialize a float into 2 bytes, spanning the range between \a floatMin and \a floatMax
\param[in] writeToBitstream true to write from your data to this bitstream.  False to read from this bitstream and write to your data
\param[in] inOutFloat The float to write
\param[in] floatMin Predetermined minimum value of f
\param[in] floatMax Predetermined maximum value of f
</member>
<member name="M:RakNet.BitStream.SerializeBits(System.Boolean,System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="213">
\brief Bidirectional serialize/deserialize numberToSerialize bits to/from the input. 
\details Right aligned data means in the case of a partial byte, the bits are aligned
from the right (bit 0) rather than the left (as in the normal
internal representation) You would set this to true when
writing user data, and false when copying bitstream data, such
as writing one bitstream to another
\param[in] writeToBitstream true to write from your data to this bitstream.  False to read from this bitstream and write to your data
\param[in] inOutByteArray The data
\param[in] numberOfBitsToSerialize The number of bits to write
\param[in] rightAlignedBits if true data will be right aligned
\return true if \a writeToBitstream is true.  true if \a writeToBitstream is false and the read was successful.  false if \a writeToBitstream is false and the read was not successful.
</member>
<member name="M:RakNet.BitStream.Read(RakNet.BitStream*,System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="314">
\brief Read one bitstream to another.
\param[in] numberOfBits bits to read
\param bitStream the bitstream to read into from
\return true on success, false on failure.
</member>
<member name="M:RakNet.BitStream.Write(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="323">
\brief Write an array or casted stream or raw data.  This does NOT do endian swapping.
\param[in] inputByteArray a byte buffer
\param[in] numberOfBytes the size of \a input in bytes
</member>
<member name="M:RakNet.BitStream.Write(RakNet.BitStream*,System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="328">
\brief Write one bitstream to another.
\param[in] numberOfBits bits to write
\param bitStream the bitstream to copy from
</member>
<member name="M:RakNet.BitStream.WriteFloat16(System.Single,System.Single,System.Single)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="336">
\brief Write a float into 2 bytes, spanning the range between \a floatMin and \a floatMax
\param[in] x The float to write
\param[in] floatMin Predetermined minimum value of f
\param[in] floatMax Predetermined maximum value of f
</member>
<member name="M:RakNet.BitStream.Read(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="397">
\brief Read an array or casted stream of byte.
\details The array is raw data. There is no automatic endian conversion with this function
\param[in] output The result byte array. It should be larger than @em numberOfBytes.
\param[in] numberOfBytes The number of byte to read
\return true on success false if there is some missing bytes.
</member>
<member name="M:RakNet.BitStream.ReadFloat16(System.Single*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Single,System.Single)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="404">
\brief Read a float into 2 bytes, spanning the range between \a floatMin and \a floatMax
\param[in] outFloat The float to read
\param[in] floatMin Predetermined minimum value of f
\param[in] floatMax Predetermined maximum value of f
</member>
<member name="M:RakNet.BitStream.ResetReadPointer" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="469">
\brief Sets the read pointer back to the beginning of your data.
</member>
<member name="M:RakNet.BitStream.ResetWritePointer" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="472">
\brief Sets the write pointer back to the beginning of your data.
</member>
<member name="M:RakNet.BitStream.AssertStreamEmpty" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="475">
\brief This is good to call when you are done with the stream to make
sure you didn't leave any data left over void
</member>
<member name="M:RakNet.BitStream.PrintBits(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="479">
\brief RAKNET_DEBUG_PRINTF the bits in the stream.  Great for debugging.
</member>
<member name="M:RakNet.BitStream.IgnoreBits(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="485">
\brief Ignore data we don't intend to read
\param[in] numberOfBits The number of bits to ignore
</member>
<member name="M:RakNet.BitStream.IgnoreBytes(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="489">
\brief Ignore data we don't intend to read
\param[in] numberOfBits The number of bytes to ignore
</member>
<member name="M:RakNet.BitStream.SetWriteOffset(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="493">
\brief Move the write pointer to a position on the array.
\param[in] offset the offset from the start of the array.
\attention
\details Dangerous if you don't know what you are doing!
For efficiency reasons you can only write mid-stream if your data is byte aligned.
</member>
<member name="M:RakNet.BitStream.GetNumberOfBitsUsed" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="500">
\brief Returns the length in bits of the stream
</member>
<member name="M:RakNet.BitStream.GetNumberOfBytesUsed" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="504">
\brief Returns the length in bytes of the stream
</member>
<member name="M:RakNet.BitStream.GetReadOffset" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="507">
\brief Returns the number of bits into the stream that we have read
</member>
<member name="M:RakNet.BitStream.SetReadOffset(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="510">
\brief Sets the read bit index
</member>
<member name="M:RakNet.BitStream.GetNumberOfUnreadBits" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="513">
\brief Returns the number of bits left in the stream that haven't been read
</member>
<member name="M:RakNet.BitStream.CopyData(System.Byte**)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="516">
\brief Makes a copy of the internal data for you \a _data will point to
the stream. Partial bytes are left aligned.
\param[out] _data The allocated copy of GetData()
\return The length in bits of the stream.
</member>
<member name="M:RakNet.BitStream.SetData(System.Byte*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="522">
\internal
Set the stream to some initial data.
</member>
<member name="M:RakNet.BitStream.GetData" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="526">
Gets the data that BitStream is writing to / reading from.
Partial bytes are left aligned.
\return A pointer to the internal state
</member>
<member name="M:RakNet.BitStream.WriteBits(System.Byte!System.Runtime.CompilerServices.IsConst*,System.UInt32,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="531">
\brief Write numberToWrite bits from the input source.
\details Right aligned data means in the case of a partial byte, the bits are aligned
from the right (bit 0) rather than the left (as in the normal
internal representation) You would set this to true when
writing user data, and false when copying bitstream data, such
as writing one bitstream to another.
\param[in] inByteArray The data
\param[in] numberOfBitsToWrite The number of bits to write
\param[in] rightAlignedBits if true data will be right aligned
</member>
<member name="M:RakNet.BitStream.WriteAlignedBytes(System.Byte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="542">
\brief Align the bitstream to the byte boundary and then write the
specified number of bits.  
\details This is faster than WriteBits but
wastes the bits to do the alignment and requires you to call
ReadAlignedBits at the corresponding read position.
\param[in] inByteArray The data
\param[in] numberOfBytesToWrite The size of input.
</member>
<member name="M:RakNet.BitStream.WriteAlignedBytesSafe(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="554">
\brief Aligns the bitstream, writes inputLength, and writes input. Won't write beyond maxBytesToWrite
\param[in] inByteArray The data
\param[in] inputLength The size of input.
\param[in] maxBytesToWrite Max bytes to write
</member>
<member name="M:RakNet.BitStream.ReadAlignedBytes(System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="560">
\brief Read bits, starting at the next aligned bits. 
\details Note that the modulus 8 starting offset of the sequence must be the same as
was used with WriteBits. This will be a problem with packet
coalescence unless you byte align the coalesced packets.
\param[in] inOutByteArray The byte array larger than @em numberOfBytesToRead
\param[in] numberOfBytesToRead The number of byte to read from the internal state
\return true if there is enough byte.
</member>
<member name="M:RakNet.BitStream.ReadAlignedBytesSafe(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.Int32*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="569">
\brief Reads what was written by WriteAlignedBytesSafe.
\param[in] inOutByteArray The data
\param[in] maxBytesToRead Maximum number of bytes to read
\return true on success, false on failure.
</member>
<member name="M:RakNet.BitStream.ReadAlignedBytesSafeAlloc(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte**,System.Int32*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="576">
\brief Same as ReadAlignedBytesSafe() but allocates the memory for you using new, rather than assuming it is safe to write to
\param[in] outByteArray outByteArray will be deleted if it is not a pointer to 0
\return true on success, false on failure.
</member>
<member name="M:RakNet.BitStream.AlignWriteToByteBoundary" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="582">
\brief Align the next write and/or read to a byte boundary.  
\details This can be used to 'waste' bits to byte align for efficiency reasons It
can also be used to force coalesced bitstreams to start on byte
boundaries so so WriteAlignedBits and ReadAlignedBits both
calculate the same offset when aligning.
</member>
<member name="M:RakNet.BitStream.AlignReadToByteBoundary" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="589">
\brief Align the next write and/or read to a byte boundary.  
\details This can be used to 'waste' bits to byte align for efficiency reasons It
can also be used to force coalesced bitstreams to start on byte
boundaries so so WriteAlignedBits and ReadAlignedBits both
calculate the same offset when aligning.
</member>
<member name="M:RakNet.BitStream.ReadBits(System.Byte*,System.UInt32,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="596">
\brief Read \a numberOfBitsToRead bits to the output source.
\details alignBitsToRight should be set to true to convert internal
bitstream data to userdata. It should be false if you used
WriteBits with rightAlignedBits false
\param[in] inOutByteArray The resulting bits array
\param[in] numberOfBitsToRead The number of bits to read
\param[in] alignBitsToRight if true bits will be right aligned.
\return true if there is enough bits to read
</member>
<member name="M:RakNet.BitStream.Write0" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="606">
\brief Write a 0
</member>
<member name="M:RakNet.BitStream.Write1" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="609">
\brief Write a 1
</member>
<member name="M:RakNet.BitStream.ReadBit" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="612">
\brief Reads 1 bit and returns true if that bit is 1 and false if it is 0.
</member>
<member name="M:RakNet.BitStream.AssertCopyData" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="615">
\brief If we used the constructor version with copy data off, this
*makes sure it is set to on and the data pointed to is copied.
</member>
<member name="M:RakNet.BitStream.SetNumberOfBitsAllocated(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="619">
\brief Use this if you pass a pointer copy to the constructor
*(_copyData==false) and want to overallocate to prevent
reallocation.
</member>
<member name="M:RakNet.BitStream.AddBitsAndReallocate(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="624">
\brief Reallocates (if necessary) in preparation of writing numberOfBitsToWrite
</member>
<member name="M:RakNet.BitStream.GetNumberOfBitsAllocated" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="627">
\internal
\return How many bits have been allocated internally
</member>
<member name="M:RakNet.BitStream.Read(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="631">
\brief Read strings, non reference.
</member>
<member name="M:RakNet.BitStream.PadWithZeroToByteLength(System.UInt32)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="635">
Write zeros until the bitstream is filled up to \a bytes
</member>
<member name="M:RakNet.BitStream.NumberOfLeadingZeroes(System.Byte)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="638">
Get the number of leading zeros for a number
\param[in] x Number to test
</member>
<member name="M:RakNet.BitStream.WriteAlignedVar8(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="649">
\internal Unrolled inner loop, for when performance is critical
</member>
<member name="M:RakNet.BitStream.ReadAlignedVar8(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="651">
\internal Unrolled inner loop, for when performance is critical
</member>
<member name="M:RakNet.BitStream.WriteAlignedVar16(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="653">
\internal Unrolled inner loop, for when performance is critical
</member>
<member name="M:RakNet.BitStream.ReadAlignedVar16(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="655">
\internal Unrolled inner loop, for when performance is critical
</member>
<member name="M:RakNet.BitStream.WriteAlignedVar32(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="657">
\internal Unrolled inner loop, for when performance is critical
</member>
<member name="M:RakNet.BitStream.ReadAlignedVar32(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="659">
\internal Unrolled inner loop, for when performance is critical
</member>
<member name="M:RakNet.BitStream.DoEndianSwap" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="703">
---- Member function template specialization declarations ----
</member>
<member name="M:RakNet.BitStream.WriteCompressed(System.Byte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="915">
\brief Assume the input source points to a native type, compress and write it.
</member>
<member name="M:RakNet.BitStream.ReadCompressed(System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="918">
\brief Assume the input source points to a compressed native type. Decompress and read it.
</member>
<member name="F:RakNet.BitStream.copyData" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="930">
true if the internal buffer is copy of the data passed to the constructor
</member>
<member name="F:RakNet.BitStream.stackData" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\rak\bitstream.h" line="933">
BitStreams that use less than BITSTREAM_STACK_ALLOCATION_SIZE use the stack, rather than the heap to store data.  It switches over if BITSTREAM_STACK_ALLOCATION_SIZE is exceeded
</member>
</members>
</doc>