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

player setCaptive true;
  
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
  
  
waituntil{sleep 0.1;(!isNil("A3E_FenceIsCreated") && !isNil("A3E_StartPos") && !isNil("A3E_ParamsParsed"))};

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

sleep 1.5;
titleFadeOut 1;
sleep 2;
["Somewhere on", A3E_WorldName , str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;
if(!isNil("paramsArray")) then {
	paramsArray call A3E_fnc_WriteParamBriefing;
};
waituntil{sleep 0.1;!isNil("A3E_EscapeHasStarted")};
player setCaptive false;
