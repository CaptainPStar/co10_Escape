private _statisticsVersion = profileNamespace getVariable ["A3E_Statistics_Version", -1]; 
private _statistics = profileNamespace getVariable ["A3E_Statistics", []]; 


private _statisticText = [_statistics] call A3E_fnc_parseStatistics;

_statisticText remoteExec ["A3E_fnc_WriteStatisticsToBriefing", 0, true]; 