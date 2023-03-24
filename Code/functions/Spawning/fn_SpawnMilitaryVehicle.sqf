params["_pos","_side"];

private _possibleVehicles = [];


  if(_side == A3E_VAR_Side_Opfor) then {
	_possibleVehicles = a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses;
};
if (_side == A3E_VAR_Side_Ind ) then {
	_possibleVehicles = a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_Ind;
};

private _vehicleType = selectRandom _possibleVehicles;

private _road = roadAt _pos;
private _direction = 0;
if(!isNull _road) then {
	_direction = getdir _road;
};

["Spawning vehicle.",["Spawning","MilitaryTraffic"],[_pos, _direction, _vehicleType, _side]] call a3e_fnc_log;
private _result = [_pos, _direction, _vehicleType, _side] call BIS_fnc_spawnVehicle;

private _vehicle = _result select 0;

[_vehicle] call a3e_fnc_onVehicleSpawn;

private _vehiclesCrew = _result select 1;
private _group = _result select 2;

[_group] call A3E_fnc_onEnemyGroupSpawn;

{[_x] call A3E_fnc_onEnemySoldierSpawn;} foreach units _group;

["Creating group.",["Spawning","MilitaryTraffic"]] call a3e_fnc_log;

_group