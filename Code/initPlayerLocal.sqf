diag_log format["initPlayerLocal run for %1 (prewaituntil)", name player];

waituntil{!isNull(player)};
//Clientside Stuff
//call compile preprocessFile "Revive\reviveInit.sqf";

diag_log format["initPlayerLocal run for %1", name player];

[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};
titleText ["Loading...", "BLACK",0.1];

AT_Revive_StaticRespawns = [];
AT_Revive_enableRespawn = false;
AT_Revive_clearedDistance = 0;
AT_Revive_Camera = 1;


call ATR_FNC_ReviveInit;

call compile preprocessFile "Scripts\AT\dronehack_init.sqf";
[] call A3E_fnc_addUserActions;

//BIS
player unassignItem "ItemMap";
player removeItem "ItemMap";
player unassignItem "ItemCompass";
player removeItem "ItemCompass";
player unassignItem "itemGPS";
player removeItem "itemGPS";
player unassignItem "O_UavTerminal";
player removeItem "O_UavTerminal";
player unassignitem "B_UavTerminal"; 
player removeitem "B_UavTerminal";
player unassignitem "I_UavTerminal"; 
player removeitem "I_UavTerminal";
player unassignItem "NVGoggles";
player removeItem "NVGoggles";
player unassignItem "NVGoggles_OPFOR";
player removeItem "NVGoggles_OPFOR";
player unassignItem "NVGoggles_INDEP";
player removeItem "NVGoggles_INDEP";
//RHS
player unassignItem "rhsusf_ANPVS_14";
player removeItem "rhsusf_ANPVS_14";
player unassignItem "rhsusf_ANPVS_15";
player removeItem "rhsusf_ANPVS_15";
player unassignItem "rhs_1PN138";
player removeItem "rhs_1PN138";
player unassignItem "rhsusf_ANPVS_15";
player removeItem "rhsusf_ANPVS_15";
//
player unassignItem "A3_GPNVG18_REC_BLK_F";
player removeItem "A3_GPNVG18_REC_BLK_F";
//BIS Apex
player unassignItem "O_NVGoggles_hex_F";
player removeItem "O_NVGoggles_hex_F";
player unassignItem "O_NVGoggles_urb_F";
player removeItem "O_NVGoggles_urb_F";
player unassignItem "O_NVGoggles_ghex_F";
player removeItem "O_NVGoggles_ghex_F";
player unassignItem "NVGoggles_tna_F";
player removeItem "NVGoggles_tna_F";
player unassignItem "NVGogglesB_blk_F";
player removeItem "NVGogglesB_blk_F";
player unassignItem "NVGogglesB_grn_F";
player removeItem "NVGogglesB_grn_F";
player unassignItem "NVGogglesB_gry_F";
player removeItem "NVGogglesB_gry_F";
//CUP
player unassignItem "CUP_NVG_HMNVS";
player removeItem "CUP_NVG_HMNVS";
player unassignItem "CUP_NVG_PVS7";
player removeItem "CUP_NVG_PVS7";
player unassignItem "CUP_NVG_PVS14";
player removeItem "CUP_NVG_PVS14";


removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeVest player;
removeHeadgear player;
  
player addeventhandler["HandleRating","_this call A3E_FNC_handleRating;"];
  
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


[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};
player setvariable["A3E_PlayerInitializedLocal",true,true];
waituntil{sleep 0.1;(!isNil("A3E_FenceIsCreated") && !isNil("A3E_StartPos") && (player getvariable["A3E_PlayerInitializedServer",false]))};

diag_log format["Escape debug: %1 is now ready (clientside).", name player];

titleFadeOut 0.5;


waituntil{sleep 0.5;!isNil("A3E_EscapeHasStarted")};

player setCaptive false;
[] spawn {
	waituntil{sleep 0.5;A3E_Task_Prison_Complete};
	["Somewhere on", A3E_WorldName , str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;
};
