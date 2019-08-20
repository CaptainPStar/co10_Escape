diag_log "Escape: Bootstrapping mission...";

if(isServer) then {
	[] spawn a3e_fnc_missionFlow;
	
	waituntil{sleep 1; count([] call A3E_FNC_GetPlayers)>0};
	[] spawn a3e_fnc_initServer;
	
};
if(hasInterface) then {
	[] spawn a3e_fnc_initLocalPlayer;
};