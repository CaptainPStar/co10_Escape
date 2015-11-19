if (!isServer) exitWith {};

private ["_spawnPos", "_minSkill", "_maxSkill", "_enemyFrequency", "_debug"];
private ["_group","_vehicle","_insurgentSoldier","_insurgentSoldiers", "_index", "_vehicleClass", "_vehicleMaxCargo", "_result", "_crew", "_soldiersCount", "_infantryType"];
private ["_fnc_OnDroppingGroup", "_cargoGroup", "_vehicleVarNameBase", "_vehicleVarNameNo", "_vehicleVarName"];

_spawnPos = _this select 0;
if (count _this > 1) then {_minSkill = _this select 1;} else {_minSkill = 0.3;};
if (count _this > 2) then {_maxSkill = _this select 2;} else {_maxSkill = 0.6;};
if (count _this > 3) then {_enemyFrequency = _this select 3;} else {_enemyFrequency = 3;};
if (count _this > 4) then {_debug = _this select 4;} else {_debug = false;};

_index = floor random count a3e_arr_Escape_ReinforcementTruck_vehicleClasses;
_vehicleClass = a3e_arr_Escape_ReinforcementTruck_vehicleClasses select _index;

_vehicleMaxCargo = a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo select _index;

_result = [_spawnPos, 0, _vehicleClass, A3E_VAR_Side_Opfor] call BIS_fnc_spawnVehicle;
_vehicle = _result select 0;
_crew = _result select 1;
_group = _result select 2;

// Find a free vehicle variable name
_vehicleVarNameBase = "drn_ReinforcementTruckVehicle";
_vehicleVarNameNo = 1;
_vehicleVarName = _vehicleVarNameBase + str _vehicleVarNameNo;
while {!(isNil _vehicleVarName)} do {
	_vehicleVarNameNo = _vehicleVarNameNo + 1;
	_vehicleVarName = _vehicleVarNameBase + str _vehicleVarNameNo;
};

_vehicle setVehicleVarName _vehicleVarName;
_vehicle call compile format ["%1=_this;", _vehicleVarName];

{
    _x setRank "PRIVATE";
    //_x setSkill (_minSkill + random (_maxSkill - _minSkill));
	[_x, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
    _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
} foreach _crew;

if (_debug) then {
    ["Spawned Reinforcement Truck of class type '" + _vehicleClass + "'."] call drn_fnc_CL_ShowDebugTextAllClients;
};

// Create cargo

_cargoGroup = createGroup A3E_VAR_Side_Opfor;
_insurgentSoldiers = [];
_soldiersCount = _enemyFrequency + 3 + floor random (4 * _enemyFrequency);
if (_soldiersCount > _vehicleMaxCargo) then {
    _soldiersCount = _vehicleMaxCargo;
};

for "_i" from 1 to _soldiersCount do {
    _infantryType = a3e_arr_Escape_InfantryTypes select floor random count a3e_arr_Escape_InfantryTypes;
    _insurgentSoldier = _cargoGroup createUnit [_infantryType, [0,0,30], [], 0, "FORM"];
    //_insurgentSoldier setSkill (_minSkill + random (_maxSkill - _minSkill));
	//[_insurgentSoldier, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
    _insurgentSoldier setRank "LIEUTNANT";
    _insurgentSoldier moveInCargo _vehicle;
    _insurgentSoldier assignAsCargo _vehicle;
    _insurgentSoldiers set [count _insurgentSoldiers, _insurgentSoldier];
};

{
    _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
    //_x setSkill (_minSkill + random (_maxSkill - _minSkill));
	//[_x, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
} foreach units _group;

_fnc_OnDroppingGroup = {
    [_this, "drn_searchAreaMarker", [0, 0, 0]] spawn drn_fnc_SearchGroup;
};

[_vehicle, _cargoGroup, drn_searchAreaMarkerName, true, _fnc_OnDroppingGroup, _debug] spawn drn_fnc_InsertionTruck;


