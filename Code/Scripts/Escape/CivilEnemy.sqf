/*
 * Transports a group to a position with a civilian vehicle.
 */

if (!isServer) exitWith {};

private ["_referenceGroup", "_vehicle", "_fncOnUnloadGroup", "_debug"];
private ["_group", "_waypoint", "_currentEntityNo", "_destinationPos"];
private ["_fnc_GetDestinationPos"];

_referenceGroup = _this select 0;
_vehicle = _this select 1;
_group = _this select 2;
if (count _this > 3) then {_fncOnUnloadGroup = _this select 3;} else {_fncOnUnloadGroup = {};};
if (count _this > 4) then {_debug = _this select 4;} else {_debug = false;};

if (_debug) then {
    ["Starting civilian enemy..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_fnc_GetDestinationPos = {
    private ["_referenceUnit"];
    private ["_destinationPos", "_roadSegments"];
    
    _referenceUnit = _this select 0;
    
    _destinationPos = [];
    
    _roadSegments = _referenceUnit nearRoads 1250;
    
    if (count _roadSegments > 0) then {
        _destinationPos = getPos (_roadSegments select floor random count _roadSegments);
    };
    
    _destinationPos
};

// Name group
sleep random 0.05;
if (isNil "drn_ReinforcementTruck_CurrentEntityNo") then {
    drn_ReinforcementTruck_CurrentEntityNo = 0
};

_currentEntityNo = drn_ReinforcementTruck_CurrentEntityNo;
drn_ReinforcementTruck_CurrentEntityNo = drn_ReinforcementTruck_CurrentEntityNo + 1;

if (isNil "a3e_var_commonLibInitialized") then {
    [] spawn {
        while {true} do { player sideChat "Script ReinforcementTruck.sqf needs CommonLib version 1.02"; sleep 5; };
    };
};

if (vehicleVarName _vehicle == "") exitWith {
    ["Civilian enemy car must have a name. Script exiting."] call drn_fnc_CL_ShowDebugTextAllClients;
};

private ["_enemySighted", "_enemyUnit"];
private ["_waypoint"];

_enemySighted = false;

while {!_enemySighted} do {
    
    // Goto new position
    _vehicle setVariable ["waypointFulfilled", false];
    
    _destinationPos = [];
    while {count _destinationPos == 0} do {
        _destinationPos = [(units _referenceGroup) select 0] call _fnc_GetDestinationPos;
        sleep 1;
    };
    
    _waypoint = _group addWaypoint [_destinationPos, 2];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "SAFE";
    _waypoint setWaypointSpeed "NORMAL";
    _waypoint setWaypointStatements ["true", vehicleVarName _vehicle + " setVariable [""waypointFulfilled"", true];"];
    _waypoint setWaypointCombatMode "BLUE";
    
    _vehicle setFuel 0.3 + random 0.6;
    
    if (_debug) then {
        ["drn_CivilianEnemy_DestinationPositionDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
        ["drn_CivilianEnemy_DestinationPositionDebugMarker" + str _currentEntityNo, _destinationPos, "mil_dot", "ColorRed", "CivEn" + str _currentEntityNo + " destination"] call drn_fnc_CL_SetDebugMarkerAllClients;
    };
    
    while {(!(_vehicle getVariable "waypointFulfilled")) && !_enemySighted} do {
        
        if (_debug) then {
            ["drn_CivilianEnemy_VehicleDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
            ["drn_CivilianEnemy_VehicleDebugMarker" + str _currentEntityNo, getPos _vehicle, "mil_dot", "ColorRed", "CivEn" + str _currentEntityNo] call drn_fnc_CL_SetDebugMarkerAllClients;
        };
        
        sleep 1;
        
        {
            _enemyUnit = _x findNearestEnemy _x;
            if (!isNull _enemyUnit) then {
                _enemySighted = true;
            };
        } foreach units _group;
    };
};

if (_debug) then {
    ["Civilian enemy detected target, unmounting..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

{
    unassignVehicle _x;
} foreach units _group;
(units _group) orderGetIn false;

_group spawn _fncOnUnloadGroup;
["drn_CivilianEnemy_DestinationPositionDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
["drn_CivilianEnemy_VehicleDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;

/*
if (_debug) then {
    ["Reinforcement truck moving out..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_destinationPos = [];
while {count _dropPos == 0} do {
    _destinationPos = [_referenceUnit] call _fnc_GetDestinationPos;
    sleep 1;
};

if (count _dropPos > 0) then {
    
    _truck setVariable ["reinforcementTruckReturning", false];
    
    if (_debug) then {
        ["drn_ReinforcementTruck_DropPositionDebugMarker" + str _currentEntityNo, _dropPos, "mil_dot", "ColorRed", "RT" + str _currentEntityNo + " drop pos"] call drn_fnc_CL_SetDebugMarkerAllClients;
    };
    
    while {!(_truck getVariable "reinforcementTruckReturning")} do {

        if (_debug) then {
            ["drn_ReinforcementTruck_VehicleDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
            ["drn_ReinforcementTruck_VehicleDebugMarker" + str _currentEntityNo, getPos _truck, "mil_dot", "ColorRed", "RT" + str _currentEntityNo] call drn_fnc_CL_SetDebugMarkerAllClients;
        };
        
        // If marker have moved, get a new destination position.
        if (!([_dropPos, _dropMarker] call drn_fnc_CL_PositionIsInsideMarker)) then {
            _dropPos = [];
            while {count _dropPos == 0} do {
                _dropPos = [_dropMarker] call _fnc_GetDropPosition;
                sleep 1;
            };

            [_crewGroup] call _fnc_ClearAllWaypoints;
            
            if (_debug) then {
                ["drn_ReinforcementTruck_DropPositionDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
                ["drn_ReinforcementTruck_DropPositionDebugMarker" + str _currentEntityNo, _dropPos, "mil_dot", "ColorRed", "RT" + str _currentEntityNo + " drop pos"] call drn_fnc_CL_SetDebugMarkerAllClients;
                ["Reinforcement truck got new intel, and moving to another position..."] call drn_fnc_CL_ShowDebugTextAllClients;
            };
        };
        
        _waypoint = _crewGroup addWaypoint [_dropPos, 10];
        _waypoint setWaypointType "MOVE";
        _waypoint setWaypointBehaviour "SAFE";
        _waypoint setWaypointSpeed "NORMAL";
        _waypoint setWaypointStatements ["true", vehicleVarName _truck + " setVariable [""waypointFulfilled"", true];"];
        _waypoint setWaypointCombatMode "BLUE";
        
        sleep 1;
    };
};
*/



