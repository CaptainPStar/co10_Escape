if (!isServer) exitWith {};

private ["_referenceGroup", "_side", "_vehicleClasses", "_vehicleCount", "_minSpawnDistance", "_maxSpawnDistance", "_minSkill", "_maxSkill", "_debug"];
private ["_activeVehiclesAndGroup", "_vehiclesGroup", "_spawnSegment", "_vehicle", "_group", "_result", "_possibleVehicles", "_vehicleType", "_vehiclesCrew", "_skill", "_minDistance", "_tries", "_trafficLocation"];
private ["_currentEntityNo", "_vehicleVarName", "_tempVehiclesAndGroup", "_deletedVehiclesCount", "_firstIteration", "_roadSegments", "_destinationSegment", "_destinationPos", "_direction"];
private ["_roadSegmentDirection", "_testDirection", "_facingAway", "_posX", "_posY", "_pos"];
private ["_fnc_OnSpawnVehicle", "_fnc_FindSpawnSegment"];
private ["_debugMarkerName", "_allRoadSegments"];
//private ["_debugMarkers", "_debugMarkerNo", "_debugMarker", "_debugMarkerName"];

_referenceGroup = _this select 0;
_side = _this select 1;
_vehicleClasses = _this select 2; //Unused
if (count _this > 3) then {_vehicleCount = _this select 3;} else {_vehicleCount = 10;};
if (count _this > 4) then {_minSpawnDistance = _this select 4;} else {_minSpawnDistance = 1000;};
if (count _this > 5) then {_maxSpawnDistance = _this select 5;} else {_maxSpawnDistance = 1500;};
if (count _this > 6) then {_minSkill = _this select 6;} else {_minSkill = 0.4;};
if (count _this > 7) then {_maxSkill = _this select 7;} else {_maxSkill = 0.6;};
if (count _this > 8) then {_fnc_OnSpawnVehicle = _this select 8;} else {_fnc_OnSpawnVehicle = {};};
if (count _this > 9) then {_debug = _this select 9;} else {_debug = false;};

while {isNil "a3e_var_commonLibInitialized"} do {
    player sideChat "Script MilitaryTraffic.sqf requires CommonLib v1.02.";
    sleep 10;
};

while {!(["TrafficMarker_SouthWest"] call drn_fnc_CL_MarkerExists)} do {
    player sideChat "Script MilitaryTraffic.sqf requires marker TrafficMarker_SouthWest placed on map.";
    sleep 10;
};

while {!(["TrafficMarker_SouthEast"] call drn_fnc_CL_MarkerExists)} do {
    player sideChat "Script MilitaryTraffic.sqf requires marker TrafficMarker_SouthEast placed on map.";
    sleep 10;
};

while {!(["TrafficMarker_SouthWest"] call drn_fnc_CL_MarkerExists)} do {
    player sideChat "Script MilitaryTraffic.sqf requires marker TrafficMarker_NorthEast placed on map.";
    sleep 10;
};

while {!(["TrafficMarker_SouthWest"] call drn_fnc_CL_MarkerExists)} do {
    player sideChat "Script MilitaryTraffic.sqf requires marker TrafficMarker_NorthWest placed on map.";
    sleep 10;
};

 if(_side != civilian) then {
	sleep 180; //Wait three mins until creating enemy vehicles
};


if (isNil "drn_fnc_MilitaryTraffic_MoveVehicle") then {
    drn_fnc_MilitaryTraffic_MoveVehicle = {
        private ["_vehicle", "_firstDestinationPos", "_debug"];
        private ["_speed", "_roadSegments", "_destinationSegment"];
        private ["_destinationPos"];
        private ["_waypoint", "_fuel"];
        
        _vehicle = _this select 0;
        if (count _this > 1) then {_firstDestinationPos = _this select 1;} else {_firstDestinationPos = [];};
        if (count _this > 2) then {_debug = _this select 2;} else {_debug = false;};
        
        // Set fuel to something in between 0.2 and 0.9.
        _fuel = 0.2 + random (0.9 - 0.2);
        _vehicle setFuel _fuel;
        
        if (count _firstDestinationPos > 0) then {
            _destinationPos = + _firstDestinationPos;
        }
        else {
            _roadSegments = _vehicle nearroads 2000;
            _destinationSegment = _roadSegments select floor random count _roadSegments;
            _destinationPos = getPos _destinationSegment;
        };
        
        _speed = "NORMAL";
        if (_vehicle distance _destinationPos < 500) then {
            _speed = "LIMITED";
        };
        
        _waypoint = group _vehicle addWaypoint [_destinationPos, 10];
        _waypoint setWaypointBehaviour "SAFE";
        _waypoint setWaypointSpeed _speed;
        _waypoint setWaypointCompletionRadius 10;
        _waypoint setWaypointStatements ["true", "_nil = [" + vehicleVarName _vehicle + ", [], " + str _debug + "] spawn drn_fnc_MilitaryTraffic_MoveVehicle;"];
    };
};

