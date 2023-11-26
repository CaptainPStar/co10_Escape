params["_pos"];

private _possibleVehicles = missionnamespace getvariable ["a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses",[]];


if(count(_possibleVehicles) == 0) exitwith {
	["No civilian vehicle defined.",["Spawning","CivilianCommuters"]] call a3e_fnc_log;
};

private _vehicleType = selectRandom _possibleVehicles;

private _road = roadAt _pos;
private _direction = 0;
if(!isNull _road) then {
	_direction = getdir _road;
};

["Spawning vehicle.",["Spawning","CivilianCommuters"],[_pos, _direction, _vehicleType, civilian]] call a3e_fnc_log;
private _result = [_pos, _direction, _vehicleType, civilian] call BIS_fnc_spawnVehicle;

_result params ["_vehicle", "_vehiclesCrew", "_group"];

[_vehicle] call a3e_fnc_onVehicleSpawn;

// replace unit with random class
private _class = selectRandom a3e_arr_Escape_MilitaryTraffic_CivilianCrewClasses;
private _newDriver = _group createUnit [_class, _pos, [] , 0, "NONE"];
private _driver = driver _vehicle;
moveOut _driver;
deleteVehicle _driver;
_newDriver moveInDriver _vehicle;
if (random 10 < 2 && {0 < _vehicle emptyPositions "Cargo"}) then {
	_class = selectRandom a3e_arr_Escape_MilitaryTraffic_CivilianCrewClasses;
	_group createUnit [_class, _pos, [] , 0, "CARGO"];
};
_vehiclesCrew = crew _vehicle;
_group addVehicle _vehicle;
_group selectLeader commander _vehicle;

[_group] call A3E_fnc_onCivilianGroupSpawn;

{[_x] call A3E_fnc_onCivilianSpawn;} foreach units _group;


clearitemcargoglobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;

if (random 100 < 20) then {
	private ["_weaponItem"];

	_weaponItem = selectRandom a3e_arr_CivilianCarWeapons;

	_vehicle addWeaponCargoGlobal [_weaponItem select 0, 1];
	_vehicle addMagazineCargoGlobal [_weaponItem select 1, _weaponItem select 2];
};
if (random 100 < 80) then {
   _vehicle addItemCargoglobal ["firstaidkit", 3];
};
if (random 100 < 80) then {
   _vehicle addMagazineCargoglobal ["smokeshellRed", 2];
};
if (random 100 < 80) then {
   _vehicle addMagazineCargoglobal ["Chemlight_green", 5];
};

["Creating group.",["Spawning","CivilianCommuters"]] call a3e_fnc_log;

_group