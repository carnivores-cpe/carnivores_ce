<?xml version="1.0"?>
<doc>
<members>
<member name="F:ID_INTERNAL_PING" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="43">
These types are never returned to the user.
Ping from a connected system.  Update timestamps (internal use only)
</member>
<member name="F:ID_PING" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="46">
Ping from an unconnected system.  Reply but do not update timestamps. (internal use only)
</member>
<member name="F:ID_PING_OPEN_CONNECTIONS" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="48">
Ping from an unconnected system.  Only reply if we have open connections. Do not update timestamps. (internal use only)
</member>
<member name="F:ID_CONNECTED_PONG" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="50">
Pong from a connected system.  Update timestamps (internal use only)
</member>
<member name="F:ID_CONNECTION_REQUEST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="52">
Asking for a new connection (internal use only)
</member>
<member name="F:ID_SECURED_CONNECTION_RESPONSE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="54">
Connecting to a secured server/peer (internal use only)
</member>
<member name="F:ID_SECURED_CONNECTION_CONFIRMATION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="56">
Connecting to a secured server/peer (internal use only)
</member>
<member name="F:ID_RPC_MAPPING" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="58">
Packet that tells us the packet contains an integer ID to name mapping for the remote system (internal use only)
</member>
<member name="F:ID_DETECT_LOST_CONNECTIONS" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="60">
A reliable packet to detect lost connections (internal use only)
</member>
<member name="F:ID_OPEN_CONNECTION_REQUEST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="62">
Offline message so we know when to reset and start a new connection (internal use only)
</member>
<member name="F:ID_OPEN_CONNECTION_REPLY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="64">
Offline message response so we know when to reset and start a new connection (internal use only)
</member>
<member name="F:ID_RPC" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="66">
Remote procedure call (internal use only)
</member>
<member name="F:ID_RPC_REPLY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="68">
Remote procedure call reply, for RPCs that return data (internal use only)
</member>
<member name="F:ID_OUT_OF_BAND_INTERNAL" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="70">
RakPeer - Same as ID_ADVERTISE_SYSTEM, but intended for internal use rather than being passed to the user. Second byte indicates type. Used currently for NAT punchthrough for receiver port advertisement. See ID_NAT_ADVERTISE_RECIPIENT_PORT
</member>
<member name="F:ID_CONNECTION_REQUEST_ACCEPTED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="78">
RakPeer - In a client/server environment, our connection request to the server has been accepted.
</member>
<member name="F:ID_CONNECTION_ATTEMPT_FAILED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="80">
RakPeer - Sent to the player when a connection request cannot be completed due to inability to connect. 
</member>
<member name="F:ID_ALREADY_CONNECTED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="82">
RakPeer - Sent a connect request to a system we are currently connected to.
</member>
<member name="F:ID_NEW_INCOMING_CONNECTION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="84">
RakPeer - A remote system has successfully connected.
</member>
<member name="F:ID_NO_FREE_INCOMING_CONNECTIONS" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="86">
RakPeer - The system we attempted to connect to is not accepting new connections.
</member>
<member name="F:ID_DISCONNECTION_NOTIFICATION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="88">
RakPeer - The system specified in Packet::systemAddress has disconnected from us.  For the client, this would mean the server has shutdown. 
</member>
<member name="F:ID_CONNECTION_LOST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="90">
RakPeer - Reliable packets cannot be delivered to the system specified in Packet::systemAddress.  The connection to that system has been closed. 
</member>
<member name="F:ID_RSA_PUBLIC_KEY_MISMATCH" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="92">
RakPeer - We preset an RSA public key which does not match what the system we connected to is using.
</member>
<member name="F:ID_CONNECTION_BANNED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="94">
RakPeer - We are banned from the system we attempted to connect to.
</member>
<member name="F:ID_INVALID_PASSWORD" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="96">
RakPeer - The remote system is using a password and has refused our connection because we did not set the correct password.
</member>
<member name="F:ID_MODIFIED_PACKET" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="98">
RakPeer - A packet has been tampered with in transit.  The sender is contained in Packet::systemAddress.
</member>
<member name="F:ID_TIMESTAMP" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="100">
RakPeer - The four bytes following this byte represent an unsigned int which is automatically modified by the difference in system times between the sender and the recipient. Requires that you call SetOccasionalPing.
</member>
<member name="F:ID_PONG" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="102">
RakPeer - Pong from an unconnected system.  First byte is ID_PONG, second sizeof(RakNetTime) bytes is the ping, following bytes is system specific enumeration data.
</member>
<member name="F:ID_ADVERTISE_SYSTEM" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="104">
RakPeer - Inform a remote system of our IP/Port, plus some offline data
</member>
<member name="F:ID_REMOTE_DISCONNECTION_NOTIFICATION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="106">
ConnectionGraph plugin - In a client/server environment, a client other than ourselves has disconnected gracefully.  Packet::systemAddress is modified to reflect the systemAddress of this client.
</member>
<member name="F:ID_REMOTE_CONNECTION_LOST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="108">
ConnectionGraph plugin - In a client/server environment, a client other than ourselves has been forcefully dropped. Packet::systemAddress is modified to reflect the systemAddress of this client.
</member>
<member name="F:ID_REMOTE_NEW_INCOMING_CONNECTION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="110">
ConnectionGraph plugin - In a client/server environment, a client other than ourselves has connected.  Packet::systemAddress is modified to reflect the systemAddress of the client that is not connected directly to us. The packet encoding is SystemAddress 1, ConnectionGraphGroupID 1, SystemAddress 2, ConnectionGraphGroupID 2
</member>
<member name="F:ID_FILE_LIST_TRANSFER_HEADER" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="115">
FileListTransfer plugin - Setup data
</member>
<member name="F:ID_FILE_LIST_TRANSFER_FILE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="117">
FileListTransfer plugin - A file
</member>
<member name="F:ID_DDT_DOWNLOAD_REQUEST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="120">
DirectoryDeltaTransfer plugin - Request from a remote system for a download of a directory
</member>
<member name="F:ID_TRANSPORT_STRING" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="123">
RakNetTransport plugin - Transport provider message, used for remote console
</member>
<member name="F:ID_REPLICA_MANAGER_CONSTRUCTION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="126">
ReplicaManager plugin - Create an object
</member>
<member name="F:ID_REPLICA_MANAGER_DESTRUCTION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="128">
ReplicaManager plugin - Destroy an object
</member>
<member name="F:ID_REPLICA_MANAGER_SCOPE_CHANGE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="130">
ReplicaManager plugin - Changed scope of an object
</member>
<member name="F:ID_REPLICA_MANAGER_SERIALIZE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="132">
ReplicaManager plugin - Serialized data of an object
</member>
<member name="F:ID_REPLICA_MANAGER_DOWNLOAD_STARTED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="134">
ReplicaManager plugin - New connection, about to send all world objects
</member>
<member name="F:ID_REPLICA_MANAGER_DOWNLOAD_COMPLETE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="136">
ReplicaManager plugin - Finished downloading all serialized objects
</member>
<member name="F:ID_CONNECTION_GRAPH_REQUEST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="139">
ConnectionGraph plugin - Request the connection graph from another system
</member>
<member name="F:ID_CONNECTION_GRAPH_REPLY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="141">
ConnectionGraph plugin - Reply to a connection graph download request
</member>
<member name="F:ID_CONNECTION_GRAPH_UPDATE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="143">
ConnectionGraph plugin - Update edges / nodes for a system with a connection graph
</member>
<member name="F:ID_CONNECTION_GRAPH_NEW_CONNECTION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="145">
ConnectionGraph plugin - Add a new connection to a connection graph
</member>
<member name="F:ID_CONNECTION_GRAPH_CONNECTION_LOST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="147">
ConnectionGraph plugin - Remove a connection from a connection graph - connection was abruptly lost
</member>
<member name="F:ID_CONNECTION_GRAPH_DISCONNECTION_NOTIFICATION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="149">
ConnectionGraph plugin - Remove a connection from a connection graph - connection was gracefully lost
</member>
<member name="F:ID_ROUTE_AND_MULTICAST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="152">
Router plugin - route a message through another system
</member>
<member name="F:ID_RAKVOICE_OPEN_CHANNEL_REQUEST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="155">
RakVoice plugin - Open a communication channel
</member>
<member name="F:ID_RAKVOICE_OPEN_CHANNEL_REPLY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="157">
RakVoice plugin - Communication channel accepted
</member>
<member name="F:ID_RAKVOICE_CLOSE_CHANNEL" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="159">
RakVoice plugin - Close a communication channel
</member>
<member name="F:ID_RAKVOICE_DATA" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="161">
RakVoice plugin - Voice data
</member>
<member name="F:ID_AUTOPATCHER_GET_CHANGELIST_SINCE_DATE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="164">
Autopatcher plugin - Get a list of files that have changed since a certain date
</member>
<member name="F:ID_AUTOPATCHER_CREATION_LIST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="166">
Autopatcher plugin - A list of files to create
</member>
<member name="F:ID_AUTOPATCHER_DELETION_LIST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="168">
Autopatcher plugin - A list of files to delete
</member>
<member name="F:ID_AUTOPATCHER_GET_PATCH" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="170">
Autopatcher plugin - A list of files to get patches for
</member>
<member name="F:ID_AUTOPATCHER_PATCH_LIST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="172">
Autopatcher plugin - A list of patches for a list of files
</member>
<member name="F:ID_AUTOPATCHER_REPOSITORY_FATAL_ERROR" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="174">
Autopatcher plugin - Returned to the user: An error from the database repository for the autopatcher.
</member>
<member name="F:ID_AUTOPATCHER_FINISHED_INTERNAL" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="176">
Autopatcher plugin - Finished getting all files from the autopatcher
</member>
<member name="F:ID_AUTOPATCHER_RESTART_APPLICATION" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="179">
Autopatcher plugin - Returned to the user: You must restart the application to finish patching.
</member>
<member name="F:ID_NAT_PUNCHTHROUGH_REQUEST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="182">
NATPunchthrough plugin - Intermediary got a request to help punch through a nat
</member>
<member name="F:ID_NAT_TARGET_NOT_CONNECTED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="184">
NATPunchthrough plugin - Intermediary cannot complete the request because the target system is not connected
</member>
<member name="F:ID_NAT_TARGET_CONNECTION_LOST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="186">
NATPunchthrough plugin - While attempting to connect, we lost the connection to the target system
</member>
<member name="F:ID_NAT_CONNECT_AT_TIME" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="188">
NATPunchthrough plugin - Internal message to connect at a certain time
</member>
<member name="F:ID_NAT_SEND_OFFLINE_MESSAGE_AT_TIME" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="190">
NATPunchthrough plugin - Internal message to send a message (to punch through the nat) at a certain time
</member>
<member name="F:ID_NAT_IN_PROGRESS" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="192">
NATPunchthrough plugin - The facilitator is already attempting this connection
</member>
<member name="F:ID_DATABASE_QUERY_REQUEST" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="195">
LightweightDatabase plugin - Query
</member>
<member name="F:ID_DATABASE_UPDATE_ROW" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="197">
LightweightDatabase plugin - Update
</member>
<member name="F:ID_DATABASE_REMOVE_ROW" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="199">
LightweightDatabase plugin - Remove
</member>
<member name="F:ID_DATABASE_QUERY_REPLY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="201">
LightweightDatabase plugin - A serialized table.  Bytes 1+ contain the table.  Pass to TableSerializer::DeserializeTable
</member>
<member name="F:ID_DATABASE_UNKNOWN_TABLE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="203">
LightweightDatabase plugin - Specified table not found
</member>
<member name="F:ID_DATABASE_INCORRECT_PASSWORD" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="205">
LightweightDatabase plugin - Incorrect password
</member>
<member name="F:ID_READY_EVENT_SET" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="208">
ReadyEvent plugin - Set the ready state for a particular system
</member>
<member name="F:ID_READY_EVENT_UNSET" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="210">
ReadyEvent plugin - Unset the ready state for a particular system
</member>
<member name="F:ID_READY_EVENT_ALL_SET" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="212">
All systems are in state ID_READY_EVENT_SET
</member>
<member name="F:ID_READY_EVENT_QUERY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="214">
ReadyEvent plugin - Request of ready event state - used for pulling data when newly connecting
</member>
<member name="F:ID_LOBBY_GENERAL" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="217">
Lobby packets. Second byte indicates type.
</member>
<member name="F:ID_AUTO_RPC_CALL" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="220">
Auto RPC procedure call
</member>
<member name="F:ID_AUTO_RPC_REMOTE_INDEX" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="223">
Auto RPC functionName to index mapping
</member>
<member name="F:ID_AUTO_RPC_UNKNOWN_REMOTE_INDEX" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="226">
Auto RPC functionName to index mapping, lookup failed. Will try to auto recover
</member>
<member name="F:ID_RPC_REMOTE_ERROR" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="229">
Auto RPC error code
See AutoRPC.h for codes, stored in packet-&gt;data[1]
</member>
<member name="F:ID_FILE_LIST_REFERENCE_PUSH" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="233">
FileListTransfer transferring large files in chunks that are read only when needed, to save memory
</member>
<member name="F:ID_READY_EVENT_FORCE_ALL_SET" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="236">
Force the ready event to all set
</member>
<member name="T:DefaultMessageIDTypes" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\messageidentifiers.h" line="1">
\file
\brief All the message identifiers used by RakNet.  Message identifiers comprise the first byte of any message.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
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
<member name="T:RakPeerInterface" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetworkfactory.h" line="1">
\file
\brief Factory class for RakNet objects

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
</member>
<member name="F:SYSTEM_PRIORITY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="24">
\internal Used by RakNet to send above-high priority messages.
</member>
<member name="F:HIGH_PRIORITY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="27">
High priority messages are send before medium priority messages.
</member>
<member name="F:MEDIUM_PRIORITY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="30">
Medium priority messages are send before low priority messages.
</member>
<member name="F:LOW_PRIORITY" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="33">
Low priority messages are only sent when no other messages are waiting.
</member>
<member name="F:NUMBER_OF_PRIORITIES" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="36">
\internal
</member>
<member name="T:PacketPriority" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="1">
\file
\brief An interface for RakPeer.  Simply contains all user functions as pure virtuals.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
\file
\brief This file contains enumerations for packet priority and reliability enumerations.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
These enumerations are used to describe when packets are delivered.
</member>
<member name="F:UNRELIABLE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="44">
Same as regular UDP, except that it will also discard duplicate datagrams.  RakNet adds (6 to 17) + 21 bits of overhead, 16 of which is used to detect duplicate packets and 6 to 17 of which is used for message length.
</member>
<member name="F:UNRELIABLE_SEQUENCED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="47">
Regular UDP with a sequence counter.  Out of order messages will be discarded.  This adds an additional 13 bits on top what is used for UNRELIABLE.
</member>
<member name="F:RELIABLE" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="50">
The message is sent reliably, but not necessarily in any order.  Same overhead as UNRELIABLE.
</member>
<member name="F:RELIABLE_ORDERED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="53">
This message is reliable and will arrive in the order you sent it.  Messages will be delayed while waiting for out of order messages.  Same overhead as UNRELIABLE_SEQUENCED.
</member>
<member name="F:RELIABLE_SEQUENCED" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="56">
This message is reliable and will arrive in the sequence you sent it.  Out or order messages will be dropped.  Same overhead as UNRELIABLE_SEQUENCED.
</member>
<member name="F:NUMBER_OF_RELIABILITIES" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="59">
\internal
</member>
<member name="T:PacketReliability" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\packetpriority.h" line="40">
These enumerations are used to describe how packets are delivered.
\note  Note to self: I write this with 3 bits in the stream.  If I add more remember to change that
</member>
<member name="D:uint8_t" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="1">
\file
\brief Types used by RakNet, most of which involve user code.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
Define __GET_TIME_64BIT to have RakNetTime use a 64, rather than 32 bit value.  A 32 bit value will overflow after about 5 weeks.
However, this doubles the bandwidth use for sending times, so don't do it unless you have a reason to.
Disabled by default.
Makes RakNet threadsafe
Define this if you use the same instance of RakPeer from multiple threads
Otherwise leave it undefined, since it makes things an order of magnitude slower.
Disabled by default
Define __BITSTREAM_NATIVE_END to NOT support endian swapping in the BitStream class.  This is faster and is what you should use
unless you actually plan to have different endianness systems connect to each other
Enabled by default.
Maximum (stack) size to use with _alloca before using new and delete instead.
Uncomment to use RakMemoryOverride for custom memory tracking
See RakMemoryOverride.h. 
If defined, RakNet will automatically try to determine available bandwidth and buffer accordingly (recommended)
If commented out, you will probably not be able to send large files and will get increased packetloss. However, responsiveness for the first 10 seconds or so will be improved.
If defined, OpenSSL is enabled for the class TCPInterface
This is necessary to use the SendEmail class with Google POP servers
Note that OpenSSL carries its own license restrictions that you should be aware of. If you don't agree, don't enable this define
This also requires that you enable header search paths to DependentExtensions\openssl-0.9.8g
#define OPEN_SSL_CLIENT_SUPPORT
Threshold at which to do a malloc / free rather than pushing data onto a fixed stack for the bitstream class
Arbitrary size, just picking something likely to be larger than most packets
</member>
<member name="D:UniqueIDType" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="35">
Given a number of bits, return how many bytes are needed to represent that.
\sa NetworkIDObject.h
</member>
<member name="D:MessageID" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="46">
First byte of a network message
</member>
<member name="T:SocketDescriptor" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="57">
Describes the local socket to use for RakPeer::Startup
</member>
<member name="F:SocketDescriptor.port" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="63">
The local port to bind to.  Pass 0 to have the OS autoassign a port.
</member>
<member name="F:SocketDescriptor.hostAddress" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="66">
The local network card address to bind to, such as "127.0.0.1".  Pass an empty string to use INADDR_ANY.
</member>
<member name="T:SystemAddress" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="70">
\brief Network address for a system
Corresponds to a network address
This is not necessarily a unique identifier. For example, if a system has both LAN and internet connections, the system may be identified by either one, depending on who is communicating
Use RakNetGUID for a unique per-instance of RakPeer to identify systems
</member>
<member name="F:SystemAddress.binaryAddress" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="76">
The peer address from inet_addr.
</member>
<member name="F:SystemAddress.port" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="78">
The port number
</member>
<member name="T:RakPeerInterface" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="108">
Size of SystemAddress data
</member>
<member name="T:RPCParameters" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="113">
All RPC functions have the same parameter list - this structure.
\depreciated Use the AutoRPC or RPC3 plugin instead
</member>
<member name="F:RPCParameters.input" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="117">
The data from the remote system
</member>
<member name="F:RPCParameters.numberOfBitsOfData" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="120">
How many bits long \a input is
</member>
<member name="F:RPCParameters.sender" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="123">
Which system called this RPC
</member>
<member name="F:RPCParameters.recipient" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="126">
Which instance of RakPeer (or a derived RakPeer or RakPeer) got this call
</member>
<member name="F:RPCParameters.functionName" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="131">
The name of the function that was called.
</member>
<member name="F:RPCParameters.replyToSender" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="134">
You can return values from RPC calls by writing them to this BitStream.
This is only sent back if the RPC call originally passed a BitStream to receive the reply.
If you do so and your send is reliable, it will block until you get a reply or you get disconnected from the system you are sending to, whichever is first.
If your send is not reliable, it will block for triple the ping time, or until you are disconnected, or you get a reply, whichever is first.
</member>
<member name="T:RakNetGUID" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="141">
Uniquely identifies an instance of RakPeer. Use RakPeer::GetGuidFromSystemAddress() and RakPeer::GetSystemAddressFromGuid() to go between SystemAddress and RakNetGUID
Use RakPeer::GetGuidFromSystemAddress(UNASSIGNED_SYSTSEM_ADDRESS) to get your own GUID
</member>
<member name="T:Packet" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="201">
This represents a user message from another system.
</member>
<member name="F:Packet.systemIndex" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="204">
Server only - this is the index into the player array that this systemAddress maps to
</member>
<member name="F:Packet.systemAddress" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="207">
The system that send this packet.
</member>
<member name="F:Packet.guid" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="210">
A unique identifier for the system that sent this packet, regardless of IP address (internal / external / remote system)
Only valid once a connection has been established (ID_CONNECTION_REQUEST_ACCEPTED, or ID_NEW_INCOMING_CONNECTION)
Until that time, will be UNASSIGNED_RAKNET_GUID
</member>
<member name="F:Packet.length" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="215">
The length of the data in bytes
\deprecated You should use bitSize.
</member>
<member name="F:Packet.bitSize" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="219">
The length of the data in bits
</member>
<member name="F:Packet.data" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="222">
The data from the sender
</member>
<member name="F:Packet.deleteData" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="225">
@internal
Indicates whether to delete the data, or to simply delete the packet.
</member>
<member name="F:UNASSIGNED_NETWORK_ID" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="244">
Unassigned object ID
</member>
<member name="T:RakPeerInterface" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="37">
The primary interface for RakNet, RakPeer contains all major functions for the library.
See the individual functions for what the class can do.
\brief The main interface for network communications
</member>
<member name="M:RakPeerInterface.Dispose" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="43">
Destructor
</member>
<member name="M:RakPeerInterface.Startup(System.UInt16,System.Int32,SocketDescriptor*,System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="47">
\brief Starts the network threads, opens the listen port.
You must call this before calling Connect().
Multiple calls while already active are ignored.  To call this function again with different settings, you must first call Shutdown().
\note Call SetMaximumIncomingConnections if you want to accept incoming connections
\note Set _RAKNET_THREADSAFE in RakNetDefines.h if you want to call RakNet functions from multiple threads (not recommended, as it is much slower and RakNet is already asynchronous).
\param[in] maxConnections The maximum number of connections between this instance of RakPeer and another instance of RakPeer. Required so the network can preallocate and for thread safety. A pure client would set this to 1.  A pure server would set it to the number of allowed clients.- A hybrid would set it to the sum of both types of connections
\param[in] localPort The port to listen for connections on.
\param[in] _threadSleepTimer How many ms to Sleep each internal update cycle (30 to give the game priority, 0 for regular (recommended)
\param[in] socketDescriptors An array of SocketDescriptor structures to force RakNet to listen on a particular IP address or port (or both).  Each SocketDescriptor will represent one unique socket.  Do not pass redundant structures.  To listen on a specific port, you can pass SocketDescriptor(myPort,0); such as for a server.  For a client, it is usually OK to just pass SocketDescriptor();
\param[in] socketDescriptorCount The size of the \a socketDescriptors array.  Pass 1 if you are not sure what to pass.
\return False on failure (can't create socket or thread), true on success.
</member>
<member name="M:RakPeerInterface.InitializeSecurity(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="60">
Secures connections though a combination of SHA1, AES128, SYN Cookies, and RSA to prevent connection spoofing, replay attacks, data eavesdropping, packet tampering, and MitM attacks.
There is a significant amount of processing and a slight amount of bandwidth overhead for this feature.
If you accept connections, you must call this or else secure connections will not be enabled for incoming connections.
If you are connecting to another system, you can call this with values for the (e and p,q) public keys before connecting to prevent MitM
\pre Must be called while offline
\param[in] pubKeyE A pointer to the public keys from the RSACrypt class.  
\param[in] pubKeyN A pointer to the public keys from the RSACrypt class. 
\param[in] privKeyP Public key generated from the RSACrypt class.  
\param[in] privKeyQ Public key generated from the RSACrypt class.  If the private keys are 0, then a new key will be generated when this function is called@see the Encryption sample
</member>
<member name="M:RakPeerInterface.DisableSecurity" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="71">
Disables all security.
\note Must be called while offline
</member>
<member name="M:RakPeerInterface.AddToSecurityExceptionList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="75">
If secure connections are on, do not use secure connections for a specific IP address.
This is useful if you have a fixed-address internal server behind a LAN.
\note Secure connections are determined by the recipient of an incoming connection. This has no effect if called on the system attempting to connect.
\param[in] ip IP address to add. * wildcards are supported.
</member>
<member name="M:RakPeerInterface.RemoveFromSecurityExceptionList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="81">
Remove a specific connection previously added via AddToSecurityExceptionList
\param[in] ip IP address to remove. Pass 0 to remove all IP addresses. * wildcards are supported.
</member>
<member name="M:RakPeerInterface.IsInSecurityExceptionList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="85">
Checks to see if a given IP is in the security exception list
\param[in] IP address to check.
</member>
<member name="M:RakPeerInterface.SetMaximumIncomingConnections(System.UInt16)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="89">
Sets how many incoming connections are allowed. If this is less than the number of players currently connected,
no more players will be allowed to connect.  If this is greater than the maximum number of peers allowed,
it will be reduced to the maximum number of peers allowed.
Defaults to 0, meaning by default, nobody can connect to you
\param[in] numberAllowed Maximum number of incoming connections allowed.
</member>
<!-- Discarding badly formed XML document comment for member 'M:RakPeerInterface.GetMaximumIncomingConnections'. -->
<member name="M:RakPeerInterface.NumberOfConnections" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="100">
Returns how many open connections there are at this time
\return the number of open connections
</member>
<member name="M:RakPeerInterface.SetIncomingPassword(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="104">
Sets the password incoming connections must match in the call to Connect (defaults to none). Pass 0 to passwordData to specify no password
This is a way to set a low level password for all incoming connections.  To selectively reject connections, implement your own scheme using CloseConnection() to remove unwanted connections
\param[in] passwordData A data block that incoming connections must match.  This can be just a password, or can be a stream of data. Specify 0 for no password data
\param[in] passwordDataLength The length in bytes of passwordData
</member>
<member name="M:RakPeerInterface.GetIncomingPassword(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.Int32*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="110">
Gets the password passed to SetIncomingPassword
\param[out] passwordData  Should point to a block large enough to hold the password data you passed to SetIncomingPassword()
\param[in,out] passwordDataLength Maximum size of the array passwordData.  Modified to hold the number of bytes actually written
</member>
<member name="M:RakPeerInterface.Connect(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32,System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="115">
\brief Connect to the specified host (ip or domain name) and server port.
Calling Connect and not calling SetMaximumIncomingConnections acts as a dedicated client.
Calling both acts as a true peer. This is a non-blocking connection.
You know the connection is successful when IsConnected() returns true or Receive() gets a message with the type identifier ID_CONNECTION_ACCEPTED.
If the connection is not successful, such as a rejected connection or no response then neither of these things will happen.
\pre Requires that you first call Initialize
\param[in] host Either a dotted IP address or a domain name
\param[in] remotePort Which port to connect to on the remote machine.
\param[in] passwordData A data block that must match the data block on the server passed to SetIncomingPassword.  This can be a string or can be a stream of data.  Use 0 for no password.
\param[in] passwordDataLength The length in bytes of passwordData
\param[in] connectionSocketIndex Index into the array of socket descriptors passed to socketDescriptors in RakPeer::Startup() to send on.
\return True on successful initiation. False on incorrect parameters, internal error, or too many existing peers.  Returning true does not mean you connected!
</member>
<member name="M:RakPeerInterface.Shutdown(System.UInt32,System.Byte)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="129">
\brief Connect to the specified network ID (Platform specific console function)
Does built-in NAt traversal
\param[in] passwordData A data block that must match the data block on the server passed to SetIncomingPassword.  This can be a string or can be a stream of data.  Use 0 for no password.
\param[in] passwordDataLength The length in bytes of passwordData
\brief Stops the network threads and closes all connections.
\param[in] blockDuration How long, in milliseconds, you should wait for all remaining messages to go out, including ID_DISCONNECTION_NOTIFICATION.  If 0, it doesn't wait at all.
\param[in] orderingChannel If blockDuration &gt; 0, ID_DISCONNECTION_NOTIFICATION will be sent on this channel
If you set it to 0 then the disconnection notification won't be sent
</member>
<member name="M:RakPeerInterface.IsActive" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="141">
Returns if the network thread is running
\return true if the network thread is running, false otherwise
</member>
<member name="M:RakPeerInterface.GetConnectionList(SystemAddress*,System.UInt16*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="145">
Fills the array remoteSystems with the SystemAddress of all the systems we are connected to
\param[out] remoteSystems An array of SystemAddress structures to be filled with the SystemAddresss of the systems we are connected to. Pass 0 to remoteSystems to only get the number of systems we are connected to
\param[in, out] numberOfSystems As input, the size of remoteSystems array.  As output, the number of elements put into the array 
</member>
<member name="M:RakPeerInterface.Send(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32!System.Runtime.CompilerServices.IsConst,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,SystemAddress,System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="150">
Sends a block of data to the specified system that you are connected to.
This function only works while the connected
The first byte should be a message identifier starting at ID_USER_PACKET_ENUM
\param[in] data The block of data to send
\param[in] length The size in bytes of the data to send
\param[in] priority What priority level to send on.  See PacketPriority.h
\param[in] reliability How reliability to send this data.  See PacketPriority.h
\param[in] orderingChannel When using ordered or sequenced messages, what channel to order these on. Messages are only ordered relative to other messages on the same stream
\param[in] systemAddress Who to send this packet to, or in the case of broadcasting who not to send it to.  Use UNASSIGNED_SYSTEM_ADDRESS to specify none
\param[in] broadcast True to send this packet to all connected systems. If true, then systemAddress specifies who not to send the packet to.
\return False if we are not connected to the specified recipient.  True otherwise
</member>
<member name="M:RakPeerInterface.SendLoopback(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="163">
"Send" to yourself rather than a remote system. The message will be processed through the plugins and returned to the game as usual
This function works anytime
The first byte should be a message identifier starting at ID_USER_PACKET_ENUM
\param[in] data The block of data to send
\param[in] length The size in bytes of the data to send
</member>
<member name="M:RakPeerInterface.Send(RakNet.BitStream!System.Runtime.CompilerServices.IsConst*,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,SystemAddress,System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="170">
Sends a block of data to the specified system that you are connected to.  Same as the above version, but takes a BitStream as input.
\param[in] bitStream The bitstream to send
\param[in] priority What priority level to send on.  See PacketPriority.h
\param[in] reliability How reliability to send this data.  See PacketPriority.h
\param[in] orderingChannel When using ordered or sequenced messages, what channel to order these on. Messages are only ordered relative to other messages on the same stream
\param[in] systemAddress Who to send this packet to, or in the case of broadcasting who not to send it to.  Use UNASSIGNED_SYSTEM_ADDRESS to specify none
\param[in] broadcast True to send this packet to all connected systems. If true, then systemAddress specifies who not to send the packet to.
\return False if we are not connected to the specified recipient.  True otherwise
\note COMMON MISTAKE: When writing the first byte, bitStream-&gt;Write((unsigned char) ID_MY_TYPE) be sure it is casted to a byte, and you are not writing a 4 byte enumeration.
</member>
<!-- Discarding badly formed XML document comment for member 'M:RakPeerInterface.SendList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte**,System.Int32!System.Runtime.CompilerServices.IsConst*,System.Int32!System.Runtime.CompilerServices.IsConst,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,SystemAddress,System.Boolean)'. -->
<member name="M:RakPeerInterface.Receive" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="202">
Gets a message from the incoming message queue.
Use DeallocatePacket() to deallocate the message after you are done with it.
User-thread functions, such as RPC calls and the plugin function PluginInterface::Update occur here.
\return 0 if no packets are waiting to be handled, otherwise a pointer to a packet.
\note COMMON MISTAKE: Be sure to call this in a loop, once per game tick, until it returns 0. If you only process one packet per game tick they will buffer up.
sa RakNetTypes.h contains struct Packet
</member>
<member name="M:RakPeerInterface.DeallocatePacket(Packet*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="210">
Call this to deallocate a message returned by Receive() when you are done handling it.
\param[in] packet The message to deallocate.	
</member>
<member name="M:RakPeerInterface.GetMaximumNumberOfPeers" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="214">
Return the total number of connections we are allowed
</member>
<member name="M:RakPeerInterface.RegisterAsRemoteProcedureCall(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,=FUNC:System.Void(RPCParameters*))" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="219">
\ingroup RAKNET_RPC
\depreciated Use the AutoRPC plugin instead
Register a C or static member function as available for calling as a remote procedure call
\param[in] uniqueID A null-terminated unique string to identify this procedure.  See RegisterClassMemberRPC() for class member functions.
\param[in] functionPointer(...) The name of the function to be used as a function pointer. This can be called whether active or not, and registered functions stay registered unless unregistered
</member>
<member name="M:RakPeerInterface.RegisterClassMemberRPC(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Void*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="226">
\ingroup RAKNET_RPC
\depreciated Use the AutoRPC plugin instead
Register a C++ member function as available for calling as a remote procedure call.
\param[in] uniqueID A null terminated string to identify this procedure. Recommended you use the macro REGISTER_CLASS_MEMBER_RPC to create the string.  Use RegisterAsRemoteProcedureCall() for static functions.
\param[in] functionPointer The name of the function to be used as a function pointer. This can be called whether active or not, and registered functions stay registered unless unregistered with UnregisterAsRemoteProcedureCall
\sa The sample ObjectMemberRPC.cpp
</member>
<member name="M:RakPeerInterface.UnregisterAsRemoteProcedureCall(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="234">
\ingroup RAKNET_RPC
\depreciated Use the AutoRPC plugin instead
Unregisters a C function as available for calling as a remote procedure call that was formerly registered with RegisterAsRemoteProcedureCall. Only call offline.
\param[in] uniqueID A string of only letters to identify this procedure.  Recommended you use the macro CLASS_MEMBER_ID for class member functions.
</member>
<member name="M:RakPeerInterface.SetNetworkIDManager(NetworkIDManager*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="240">
\ingroup RAKNET_RPC
Used by Object member RPC to lookup objects given that object's ID
Also used by the ReplicaManager plugin
\param[in] An instance of NetworkIDManager to use for the lookup.
</member>
<member name="M:RakPeerInterface.GetNetworkIDManager" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="246">
\return Returns the value passed to SetNetworkIDManager or 0 if never called.
</member>
<member name="M:RakPeerInterface.RPC(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,SystemAddress,System.Boolean,System.UInt32*,NetworkID,RakNet.BitStream*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="249">
\ingroup RAKNET_RPC
Calls a C function on the remote system that was already registered using RegisterAsRemoteProcedureCall().
\param[in] uniqueID A NULL terminated string identifying the function to call.  Recommended you use the macro CLASS_MEMBER_ID for class member functions.
\param[in] data The data to send
\param[in] bitLength The number of bits of \a data
\param[in] priority What priority level to send on. See PacketPriority.h.
\param[in] reliability How reliability to send this data. See PacketPriority.h.
\param[in] orderingChannel When using ordered or sequenced message, what channel to order these on.
\param[in] systemAddress Who to send this message to, or in the case of broadcasting who not to send it to.  Use UNASSIGNED_SYSTEM_ADDRESS to specify none
\param[in] broadcast True to send this packet to all connected systems. If true, then systemAddress specifies who not to send the packet to.
\param[in] includedTimestamp Pass a timestamp if you wish, to be adjusted in the usual fashion as per ID_TIMESTAMP.  Pass 0 to not include a timestamp.
\param[in] networkID For static functions, pass UNASSIGNED_NETWORK_ID.  For member functions, you must derive from NetworkIDObject and pass the value returned by NetworkIDObject::GetNetworkID for that object.
\param[in] replyFromTarget If 0, this function is non-blocking.  Otherwise it will block while waiting for a reply from the target procedure, which should be remotely written to RPCParameters::replyToSender and copied to replyFromTarget.  The block will return early on disconnect or if the sent packet is unreliable and more than 3X the ping has elapsed.
\return True on a successful packet send (this does not indicate the recipient performed the call), false on failure
</member>
<member name="M:RakPeerInterface.RPC(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,RakNet.BitStream!System.Runtime.CompilerServices.IsConst*,PacketPriority,PacketReliability,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,SystemAddress,System.Boolean,System.UInt32*,NetworkID,RakNet.BitStream*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="265">
\ingroup RAKNET_RPC
Calls a C function on the remote system that was already registered using RegisterAsRemoteProcedureCall.
If you want that function to return data you should call RPC from that system in the same wayReturns true on a successful packet
send (this does not indicate the recipient performed the call), false on failure
\param[in] uniqueID A NULL terminated string identifying the function to call.  Recommended you use the macro CLASS_MEMBER_ID for class member functions.
\param[in] data The data to send
\param[in] bitLength The number of bits of \a data
\param[in] priority What priority level to send on. See PacketPriority.h.
\param[in] reliability How reliability to send this data. See PacketPriority.h.
\param[in] orderingChannel When using ordered or sequenced message, what channel to order these on.
\param[in] systemAddress Who to send this message to, or in the case of broadcasting who not to send it to.  Use UNASSIGNED_SYSTEM_ADDRESS to specify none
\param[in] broadcast True to send this packet to all connected systems. If true, then systemAddress specifies who not to send the packet to.
\param[in] includedTimestamp Pass a timestamp if you wish, to be adjusted in the usual fashion as per ID_TIMESTAMP.  Pass 0 to not include a timestamp.
\param[in] networkID For static functions, pass UNASSIGNED_NETWORK_ID.  For member functions, you must derive from NetworkIDObject and pass the value returned by NetworkIDObject::GetNetworkID for that object.
\param[in] replyFromTarget If 0, this function is non-blocking.  Otherwise it will block while waiting for a reply from the target procedure, which should be remotely written to RPCParameters::replyToSender and copied to replyFromTarget.  The block will return early on disconnect or if the sent packet is unreliable and more than 3X the ping has elapsed.
\return True on a successful packet send (this does not indicate the recipient performed the call), false on failure
</member>
<member name="M:RakPeerInterface.CloseConnection(SystemAddress!System.Runtime.CompilerServices.IsConst,System.Boolean,System.Byte)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="284">
Close the connection to another host (if we initiated the connection it will disconnect, if they did it will kick them out).
\param[in] target Which system to close the connection to.
\param[in] sendDisconnectionNotification True to send ID_DISCONNECTION_NOTIFICATION to the recipient.  False to close it silently.
\param[in] channel Which ordering channel to send the disconnection notification on, if any
</member>
<member name="M:RakPeerInterface.IsConnected(SystemAddress!System.Runtime.CompilerServices.IsConst,System.Boolean,System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="290">
Returns if a particular systemAddress is connected to us (this also returns true if we are in the process of connecting)
\param[in] systemAddress The SystemAddress we are referring to
\param[in] includeInProgress If true, also return true for connections that are in progress but haven't completed
\param[in] includeDisconnecting If true, also return true for connections that are in the process of disconnecting
\return True if this system is connected and active, false otherwise.
</member>
<member name="M:RakPeerInterface.GetIndexFromSystemAddress(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="297">
Given a systemAddress, returns an index from 0 to the maximum number of players allowed - 1.
\param[in] systemAddress The SystemAddress we are referring to
\return The index of this SystemAddress or -1 on system not found.
</member>
<member name="M:RakPeerInterface.GetSystemAddressFromIndex(System.Int32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="302">
This function is only useful for looping through all systems
Given an index, will return a SystemAddress.
\param[in] index Index should range between 0 and the maximum number of players allowed - 1.
\return The SystemAddress
</member>
<member name="M:RakPeerInterface.AddToBanList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="308">
Bans an IP from connecting.  Banned IPs persist between connections but are not saved on shutdown nor loaded on startup.
param[in] IP Dotted IP address. Can use * as a wildcard, such as 128.0.0.* will ban all IP addresses starting with 128.0.0
\param[in] milliseconds how many ms for a temporary ban.  Use 0 for a permanent ban
</member>
<member name="M:RakPeerInterface.RemoveFromBanList(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="313">
Allows a previously banned IP to connect. 
param[in] Dotted IP address. Can use * as a wildcard, such as 128.0.0.* will banAll IP addresses starting with 128.0.0
</member>
<member name="M:RakPeerInterface.ClearBanList" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="317">
Allows all previously banned IPs to connect.
</member>
<member name="M:RakPeerInterface.IsBanned(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="320">
Returns true or false indicating if a particular IP is banned.
\param[in] IP - Dotted IP address.
\return true if IP matches any IPs in the ban list, accounting for any wildcards. False otherwise.
</member>
<member name="M:RakPeerInterface.Ping(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="326">
Send a ping to the specified connected system.
\pre The sender and recipient must already be started via a successful call to Startup()
\param[in] target Which system to ping
</member>
<member name="M:RakPeerInterface.Ping(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.Boolean,System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="331">
Send a ping to the specified unconnected system. The remote system, if it is Initialized, will respond with ID_PONG followed by sizeof(RakNetTime) containing the system time the ping was sent.(Default is 4 bytes - See __GET_TIME_64BIT in RakNetTypes.h
\param[in] host Either a dotted IP address or a domain name.  Can be 255.255.255.255 for LAN broadcast.
\param[in] remotePort Which port to connect to on the remote machine.
\param[in] onlyReplyOnAcceptingConnections Only request a reply if the remote system is accepting connections
\param[in] connectionSocketIndex Index into the array of socket descriptors passed to socketDescriptors in RakPeer::Startup() to send on.
\return true on success, false on failure (unknown hostname)
</member>
<member name="M:RakPeerInterface.GetAveragePing(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="339">
Returns the average of all ping times read for the specific system or -1 if none read yet
\param[in] systemAddress Which system we are referring to
\return The ping time for this system, or -1
</member>
<member name="M:RakPeerInterface.GetLastPing(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="344">
Returns the last ping time read for the specific system or -1 if none read yet
\param[in] systemAddress Which system we are referring to
\return The last ping time for this system, or -1
</member>
<member name="M:RakPeerInterface.GetLowestPing(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="349">
Returns the lowest ping time read or -1 if none read yet
\param[in] systemAddress Which system we are referring to
\return The lowest ping time for this system, or -1
</member>
<member name="M:RakPeerInterface.SetOccasionalPing(System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="354">
Ping the remote systems every so often, or not. This is off by default.  Can be called anytime.
\param[in] doPing True to start occasional pings.  False to stop them.
</member>
<member name="M:RakPeerInterface.SetOfflinePingResponse(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="359">
Sets the data to send along with a LAN server discovery or offline ping reply.
\a length should be under 400 bytes, as a security measure against flood attacks
\param[in] data a block of data to store, or 0 for none
\param[in] length The length of data in bytes, or 0 for none
\sa Ping.cpp
</member>
<member name="M:RakPeerInterface.GetOfflinePingResponse(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte**,System.UInt32*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="366">
Returns pointers to a copy of the data passed to SetOfflinePingResponse
\param[out] data A pointer to a copy of the data passed to \a SetOfflinePingResponse()
\param[out] length A pointer filled in with the length parameter passed to SetOfflinePingResponse()
\sa SetOfflinePingResponse
</member>
<member name="M:RakPeerInterface.GetInternalID(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="373">
Return the unique address identifier that represents you on the the network and is based on your local IP / port.
\return the identifier of your system internally, which may not be how other systems see if you if you are behind a NAT or proxy
</member>
<member name="M:RakPeerInterface.GetExternalID(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="377">
Return the unique address identifier that represents you on the the network and is based on your externalIP / port
(the IP / port the specified player uses to communicate with you)
\param[in] target Which remote system you are referring to for your external ID.  Usually the same for all systems, unless you have two or more network cards.
</member>
<member name="M:RakPeerInterface.GetGuidFromSystemAddress(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="382">
Given a connected system, give us the unique GUID representing that instance of RakPeer.
This will be the same on all systems connected to that instance of RakPeer, even if the external system addresses are different
Currently O(log(n)), but this may be improved in the future. If you use this frequently, you may want to cache the value as it won't change.
If \a input is UNASSIGNED_SYSTEM_ADDRESS, will return your own GUID
\pre Call Startup() first, or the function will return UNASSIGNED_RAKNET_GUID
\param[in] input The system address of the system we are connected to
</member>
<member name="M:RakPeerInterface.GetSystemAddressFromGuid(RakNetGUID!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="390">
Given the GUID of a connected system, give us the system address of that system.
The GUID will be the same on all systems connected to that instance of RakPeer, even if the external system addresses are different
Currently O(log(n)), but this may be improved in the future. If you use this frequently, you may want to cache the value as it won't change.
If \a input is UNASSIGNED_RAKNET_GUID, will return UNASSIGNED_SYSTEM_ADDRESS
\param[in] input The RakNetGUID of the system we are checking to see if we are connected to
</member>
<member name="M:RakPeerInterface.SetTimeoutTime(System.UInt32,SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="397">
Set the time, in MS, to use before considering ourselves disconnected after not being able to deliver a reliable message.
Default time is 10,000 or 10 seconds in release and 30,000 or 30 seconds in debug.
\param[in] timeMS Time, in MS
\param[in] target Which system to do this for. Pass UNASSIGNED_SYSTEM_ADDRESS for all systems.
</member>
<member name="M:RakPeerInterface.SetMTUSize(System.Int32,SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="403">
Set the MTU per datagram.  It's important to set this correctly - otherwise packets will be needlessly split, decreasing performance and throughput.
Maximum allowed size is MAXIMUM_MTU_SIZE.
Too high of a value will cause packets not to arrive at worst and be fragmented at best.
Too low of a value will split packets unnecessarily.
Recommended size is 1500
sa MTUSize.h
\param[in] size The MTU size
\param[in] target Which system to set this for.  UNASSIGNED_SYSTEM_ADDRESS to set the default, for new systems
\pre Can only be called when not connected.
\return false on failure (we are connected), else true
</member>
<member name="M:RakPeerInterface.GetMTUSize(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="415">
Returns the current MTU size
\param[in] target Which system to get this for.  UNASSIGNED_SYSTEM_ADDRESS to get the default
\return The current MTU size
</member>
<member name="M:RakPeerInterface.GetNumberOfAddresses" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="420">
Returns the number of IP addresses this system has internally. Get the actual addresses from GetLocalIP()
</member>
<member name="M:RakPeerInterface.GetLocalIP(System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="423">
Returns an IP address at index 0 to GetNumberOfAddresses-1
\param[in] index index into the list of IP addresses
\return The local IP address at this index
</member>
<member name="M:RakPeerInterface.IsLocalIP(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="428">
Is this a local IP?
\param[in] An IP address to check, excluding the port
\return True if this is one of the IP addresses returned by GetLocalIP
</member>
<member name="M:RakPeerInterface.AllowConnectionResponseIPMigration(System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="433">
Allow or disallow connection responses from any IP. Normally this should be false, but may be necessary
when connecting to servers with multiple IP addresses.
\param[in] allow - True to allow this behavior, false to not allow. Defaults to false. Value persists between connections
</member>
<member name="M:RakPeerInterface.AdvertiseSystem(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Int32,System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="438">
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
<member name="M:RakPeerInterface.SetSplitMessageProgressInterval(System.Int32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="449">
Controls how often to return ID_DOWNLOAD_PROGRESS for large message downloads.
ID_DOWNLOAD_PROGRESS is returned to indicate a new partial message chunk, roughly the MTU size, has arrived
As it can be slow or cumbersome to get this notification for every chunk, you can set the interval at which it is returned.
Defaults to 0 (never return this notification)
\param[in] interval How many messages to use as an interval
</member>
<member name="M:RakPeerInterface.GetSplitMessageProgressInterval" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="456">
Returns what was passed to SetSplitMessageProgressInterval()
\return What was passed to SetSplitMessageProgressInterval(). Default to 0.
</member>
<member name="M:RakPeerInterface.SetUnreliableTimeout(System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="460">
Set how long to wait before giving up on sending an unreliable message
Useful if the network is clogged up.
Set to 0 or less to never timeout.  Defaults to 0.
\param[in] timeoutMS How many ms to wait before simply not sending an unreliable message.
</member>
<member name="M:RakPeerInterface.SendTTL(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.Int32,System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="466">
Send a message to host, with the IP socket option TTL set to 3
This message will not reach the host, but will open the router.
Used for NAT-Punchthrough
</member>
<member name="M:RakPeerInterface.SetCompileFrequencyTable(System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="472">
Enables or disables frequency table tracking.  This is required to get a frequency table, which is used in GenerateCompressionLayer()
This value persists between connect calls and defaults to false (no frequency tracking)
\pre You can call this at any time - however you SHOULD only call it when disconnected.  Otherwise you will only trackpart of the values sent over the network.
\param[in] doCompile True to enable tracking 
</member>
<member name="M:RakPeerInterface.GetOutgoingFrequencyTable(System.UInt32*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="478">
Returns the frequency of outgoing bytes into output frequency table
The purpose is to save to file as either a master frequency table from a sample game session for passing to
GenerateCompressionLayer() 
\pre You should only call this when disconnected. Requires that you first enable data frequency tracking by calling SetCompileFrequencyTable(true)
\param[out] outputFrequencyTable  The frequency of each corresponding byte
\return False (failure) if connected or if frequency table tracking is not enabled. Otherwise true (success)
</member>
<member name="M:RakPeerInterface.GenerateCompressionLayer(System.UInt32*,System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="486">
This is an optional function to generate the compression layer based on the input frequency table.
If you want to use it you should call this twice - once with inputLayer as true and once as false.
The frequency table passed here with inputLayer=true should match the frequency table on the recipient with inputLayer=false.
Likewise, the frequency table passed here with inputLayer=false should match the frequency table on the recipient with inputLayer=true.
Calling this function when there is an existing layer will overwrite the old layer.
\pre You should only call this when disconnected
\param[in] inputFrequencyTable A frequency table for your data
\param[in] inputLayer Is this the input layer?
\return false (failure) if connected.  Otherwise true (success)
\sa Compression.cpp
</member>
<member name="M:RakPeerInterface.DeleteCompressionLayer(System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="498">
Delete the output or input layer as specified.  This is not necessary to call and is only valuable for freeing memory.
\pre You should only call this when disconnected
\param[in] inputLayer True to mean the inputLayer, false to mean the output layer
\return false (failure) if connected.  Otherwise true (success)
</member>
<member name="M:RakPeerInterface.GetCompressionRatio" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="504">
Returns the compression ratio. A low compression ratio is good.  Compression is for outgoing data
\return The compression ratio
</member>
<member name="M:RakPeerInterface.GetDecompressionRatio" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="508">
Returns the decompression ratio.  A high decompression ratio is good.  Decompression is for incoming data
\return The decompression ratio
</member>
<member name="M:RakPeerInterface.AttachPlugin(PluginInterface*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="513">
Attatches a Plugin interface to run code automatically on message receipt in the Receive call
\note If plugins have dependencies on each other then the order does matter - for example the router plugin should go first because it might route messages for other plugins
\param[in] messageHandler Pointer to a plugin to attach
</member>
<member name="M:RakPeerInterface.DetachPlugin(PluginInterface*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="518">
Detaches a Plugin interface to run code automatically on message receipt
\param[in] messageHandler Pointer to a plugin to detach
</member>
<member name="M:RakPeerInterface.PushBackPacket(Packet*,System.Boolean)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="523">
Put a message back at the end of the receive queue in case you don't want to deal with it immediately
\param[in] packet The packet you want to push back.
\param[in] pushAtHead True to push the packet so that the next receive call returns it.  False to push it at the end of the queue (obviously pushing it at the end makes the packets out of order)
</member>
<member name="M:RakPeerInterface.SetRouterInterface(RouterInterface*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="528">
\Internal
</member>
<member name="M:RakPeerInterface.RemoveRouterInterface(RouterInterface*)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="532">
\Internal
</member>
<member name="M:RakPeerInterface.AllocatePacket(System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="536">
\Returns a packet for you to write to if you want to create a Packet for some reason.
You can add it to the receive buffer with PushBackPacket
\param[in] dataSize How many bytes to allocate for the buffer
\return A packet you can write to
</member>
<member name="M:RakPeerInterface.ApplyNetworkSimulator(System.Double,System.UInt16,System.UInt16)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="543">
Adds simulated ping and packet loss to the outgoing data flow.
To simulate bi-directional ping and packet loss, you should call this on both the sender and the recipient, with half the total ping and maxSendBPS value on each.
You can exclude network simulator code with the _RELEASE #define to decrease code size
\depreciated Use http://www.jenkinssoftware.com/raknet/forum/index.php?topic=1671.0 instead.
\param[in] maxSendBPS Maximum bits per second to send.  Packetloss grows linearly.  0 to disable. (CURRENTLY BROKEN - ALWAYS DISABLED)
\param[in] minExtraPing The minimum time to delay sends.
\param[in] extraPingVariance The additional random time to delay sends.
</member>
<member name="M:RakPeerInterface.SetPerConnectionOutgoingBandwidthLimit(System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="552">
Limits how much outgoing bandwidth can be sent per-connection.
This limit does not apply to the sum of all connections!
Exceeding the limit queues up outgoing traffic
\param[in] maxBitsPerSecond Maximum bits per second to send.  Use 0 for unlimited (default). Once set, it takes effect immedately and persists until called again.
</member>
<member name="M:RakPeerInterface.IsNetworkSimulatorActive" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="558">
Returns if you previously called ApplyNetworkSimulator
\return If you previously called ApplyNetworkSimulator
</member>
<member name="M:RakPeerInterface.GetStatistics(SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="564">
Returns a structure containing a large set of network statistics for the specified system.
You can map this data to a string using the C style StatisticsToString() function
\param[in] systemAddress: Which connected system to get statistics for
\return 0 on can't find the specified system.  A pointer to a set of data otherwise.
\sa RakNetStatistics.h
</member>
<member name="M:RakPeerInterface.GetRPCString(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst,SystemAddress!System.Runtime.CompilerServices.IsConst)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="572">
\internal
</member>
<member name="M:RakPeerInterface.SendOutOfBand(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt16,System.Byte,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32,System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakpeerinterface.h" line="575">
\internal
</member>
<member name="T:RakNetStatistics" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="1">
\file
\brief A structure that holds all statistical data returned by RakNet.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
\file
\brief This file contains enumerations for packet priority and reliability enumerations.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
\file
\brief Types used by RakNet, most of which involve user code.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
\brief Network Statisics Usage 

Store Statistics information related to network usage 
</member>
<member name="F:RakNetStatistics.messageSendBuffer" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="31">
 Number of Messages in the send Buffer (high, medium, low priority)
</member>
<member name="F:RakNetStatistics.messagesSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="33">
 Number of messages sent (high, medium, low priority)
</member>
<member name="F:RakNetStatistics.messageDataBitsSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="35">
 Number of data bits used for user messages
</member>
<member name="F:RakNetStatistics.messageTotalBitsSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="37">
 Number of total bits used for user messages, including headers
</member>
<member name="F:RakNetStatistics.packetsContainingOnlyAcknowlegements" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="40">
 Number of packets sent containing only acknowledgments
</member>
<member name="F:RakNetStatistics.acknowlegementsSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="42">
 Number of acknowledgments sent
</member>
<member name="F:RakNetStatistics.acknowlegementsPending" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="44">
 Number of acknowledgments waiting to be sent
</member>
<member name="F:RakNetStatistics.acknowlegementBitsSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="46">
 Number of acknowledgments bits sent
</member>
<member name="F:RakNetStatistics.packetsContainingOnlyAcknowlegementsAndResends" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="49">
 Number of packets containing only acknowledgments and resends
</member>
<member name="F:RakNetStatistics.messageResends" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="52">
 Number of messages resent
</member>
<member name="F:RakNetStatistics.messageDataBitsResent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="54">
 Number of bits resent of actual data
</member>
<member name="F:RakNetStatistics.messagesTotalBitsResent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="56">
 Total number of bits resent, including headers
</member>
<member name="F:RakNetStatistics.messagesOnResendQueue" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="58">
 Number of messages waiting for ack (// TODO - rename this)
</member>
<member name="F:RakNetStatistics.numberOfUnsplitMessages" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="61">
 Number of messages not split for sending
</member>
<member name="F:RakNetStatistics.numberOfSplitMessages" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="63">
 Number of messages split for sending
</member>
<member name="F:RakNetStatistics.totalSplits" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="65">
 Total number of splits done for sending
</member>
<member name="F:RakNetStatistics.packetsSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="68">
 Total packets sent
</member>
<member name="F:RakNetStatistics.encryptionBitsSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="71">
 Number of bits added by encryption
</member>
<member name="F:RakNetStatistics.totalBitsSent" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="73">
 total bits sent
</member>
<member name="F:RakNetStatistics.sequencedMessagesOutOfOrder" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="76">
 Number of sequenced messages arrived out of order
</member>
<member name="F:RakNetStatistics.sequencedMessagesInOrder" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="78">
 Number of sequenced messages arrived in order
</member>
<member name="F:RakNetStatistics.orderedMessagesOutOfOrder" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="81">
 Number of ordered messages arrived out of order
</member>
<member name="F:RakNetStatistics.orderedMessagesInOrder" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="83">
 Number of ordered messages arrived in order
</member>
<member name="F:RakNetStatistics.packetsReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="86">
 Packets with a good CRC received
</member>
<member name="F:RakNetStatistics.packetsWithBadCRCReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="88">
 Packets with a bad CRC received
</member>
<member name="F:RakNetStatistics.bitsReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="90">
 Bits with a good CRC received
</member>
<member name="F:RakNetStatistics.bitsWithBadCRCReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="92">
 Bits with a bad CRC received
</member>
<member name="F:RakNetStatistics.acknowlegementsReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="94">
 Number of acknowledgement messages received for packets we are resending
</member>
<member name="F:RakNetStatistics.duplicateAcknowlegementsReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="96">
 Number of acknowledgement messages received for packets we are not resending
</member>
<member name="F:RakNetStatistics.messagesReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="98">
 Number of data messages (anything other than an ack) received that are valid and not duplicate
</member>
<member name="F:RakNetStatistics.invalidMessagesReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="100">
 Number of data messages (anything other than an ack) received that are invalid
</member>
<member name="F:RakNetStatistics.duplicateMessagesReceived" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="102">
 Number of data messages (anything other than an ack) received that are duplicate
</member>
<member name="F:RakNetStatistics.messagesWaitingForReassembly" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="104">
 Number of messages waiting for reassembly
</member>
<member name="F:RakNetStatistics.internalOutputQueueSize" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="106">
 Number of messages in reliability output queue
</member>
<member name="F:RakNetStatistics.bitsPerSecond" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="108">
 Current bits per second
</member>
<member name="F:RakNetStatistics.connectionStartTime" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="110">
 connection start time
</member>
<member name="M:StatisticsToString(RakNetStatistics*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.Int32)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknetstatistics.h" line="163">
Verbosity level currently supports 0 (low), 1 (medium), 2 (high)
\param[in] s The Statistical information to format out
\param[in] buffer The buffer containing a formated report
\param[in] verbosityLevel 
0 low
1 medium 
2 high 
</member>
<member name="T:_iobuf" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\raknettypes.h" line="1">
\file
\brief Types used by RakNet, most of which involve user code.

This file is part of RakNet Copyright 2003 Kevin Jenkins.

Usage of RakNet is subject to the appropriate license agreement.
Creative Commons Licensees are subject to the
license found at
http://creativecommons.org/licenses/by-nc/2.5/
Single application licensees are subject to the license found at
http://www.jenkinssoftware.com/SingleApplicationLicense.html
Custom license users are subject to the terms therein.
GPL license users are subject to the GNU General Public
License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version.
</member>
<member name="T:RakNet.RakString" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="14">
\brief String class
Has the following improvements over std::string
Reference counting: Suitable to store in lists
Varidic assignment operator
Doesn't cause linker errors
</member>
<member name="M:RakNet.RakString.#ctor" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="22">
Constructors
</member>
<member name="M:RakNet.RakString.op_Implicit~System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="31">
Implicit return of const char*
</member>
<member name="M:RakNet.RakString.C_String" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="34">
Same as std::string::c_str
</member>
<member name="M:RakNet.RakString.op_Assign(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="40">
Assigment operators
</member>
<member name="M:RakNet.RakString.op_AdditionAssignment(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="46">
Concatenation
</member>
<member name="M:RakNet.RakString.op_Subscript(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="52">
Character index. Do not use to change the string however.
</member>
<member name="M:RakNet.RakString.op_Equality(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="55">
Equality
</member>
<member name="M:RakNet.RakString.op_Inequality(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="66">
Inequality
</member>
<member name="M:RakNet.RakString.ToLower" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="69">
Change all characters to lowercase
</member>
<member name="M:RakNet.RakString.ToUpper" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="72">
Change all characters to uppercase
</member>
<member name="M:RakNet.RakString.Set(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,BTEllipsis)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="75">
Set the value of the string
</member>
<member name="M:RakNet.RakString.IsEmpty" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="78">
Returns if the string is empty. Also, C_String() would return ""
</member>
<member name="M:RakNet.RakString.GetLength" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="81">
Returns the length of the string
</member>
<member name="M:RakNet.RakString.Replace(System.UInt32,System.UInt32,System.Byte)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="84">
Replace character(s) in starting at index, for count, with c
</member>
<member name="M:RakNet.RakString.SetChar(System.UInt32,System.Byte)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="87">
Replace character at index with c
</member>
<member name="M:RakNet.RakString.SetChar(System.UInt32,RakNet.RakString)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="90">
Replace character at index with string s
</member>
<member name="M:RakNet.RakString.Erase(System.UInt32,System.UInt32)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="96">
Erase characters out of the string at index for count
</member>
<member name="M:RakNet.RakString.StrCmp(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="99">
Compare strings (case sensitive)
</member>
<member name="M:RakNet.RakString.StrICmp(RakNet.RakString!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="102">
Compare strings (not case sensitive)
</member>
<member name="M:RakNet.RakString.Clear" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="105">
Clear the string
</member>
<member name="M:RakNet.RakString.Printf" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="108">
Print the string to the screen
</member>
<member name="M:RakNet.RakString.FPrintf(_iobuf*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="111">
Print the string to a file
</member>
<member name="M:RakNet.RakString.IPAddressMatch(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="114">
Does the given IP address match the IP address encoded into this string, accounting for wildcards?
</member>
<member name="M:RakNet.RakString.ContainsNonprintableExceptSpaces" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="117">
Does the string contain non-printable characters other than spaces?
</member>
<member name="M:RakNet.RakString.IsEmailAddress" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="120">
Is this a valid email address?
</member>
<member name="M:RakNet.RakString.URLEncode" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="123">
URL Encode the string. See http://www.codeguru.com/cpp/cpp/cpp_mfc/article.php/c4029/
</member>
<member name="M:RakNet.RakString.FreeMemory" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="126">
RakString uses a freeList of old no-longer used strings
Call this function to clear this memory on shutdown
</member>
<member name="M:RakNet.RakString.Serialize(RakNet.BitStream*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="130">
Serialize to a bitstream, uncompressed (slightly faster)
\param[out] bs Bitstream to serialize to
</member>
<member name="M:RakNet.RakString.Serialize(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,RakNet.BitStream*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="134">
Static version of the Serialize function
</member>
<member name="M:RakNet.RakString.SerializeCompressed(RakNet.BitStream*,System.Int32,System.Boolean)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="137">
Serialize to a bitstream, compressed (better bandwidth usage)
\param[out]  bs Bitstream to serialize to
\param[in] languageId languageId to pass to the StringCompressor class
\param[in] writeLanguageId encode the languageId variable in the stream. If false, 0 is assumed, and DeserializeCompressed will not look for this variable in the stream (saves bandwidth)
\pre StringCompressor::AddReference must have been called to instantiate the class (Happens automatically from RakPeer::Startup())
</member>
<member name="M:RakNet.RakString.SerializeCompressed(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,RakNet.BitStream*,System.Int32,System.Boolean)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="144">
Static version of the SerializeCompressed function
</member>
<member name="M:RakNet.RakString.Deserialize(RakNet.BitStream*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="147">
Deserialize what was written by Serialize
\param[in] bs Bitstream to serialize from
\return true if the deserialization was successful
</member>
<member name="M:RakNet.RakString.Deserialize(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,RakNet.BitStream*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="152">
Static version of the Deserialize() function
</member>
<member name="M:RakNet.RakString.DeserializeCompressed(RakNet.BitStream*,System.Boolean)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="155">
Deserialize compressed string, written by SerializeCompressed
\param[in] bs Bitstream to serialize from
\param[in] readLanguageId If true, looks for the variable langaugeId in the data stream. Must match what was passed to SerializeCompressed
\return true if the deserialization was successful
\pre StringCompressor::AddReference must have been called to instantiate the class (Happens automatically from RakPeer::Startup())
</member>
<member name="M:RakNet.RakString.DeserializeCompressed(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,RakNet.BitStream*,System.Boolean)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="162">
Static version of the DeserializeCompressed() function
</member>
<member name="M:RakNet.RakString.GetSizeToAllocate(System.UInt32)" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="168">
\internal
</member>
<member name="T:RakNet.RakString.SharedString" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="178">
\internal
</member>
<member name="M:RakNet.RakString.#ctor(RakNet.RakString.SharedString*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="188">
\internal
</member>
<member name="F:RakNet.RakString.sharedString" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="191">
\internal
</member>
<member name="F:RakNet.RakString.emptyString" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="196">
\internal
</member>
<member name="F:RakNet.RakString.freeList" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="201">
\internal
List of free objects to reduce memory reallocations
</member>
<member name="F:RakNet.RakString.nPos" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\rakstring.h" line="205">
Means undefined position
</member>
<member name="T:RakNet.BitStream" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="43">
This class allows you to write and read native types as a string of bits.  BitStream is used extensively throughout RakNet and is designed to be used by users as well.
\sa BitStreamSample.txt
</member>
<member name="M:RakNet.BitStream.#ctor" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="49">
Default Constructor
</member>
<member name="M:RakNet.BitStream.#ctor(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="52">
Create the bitstream, with some number of bytes to immediately allocate.
There is no benefit to calling this, unless you know exactly how many bytes you need and it is greater than BITSTREAM_STACK_ALLOCATION_SIZE.
In that case all it does is save you one or more realloc calls.
\param[in] initialBytesToAllocate the number of bytes to pre-allocate.
</member>
<member name="M:RakNet.BitStream.#ctor(System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="58">
Initialize the BitStream, immediately setting the data it contains to a predefined pointer.
Set \a _copyData to true if you want to make an internal copy of the data you are passing. Set it to false to just save a pointer to the data.
You shouldn't call Write functions with \a _copyData as false, as this will write to unallocated memory
99% of the time you will use this function to cast Packet::data to a bitstream for reading, in which case you should write something as follows:
\code
RakNet::BitStream bs(packet-&gt;data, packet-&gt;length, false);
\endcode
\param[in] _data An array of bytes.
\param[in] lengthInBytes Size of the \a _data.
\param[in] _copyData true or false to make a copy of \a _data or not.
</member>
<member name="M:RakNet.BitStream.Dispose" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="70">
Destructor
</member>
<member name="M:RakNet.BitStream.Reset" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="73">
Resets the bitstream for reuse.
</member>
<member name="M:RakNet.BitStream.Serialize(System.Boolean,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="125">
Bidirectional serialize/deserialize an array or casted stream or raw data.  This does NOT do endian swapping.
\param[in] writeToBitstream true to write from your data to this bitstream.  False to read from this bitstream and write to your data
\param[in] input a byte buffer
\param[in] numberOfBytes the size of \a input in bytes
\return true if \a writeToBitstream is true.  true if \a writeToBitstream is false and the read was successful.  false if \a writeToBitstream is false and the read was not successful.
</member>
<member name="M:RakNet.BitStream.SerializeBits(System.Boolean,System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="172">
Bidirectional serialize/deserialize numberToSerialize bits to/from the input. Right aligned
data means in the case of a partial byte, the bits are aligned
from the right (bit 0) rather than the left (as in the normal
internal representation) You would set this to true when
writing user data, and false when copying bitstream data, such
as writing one bitstream to another
\param[in] writeToBitstream true to write from your data to this bitstream.  False to read from this bitstream and write to your data
\param[in] input The data
\param[in] numberOfBitsToSerialize The number of bits to write
\param[in] rightAlignedBits if true data will be right aligned
\return true if \a writeToBitstream is true.  true if \a writeToBitstream is false and the read was successful.  false if \a writeToBitstream is false and the read was not successful.
</member>
<member name="M:RakNet.BitStream.Read(RakNet.BitStream*,System.UInt32)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="265">
Read one bitstream to another
\param[in] numberOfBits bits to read
\param bitStream the bitstream to read into from
</member>
<member name="M:RakNet.BitStream.Write(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="273">
Write an array or casted stream or raw data.  This does NOT do endian swapping.
\param[in] input a byte buffer
\param[in] numberOfBytes the size of \a input in bytes
</member>
<member name="M:RakNet.BitStream.Write(RakNet.BitStream*,System.UInt32)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="278">
Write one bitstream to another
\param[in] numberOfBits bits to write
\param bitStream the bitstream to copy from
</member>
<member name="M:RakNet.BitStream.Read(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="319">
Read an array or casted stream of byte. The array
is raw data. There is no automatic endian conversion with this function
\param[in] output The result byte array. It should be larger than @em numberOfBytes.
\param[in] numberOfBytes The number of byte to read
\return true on success false if there is some missing bytes.
</member>
<member name="M:RakNet.BitStream.ResetReadPointer" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="359">
Sets the read pointer back to the beginning of your data.
</member>
<member name="M:RakNet.BitStream.ResetWritePointer" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="362">
Sets the write pointer back to the beginning of your data.
</member>
<member name="M:RakNet.BitStream.AssertStreamEmpty" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="365">
This is good to call when you are done with the stream to make
sure you didn't leave any data left over void
</member>
<member name="M:RakNet.BitStream.PrintBits(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="369">
RAKNET_DEBUG_PRINTF the bits in the stream.  Great for debugging.
</member>
<member name="M:RakNet.BitStream.IgnoreBits(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="373">
Ignore data we don't intend to read
\param[in] numberOfBits The number of bits to ignore
</member>
<member name="M:RakNet.BitStream.IgnoreBytes(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="377">
Ignore data we don't intend to read
\param[in] numberOfBits The number of bytes to ignore
</member>
<member name="M:RakNet.BitStream.SetWriteOffset(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="381">
Move the write pointer to a position on the array.
\param[in] offset the offset from the start of the array.
\attention
Dangerous if you don't know what you are doing!
For efficiency reasons you can only write mid-stream if your data is byte aligned.
</member>
<member name="M:RakNet.BitStream.GetNumberOfBitsUsed" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="388">
Returns the length in bits of the stream
</member>
<member name="M:RakNet.BitStream.GetNumberOfBytesUsed" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="392">
Returns the length in bytes of the stream
</member>
<member name="M:RakNet.BitStream.GetReadOffset" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="395">
Returns the number of bits into the stream that we have read
</member>
<member name="M:RakNet.BitStream.GetNumberOfUnreadBits" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="401">
Returns the number of bits left in the stream that haven't been read
</member>
<member name="M:RakNet.BitStream.CopyData(System.Byte**)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="404">
Makes a copy of the internal data for you \a _data will point to
the stream. Returns the length in bits of the stream. Partial
bytes are left aligned
\param[out] _data The allocated copy of GetData()
</member>
<member name="M:RakNet.BitStream.SetData(System.Byte*)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="410">
Set the stream to some initial data.
\internal
</member>
<member name="M:RakNet.BitStream.GetData" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="414">
Gets the data that BitStream is writing to / reading from
Partial bytes are left aligned.
\return A pointer to the internal state
</member>
<member name="M:RakNet.BitStream.WriteBits(System.Byte!System.Runtime.CompilerServices.IsConst*,System.UInt32,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="419">
Write numberToWrite bits from the input source Right aligned
data means in the case of a partial byte, the bits are aligned
from the right (bit 0) rather than the left (as in the normal
internal representation) You would set this to true when
writing user data, and false when copying bitstream data, such
as writing one bitstream to another
\param[in] input The data
\param[in] numberOfBitsToWrite The number of bits to write
\param[in] rightAlignedBits if true data will be right aligned
</member>
<member name="M:RakNet.BitStream.WriteAlignedBytes(System.Byte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="430">
Align the bitstream to the byte boundary and then write the
specified number of bits.  This is faster than WriteBits but
wastes the bits to do the alignment and requires you to call
ReadAlignedBits at the corresponding read position.
\param[in] input The data
\param[in] numberOfBytesToWrite The size of input.
</member>
<member name="M:RakNet.BitStream.WriteAlignedBytesSafe(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="438">
Aligns the bitstream, writes inputLength, and writes input. Won't write beyond maxBytesToWrite
\param[in] input The data
\param[in] inputLength The size of input.
\param[in] maxBytesToWrite Max bytes to write
</member>
<member name="M:RakNet.BitStream.ReadAlignedBytes(System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="444">
Read bits, starting at the next aligned bits. Note that the
modulus 8 starting offset of the sequence must be the same as
was used with WriteBits. This will be a problem with packet
coalescence unless you byte align the coalesced packets.
\param[in] output The byte array larger than @em numberOfBytesToRead
\param[in] numberOfBytesToRead The number of byte to read from the internal state
\return true if there is enough byte.
</member>
<member name="M:RakNet.BitStream.ReadAlignedBytesSafe(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*,System.Int32*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Int32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="453">
Reads what was written by WriteAlignedBytesSafe
\param[in] input The data
\param[in] maxBytesToRead Maximum number of bytes to read
</member>
<member name="M:RakNet.BitStream.ReadAlignedBytesSafeAlloc(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte**,System.Int32*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="459">
Same as ReadAlignedBytesSafe() but allocates the memory for you using new, rather than assuming it is safe to write to
\param[in] input input will be deleted if it is not a pointer to 0
</member>
<member name="M:RakNet.BitStream.AlignWriteToByteBoundary" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="464">
Align the next write and/or read to a byte boundary.  This can
be used to 'waste' bits to byte align for efficiency reasons It
can also be used to force coalesced bitstreams to start on byte
boundaries so so WriteAlignedBits and ReadAlignedBits both
calculate the same offset when aligning.
</member>
<member name="M:RakNet.BitStream.AlignReadToByteBoundary" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="471">
Align the next write and/or read to a byte boundary.  This can
be used to 'waste' bits to byte align for efficiency reasons It
can also be used to force coalesced bitstreams to start on byte
boundaries so so WriteAlignedBits and ReadAlignedBits both
calculate the same offset when aligning.
</member>
<member name="M:RakNet.BitStream.ReadBits(System.Byte*,System.UInt32,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="478">
Read \a numberOfBitsToRead bits to the output source
alignBitsToRight should be set to true to convert internal
bitstream data to userdata. It should be false if you used
WriteBits with rightAlignedBits false
\param[in] output The resulting bits array
\param[in] numberOfBitsToRead The number of bits to read
\param[in] alignBitsToRight if true bits will be right aligned.
\return true if there is enough bits to read
</member>
<member name="M:RakNet.BitStream.Write0" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="488">
Write a 0
</member>
<member name="M:RakNet.BitStream.Write1" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="491">
Write a 1
</member>
<member name="M:RakNet.BitStream.ReadBit" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="494">
Reads 1 bit and returns true if that bit is 1 and false if it is 0
</member>
<member name="M:RakNet.BitStream.AssertCopyData" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="497">
If we used the constructor version with copy data off, this
*makes sure it is set to on and the data pointed to is copied.
</member>
<member name="M:RakNet.BitStream.SetNumberOfBitsAllocated(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="501">
Use this if you pass a pointer copy to the constructor
*(_copyData==false) and want to overallocate to prevent
*reallocation
</member>
<member name="M:RakNet.BitStream.AddBitsAndReallocate(System.UInt32!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="506">
Reallocates (if necessary) in preparation of writing numberOfBitsToWrite
</member>
<member name="M:RakNet.BitStream.GetNumberOfBitsAllocated" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="509">
\internal
\return How many bits have been allocated internally
</member>
<member name="M:RakNet.BitStream.DoEndianSwap" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="519">
---- Member function template specialization declarations ----
</member>
<member name="M:RakNet.BitStream.WriteCompressed(System.Byte!System.Runtime.CompilerServices.IsConst*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="697">
Assume the input source points to a native type, compress and write it.
</member>
<member name="M:RakNet.BitStream.ReadCompressed(System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsConst,System.Boolean!System.Runtime.CompilerServices.IsConst)" decl="true" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="700">
Assume the input source points to a compressed native type. Decompress and read it.
</member>
<member name="F:RakNet.BitStream.copyData" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="712">
true if the internal buffer is copy of the data passed to the constructor
</member>
<member name="F:RakNet.BitStream.stackData" decl="false" source="c:\program files\microsoft sdks\windows\v6.0a\include\rak\bitstream.h" line="715">
BitStreams that use less than BITSTREAM_STACK_ALLOCATION_SIZE use the stack, rather than the heap to store data.  It switches over if BITSTREAM_STACK_ALLOCATION_SIZE is exceeded
</member>
</members>
</doc>