if (_debug) then {
    ["Starting Military Traffic " + str _side + "..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_activeVehiclesAndGroup = [];


_possibleVehicles = [];

_fnc_FindSpawnSegment = {
    private ["_referenceGroup", "_minSpawnDistance", "_maxSpawnDistance", "_activeVehiclesAndGroup"];
    private ["_refUnit", "_roadSegments", "_roadSegment", "_isOk", "_tries", "_result", "_spawnDistanceDiff", "_refPosX", "_refPosY", "_dir", "_tooFarAwayFromAll", "_tooClose", "_tooCloseToAnotherVehicle"];

    _referenceGroup = _this select 0;
    _minSpawnDistance = _this select 1;
    _maxSpawnDistance = _this select 2;
    _activeVehiclesAndGroup = _this select 3;
    
    _spawnDistanceDiff = _maxSpawnDistance - _minSpawnDistance;
    _roadSegment = "NULL";
    _refUnit = vehicle ((units _referenceGroup) select floor random count units _referenceGroup);

    _isOk = false;
    _tries = 0;
    while {!_isOk && _tries < 5} do {
        _isOk = true;
        
        _dir = random 360;
        _refPosX = ((getPos _refUnit) select 0) + (_minSpawnDistance + _spawnDistanceDiff) * sin _dir;
        _refPosY = ((getPos _refUnit) select 1) + (_minSpawnDistance + _spawnDistanceDiff) * cos _dir;
        
        _roadSegments = [_refPosX, _refPosY] nearRoads (_spawnDistanceDiff);
        
        if (count _roadSegments > 0) then {
            _roadSegment = _roadSegments select floor random count _roadSegments;
            
            // Check if road segment is at spawn distance
            _tooFarAwayFromAll = true;
            _tooClose = false;
            {
                private ["_tooFarAway"];
                
                _tooFarAway = false;
                
                if ((vehicle _x) distance (getPos _roadSegment) < _minSpawnDistance) then {
                    _tooClose = true;
                };
                if ((vehicle _x) distance (getPos _roadSegment) > _maxSpawnDistance) then {
                    _tooFarAway = true;
                };
                if (!_tooFarAway) then {
                    _tooFarAwayFromAll = false;
                };
                
                _tooCloseToAnotherVehicle = false;
                {
                    private ["_vehicle"];
                    _vehicle = _x select 0;
                    
                    if ((getPos _roadSegment) distance _vehicle < 100) then {
                        _tooCloseToAnotherVehicle = true;
                    };                
                } foreach _activeVehiclesAndGroup;
            } foreach units _referenceGroup;
            
            _isOk = true;
            
            if (_tooClose || _tooFarAwayFromAll || _tooCloseToAnotherVehicle) then {
                _isOk = false;
                _tries = _tries + 1;
            };
        }
        else {
            _isOk = false;
            _tries = _tries + 1;
        };
    };

    if (!_isOk) then {
        _result = "NULL";
    }
    else {
        _result = _roadSegment;
    };

    _result
};

//_iterationNo = 0;
_firstIteration = true;


while {true} do {
    scopeName "mainScope";

    // If there are few vehicles, add a vehicle

    _tries = 0;
    while {count _activeVehiclesAndGroup < _vehicleCount && _tries < 1} do {

        // Get all spawn positions within range
        if (_firstIteration) then {
            _minDistance = 300;
            
            if (_minDistance > _maxSpawnDistance) then {
                _minDistance = 0;
            };
        }
        else {
            _minDistance = _minSpawnDistance;
        };
        _refUnit = vehicle ((units _referenceGroup) select floor random count units _referenceGroup);
        _spawnSegment = [_referenceGroup, _minDistance, _maxSpawnDistance, _activeVehiclesAndGroup] call _fnc_FindSpawnSegment;
        
        // If there were spawn positions
        if (str _spawnSegment != """NULL""") then {
            _tries = 0;
            _refPos = position _spawnSegment;
            // Get first destination
            
            _roadSegments = [];
            while {count _roadSegments == 0} do {
                _trafficLocation = floor random 8;
                switch (_trafficLocation) do {
                    case 0: { _roadSegments = ([(_refPos select 0) + 5000, (_refPos select 1) + 5000]  ) nearRoads 1500; };
                    case 1: { _roadSegments = ([(_refPos select 0) - 5000, (_refPos select 1) + 5000] ) nearRoads 1500; };
                    case 2: { _roadSegments = ([(_refPos select 0) + 5000, (_refPos select 1) - 5000] ) nearRoads 1500; };
                    case 3: { _roadSegments = ([(_refPos select 0) - 5000, (_refPos select 1) - 5000] ) nearRoads 1500; };
                    case 4: { _roadSegments = ([(_refPos select 0), (_refPos select 1) + 7071]  ) nearRoads 1500; };
                    case 5: { _roadSegments = ([(_refPos select 0), (_refPos select 1) - 7071] ) nearRoads 1500; };
                    case 6: { _roadSegments = ([(_refPos select 0) + 7071, (_refPos select 1)] ) nearRoads 1500; };
                    case 7: { _roadSegments = ([(_refPos select 0) - 7071, (_refPos select 1)] ) nearRoads 1500; };
                };
            };
            
            _destinationSegment = _roadSegments select floor random count _roadSegments;
            _destinationPos = getPos _destinationSegment;
            
            _direction = ((_destinationPos select 0) - (getPos _spawnSegment select 0)) atan2 ((_destinationPos select 1) - (getpos _spawnSegment select 1));
            _roadSegmentDirection = getDir _spawnSegment;
            
            while {_roadSegmentDirection < 0} do {
                _roadSegmentDirection = _roadSegmentDirection + 360;
            };
            while {_roadSegmentDirection > 360} do {
                _roadSegmentDirection = _roadSegmentDirection - 360;
            };
            
            while {_direction < 0} do {
                _direction = _direction + 360;
            };
            while {_direction > 360} do {
                _direction = _direction - 360;
            };

            _testDirection = _direction - _roadSegmentDirection;
            
            while {_testDirection < 0} do {
                _testDirection = _testDirection + 360;
            };
            while {_testDirection > 360} do {
                _testDirection = _testDirection - 360;
            };
            
            _facingAway = false;
            if (_testDirection > 90 && _testDirection < 270) then {
                _facingAway = true;
            };
            
            if (_facingAway) then {
                _direction = _roadSegmentDirection + 180;
            }
            else {
                _direction = _roadSegmentDirection;
            };            
            
            _posX = (getPos _spawnSegment) select 0;
            _posY = (getPos _spawnSegment) select 1;
            
            _posX = _posX + 2.5 * sin (_direction + 90);
            _posY = _posY + 2.5 * cos (_direction + 90);
            _pos = [_posX, _posY, 0];
            _faction = _side;
            // Create vehicle
            //if(_side != civilian) then {
            //    _faction = _factionsArray select (floor (random (count _factionsArray)));
            //};
            //if(_side == civilian) then {
            //    _faction = civilian;
            //    _possibleVehicles = a3e_arr_Escape_EnemyCivilianCarTypes;
            //};
            if(_side == A3E_VAR_Side_Opfor) then {
                _possibleVehicles = a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses;
            };
            if (_side == A3E_VAR_Side_Ind ) then {
                _possibleVehicles = a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_Ind;
            };
			if(_side == civilian) then {
                _possibleVehicles = a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses;
            };
            _vehicleType = _possibleVehicles select floor (random count _possibleVehicles);
            _result = [_pos, _direction + 90, _vehicleType, _side] call BIS_fnc_spawnVehicle;
            _vehicle = _result select 0;
            _vehiclesCrew = _result select 1;
            _vehiclesGroup = _result select 2;
            
            // Name vehicle
            sleep random 0.05;
            if (isNil "drn_MilitaryTraffic_CurrentEntityNo") then {
                drn_MilitaryTraffic_CurrentEntityNo = 0
            };
            
            _currentEntityNo = drn_MilitaryTraffic_CurrentEntityNo;
            drn_MilitaryTraffic_CurrentEntityNo = drn_MilitaryTraffic_CurrentEntityNo + 1;
            
            _vehicleVarName = "drn_MilitaryTraffic_Entity_" + str _currentEntityNo;
            _vehicle setVehicleVarName _vehicleVarName;
            _vehicle call compile format ["%1=_this;", _vehicleVarName];
            
            // Set crew skill
            {
                //_skill = _minSkill + random (_maxSkill - _minSkill);
//                [_x, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;

            } foreach _vehiclesCrew;
            
            _debugMarkerName = "drn_MilitaryTraffic_DebugMarker" + str _currentEntityNo;
            
            //_vehicle setDir _direction;
            
            // Start vehicle
            [_vehicle, _destinationPos, _debug] spawn drn_fnc_MilitaryTraffic_MoveVehicle;
			
            _activeVehiclesAndGroup pushBack [_vehicle, _vehiclesGroup, _vehiclesCrew, _debugMarkerName, _result spawn _fnc_OnSpawnVehicle];
            
            // Run spawn script
            //_vehiclesGroup setVariable ["drn_scriptHandle", _result spawn _fnc_OnSpawnVehicle]; // Squint complaining, but is ok.
            
            if (_debug) then {
                ["Vehicle '" + vehicleVarName _vehicle + "' created! Total vehicles = " + str count _activeVehiclesAndGroup] call drn_fnc_CL_ShowDebugTextAllClients;
            };
        }
        else {
            _tries = _tries + 1;
        };
    };
    
    _firstIteration = false;
    if (_debug) then {
        {
            private ["_debugMarkerColor"];
            
            _vehicle = _x select 0;
            _group = _x select 1;
            _debugMarkerName = _x select 3;
            _side = side _group;
            
            _debugMarkerColor = "Default";
            if (_side == west) then {
                _debugMarkerColor = "ColorBlue";
            };
            if (_side == east) then {
                _debugMarkerColor = "ColorRed";
            };
            if (_side == civilian) then {
                _debugMarkerColor = "ColorYellow";
            };
            if (_side == resistance) then {
                _debugMarkerColor = "ColorGreen";
            };
            
            [_debugMarkerName, getPos (_vehicle), "c_car", _debugMarkerColor, "Traffic"] call drn_fnc_CL_SetDebugMarkerAllClients;
            
        } foreach _activeVehiclesAndGroup;
    };
    
	// If any vehicle is too far away, delete it
    _deletedVehiclesCount = 0;
	private _players = [] call A3E_FNC_GetPlayers;
	{
        private ["_closestUnitDistance", "_distance", "_crewUnits"];
        private ["_scriptHandle"];
        
        _vehicle = _x select 0;
        _group = _x select 1;
        _crewUnits = _x select 2;
        _debugMarkerName = _x select 3;
		_scriptHandle = _x select 4;
        
        _closestUnitDistance = 1000000;
        
        {
            _distance = ((vehicle _x) distance _vehicle);
            if (_distance < _closestUnitDistance) then {
                _closestUnitDistance = _distance;
            };
        } foreach _players;
        
		//Failsafe deletion... just to make sure
        if (_closestUnitDistance > _maxSpawnDistance && ({isPlayer _x} count (crew _vehicle) == 0)) then {
			//Deleting the old crew here... must be somewhere
            {
                deleteVehicle _x;
            } foreach _crewUnits;

            // Terminate script before deleting the vehicle
            //_scriptHandle = _group getVariable "drn_scriptHandle";
            if (!(scriptDone _scriptHandle)) then {
                terminate _scriptHandle;
            };
            
            deleteVehicle _vehicle;
            deleteGroup _group;

            [_debugMarkerName] call drn_fnc_CL_DeleteDebugMarkerAllClients;
            _deletedVehiclesCount = _deletedVehiclesCount + 1;
            
            if (_debug) then {
                ["Vehicle deleted! Total vehicles = " + str (count _activeVehiclesAndGroup - _deletedVehiclesCount)] call drn_fnc_CL_ShowDebugTextAllClients
            };
			_activeVehiclesAndGroup deleteAt _forEachIndex;
        };
	} foreach _activeVehiclesAndGroup;
    
    
    sleep 1;
};


