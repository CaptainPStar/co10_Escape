diag_log "Escape: Bootstrapping mission...";

call compile preprocessFileLineNumbers "config.sqf";
call compile preprocessFileLineNumbers "Island\WorldConfig.sqf";

private _isHC = !isServer && {!hasInterface};

if (isServer) then {
	[] spawn a3e_fnc_missionFlow;
	a3e_hcArray = entities "HeadlessClient_F";
	a3e_hcReady = +a3e_hcArray;
	"a3e_hc" addPublicVariableEventHandler {
		params ["", "_hc"];
		("HC ready " + str _hc) call a3e_fnc_rptLog;
		a3e_hcReady = a3e_hcReady - [_hc];
	};
	call a3e_fnc_parameterInit;
};

if (_isHC) then {
	waitUntil {!isNil "A3E_ParamsParsed"};
};

call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";

if (isServer || {_isHC}) then {
	call a3e_fnc_initServerHC;
};

if (_isHC) then {
	waituntil {!isNull player};
	a3e_hc = player;
	publicVariableServer "a3e_hc";
};

if (isServer) then {
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
