if (!isServer) exitWith {};

private ["_vehicle", "_searchAreaMarker"];
private ["_maxStationaryTimeSec", "_maxWalkDistanceMeters", "_state", "_searchAreaExists", "_shownMissingSearchAreaMsg", "_searchGroupExists", "_destinationPos", "_group", "_soldiers"];
private ["_side", "_garbageGroup", "_lastPos", "_stationaryTimeSec", "_useVehicle", "_enemyPos", "_enemySighted", "_waypoint", "_currentEntityNo"];
private ["_fnc_isMounted", "_fnc_isUnMounted", "_fnc_ClearAllWaypoints", "_fnc_GetKnownEnemyPosition", "_fnc_SetNewState"];

_maxStationaryTimeSec = 60;
_maxWalkDistanceMeters = 300;

_vehicle = _this select 0;
_searchAreaMarker = _this select 1;

while {isNil "a3e_var_commonLibInitialized"} do {
    player sideChat "Script MotorizedSearchGroup.sqf requires CommonLib v1.02.";
    sleep 10;
};

if (A3E_Debug) then {
    ["Starting motorized search group script..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_fnc_isUnMounted = {
    private ["_units"];
    private ["_result"];
    
    _units = _this select 0;
    _result = true;
    if (({vehicle _x != _x} count _units) > 0) then {
        _result = false;
    };
    
    _result
};

_fnc_isMounted = {
    private ["_units"];
    private ["_result"];

    _units = _this select 0;
    
    if (count _units == 0) then {
        _result = false;
    }
    else {
        _result = true;
        if (({vehicle _x == _x} count _units) > 0) then {
            _result = false;
        };
    };
    
    _result
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

_fnc_GetKnownEnemyPosition = {
    private ["_leader"];
    private ["_supposedPosition", "_nearestEnemyUnit", "_distanceToNearestUnit"];
    
    _leader = _this select 0;
    
    _supposedPosition = [];
    
    scopeName "mainScope";
    
    _nearestEnemyUnit = _leader findNearestEnemy _leader;
    if (!isNull _nearestEnemyUnit) then {
        private ["_knowledge"];
        
        _distanceToNearestUnit = (_leader distance _nearestEnemyUnit);
        
        {
            private ["_detectedUnit"];
            _detectedUnit = _x select 4;
            
            if (_detectedUnit == _nearestEnemyUnit) then {
                private ["_enemysSupposedPos", "_positionAccuracy"];
                
                _enemysSupposedPos = (_x select 0);
                _positionAccuracy = (_x select 5);
                
                // Check if position is enough accurate
                if (_positionAccuracy < 100) then {
                    _supposedPosition = _enemysSupposedPos;
                };
                
                breakTo "mainScope";
            };
        } foreach (_leader nearTargets _distanceToNearestUnit + 50);
    };
    
    _supposedPosition
};

_fnc_SetNewState = {
    private ["_state"];
    
    _state = _this select 0;
    A3E_Debug = _this select 1;
    
    if (A3E_Debug) then {
        ["Motorized search group state = " + _state] call drn_fnc_CL_ShowDebugTextAllClients;
    };
    
    _state
};

// Name vehicle
sleep random 0.05;
if (isNil "drn_MotorizedSearchGroup_CurrentEntityNo") then {
    drn_MotorizedSearchGroup_CurrentEntityNo = 0;
}
else {
    drn_MotorizedSearchGroup_CurrentEntityNo = drn_MotorizedSearchGroup_CurrentEntityNo + 1;
};

_currentEntityNo = drn_MotorizedSearchGroup_CurrentEntityNo;

if (isNull _vehicle) exitWith {};

_group = group _vehicle;
_side = side _group;
_soldiers =+ assignedCargo _vehicle;
{
    if (vehicle _x == _x) then {
        _soldiers set [count _soldiers, _x];
    };
} foreach units _group;

_searchAreaExists = false;
_shownMissingSearchAreaMsg = false;

while {!_searchAreaExists} do {
    if (((getMarkerPos _searchAreaMarker) select 0) != 0 || ((getMarkerPos _searchAreaMarker) select 1 != 0)) then {
        _searchAreaExists = true;
    }
    else {
        if (A3E_Debug && !_shownMissingSearchAreaMsg) then {
            ["Motorized search group waiting for search area assignment..."] call drn_fnc_CL_ShowDebugTextAllClients;
            _shownMissingSearchAreaMsg = true;
        };
    };
    sleep 1;
};

if (A3E_Debug) then {
    ["Search area exists. Motorized search group on its way!"] call drn_fnc_CL_ShowDebugTextAllClients;
};

_searchGroupExists = true;

_state = "READY";
_lastPos = [0, 0, 0];
_destinationPos = [];
_useVehicle = false;
_enemySighted = false;
if (canMove _vehicle && fuel _vehicle > 0) then {
    _useVehicle = true;
};

scopeName "mainScope";

while {_searchGroupExists} do {
    
    if (A3E_Debug) then {
        ["drn_MotorizedSearchGroup_VehicleDebugMarker" + str _currentEntityNo, getPos (leader group _vehicle), "mil_dot", "ColorRed", "MSG" + str _currentEntityNo] call drn_fnc_CL_SetDebugMarkerAllClients;
    };    
    
    if ((str _lastPos) == (str getPos leader _group)) then {
        _stationaryTimeSec = _stationaryTimeSec + 1;
    }
    else {
        _stationaryTimeSec = 0;
        _lastPos = + (getPos leader _group);
    };
    
    if (_stationaryTimeSec > _maxStationaryTimeSec) then {
        [_group] call _fnc_ClearAllWaypoints;
        
        if (A3E_Debug) then {
            ["Motorized search group stationary for long time. Reseting..."] call drn_fnc_CL_ShowDebugTextAllClients;
        };
        
        _stationaryTimeSec = 0;
        _state = ["READY", A3E_Debug] call _fnc_SetNewState;
    };
    
    if (count _destinationPos > 0) then {
        if (_state != "ENGAGING" && !([_destinationPos, _searchAreaMarker] call drn_fnc_CL_PositionIsInsideMarker)) then {
            [_group] call _fnc_ClearAllWaypoints;
            _state = ["READY", A3E_Debug] call _fnc_SetNewState;
            
            if (A3E_Debug) then {
                ["Motorized search group interrupting and following new intel. Reseting..."] call drn_fnc_CL_ShowDebugTextAllClients;
            };
        };
    };
    
    {
        if ((!alive _x) || (!canStand _x)) then {
            _garbageGroup = createGroup _side;
            _soldiers = _soldiers - [_x];
            [_x] joinSilent _garbageGroup;
            [_x] call drn_fnc_CL_AddUnitsToGarbageCollector;
            
            if (count units _group == 0) then {
                deleteGroup _group;
                _searchGroupExists = false;
                breakTo "mainScope";
            };
        };
    } foreach _soldiers;
    
    if ((!(canMove _vehicle) || (fuel _vehicle <= 0)) && _useVehicle) then {
        private ["_crewGroup"];
        
        _useVehicle = false;
        
        // Separate soldiers and crew
        [_group] call _fnc_ClearAllWaypoints;
        _crewGroup = _group;
        _group = createGroup _side;
        _soldiers joinSilent _group;
        (units _crewGroup) call drn_fnc_CL_AddUnitsToGarbageCollector;
        
        _state = ["BEGIN UNMOUNT", A3E_Debug] call _fnc_SetNewState;
        
        if (A3E_Debug) then {
            ["Motorized search group abondoning vehicle..."] call drn_fnc_CL_ShowDebugTextAllClients;
        };
    };
            
    if (_state == "READY") then {
        _enemySighted = false;
        _enemyPos = [0, 0, 0];
        _enemySighted = false;
        _useVehicle = false;
        if (canMove _vehicle && fuel _vehicle > 0) then {
            _useVehicle = true;
        };
        
		_destinationPos = [_searchAreaMarker] call drn_fnc_CL_GetRandomMarkerPos;
		while {surfaceIsWater _destinationPos} do {
			_destinationPos = [_searchAreaMarker] call drn_fnc_CL_GetRandomMarkerPos;
		};
        
        if (A3E_Debug) then {
            ["drn_MotorizedSearchGroup_DestinationDebugMarker" + str _currentEntityNo, _destinationPos, "mil_dot", "ColorRed", "MSG" + str _currentEntityNo + " destination"] call drn_fnc_CL_SetDebugMarkerAllClients;
        };

        if (count _soldiers > 0) then {
            // If distance is within walk distance            
            if (((leader _group) distance _destinationPos) < _maxWalkDistanceMeters) then {
                if (!([_soldiers] call _fnc_isUnMounted)) then {
                    _state = ["BEGIN UNMOUNT", A3E_Debug] call _fnc_SetNewState;
                }
                else {
                    if (_enemySighted) then {
                        _state = ["BEGIN ENGAGE", A3E_Debug] call _fnc_SetNewState;
                    }
                    else {
                        _state = ["BEGIN MOVE", A3E_Debug] call _fnc_SetNewState;
                    };
                };
            }
            else {
                // If distance is not within walk distance
                if (_useVehicle) then {
                    _state = ["BEGIN MOUNT", A3E_Debug] call _fnc_SetNewState;
                }
                else {
                    if (_enemySighted) then {
                        _state = ["BEGIN ENGAGE", A3E_Debug] call _fnc_SetNewState;
                    }
                    else {
                        _state = ["BEGIN MOVE", A3E_Debug] call _fnc_SetNewState;
                    };
                }
            };
        }
        else {
            if (_enemySighted) then {
                _state = ["BEGIN ENGAGE", A3E_Debug] call _fnc_SetNewState;
            }
            else {
                _state = ["BEGIN MOVE", A3E_Debug] call _fnc_SetNewState;
            };
        };
    };
    
    if (_state == "BEGIN MOUNT") then {
        if (!([_soldiers] call _fnc_isMounted)) then {
            _soldiers allowGetIn true;
            {
                _x assignAsCargo _vehicle;
            } foreach _soldiers;
            _soldiers orderGetIn true;
        };
        
        _state = ["MOUNTING", A3E_Debug] call _fnc_SetNewState;
    };
    
    if (_state == "BEGIN UNMOUNT") then {
        if (!([_soldiers] call _fnc_isUnMounted)) then {
            _soldiers orderGetIn false;
            {
                unassignVehicle _x;
            } foreach _soldiers;
            _soldiers allowGetIn false;
        };
        
        _state = ["UNMOUNTING", A3E_Debug] call _fnc_SetNewState;
    };
    
    if (_state == "MOUNTING") then {
        if ([_soldiers] call _fnc_isMounted) then {
            _state = ["BEGIN MOVE", A3E_Debug] call _fnc_SetNewState;
        };
    };
    
    if (_state == "UNMOUNTING") then {
        if ([_soldiers] call _fnc_isUnMounted) then {
            if (_enemySighted) then {
                _state = ["BEGIN ENGAGE", A3E_Debug] call _fnc_SetNewState;
            }
            else {
                _state = ["BEGIN MOVE", A3E_Debug] call _fnc_SetNewState;
            };
        };
    };
    
    if (_state == "BEGIN MOVE") then {
        private ["_behaviour", "_speed", "_formation", "_combatMode", "_type"];
        
        if (count _soldiers > 0 && ([_soldiers] call _fnc_isUnMounted)) then {
            _soldiers allowGetIn false;
        };
        
        if (_useVehicle) then {
            if ((leader _group) distance _destinationPos > _maxWalkDistanceMeters) then {
                _type = "MOVE";
                _behaviour = "SAFE";
                _combatMode = "YELLOW";
                _speed = "NORMAL";
                _formation = "WEDGE";
            }
            else {
                _type = "MOVE";
                _behaviour = "AWARE";
                _combatMode = "YELLOW";
                _speed = "LIMITED";
                _formation = "LINE";
            };
        }
        else {
            _type = "MOVE";
            _behaviour = "SAFE";
            _combatMode = "YELLOW";
            _speed = "LIMITED";
            _formation = "COLUMN";
        };
        
        _waypoint = _group addWaypoint [_destinationPos, 0];
        _waypoint setWaypointType _type;
        _waypoint setWaypointBehaviour _behaviour;
        _waypoint setWaypointCombatMode _combatMode;
        _waypoint setWaypointSpeed _speed;
        _waypoint setWaypointFormation _formation;
        
        _group setBehaviour _behaviour;
        _group setCombatMode _combatMode;
        _group setSpeedMode _speed;
        _group setFormation _formation;
        
        _stationaryTimeSec = 0;
        _state = ["MOVING", A3E_Debug] call _fnc_SetNewState;
    };
    
    if (_state == "BEGIN ENGAGE") then {
        private ["_behaviour", "_speed", "_formation", "_combatMode", "_type"];
        
        _destinationPos = _enemyPos;
        
        if (A3E_Debug) then {
            ["drn_MotorizedSearchGroup_DestinationDebugMarker" + str _currentEntityNo, _destinationPos, "mil_dot", "ColorRed", "MSG" + str _currentEntityNo + " target"] call drn_fnc_CL_SetDebugMarkerAllClients;
            //["drn_MotorizedSearchGroup_DestinationDebugMarker" + str _currentEntityNo, _destinationPos, "Warning"] call drn_fnc_CL_SetDebugMarkerAllClients;
            /*
            if (!isNil "drn_MSGA3E_DebugMarker") then {
                deleteMarkerLocal "drn_MSGA3E_DebugMarker";
            };
            drn_MSGA3E_DebugMarker = createMarkerLocal ["drn_MSGA3E_DebugMarker", _destinationPos];
            "drn_MSGA3E_DebugMarker" setMarkerTypeLocal "Warning";
            */
        };
        
        [_group] call _fnc_ClearAllWaypoints;
        if (count _soldiers > 0) then {
            _soldiers allowGetIn false;
        };
        
        if (_useVehicle) then {
            if (count _soldiers > 0) then {
                _type = "SAD";
                _behaviour = "AWARE";
                _combatMode = "YELLOW";
                _speed = "LIMITED";
                _formation = "LINE";
            }
            else {
                _type = "SAD";
                _behaviour = "COMBAT";
                _combatMode = "YELLOW";
                _speed = "LIMITED";
                _formation = "LINE";
            }
        }
        else {
            _type = "SAD";
            _behaviour = "AWARE";
            _combatMode = "RED";
            _speed = "NORMAL";
            _formation = "LINE";
        };
        
        _waypoint = _group addWaypoint [_enemyPos, 0];
        _waypoint = _group addWaypoint [_enemyPos, 0];
        _waypoint setWaypointType _type;
        _waypoint setWaypointBehaviour _behaviour;
        _waypoint setWaypointCombatMode _combatMode;
        _waypoint setWaypointSpeed _speed;
        _waypoint setWaypointFormation _formation;
        
        _group setBehaviour _behaviour;
        _group setCombatMode _combatMode;
        _group setSpeedMode _speed;
        _group setFormation _formation;
        
        _stationaryTimeSec = 0;
        _state = ["ENGAGING", A3E_Debug] call _fnc_SetNewState;
    };
    
    if (_state == "MOVING") then {
        private ["_currentEnemyPosition"];
        
        _currentEnemyPosition = [leader _group] call _fnc_GetKnownEnemyPosition;
        
        if (count _currentEnemyPosition > 0) then {
            _enemySighted = true;
            _enemyPos = + _currentEnemyPosition;
            
            if (_useVehicle && (count _soldiers > 0) && (!([_soldiers] call _fnc_IsUnMounted))) then {
                _state = ["BEGIN UNMOUNT", A3E_Debug] call _fnc_SetNewState;
            }
            else {
                _state = ["BEGIN ENGAGE", A3E_Debug] call _fnc_SetNewState;
            };
        }
        else {
            if (((leader _group) distance _destinationPos) < 200) then {
                if (count _soldiers > 0) then {
                    if ([_soldiers] call _fnc_IsMounted) then {
                        _state = ["BEGIN UNMOUNT", A3E_Debug] call _fnc_SetNewState;
                    };
                }
                else {
                    _group setBehaviour "COMBAT";
                    _group setSpeedMode "LIMITED";
                    _group setCombatMode "YELLOW";
                };
            };
                
            if (((leader _group) distance _destinationPos) < 25) then {
                _state = ["READY", A3E_Debug] call _fnc_SetNewState;
            };
        };
    };
    
    if (_state == "ENGAGING") then {
        private ["_currentEnemyPosition"];
        
        _currentEnemyPosition = [leader _group] call _fnc_GetKnownEnemyPosition;
        if (count _currentEnemyPosition > 0) then {
            if (_currentEnemyPosition distance _enemyPos > 100) then {
                _enemyPos = + _currentEnemyPosition;
                _waypoint setWaypointPosition [_enemyPos, 0];
            };
        };
    };
    
    if (!canMove _vehicle && count _soldiers == 0) then {
        _searchGroupExists = false;
    };
    
    sleep 1;
};

if (A3E_Debug) then {
    ["Motorized search group destroyed. Script exiting."] call drn_fnc_CL_ShowDebugTextAllClients;
    ["drn_MotorizedSearchGroup_VehicleDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
    ["drn_MotorizedSearchGroup_DestinationDebugMarker" + str _currentEntityNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
};




