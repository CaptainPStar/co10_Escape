diag_log "Escape: Bootstrapping mission...";

call compile preprocessFileLineNumbers "config.sqf";
call compile preprocessFileLineNumbers "Island\WorldConfig.sqf";

if(isServer) then {
	[] spawn a3e_fnc_missionFlow;
	[] spawn a3e_fnc_initServer;
	
};
if(hasInterface) then {
	[] spawn {
		titleText [localize "STR_A3E_initLocalPlayer_Loading", "BLACK",0.1];
		[] call a3e_fnc_initLocalPlayer;
		sleep 2;
		titleFadeOut 2.0;
	};
};