if (!isServer) exitWith {};

private ["_referenceGroup", "_locationMarkerName", "_side", "_infantryClasses", "_minSkill", "_maxSkill", "_spawnRadius", "_areaPerGroup", "_debug"];
private ["_locationNo", "_locationFullName", "_locationExists", "_isFaction", "_location", "_soldierType", "_soldierCount", "_soldier", "_soldiers", "_i"];
private ["_locationPos", "_locationSize", "_minSoldierCount", "_maxSoldierCount", "_maxGroupsCount", "_possibleInfantryTypes", "_instanceNo"];

_referenceGroup = _this select 0;
_locationMarkerName = _this select 1;

_side = _this select 2;
if (count _this > 3) then {_infantryClasses = _this select 3;} else {_infantryClasses = [];};
if (count _this > 4) then {_maxGroupsCount = _this select 4;} else {_maxGroupsCount = 10;};
if (count _this > 5) then {_minSoldierCount = _this select 5;} else {_minSoldierCount = 5;};
if (count _this > 6) then {_maxSoldierCount = _this select 6;} else {_maxSoldierCount = 10;};
if (count _this > 7) then {_minSkill = _this select 7;} else {_minSkill = 0.3;};
if (count _this > 8) then {_maxSkill = _this select 8;} else {_maxSkill = 0.6;};
if (count _this > 9) then {_spawnRadius = _this select 9;} else {_spawnRadius = 750;};
if (count _this > 10) then {_areaPerGroup = _this select 10;} else {_areaPerGroup = 10000;};
if (count _this > 11) then {_debug = _this select 11;} else {_debug = false;};


if (isNil "a3e_var_commonLibInitialized") then {
    [] spawn {
        while {true} do { player sideChat "Script AmbientInfantry.sqf needs CommonLib version 1.02"; sleep 5; };
    };
};

// Initialize global variable
sleep random 0.1;
if (isNil "a3e_var_guardedVillageInstanceNo") then {
    a3e_var_guardedVillageInstanceNo = 0;
}
else {
    a3e_var_guardedVillageInstanceNo = a3e_var_guardedVillageInstanceNo + 1;
};

_instanceNo = a3e_var_guardedVillageInstanceNo;
call compile format ["a3e_var_guardedVillageLocations%1 = [];", _instanceNo];

_locationNo = 0;
_locationFullName = _locationMarkerName + str _locationNo;

if (((getMarkerPos _locationFullName) select 0) != 0 || ((getMarkerPos _locationFullName) select 1 != 0)) then {
    _locationExists = true;
}
else {
    _locationExists = false;
};

while {_locationExists} do {
    _locationPos = getMarkerPos _locationFullName;
    _locationSize = getMarkerSize _locationFullName;
    _maxGroupsCount = ceil(((_locationSize select 0) * (_locationSize select 1)) * 4 / _areaPerGroup);

    _soldierCount = (_minSoldierCount + floor (random (_maxSoldierCount - _minSoldierCount + 1))) * _maxGroupsCount;
    _possibleInfantryTypes = a3e_arr_Escape_InfantryTypes + a3e_arr_Escape_InfantryTypes_Ind + a3e_arr_Escape_InfantryTypes_Ind + a3e_arr_Escape_InfantryTypes_Ind + a3e_arr_Escape_InfantryTypes_Ind;
    
    _soldiers = [];
    for [{_i = 0}, {_i < _soldierCount}, {_i = _i + 1}] do {
        _soldierType = _possibleInfantryTypes select (floor (random (count _possibleInfantryTypes)));

        // soldier: [type, skill, spawned, damage, obj, scriptHandle, hasScript]
        _soldier = [_soldierType, (_minSkill + random (_maxSkill - _minSkill)), false, 0, objNull, objNull, false];
        _soldiers set [count _soldiers, _soldier];
    };

    _location = [_locationFullName, "", _soldiers, _locationPos];

    _location call compile format ["a3e_var_guardedVillageLocations%1 set [count a3e_var_guardedVillageLocations%2, _this];", _instanceNo, _instanceNo];

    // Set ammo depot trigger
    private ["_marker", "_count", "_populated", "_trigger"];
    
    _trigger = createTrigger["EmptyDetector", getMarkerPos _locationFullName];
    _trigger triggerAttachVehicle [vehicle (units _referenceGroup select 0)];
    _trigger setTriggerArea[_spawnRadius, _spawnRadius, 0, false];
    _trigger setTriggerActivation["MEMBER", "PRESENT", true];
    _trigger setTriggerTimeout [1, 1, 1, true];
    _trigger setTriggerStatements["this", "_nil = [a3e_var_guardedVillageLocations" + str _instanceNo + " select " + str _locationNo + ", " + str _side + ", " + str _maxGroupsCount + ", " + str _debug + "] spawn drn_fnc_PopulateLocation;", "_nil = [a3e_var_guardedVillageLocations" + str _instanceNo + " select " + str _locationNo + ", " + str _debug + "] spawn drn_fnc_DepopulateLocation;"];
    
    // Get next guarded position
    _locationNo = _locationNo + 1;
    _locationFullName = _locationMarkerName + str _locationNo;

    if (((getMarkerPos _locationFullName) select 0) != 0 || ((getMarkerPos _locationFullName) select 1 != 0)) then {
        _locationExists = true;
    }
    else {
        _locationExists = false;
    };
};

