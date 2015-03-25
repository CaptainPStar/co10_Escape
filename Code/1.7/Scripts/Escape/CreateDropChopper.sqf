if (!isServer) exitWith {};

private ["_spawnPos", "_side", "_minSkill", "_maxSkill", "_onGroupDropped", "_dropUnits", "_debug", "_chopper", "_group", "_pilot", "_gunner1", "_gunner2", "_currentInstanceNo", "_crewType", "_chopperType", "_dropPosition"];
private ["_vehicleVarName"];

_spawnPos = _this select 0;
_side = _this select 1;
_chopperType = _this select 2;
_crewType = _this select 3;
_dropUnits = _this select 4;
_dropPosition = _this select 5;
if (count _this > 6) then {_minSkill = _this select 6;} else {_minSkill = 0.3;};
if (count _this > 7) then {_maxSkill = _this select 7;} else {_maxSkill = 0.5;};
if (count _this > 8) then {_onGroupDropped = _this select 8;} else {_onGroupDropped = {};};
if (count _this > 9) then {_debug = _this select 9;} else {_debug = false;};

if (_debug) then {
    player sideChat "Creating drop chopper...";
};

if (isNil "drn_CreateDropChopper_CurrentInstanceNo") then {
	drn_CreateDropChopper_CurrentInstanceNo = 0
};

_currentInstanceNo = drn_CreateDropChopper_CurrentInstanceNo;
drn_CreateDropChopper_CurrentInstanceNo = drn_CreateDropChopper_CurrentInstanceNo + 1;

//_chopper = _chopperType createVehicle _spawnPos;
_chopper = createVehicle [_chopperType, _spawnPos, [], 0, "NONE"];
_vehicleVarName = "drn_searchChopper" + str _currentInstanceNo;
_chopper setVehicleVarName _vehicleVarName;
_chopper Call Compile Format ["%1 = _this; PublicVariable ""%1""", _vehicleVarName];

{
	_x moveInCargo _chopper;
	_x assignAsCargo _chopper;
} foreach _dropUnits;

_group = createGroup _side;

//_crewType createUnit [[0, 0, 30], _group, "", (_minSkill + random (_maxSkill - _minSkill)), "LIEUTNANT"];
//_crewType createUnit [[0, 0, 30], _group, "", (_minSkill + random (_maxSkill - _minSkill)), "LIEUTNANT"];
//_crewType createUnit [[0, 0, 30], _group, "", (_minSkill + random (_maxSkill - _minSkill)), "LIEUTNANT"];
_group createUnit [_crewType, [0, 0, 30], [], 0, "FORM"];
_group createUnit [_crewType, [0, 0, 30], [], 0, "FORM"];

_pilot = (units _group) select 0;
_gunner1 = (units _group) select 1;
//_gunner2 = (units _group) select 2;

_pilot assignAsDriver _chopper;
_pilot moveInDriver _chopper;
_gunner1 assignAsGunner _chopper;
_gunner1 moveInTurret [_chopper, [0]];
// _gunner2 assignAsGunner _chopper;
// _gunner2 moveInTurret [_chopper, [1]];

{
    _x setUnitRank "LIEUTNANT";
    _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
} foreach units _group;

[_chopper, _dropUnits, _dropPosition, _onGroupDropped, _debug] execVM "Scripts\Escape\DropChopper.sqf";



