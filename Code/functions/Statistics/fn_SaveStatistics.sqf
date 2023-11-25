params["_endType"];


	
private _statisticsCollected = missionNamespace getvariable ["A3E_EndStatisticsCollected",false];

if(!_statisticsCollected) then {
	missionNamespace setvariable ["A3E_EndStatisticsCollected",true];
	private _island = getText (missionConfigFile >> "EscapeIsland");
	private _mod = getText (missionConfigFile >> "EscapeMod");
	private _version = getText (missionConfigFile >> "EscapeVersion");
	private _release = getText (missionConfigFile >> "EscapeRelease");
	private _statisticsVersion = profileNamespace getVariable ["A3E_Statistics_Version", -1]; 
	private _statistics = profileNamespace getVariable ["A3E_Statistics", []]; 

	_statistics pushBack [_version,_mod,_island,_endType, count (call BIS_fnc_listPlayers), time, A3E_Task_Prison_Complete,A3E_Task_Map_Complete,A3E_Task_ComCenter_Complete,A3E_Task_Exfil_Complete];

	profileNamespace setVariable ["A3E_Statistics", _statistics]; 
	missionNamespace setvariable ["A3E_EndStatistics",[_statistics] call A3E_fnc_parseStatistics,true];
	saveProfileNamespace;
};