if (!isServer) exitWith {};

private ["_referenceGroup", "_spawnPos", "_side", "_vehicleTypes", "_unitTypes", "_enemyFrequency", "_debug"];
private ["_group","_vehicle", "_vehicleClass"];
private ["_fnc_OnDroppingGroup", "_vehicleVarNameBase", "_vehicleVarNameNo", "_vehicleVarName"];

_referenceGroup = _this select 0;
_spawnPos = _this select 1;
_side = _this select 2;
_vehicleTypes = _this select 3;
_unitTypes = _this select 4;
_enemyFrequency = _this select 5;
if (count _this > 6) then {_debug = _this select 6;} else {_debug = false;};

_vehicleClass = _vehicleTypes select floor random count _vehicleTypes;
//_vehicle = _vehicleClass createVehicle _spawnPos;
_vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "NONE"];

// Find a free vehicle variable name
_vehicleVarNameBase = "drn_CivilEnemyCar";
_vehicleVarNameNo = 1;
_vehicleVarName = _vehicleVarNameBase + str _vehicleVarNameNo;
while {!(isNil _vehicleVarName)} do {
	_vehicleVarNameNo = _vehicleVarNameNo + 1;
	_vehicleVarName = _vehicleVarNameBase + str _vehicleVarNameNo;
};

_vehicle setVehicleVarName _vehicleVarName;
_vehicle call compile format ["%1=_this;", _vehicleVarName];

_group = [_vehicle, _side, _unitTypes, _enemyFrequency] call drn_fnc_Escape_PopulateVehicle;

{
    _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;    
} foreach units _group;

if (_debug) then {
    ["Spawned civil car with enemies of type '" + _vehicleClass + "'."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_fnc_OnDroppingGroup = {
    [_this, "drn_searchAreaMarker", [0, 0, 0]] spawn drn_fnc_SearchGroup;
};

[_referenceGroup, _vehicle, _group, _fnc_OnDroppingGroup, _debug] execVM "Scripts\Escape\CivilEnemy.sqf";


