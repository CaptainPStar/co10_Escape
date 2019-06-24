diag_log "Escape: Bootstrapping mission...";

if(isServer) then {
	[] spawn a3e_fnc_missionFlow;
	
	waituntil{sleep 1; count([] call A3E_FNC_GetPlayers)>0};
	[] spawn a3e_fnc_initServer;
	
	//ACE Revive
	AT_Revive_Camera = Param_ReviveView; //Needs to be stored on server now
	ACE_MedicalServer = false;
	publicVariable "ACE_MedicalServer";
	if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
		ACE_MedicalServer = true;
		publicVariable "ACE_MedicalServer";
		["ace_unconscious", {params["_unit", "_isDown"]; [_unit,_isDown] spawn ACE_fnc_HandleUnconscious;}] call CBA_fnc_addEventHandler;
	};
};
if(hasInterface) then {
	[] spawn a3e_fnc_initLocalPlayer;
};