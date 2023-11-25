diag_log "Escape: Bootstrapping mission...";

call compile preprocessFileLineNumbers "config.sqf";
//call compile preprocessFileLineNumbers "Island\WorldConfig.sqf";

//Prepared for new terrain and mod storage logic
private _islandPath = "Island";
private _configPath = format["%1\WorldConfig.sqf",_islandPath];
private _villageMarkersPath = format["%1\VillageMarkers.sqf",_islandPath];
private _comCentersPath = format["%1\CommunicationCenterMarkers.sqf",_islandPath];


[] call compile preprocessFileLineNumbers _configPath;
[] call compile preprocessFileLineNumbers _villageMarkersPath;
[] call compile preprocessFileLineNumbers _comCentersPath;

if(isNil("A3E_WorldName")) then {
	["WorldConfig seems to be missing.",["ERROR","Missing"]] call A3E_fnc_log;
	throw "WorldConfig seems to be missing.";
};

if(isNil("a3e_villageMarkers")) then {
	["Villagemarker seem to be missing.",["ERROR","Missing"]] call A3E_fnc_log;
	throw "Villagemarker config seems to be missing.";
};

if(isNil("a3e_communicationCenterMarkers")) then {
	["ComCentermarker seem to be missing.",["ERROR","Missing"]] call A3E_fnc_log;
	throw "ComCentermarkers seems to be missing.";
};



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