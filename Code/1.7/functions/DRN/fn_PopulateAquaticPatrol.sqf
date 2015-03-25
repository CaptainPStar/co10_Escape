if (!isServer) exitWith {};

private ["_village", "_markerName", "_debug", "_soldiers", "_soldier", "_skill", "_soldierType", "_spawned", "_damage", "_soldierObj"];
private ["_villagePos", "_script", "_groups", "_newGroup", "_soldierPos", "_rank", "_villageSide"];

_village = _this select 0;
if (count _this > 1) then {_debug = _this select 1;} else {_debug = false;};

_markerName = _village select 0;
_villagePos = _village select 1;
_groups = _village select 2;
//_villageSide = _village select 3;

if (_debug) then {
    player sideChat "Populating aquatic patrol zone (" + _markerName + " No of groups: " + str _groups + ")";
};

if (_groups == 0) exitWith {};
_arrBoats = [];
for [{_i=0},{_i<=_groups},{_i=_i+1}] do {
	//_boat = createVehicle ["O_Boat_Armed_01_hmg_F", _villagePos, [], 0, ""];

	_spawnPos = [_markerName] call a3e_fnc_RandomMarkerPos;
	while {!(surfaceIsWater [_spawnPos select 0, _spawnPos select 1])} do {
		_spawnPos = [_markerName] call a3e_fnc_RandomMarkerPos;
	};
	
	_boat = [_spawnPos, random 360, (a3e_arr_AquaticPatrols select floor (random count a3e_arr_AquaticPatrols)), EAST] call BIS_fnc_spawnVehicle;
	_arrBoats set [count _arrBoats, _boat];
	_crew = _boat select 1;
	_group = _boat select 2;

	{
		 _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
	} foreach _crew;
	_script = [_group, _markerName] spawn A3E_fnc_AquaticPatrol;

	_group setvariable["A3E_GroupPatrolScript",_script];
	sleep 1;
}; 

_village set [3, _arrBoats];