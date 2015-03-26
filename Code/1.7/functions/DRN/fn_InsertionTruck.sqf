/*
 * Transports a group to a position with a truck.
 * Parameters:
 *   _truck: Transport vehicle (truck).
 *   _cargoGroup: Group to transport.
 *   _dropMarker: Group will be dropped on a random road segment within this marker area.
 *   _attackOnSight: true if transport should unload and attack if enemy is detected before reaching destination position.
 *   _fncOnUnloadGroup: Code that is executed when unloading group (group can be accessed through variable "_this").
 *   _debug: true to output debug information, else false.
 */

if (!isServer) exitWith {};

private ["_truck", "_cargoGroup", "_dropMarker", "_attackOnSight", "_fncOnUnloadGroup", "_debug"];
private ["_crewGroup", "_waypoint", "_startPos", "_cargoUnits", "_currentEntityNo", "_dropPos"];
private ["_fnc_GetDropPosition", "_fnc_ClearAllWaypoints"];

_truck = _this select 0;
_cargoGroup = _this select 1;
_dropMarker = _this select 2;
if (count _this > 3) then {_attackOnSight = _this select 3;} else {_attackOnSight = false;};
if (count _this > 4) then {_fncOnUnloadGroup = _this select 4;} else {_fncOnUnloadGroup = {};};
if (count _this > 5) then {_debug = _this select 5;} else {_debug = false;};

_crewGroup = group _truck;
_startPos = getPos _truck;
_cargoUnits = + units _cargoGroup;

if (_debug) then {
    ["Starting reinforcement truck script..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_fnc_ClearAllWaypoints = {
    private ["_group"];
    private ["_waypointCount", "_i"];
    
    _group = _this select 0;

    _waypointCount = count waypoints _group;
    
    for [{_i = _waypointCount - 1}, {_i >= 0}, {_i = _i - 1}] do {
        deleteWaypoint [_group, _i];
    };
};

_fnc_GetDropPosition = {
    private ["_destinationMarker"];
    private ["_dropPosition", "_markerSize", "_isOk", "_markerLongestSide", "_roadSegment", "_roadSegments", "_attempts"];
    
    _destinationMarker = _this select 0;
    
    _dropPosition = [];
    
    _markerSize = markerSize _destinationMarker;
    _markerLongestSide = _markerSize select 0;
    if (_markerSize select 1 > _markerLongestSide) then {
        _markerLongestSide = _markerSize select 1;  
    };
    _markerLongestSide = _markerLongestSide * 1.414;

    _roadSegments = (getMarkerPos _destinationMarker) nearRoads _markerLongestSide;
    
    if (count _roadSegments > 0) then {
        _isOk = false;
        _attempts = 0;
        
        while {(!_isOk) && _attempts < 5} do {
            _roadSegment = _roadSegments select floor random count _roadSegments;
            
            if ([getPos _roadSegment, _destinationMarker] call drn_fnc_CL_PositionIsInsideMarker) then {
                _dropPosition = + getPos _roadSegment;
                _isOk = true;
            }
            else {
                _attempts = _attempts + 1;
            };
        };        
    };
    
    _dropPosition
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

if (vehicleVarName _truck == "") exitWith {
    ["Reinforcement truck must have a name. Script exiting."] call drn_fnc_CL_ShowDebugTextAllClients;
};

{
    _x assignAsCargo _truck;
    _x moveInCargo _truck;
} foreach units _cargoGroup;

_truck setVariable ["waypointFulfilled", false];
_truck setVariable ["missionCompleted", false];

[_truck, _cargoGroup, _fncOnUnloadGroup, _startPos, _attackOnSight, _crewGroup, _cargoUnits, _debug] spawn {
    private ["_truck", "_cargoGroup", "_fncOnUnloadGroup", "_startPos", "_attackOnSight", "_crewGroup", "_debug", "_enemySighted", "_enemyUnit", "_cargoUnits"];
    private ["_waypoint"];

	_truck = _this select 0;
	_cargoGroup = _this select 1;
    _fncOnUnloadGroup = _this select 2;
    _startPos = _this select 3;
    _attackOnSight = _this select 4;
    _crewGroup = _this select 5;
    _cargoUnits = _this select 6;
	_debug = _this select 7;

	_enemySighted = false;

    while {(!(_truck getVariable "waypointFulfilled")) && !_enemySighted} do {
		_enemyUnit = (driver _truck) findNearestEnemy (driver _truck);

		// If an enemy is sighted
		if (!isNull _enemyUnit) then {
            if (_attackOnSight) then {
                _enemySighted = true;
                _cargoGroup reveal _enemyUnit;
            };
        }
        else {
            _enemyUnit = ((units _cargoGroup) select 0) findNearestEnemy ((units _cargoGroup) select 0);
            if (!isNull _enemyUnit) then {
                if (_attackOnSight) then {
                    _enemySighted = true;
                    _crewGroup reveal _enemyUnit;
                };
            };
        };
        
		sleep 1;
	};
   
	if (_debug) then {
        ["Reinforcement truck dropping cargo..."] call drn_fnc_CL_ShowDebugTextAllClients;
	};
    
    {
        unassignVehicle _x;
    } foreach units _cargoGroup;
    (units _cargoGroup) orderGetIn false;

    _cargoGroup spawn _fncOnUnloadGroup;
    
    while {{vehicle _x != _x} count _cargoUnits > 0} do {
        {
            if ((vehicle _x != _x) && (!alive _x)) then {
                player sideChat "Deleting dead unit";
                _x setPos getPos _truck;
            };
        } foreach _cargoUnits;
        
        sleep 1;
    };

    sleep 60;
    
    	if (_debug) then {
        ["Reinforcement truck returning..."] call drn_fnc_CL_ShowDebugTextAllClients;
	};
    
    _truck setVariable ["reinforcementTruckReturning", true];
    
    _waypoint = _crewGroup addWaypoint [_startPos, 5];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "SAFE";
    _waypoint setWaypointSpeed "FULL";
    _waypoint setWaypointStatements ["true", vehicleVarName _truck + " setVariable [""missionCompleted"", true];"];
    _waypoint setWaypointCombatMode "BLUE";

	while {!(_truck getVariable "missionCompleted")} do {
		sleep 1;
	};

	if (_debug) then {
        ["Reinforcement truck script terminating..."] call drn_fnc_CL_ShowDebugTextAllClients;
	};
    
	{
		deleteVehicle _x;
	} foreach units group _truck;
	deleteVehicle _truck;
    deleteGroup _crewGroup;
};

if (_debug) then {
    ["Reinforcement truck moving out..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_dropPos = [];
while {count _dropPos == 0} do {
    _dropPos = [_dropMarker] call _fnc_GetDropPosition;
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




