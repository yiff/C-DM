#define COLOR_WHITE 0xFFFFFFFF
#define RP_PURPLE 0xC2A2DAAA

#include <open.mp>
#include <zcmd>
#include <sscanf2>

/*
     ___      _
    / __| ___| |_ _  _ _ __
    \__ \/ -_)  _| || | '_ \
    |___/\___|\__|\_,_| .__/
                      |_|
*/

main()
{
	printf(" ");
	printf("  -------------------------------");
	printf("  |  My first open.mp gamemode! |");
	printf("  -------------------------------");
	printf(" ");
}

public OnGameModeInit()
{
	SetGameModeText("C-DM v1.0");
	
	// grove street
	AddPlayerClass(2, 2495.3547, -1688.2319, 13.6774, 351.1646, WEAPON_DEAGLE, 500);
	
	// trailer park
	AddPlayerClass(32, -965.5652,-543.6519,25.9609,305.0317, WEAPON_DEAGLE, 500);
	
	// bikes, quads, dirtbikes for freeroam at skatepark
	AddStaticVehicle(471,1930.8300,-1397.3861,13.0497,156.4650,120,112);
	AddStaticVehicle(471,1928.7161,-1395.8013,13.0540,127.4952,74,91);
	AddStaticVehicle(468,1920.3721,-1415.6339,13.2395,339.9277,3,3);
	AddStaticVehicle(468,1918.4639,-1415.4242,13.2393,342.6587,3,3);
	AddStaticVehicle(468,1916.2661,-1415.2195,13.2390,341.3231,6,6);
	AddStaticVehicle(481,1948.3094,-1377.4160,18.0952,36.1993,3,3);
	AddStaticVehicle(481,1956.6669,-1364.0176,23.6658,153.5489,12,9);
	AddStaticVehicle(481,1907.4697,-1416.0938,13.0826,333.0572,1,1);
	
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

/*
      ___
     / __|___ _ __  _ __  ___ _ _
    | (__/ _ \ '  \| '  \/ _ \ ' \
     \___\___/_|_|_|_|_|_\___/_||_|

*/

public OnPlayerConnect(playerid)
{
	new string[64], playerName[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playerName, MAX_PLAYER_NAME);
	format(string, sizeof string, "%s has joined the server! Use '/help' to see the commands.", playerName);
	SendClientMessageToAll(COLOR_WHITE, string);
	
	SetPlayerScore(playerid, 0);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new szString[64],
	playerName[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playerName, MAX_PLAYER_NAME);
	
	new szDisconnectReason[3][] =
	{
		"Timeout/Crash",
		"Quit",
		"Kick/Ban"
	};
	
	format(szString, sizeof szString, "%s has left the server. (%s)", playerName, szDisconnectReason[reason]);
	
	SendClientMessageToAll(COLOR_WHITE, szString);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(GetPlayerScore(playerid) == 0) // if they're in arena 0 aka freeroam
	{
		new Float:RandomSpawn[][6] =
		{
			{1908.6096, -1405.5741, 13.5703, 268.2680},
			{1906.9211, -1407.1719, 13.5703, 247.8435},
			{1933.2632, -1403.5870, 13.5703, 122.1036},
			{1911.5746, -1401.4863, 13.5703, 203.7466},
			{1905.0167, -1414.2311, 13.5703, 289.6927},
			{1926.9270, -1417.8760, 16.3594, 47.0594}
		};

		new rand = random(sizeof(RandomSpawn));
		
		// set the player's team back to NO_TEAM
		SetPlayerTeam(playerid, NO_TEAM);

		SetPlayerVirtualWorld(playerid, 0);
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
		SetPlayerFacingAngle(playerid, RandomSpawn[rand][3]);

		return 1;
	}

	if(GetPlayerScore(playerid) == 1) // if they're in arena 1 aka grove street
	{
		new Float:RandomSpawn[][6] =
		{
			{2458.6487, -1668.2599, 13.4805, 285.8223},
			{2451.9399, -1644.3558, 13.4582, 196.3425},
			{2498.8467, -1643.6904, 13.7826, 170.6099},
			{2537.7239, -1665.4231, 15.1503, 142.0703},
			{2515.4878, -1686.5723, 13.5237, 63.7271},
			{2455.6477, -1709.0281, 13.6044, 265.3536}
		};

		new rand = random(sizeof(RandomSpawn));
		
		new RandomSkin[] =
		{
			2,
			170,
			29,
			44,
			115,
			268
		};
		
		new randSkin = random(sizeof(RandomSkin));
		
		SetPlayerVirtualWorld(playerid, 1);
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
		SetPlayerFacingAngle(playerid, RandomSpawn[rand][3]);
		SetPlayerSkin(playerid, RandomSkin[randSkin]);
		
		// custom weapons for arena 1 aka grove street
		GivePlayerWeapon(playerid, 24, 500); // deagle
	
		return 1;
	}
	
	if(GetPlayerScore(playerid) == 2) // if they're in arena 2 aka trailer park
	{
		new Float:RandomSpawn[][6] =
		{
			{-965.5652, -543.6519, 25.9609, 305.0317},
			{-913.2652, -522.1810, 25.9536, 123.9274},
			{-922.9443, -491.8040, 25.9609, 91.5275},
			{-960.4918, -506.8765, 26.2387, 253.8781},
			{-951.2301, -530.5084, 25.9536, 330.7258},
			{-910.6937, -542.7200, 25.9536, 145.4775}
		};
		
		new rand = random(sizeof(RandomSpawn));
		
		new RandomSkin[] =
		{
			32,
			34,
			160,
			159,
			157,
			200
		};
		
		new randSkin = random(sizeof(RandomSkin));
		
		SetPlayerVirtualWorld(playerid, 2);
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
		SetPlayerFacingAngle(playerid, RandomSpawn[rand][3]);
		SetPlayerSkin(playerid, RandomSkin[randSkin]);

		// custom weapons for arena 2 aka trailer park
		GivePlayerWeapon(playerid, 25, 500); // shotgun

		return 1;
	}
	
	if(GetPlayerScore(playerid) == 3) // if they're in arena 3 aka jefferson motel
	{
		new Float:RandomSpawn[][8] =
		{
			{2219.3499, -1152.3683, 1025.7969, 327.9911},
			{2226.7610, -1144.4176, 1029.7969, 127.5094},
			{2251.3962, -1158.6681, 1029.7969, 139.2310},
			{2247.1948, -1191.3601, 1029.7969, 31.4793},
			{2231.2019, -1178.5431, 1029.7969, 131.7200},
			{2239.6572, -1192.7673, 1033.7969, 322.8445},
			{2230.8359, -1161.5802, 1029.7969, 319.1016},
			{2227.8206, -1150.4482, 1025.7969, 81.3324}
		};
		
		new rand = random(sizeof(RandomSpawn));
		
		new RandomSkin[] =
		{
			177,
			170,
			143,
			121,
			119,
			65,
			56,
			43,
			6
		};
		
		new randSkin = random(sizeof(RandomSkin));
		
		SetPlayerVirtualWorld(playerid, 3);
		SetPlayerInterior(playerid, 15);
		SetPlayerPos(playerid, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
		SetPlayerFacingAngle(playerid, RandomSpawn[rand][3]);
		SetPlayerSkin(playerid, RandomSkin[randSkin]);

		// custom weapons for arena 3 aka jefferson motel
		GivePlayerWeapon(playerid, 25, 500); // shotgun
		GivePlayerWeapon(playerid, 30, 500); // ak47

		return 1;
	}
	
	if(GetPlayerScore(playerid) == 4) // if they're in arena 4 aka team deathmatch whitewood estates SWAT raid
	{
		// team 0 (crim) or team 1 (cops)
		if(GetPlayerTeam(playerid) == 0) // if player selected is on criminal team
		{
			new Float:RandomSpawn[][5] =
			{
				{2363.0452, -1120.8047, 1050.8750, 223.7332},
				{2373.3774, -1122.6882, 1050.8750, 144.4296},
				{2372.4502, -1134.9718, 1050.8750, 64.7683},
				{2359.3516, -1134.1257, 1050.8750, 296.8062},
				{257.9478, -40.4115, 1002.0234, 96.5626}
			};
			
			new rand = random(sizeof(RandomSpawn));
			
			new RandomSkin[] =
			{
				259,
				21,
				29,
				28,
				30,
				47,
				67,
				144,
				183
			};
			
			new randSkin = random(sizeof(RandomSkin));
			
			SetPlayerVirtualWorld(playerid, 4);
			SetPlayerInterior(playerid, 8);
			SetPlayerPos(playerid, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
			SetPlayerFacingAngle(playerid, RandomSpawn[rand][3]);
			SetPlayerSkin(playerid, RandomSkin[randSkin]);
	
			// custom weapons for crims in arena 4 aka whitewood estates SWAT raid
			GivePlayerWeapon(playerid, 25, 500); // shotgun
			GivePlayerWeapon(playerid, 24, 500); // deagle
	
			return 1;
			}

		if(GetPlayerTeam(playerid) == 1) // if player selected is on SWAT team
		{
			new Float:RandomSpawn[][5] =
			{
				{915.5790, 2017.9376, 10.8203, 227.5450},
				{917.9889, 1988.3374, 10.8203, 333.4933},
				{926.4125, 1995.1372, 11.4609, 7.5310},
				{920.4971, 2004.1718, 11.0706, 293.7247},
				{899.6014, 2020.0249, 10.8203, 242.1747}
			};
			
			new rand = random(sizeof(RandomSpawn));
	
			SetPlayerVirtualWorld(playerid, 4);
			SetPlayerInterior(playerid, 0);
			SetPlayerPos(playerid, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
			SetPlayerFacingAngle(playerid, RandomSpawn[rand][3]);
			SetPlayerSkin(playerid, 285);
	
			// custom weapons for SWAT in arena 4 aka whitewood estates SWAT raid
			GivePlayerWeapon(playerid, 31, 500); // m4
			GivePlayerWeapon(playerid, 25, 500); // shotgun
			GivePlayerWeapon(playerid, 24, 500); // deagle

			return 1;
			}
		}
	
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SendDeathMessage(killerid, playerid, reason);
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

/*
     ___              _      _ _    _
    / __|_ __  ___ __(_)__ _| (_)__| |_
    \__ \ '_ \/ -_) _| / _` | | (_-<  _|
    |___/ .__/\___\__|_\__,_|_|_/__/\__|
        |_|
*/

public OnFilterScriptInit()
{
	printf(" ");
	printf("  -----------------------------------------");
	printf("  |  Error: Script was loaded incorrectly |");
	printf("  -----------------------------------------");
	printf(" ");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	SpawnPlayer(playerid);
	return 1;
}

// basic commands - don't work anymore since i installed zcmd?? idk...
public OnPlayerCommandText(playerid, cmdtext[])
{
	return 1;
}

// zcmd commands - more advanced commands
// help command
CMD:help(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, "Hey! Welcome to cody's deathmatch server.");
	SendClientMessage(playerid, COLOR_WHITE, "You can check the scoreboard to see what lobby ID players are in.");
	SendClientMessage(playerid, COLOR_WHITE, "Here's some commands you can use:");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, "[-- General commands! --]");
	SendClientMessage(playerid, COLOR_WHITE, "/me - It's the roleplay one... You know this!");
	SendClientMessage(playerid, COLOR_WHITE, "/cls - Clears your own chat box!");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, "[-- Freeroam lobby commands! --]");
	SendClientMessage(playerid, COLOR_WHITE, "/spawn - Respawn yourself in freeroam mode.");
	SendClientMessage(playerid, COLOR_WHITE, "/tpto - You can either TP to someone with this command by ID or by double-clicking their name on the scoreboard.");
	SendClientMessage(playerid, COLOR_WHITE, "/dgl /m4 /ak /shotty - One-off weapon spawning commands for freeroam mode.");
	SendClientMessage(playerid, COLOR_WHITE, "/v - Spawn vehicles by ID.");
	SendClientMessage(playerid, COLOR_WHITE, "/skin - Lets you change your skin by ID in freeroam mode.");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, "[-- Lobby-specific commands! --]");
	SendClientMessage(playerid, COLOR_WHITE, "/lobby - Lets you pick to join either a specific deathmatch arena or freeroam.");
	SendClientMessage(playerid, COLOR_WHITE, "/changeteam - Lets you pick your team depending on what arena you're in.");
	return 1;
}

// slash me command
CMD:me(playerid, params[])
{
	new string[128];
	new action[100];
	new playerName[MAX_PLAYER_NAME];
	
	GetPlayerName(playerid, playerName, sizeof(playerName));
	
	if(sscanf(params, "s[100]", action))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Usage: /me <action>");
		return 1;
	}
	
	format(string, sizeof(string), "* %s %s", playerName, action);
	SendClientMessageToAll(RP_PURPLE, string);
	return 1;
}
// cls command to clear your chat-box client-side
CMD:cls(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	SendClientMessage(playerid, COLOR_WHITE, " ");
	return 1;
}
// spawn command
CMD:spawn(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		SpawnPlayer(playerid);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}
// change team command
CMD:changeteam(playerid, params[])
{
	if(GetPlayerScore(playerid) < 4) // if score is less than 4, you can't do the cmd
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't change your team in this arena! You can only change teams in the team deathmatch arenas.");
		return 1;
	}
	
	else
	{
		if(GetPlayerScore(playerid) == 4) // if player has a score of 4, meaning they're in the whitewood SWAT team deathmatch
		{
			new id;
			
			if (sscanf(params, "i", id) != 0)
			{
				SendClientMessage(playerid, COLOR_WHITE, " ");
				SendClientMessage(playerid, COLOR_WHITE, "[-- Teams List --]");
				SendClientMessage(playerid, COLOR_WHITE, "0 - Criminals");
				SendClientMessage(playerid, COLOR_WHITE, "1 - SWAT Team");
				return 1;
			}
			
			if(id > 3)
			{
				SendClientMessage(playerid, COLOR_WHITE, "That's an invalid Team ID for this arena. Check '/changeteam' again.");
				return 1;
			}
			
			SetPlayerTeam(playerid, id);
			SpawnPlayer(playerid);
		}
		
		return 1;
	}
}
// teleport to players command
CMD:tpto(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		new id;

		if (sscanf(params, "i", id) != 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Usage: /tpto <id>");
	    	return 1;
		}
		
		if(!IsPlayerConnected(id))
		{
			SendClientMessage(playerid, COLOR_WHITE, "Invalid ID provided! The ID either wasn't correct or they aren't connected anymore. Try again.");
			return 1;
		}
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(id, x, y, z);
		SetPlayerPos(playerid, x, y+5.0, z);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}
