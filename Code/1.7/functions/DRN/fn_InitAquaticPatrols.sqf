// Initialization for server
if (!isServer) exitWith {};

private ["_referenceUnit", "_side", "_infantryClasses", "_minSkill", "_maxSkill", "_debug", "_spawnRadius", "_aquaticPatrolZonePos", "_minSoldiersPerGroup", "_maxSoldiersPerGroup", "_areaPerGroup"];
private ["_village", "_possibleInfantryTypes", "_soldierType", "_soldierCount", "_soldier", "_soldiers", "_i", "_isFaction", "_factionsArray"];
private ["_aquaticPatrolZoneNo", "_aquaticPatrolZoneSize", "_maxGroupsCount", "_groupsCount", "_groups", "_groupIndex", "_damage", "_spawned", "_soldierObj"];
private ["_script", "_skill", "_ammo", "_trigger", "_soldierPos", "_rank", "_hasScript", "_groupPos", "_roadSegments", "_roadSegment"];
private ["_message", "_aquaticPatrolZoneName", "_fnc_onSpawnGroup"];

if (isNil "a3e_var_villageMarkersInitialized") exitWith {
    [] spawn {
        player sideChat "Scripts\DRN\VillageMarkers\InitVillageMarkers.sqf must be called before call to Scripts/DRN/VillagePatrols/InitVillagePatrols.sqf.";
        sleep 10;
    };
};

_referenceUnit = _this select 0;
_side = _this select 1;
if (count _this > 2) then {_infantryClasses = _this select 2;} else {_infantryClasses = [];};
if (count _this > 3) then {_minSoldiersPerGroup = _this select 3;} else {_minSoldiersPerGroup = 2;};
if (count _this > 4) then {_maxSoldiersPerGroup = _this select 4;} else {_maxSoldiersPerGroup = 5;};

// If village area is less than this number 0 or 1 group will be spawned. If village area is double this number, 0, 1 or 2 groups will spawn, and so on.
if (count _this > 5) then {_areaPerGroup = _this select 5;} else {_areaPerGroup = 5000;};

if (count _this > 6) then {_minSkill = _this select 6;} else {_minSkill = 0.3;};
if (count _this > 7) then {_maxSkill = _this select 7;} else {_maxSkill = 0.6;};
if (count _this > 8) then {_spawnRadius = _this select 8;} else {_spawnRadius = 750;};
if (count _this > 9) then {_fnc_onSpawnGroup = _this select 9;} else {_fnc_onSpawnGroup = {};};
if (count _this > 10) then {_debug = _this select 10;} else {_debug = false;};
_factionsArray = [A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor ,A3E_VAR_Side_Opfor];
if (_debug) then {
	_message = "Initializing aquatic patrols.";
	diag_log _message;
	player sideChat _message;
};

a3e_arr_aquaticPatrols_Markers = [];
drn_fnc_AquaticPatrols_OnSpawnGroup = _fnc_OnSpawnGroup;
_aquaticPatrolZoneNo = 0;

// Create spawn triggers around each village
{
    _aquaticPatrolZoneName = "a3e_aquaticPatrolMarker" + str _aquaticPatrolZoneNo;
    
    _aquaticPatrolZonePos = _x select 0;
    _aquaticPatrolZoneSize = _x select 3;
    //_maxGroupsCount = ceil (((_aquaticPatrolZoneSize select 0) * (_aquaticPatrolZoneSize select 1)) / _areaPerGroup);
    _maxGroupsCount = random 1;
    // _groupsCount = floor random (_maxGroupsCount + 1);
    // _groupsCount = _groupsCount + (floor random (_maxGroupsCount + 1 - _groupsCount));
    _groupsCount = _maxGroupsCount;

	_aquaticPatrolZone = [_aquaticPatrolZoneName, _aquaticPatrolZonePos, _groupsCount, []];
	a3e_arr_aquaticPatrols_Markers set [count a3e_arr_aquaticPatrols_Markers, _aquaticPatrolZone];

	// Set village trigger
	//#### We should add two trigger, one for population one for depopulation ######

	_trigger = createTrigger["EmptyDetector", _aquaticPatrolZonePos];
	_trigger triggerAttachVehicle [vehicle _referenceUnit];
	_trigger setTriggerArea[_spawnRadius, _spawnRadius, 0, false];
	_trigger setTriggerActivation["MEMBER", "PRESENT", true];
	_trigger setTriggerTimeout [1, 1, 1, true];
	_trigger setTriggerStatements["this", "_nil = [a3e_arr_aquaticPatrols_Markers select " + str _aquaticPatrolZoneNo + ", " + str _debug + "] spawn drn_fnc_PopulateAquaticPatrol;", "_nil = [a3e_arr_aquaticPatrols_Markers select " + str _aquaticPatrolZoneNo + ", " + str _debug + "] spawn drn_fnc_DepopulateAquaticPatrol;"];

	_aquaticPatrolZoneNo = _aquaticPatrolZoneNo + 1;
} foreach a3e_patrolBoatMarkers;

if (_debug) then {
	_message = "Initialized aquatic patrols: " + str _aquaticPatrolZoneNo;
	diag_log _message;
	player sideChat _message;
};

