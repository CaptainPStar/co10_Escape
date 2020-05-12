/*
	Creating a manned search chopper, and runs the script SearchChopper.sqf on it.

	Arguments:
		_homePos: Choppers spawn position.
		_side: Chopper's side.
		_searchAreaMarker: Search area marker.
		_searchTimeMin: Optional. Search time in minutes, starting when chopper leaving home position.
		_refuelTimeMin: Optional. Refuel time in minutes, starting when chopper has returned to base and start refueling.
		_chopperType: Optional. Class name of chopper to use.
		_minSkill: Optional. Skill for the different units in the group is a random value between this value and _maxSkill.
		_maxSkill: Optional. Skill for the different units in the group is a random value between _minSkill and this value.
		_unitArray: Optional. All created man units will be appended to this array.
		_debug: Optional. true if you want to monitor the chopper's different states through the player's side chat.
*/

if (!isServer) exitWith {};

private ["_homePos", "_side", "_searchAreaMarker", "_searchTimeMin", "_refuelTimeMin", "_minSkill", "_maxSkill", "_unitArray", "_debug"];
private ["_chopper", "_chopperspawn"];
private ["_vehicleVarName", "_vehicleVarNameBase", "_vehicleVarNameNo"];

_homePos = _this select 0;
_side = _this select 1;
_searchAreaMarker = _this select 2;
if (count _this > 3) then {_searchTimeMin = _this select 3;} else {_searchTimeMin = 15};
if (count _this > 4) then {_refuelTimeMin = _this select 4;} else {_refuelTimeMin = 10};
if (count _this > 5) then {_minSkill = _this select 5;} else {_minSkill = 0.3;};
if (count _this > 6) then {_maxSkill = _this select 6;} else {_maxSkill = 0.6;};
if (count _this > 7) then {_unitArray = _this select 7;} else {_unitArray = [];};
if (count _this > 8) then {_debug = _this select 8;} else {_debug = false;};

if (_debug) then {
    player sideChat "Creating search chopper...";
};


// Find a free vehicle variable name
_vehicleVarNameBase = "drn_searchChopper";
_vehicleVarNameNo = 1;
_vehicleVarName = _vehicleVarNameBase + str _vehicleVarNameNo;
while {!(isNil _vehicleVarName)} do {
	_vehicleVarNameNo = _vehicleVarNameNo + 1;
	_vehicleVarName = _vehicleVarNameBase + str _vehicleVarNameNo;
};

//_chopper = "O_Heli_Light_02_F" createVehicle _homePos;
//_chopper = createVehicle ["RHS_Mi8AMTSh_vvsc", _homePos, [], 0, "NONE"];
private _type =  selectRandom a3e_arr_searchChopper;

_homePos = _homePos vectorAdd [0,0,100];

//_chopperspawn = [_homePos, random 360, _type, A3E_VAR_Side_Opfor] call BIS_fnc_spawnVehicle;
_chopper = createVehicle [_type, _homePos, [], random 360, "FLY"];
[_chopper] call a3e_fnc_onVehicleSpawn;
private _group = createVehicleCrew _chopper;

{
	_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
} foreach crew _chopper;

// populate FFV turrets
private _classList = [a3e_arr_Escape_InfantryTypes_Ind, a3e_arr_Escape_InfantryTypes] select (side _group == A3E_VAR_Side_Opfor);
{
	if !(_chopper lockedTurret _x) then {
		private _soldier = _group createUnit [selectRandom _classList, [0,0,0], [], 0, "NONE"];
		_soldier moveInTurret [_chopper, _x];
	};
} forEach (fullCrew [_chopper, "turret", true] select {_x#4} apply {_x#3});

_chopper lock 0;
_chopper setVehicleVarName _vehicleVarName;
_chopper call compile format ["%1=_this;", _vehicleVarName];

_chopper action ["lightOn", _chopper];



[_chopper, _searchAreaMarker, _searchTimeMin, _refuelTimeMin, _debug] spawn drn_fnc_SearchChopper;


