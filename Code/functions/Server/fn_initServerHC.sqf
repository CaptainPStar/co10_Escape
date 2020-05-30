"Server/HC init" call a3e_fnc_rptLog;

call compile preprocessFileLineNumbers "Scripts\Escape\Functions.sqf";
call compile preprocessFileLineNumbers "Scripts\Escape\AIskills.sqf";

private _enemyFrequency = Param_EnemyFrequency;

[_enemyFrequency] call compile preprocessFileLineNumbers "Units\UnitClasses.sqf";

drn_searchAreaMarkerName = "drn_searchAreaMarker";
