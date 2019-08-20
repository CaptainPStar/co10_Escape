diag_log format["initClient run for %1 (%2)", name player, str _this];

if(!hasInterface) exitwith {};


titleText [localize "STR_A3E_initLocalPlayer_Loading", "BLACK",0.1];

waituntil {!isnull player};

call A3E_FNC_Briefing;

[player] remoteExec ["a3e_fnc_initPlayer", 2, false];

[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};


AT_Revive_StaticRespawns = [];
AT_Revive_enableRespawn = false;
AT_Revive_clearedDistance = 0;
AT_Revive_Camera = 1;



[] call A3E_fnc_addUserActions;

//BIS
player unassignItem "ItemMap";
player removeItem "ItemMap";
player unassignItem "ItemCompass";
player removeItem "ItemCompass";
player unassignItem "itemGPS";
player removeItem "itemGPS";
player unassignItem "itemRadio";
player removeItem "itemRadio";
player unassignItem "itemWatch";
player removeItem "itemWatch";
player unassignItem "O_UavTerminal";
player removeItem "O_UavTerminal";
player unassignitem "B_UavTerminal"; 
player removeitem "B_UavTerminal";
player unassignitem "I_UavTerminal"; 
player removeitem "I_UavTerminal";




removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeVest player;
removeHeadgear player;
removeGoggles player;
if(hmd player != "") then {
	private _hmd = hmd player;
	player unlinkItem _hmd;
};

player addeventhandler["HandleRating","_this call A3E_FNC_handleRating;"];


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

waituntil{sleep 0.1;!isNil("A3E_ParamsParsed")};
AT_Revive_Camera = Param_ReviveView;

//If no ACE use ATR revive
if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
	player setVariable ["ACE_Revive_isUnconscious", false, true];
} else {
	call ATR_FNC_ReviveInit;
};


setTerrainGrid Param_Grass;

if (Param_Magrepack == 1) then {
	[] execVM "Scripts\outlw_magRepack\MagRepack_init_sv.sqf";
};


[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};
player setvariable["A3E_PlayerInitializedLocal",true,true];


waituntil{sleep 0.1;(player getvariable["A3E_PlayerInitializedServer",false])};

diag_log format["Escape debug: %1 is now ready (clientside).", name player];

sleep 3;
titleFadeOut 1.0;


waituntil{sleep 0.5;!isNil("A3E_EscapeHasStarted")};

//Message delayed to make sure ACE_MedicalServer is broadcasted
if ((isClass(configFile >> "CfgPatches" >> "ACE_Medical")) && !(ACE_MedicalServer)) then {systemChat "Player is running ACE on unsupported server! Please deactivate or gameplay could be servilely affected.";};
if (!(isClass(configFile >> "CfgPatches" >> "ACE_Medical")) && (ACE_MedicalServer)) then {systemChat "Server is running ACE! Please install the compatible version and reconnect to prevent gamebreaking issues.";};

[] spawn {
	waituntil{sleep 0.5;A3E_Task_Prison_Complete};
	[localize "STR_A3E_initLocalPlayer_somewhereOn", A3E_WorldName , str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;
};
