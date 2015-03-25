private ["_useRevive"];
private ["_volume", "_dynamicWeather", "_isJipPlayer"];
private ["_showIntro", "_showPlayerMapAndCompass", "_fog", "_playerIsImmortal", "_playersEnteredWorld"];

_isJipPlayer = false;
if (!isServer && isNull player) then
{
    _isJipPlayer = true;
};


if(!isDedicated) then {
	//startLoadingScreen ["Loading Mission, please wait...","Escape_loadingScreen"];
	//startLoadingScreen ["Loading Mission, please wait..."];
	titleText ["Loading...", "BLACK",0.1];
};

AT_Revive_StaticRespawns = [];
AT_Revive_enableRespawn = false;
AT_Revive_clearedDistance = 0;

//call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";
call compile preprocessFile "Revive\reviveInit.sqf";
call compile preprocessFile "Scripts\AT\hack_terminal.sqf";
call compile preprocessFile "Scripts\AT\dronehack_init.sqf";
call compile preprocessFileLineNumbers "config.sqf";
call compile preprocessFileLineNumbers ("Island\WorldConfig.sqf");




// Developer Variables

_useRevive = true;
_showIntro = true;

// Debug Variables

_showPlayerMapAndCompass = a3e_debug_MapAndCompass;
_playerIsImmortal = a3e_debug_immortal; // Only works for unit p1
_debug = a3e_debug;

// Initialization

drn_var_Escape_firstPreloadDone = false;

if(isNil("drn_var_commonLibInitialized")) then {
	call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
};

drn_var_Escape_playerEnteredWorld = false;


onPreloadFinished {
	if (!drn_var_Escape_firstPreloadDone) then {
		drn_var_Escape_firstPreloadDone = true;

		if (!isNull player) then {
            drn_var_Escape_playerEnteredWorld = true;
            removeAllWeapons player;
            removeAllItems player;
            removeBackpack player;
		};
	};
};


enableSaving [true, true];

if (!isDedicated) then {
    waitUntil {!isNull player};
    player setCaptive true;
};

if (_playerIsImmortal) then {
    p1 allowDamage false;
};

//revive init
if(isMultiplayer) then {
	//{[_x] call at_fnc_initRevive;} foreach playableunits;
} else {
	//[p1] call at_fnc_initRevive;
};
//[player] call at_fnc_initRevive;	
//[] spawn at_fnc_serverCheck;



// Initialization
drn_arr_JipSpawnPos = [];
//call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
//call drn_fnc_CL_InitParams;

//Wait until server has parsed the parameters
waituntil {!isNil("A3E_ParamsParsed")};

call compile preprocessFileLineNumbers "Scripts\Escape\Functions.sqf";
call compile preprocessFileLineNumbers "Scripts\Escape\AIskills.sqf";

[_isJipPlayer] call compile preprocessFileLineNumbers "Briefing.sqf";

setTerrainGrid (Param_Grass);

if (isServer) then {
    drn_var_Escape_hoursSkipped = 0;
    
    if (isMultiplayer) then {
        private ["_hour"];
        
        if (Param_TimeOfDay == 24) then {
            _hour = floor random 24;
        }
        else {
            _hour = Param_TimeOfDay;
        };
        
        drn_var_Escape_hoursSkipped = _hour - (date select 3);
        publicVariable "drn_var_Escape_hoursSkipped";
        setDate [date select 0, date select 1, date select 2, _hour, 0];
    };
};

if((Param_NoNightvision)==1) then {
	a3e_var_noNV = true;
} else {
	a3e_var_noNV = false;
};


