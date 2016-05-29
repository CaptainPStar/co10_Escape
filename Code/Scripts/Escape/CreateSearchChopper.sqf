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
private ["_chopper", "_chopperspawn", "_group", "_pilot", "_copilot", "_gunner1", "_gunner2", "_gunner3"];
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
_chopperspawn = [_homePos, random 360, (a3e_arr_searchChopper select floor (random count a3e_arr_searchChopper)), A3E_VAR_Side_Opfor] call BIS_fnc_spawnVehicle;
_chopper = _chopperspawn select 0;
_chopper lock 0;
_chopper setVehicleVarName _vehicleVarName;
_chopper call compile format ["%1=_this;", _vehicleVarName];

_group = createGroup _side;

//"O_Pilot_F" createUnit [getMarkerPos "drn_searchChopperStartPosMarker", _group, "", (_minSkill + random (_maxSkill - _minSkill)), "LIEUTNANT"];
//"O_Pilot_F" createUnit [getMarkerPos "drn_searchChopperStartPosMarker", _group, "", (_minSkill + random (_maxSkill - _minSkill)), "LIEUTNANT"];
//"O_Pilot_F" createUnit [position player, _group, "", (_minSkill + random (_maxSkill - _minSkill)), "LIEUTNANT"];
/*_group createUnit [(a3e_arr_searchChopper_pilot select floor (random count a3e_arr_searchChopper_pilot)), getMarkerPos "drn_searchChopperStartPosMarker", [], 0, "FORM"];
_group createUnit [(a3e_arr_searchChopper_pilot select floor (random count a3e_arr_searchChopper_pilot)), getMarkerPos "drn_searchChopperStartPosMarker", [], 0, "FORM"];
_group createUnit [(a3e_arr_searchChopper_crew select floor (random count a3e_arr_searchChopper_crew)), getMarkerPos "drn_searchChopperStartPosMarker", [], 0, "FORM"];
_group createUnit [(a3e_arr_searchChopper_crew select floor (random count a3e_arr_searchChopper_crew)), getMarkerPos "drn_searchChopperStartPosMarker", [], 0, "FORM"];
_group createUnit [(a3e_arr_searchChopper_crew select floor (random count a3e_arr_searchChopper_crew)), getMarkerPos "drn_searchChopperStartPosMarker", [], 0, "FORM"];

_unitArray = _unitArray + units _group;

_pilot = (units _group) select 0;
_copilot = (units _group) select 1;
_gunner1 = (units _group) select 2;
_gunner2 = (units _group) select 3;
_gunner3 = (units _group) select 4;

_pilot assignAsDriver _chopper;
_pilot moveInDriver _chopper;
_copilot assignAsGunner _chopper;
_copilot moveInTurret [_chopper, [0]];
_gunner1 assignAsGunner _chopper;
_gunner1 moveInTurret [_chopper, [1]];
_gunner2 assignAsGunner _chopper;
_gunner2 moveInTurret [_chopper, [2]];
_gunner3 assignAsGunner _chopper;
_gunner3 moveInTurret [_chopper, [3]];*/
_chopper action ["lightOn", _chopper];

/*{
	_x setUnitRank "LIEUTNANT";
    _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
} foreach units _group;*/

[_chopper, _searchAreaMarker, _searchTimeMin, _refuelTimeMin, _debug] spawn drn_fnc_SearchChopper;


