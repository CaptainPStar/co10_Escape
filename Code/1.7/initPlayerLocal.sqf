waituntil{!isNull(player)};
//Clientside Stuff
//call compile preprocessFile "Revive\reviveInit.sqf";
[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};
titleText ["Loading...", "BLACK",0.1];

call compile preprocessFile "Revive\reviveInit.sqf";
call compile preprocessFile "Scripts\AT\dronehack_init.sqf";
[] call A3E_fnc_addUserActions;
  
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
  
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
  
  
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemWatch";
player assignItem "ItemWatch";

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

  //Disable respawn Button
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



[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};

waituntil{sleep 0.1;(!isNil("A3E_FenceIsCreated") && !isNil("A3E_StartPos") && !isNil("A3E_ParamsParsed") && (player getvariable["A3E_PlayerInitialized",false]))};

sleep 2.0;

if(!isNil("paramsArray")) then {
	paramsArray call A3E_fnc_WriteParamBriefing;
};

diag_log format["Escape debug: %1 is now ready (clientside).", name player];

titleFadeOut 1;
sleep 2;
["Somewhere on", A3E_WorldName , str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;

waituntil{sleep 0.5;!isNil("A3E_EscapeHasStarted")};

player setCaptive false;