if (!isDedicated) then {
	waitUntil {drn_var_Escape_playerEnteredWorld};

	// Report to all other clients (and server) that player has entered the world
	//### Maybe its save to only report to server (could save traffic at startup) ###
	if (isNil "drn_var_Escape_syncronizationDone") then {
		switch (str player) do {
			case "p1": {
				drn_var_Escape_playerEnteredWorld_p1 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p1";
			};
			case "p2": {
				drn_var_Escape_playerEnteredWorld_p2 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p2";
			};
			case "p3": {
				drn_var_Escape_playerEnteredWorld_p3 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p3";
			};
			case "p4": {
				drn_var_Escape_playerEnteredWorld_p4 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p4";
			};
			case "p5": {
				drn_var_Escape_playerEnteredWorld_p5 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p5";
			};
			case "p6": {
				drn_var_Escape_playerEnteredWorld_p6 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p6";
			};
			case "p7": {
				drn_var_Escape_playerEnteredWorld_p7 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p7";
			};
			case "p8": {
				drn_var_Escape_playerEnteredWorld_p8 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p8";
			};
			case "p9": {
				drn_var_Escape_playerEnteredWorld_p9 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p9";
			};
			case "p10": {
				drn_var_Escape_playerEnteredWorld_p10 = true;
				publicVariable "drn_var_Escape_playerEnteredWorld_p10";
			};
			default {
				player sideChat "This should never happen!";
			};
		};
		
		_playersEnteredWorld = 1;
		while {(count call drn_fnc_Escape_GetPlayers != _playersEnteredWorld)} do {
			
			_playersEnteredWorld = 0;
			if (!isNil "drn_var_Escape_playerEnteredWorld_p1") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p2") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p3") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p4") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p5") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p6") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p7") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p8") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p9") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
			if (!isNil "drn_var_Escape_playerEnteredWorld_p10") then {
				_playersEnteredWorld = _playersEnteredWorld + 1;
			};
		};
	};

	drn_var_Escape_syncronizationDone = true;
	publicVariable "drn_var_Escape_syncronizationDone";

	waitUntil {!isNil "drn_var_Escape_FunctionsInitializedOnServer"};
	[] call drn_fnc_Escape_AskForTimeSynchronization;

	// Player Initialization

	removeAllWeapons player;
	removeAllItems player;
	removeBackpack player;

	player addWeapon "ItemRadio";
	player addWeapon "ItemWatch";
	player addWeapon "ItemMap";

	drn_fnc_Escape_DisableLeaderSetWaypoints = {
		if (!visibleMap) exitwith {};
		
		{
			player groupSelectUnit [_x, false]; 
		} foreach units group player;
	};

	// If multiplayer, then disable the cheating "move to" waypoint feature.
	if (isMultiplayer) then {
		[] spawn {
			waitUntil {!isNull(findDisplay 46)}; 
			// (findDisplay 46) displayAddEventHandler ["KeyDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
			(findDisplay 46) displayAddEventHandler ["MouseButtonDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
		};
	};


	if (!isMultiplayer) then {
		{
			/*
			_x setCaptive true;
			
			removeAllWeapons _x;
			removeAllItems _x;
			_x addWeapon "ItemRadio";
			_x addWeapon "ItemWatch";
			_x addWeapon "ItemMap";
			*/
			
			if (_x != p1) then {
				deleteVehicle _x;
			};
		} foreach units group player;
	};



	// Run start sequence for all players
	if (!isNull player) then {
		[_showIntro, _showPlayerMapAndCompass, _isJipPlayer, _useRevive, _debug] spawn {
			private ["_showIntro", "_showPlayerMapAndCompass", "_isJipPlayer", "_useRevive"];
			private ["_marker","_debug"];
			
			_showIntro = _this select 0;
			_showPlayerMapAndCompass = _this select 1;
			_isJipPlayer = _this select 2;
			_useRevive = _this select 3;
			_debug = _this select 4;
			
			waitUntil {!(isNil "drn_startPos")};
			waitUntil {!(isNil "drn_fenceIsCreated")};
			
			if (_isJipPlayer) then {
				[[player], "A3E_FNC_handleJIP", false, false] spawn BIS_fnc_MP;
				
                                
				//[] spawn {
				//	private ["_marker"];
					
					// Communication center markers
				//	waitUntil {!isNil "drn_var_Escape_communicationCenterPositions"};
					
				//	for "_i" from 0 to (count drn_var_Escape_communicationCenterPositions) - 1 do {
				//		_marker = createMarkerLocal ["drn_Escape_ComCenJipMarker" + str _i, (drn_var_Escape_communicationCenterPositions select _i)];
				//		_marker setMarkerType "Flag_CSAT";
				//	};
					
					// Ammo depot markers
				//	waitUntil {!isNil "drn_var_Escape_ammoDepotPositions"};
					
				//	for "_i" from 0 to (count drn_var_Escape_ammoDepotPositions) - 1 do {
				//		_marker = createMarkerLocal ["drn_Escape_AmmoDepotJipMarker" + str _i, (drn_var_Escape_ammoDepotPositions select _i)];
				//		_marker setMarkerType "o_installation";
				//	};
					
					// Extraction marker
				//	if (!isNil "drn_var_Escape_ExtractionMarkerPos") then {
				//		_marker = createMarkerLocal ["drn_visibleGoalJipMarker", drn_var_Escape_ExtractionMarkerPos];
				//		_marker setMarkerType "Flag_NATO";
				//	};
				//};
			} else {
				//if (isMultiplayer) then {
					player setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];

					{
						if(!isplayer _x) then {
							_x setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];
						};
					} foreach units group player;
				//};
				
				/*while {!([drn_startPos] call drn_fnc_Escape_AllPlayersOnStartPos) && (isNil "drn_escapeHasStarted")} do {
					sleep 0.1;
				};*/
			   // waituntil {([drn_startPos] call drn_fnc_Escape_AllPlayersOnStartPos) && (!isNil "drn_escapeHasStarted")};

			};
			//Disable Respawn-Button
			[] spawn {
				if((Param_RespawnButton)==0) then {
					while{true} do {
						while{isNull ((findDisplay 49) displayCtrl 1010)} do {
							sleep 0.1;
						};
						((findDisplay 49) displayCtrl 1010) ctrlEnable false;
						while{!isNull ((findDisplay 49) displayCtrl 1010)} do {
							sleep 0.1;
						};
					};
				};
			};
			if (_showPlayerMapAndCompass) then {
				_marker = createMarkerLocal ["drn_startPosMarker", drn_startPos];
				_marker setMarkerType "mil_dot";
				player additem "ItemCompass";
				player assignItem "ItemCompass";
			}
			else {
				player unassignItem "ItemMap";
				player removeItem "ItemMap";
				player unassignItem "ItemCompass";
				player removeItem "ItemCompass";
				player unassignItem "itemGPS";
				player removeItem "itemGPS";
				player unassignItem "NVGoggles";
				player removeItem "NVGoggles";
				player unassignItem "rhsusf_ANPVS_14";
				player removeItem "rhsusf_ANPVS_14";
				player unassignItem "rhsusf_ANPVS_15";
				player removeItem "rhsusf_ANPVS_15";
				player unassignItem "A3_GPNVG18_REC_BLK_F";
				player removeItem "A3_GPNVG18_REC_BLK_F";
				player unassignitem "B_UavTerminal"; 
				player removeitem "B_UavTerminal";
			};
			
			// Set position again (a fix for the bug that makes players run away after server restart and before fence is built by server)
			//player setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];

			
			player setVariable ["drn_var_initializing", false, true];
			waitUntil {!(isNil "drn_escapeHasStarted")};
			{
				_x setCaptive false;
				_x enableAI "MOVE";
			} foreach units group player;
		};
	};
	[] spawn {
		disableSerialization;
		waitUntil {!isNull(findDisplay 46)};
		(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
	};
	
	waitUntil {!(isNil "drn_startPos")};
	waitUntil {!(isNil "drn_fenceIsCreated")};
	sleep 1.5;
	titleFadeOut 1;
	sleep 3;
	["Somewhere on", A3E_WorldName , str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;
	if(!isNil("paramsArray")) then {
		paramsArray call A3E_fnc_WriteParamBriefing;
	};
};