// one-off weapon give commands
CMD:dgl(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		GivePlayerWeapon(playerid, 24, 500);
		SetPlayerArmedWeapon(playerid, 24);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}

CMD:m4(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		GivePlayerWeapon(playerid, 31, 500);
		SetPlayerArmedWeapon(playerid, 31);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}

CMD:ak(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		GivePlayerWeapon(playerid, 30, 500);
		SetPlayerArmedWeapon(playerid, 30);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}

CMD:shotty(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		GivePlayerWeapon(playerid, 25, 500);
		SetPlayerArmedWeapon(playerid, 25);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}
// skin changing command
CMD:skin(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		new id;
		
		if (sscanf(params, "i", id) != 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Usage: /skin <id>");
	    	return 1;
		}
		
		if (id > 311 || id == 74 || id == 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "You can't use that skin. Try another ID!");
			return 1;
		}
		
		SetPlayerSkin(playerid, id);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}
// vehicle spawning command
CMD:v(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		new id;
		
		if(sscanf(params, "i", id) != 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Usage: /v <id>");
			return 1;
		}
		
		if(id < 400 || id > 611)
		{
			SendClientMessage(playerid, COLOR_WHITE, "You can't spawn that vehicle. Try another ID!");
		}
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		AddStaticVehicle(id, x, y, z, 90.0, -1, -1);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}
// weapon giving command by id
CMD:wep(playerid, params[])
{
	if(GetPlayerScore(playerid) == 0)
	{
		new id;
		
		if(sscanf(params, "i", id) != 0)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Usage: /wep <id>");
			return 1;
		}
		
		if(id < 0 || id > 46)
		{
			SendClientMessage(playerid, COLOR_WHITE, "You can't get that weapon. Try another ID!");
		}
		
		GivePlayerWeapon(playerid, id, 500);
		SetPlayerArmedWeapon(playerid, id);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "You can't use this command in a deathmatch lobby. Go back to lobby 0, aka freeroam, to use this command and more!");
		return 1;
	}
}
// lobby command to get to different deathmatch lobbies
CMD:lobby(playerid, params[])
{
	new lobbyid;
	
	if(sscanf(params, "i", lobbyid) != 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, " ");
		SendClientMessage(playerid, COLOR_WHITE, "[-- Lobby List! --]");
		SendClientMessage(playerid,COLOR_WHITE, "0 - Freeroam");
		SendClientMessage(playerid, COLOR_WHITE, " ");
		SendClientMessage(playerid, COLOR_WHITE, "[-- Free-For-All Deathmatch Arenas --]");
		SendClientMessage(playerid,COLOR_WHITE, "1 - Grove Street");
		SendClientMessage(playerid,COLOR_WHITE, "2 - Trailer Park");
		SendClientMessage(playerid,COLOR_WHITE, "3 - Jefferson Motel");
		SendClientMessage(playerid, COLOR_WHITE, " ");
		SendClientMessage(playerid, COLOR_WHITE, "[-- Team Deathmatch Arenas --]");
		SendClientMessage(playerid,COLOR_WHITE, "4 - Whitewood Estates SWAT Raid");
		SendClientMessage(playerid, COLOR_WHITE, " ");
		SendClientMessage(playerid, COLOR_WHITE, "Usage: /lobby <id>");
		return 1;
	}
	
	if(lobbyid > 4)
	{
		SendClientMessage(playerid, COLOR_WHITE, "I haven't added a lobby with that ID yet! Try typing '/lobby' again for a list of the availble lobbies.");
	}
	
	if(lobbyid == 0)
	{
		// freeroam
		SetPlayerTime(playerid, 12, 0);
		SetPlayerWeather(playerid, 0);
		// set the score so we identify which lobby they're in
		SetPlayerScore(playerid, 0);
		// set the player's team back to NO_TEAM
		SetPlayerTeam(playerid, NO_TEAM);
		// all the lobby specific spawns/skins/weapons code is in OnPlayerSpawn func
		SpawnPlayer(playerid);
	
		return 1;
	}
	
	if(lobbyid == 1)
	{
		// grove street free-for-all deathmatch
		SetPlayerTime(playerid, 12, 0);
		SetPlayerWeather(playerid, 0);
		// set the score so we identify which lobby they're in
		SetPlayerScore(playerid, 1);
		// set the player's team back to NO_TEAM
		SetPlayerTeam(playerid, NO_TEAM);
		// all the lobby specific spawns/skins/weapons code is in OnPlayerSpawn func
		SpawnPlayer(playerid);
	
		return 1;
	}
	
	if(lobbyid == 2)
	{
		// trailer park free-for-all deathmatch
		SetPlayerTime(playerid, 0, 0);
		SetPlayerWeather(playerid, 8);
		// set the score so we identify which lobby they're in
		SetPlayerScore(playerid, 2);
		// set the player's team back to NO_TEAM
		SetPlayerTeam(playerid, NO_TEAM);
		// all the lobby specific spawns/skins/weapons code is in OnPlayerSpawn func
		SpawnPlayer(playerid);
		
		return 1;
	}
	
	if(lobbyid == 3)
	{
		// jefferson motel free-for-all deathmatch
		SetPlayerTime(playerid, 12, 0);
		SetPlayerWeather(playerid, 0);
		// set the score so we identify which lobby they're in
		SetPlayerScore(playerid, 3);
		// set the player's team back to NO_TEAM
		SetPlayerTeam(playerid, NO_TEAM);
		// all the lobby specific spawns/skins/weapons code is in OnPlayerSpawn func
		SpawnPlayer(playerid);
		
		return 1;
	}
	
	if(lobbyid == 4)
	{
		// whitewood estates SWAT team deathmatch
		SetPlayerTime(playerid, 6, 0);
		SetPlayerWeather(playerid, 4);
		// set the score so we identify which lobby they're in
		SetPlayerScore(playerid, 4);
		// set the player's team randomly to either team 0 (crim) or team 1 (cops)
		SetPlayerTeam(playerid, random(2)); // set playerteam to 0 or 1 (hopefully...)
		// all the lobby specific spawns/skins/weapons code is in OnPlayerSpawn func
		SpawnPlayer(playerid);
		
		return 1;
	}
	
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
	return 1;
}

public OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart)
{
	return 1;
}

public OnActorStreamIn(actorid, forplayerid)
{
	return 1;
}

public OnActorStreamOut(actorid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerEnterGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerLeaveGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerEnterPlayerGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerLeavePlayerGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerClickGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerClickPlayerGangZone(playerid, zoneid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnClientCheckResponse(playerid, actionid, memaddr, retndata)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerFinishedDownloading(playerid, virtualworld)
{
	return 1;
}

public OnPlayerRequestDownload(playerid, DOWNLOAD_REQUEST:type, crc)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 0;
}

public OnPlayerSelectObject(playerid, SELECT_OBJECT:type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, EDIT_RESPONSE:response, Float:fX, Float:fY, Float:fZ, Float:rotationX, Float:rotationY, Float:rotationZ)
{
	return 1;
}

public OnPlayerEditAttachedObject(playerid, EDIT_RESPONSE:response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:rotationX, Float:rotationY, Float:rotationZ, Float:scaleX, Float:scaleY, Float:scaleZ)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerPickUpPlayerPickup(playerid, pickupid)
{
	return 1;
}

public OnPickupStreamIn(pickupid, playerid)
{
	return 1;
}

public OnPickupStreamOut(pickupid, playerid)
{
	return 1;
}

public OnPlayerPickupStreamIn(pickupid, playerid)
{
	return 1;
}

public OnPlayerPickupStreamOut(pickupid, playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, CLICK_SOURCE:source)
{
	if(GetPlayerScore(playerid) == 0)
	{
		if(!IsPlayerConnected(clickedplayerid))
		{
			SendClientMessage(playerid, COLOR_WHITE, "Invalid ID provided! The ID either wasn't correct or they aren't connected anymore. Try again.");
			return 1;
		}
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(clickedplayerid, x, y, z);
		SetPlayerPos(playerid, x, y+5.0, z);
		return 1;
	}
	
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, " ");
		SendClientMessage(playerid, COLOR_WHITE, "Hey! Usually double-clicking on a player's name would let you TP to them in freeroam,");
		SendClientMessage(playerid, COLOR_WHITE, "but you're in a lobby! Go to freeroam (/lobby 0) to use this command.");
		return 1;
	}
}

public OnPlayerWeaponShot(playerid, weaponid, BULLET_HIT_TYPE:hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnScriptCash(playerid, amount, source)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	return 1;
}

public OnIncomingConnection(playerid, ip_address[], port)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	return 1;
}

public OnTrailerUpdate(playerid, vehicleid)
{
	return 1;
}

public OnVehicleSirenStateChange(playerid, vehicleid, newstate)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, component)
{
	return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjob)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, colour1, colour2)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
	return 1;
}

