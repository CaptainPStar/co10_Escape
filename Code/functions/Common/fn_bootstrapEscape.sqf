diag_log "Escape: Bootstrapping mission...";

if(isServer) then {
	[] spawn a3e_fnc_missionFlow;
	
	waituntil{sleep 1; count([] call A3E_FNC_GetPlayers)>0};
	[] spawn a3e_fnc_initServer;
	
	//ACE Revive
	if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
		countStarted = false;
		ACE_allUnconscious = false;
		ACE_UnconsciousPlayers = [];
		addMissionEventHandler ["HandleDisconnect", ACE_fnc_HandleDisconnect];
		["ace_unconscious", ACE_fnc_HandleUnconscious] call CBA_fnc_addEventHandler;
	};
};
if(hasInterface) then {
	[] spawn a3e_fnc_initLocalPlayer;
};