if (!isServer) exitWith {};

private ["_referenceGroup", "_side", "_vehicleClasses", "_vehicleCount", "_minSpawnDistance", "_maxSpawnDistance", "_minSkill", "_maxSkill", "_debug"];
private ["_activeVehiclesAndGroup", "_vehiclesGroup", "_spawnSegment", "_vehicle", "_group", "_result", "_possibleVehicles", "_vehicleType", "_vehiclesCrew", "_skill", "_minDistance", "_tries", "_trafficLocation"];
private ["_currentEntityNo", "_vehicleVarName", "_isFaction", "_tempVehiclesAndGroup", "_deletedVehiclesCount", "_firstIteration", "_roadSegments", "_destinationSegment", "_destinationPos", "_direction"];
private ["_roadSegmentDirection", "_testDirection", "_facingAway", "_posX", "_posY", "_pos"];
private ["_fnc_OnSpawnVehicle", "_fnc_FindSpawnSegment"];
private ["_debugMarkerName", "_allRoadSegments"];
//private ["_debugMarkers", "_debugMarkerNo", "_debugMarker", "_debugMarkerName"];

_referenceGroup = _this select 0;
_side = _this select 1;
_vehicleClasses = _this select 2;
if (count _this > 3) then {_vehicleCount = _this select 3;} else {_vehicleCount = 10;};
if (count _this > 4) then {_minSpawnDistance = _this select 4;} else {_minSpawnDistance = 1000;};
if (count _this > 5) then {_maxSpawnDistance = _this select 5;} else {_maxSpawnDistance = 1500;};
if (count _this > 6) then {_minSkill = _this select 6;} else {_minSkill = 0.4;};
if (count _this > 7) then {_maxSkill = _this select 7;} else {_maxSkill = 0.6;};
if (count _this > 8) then {_fnc_OnSpawnVehicle = _this select 8;} else {_fnc_OnSpawnVehicle = {};};
if (count _this > 9) then {_debug = _this select 9;} else {_debug = false;};
_factionsArray = [A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor ,A3E_VAR_Side_Opfor];
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

_isFaction = false;
if (str _vehicleClasses == """USMC""") then {
    _possibleVehicles = ["HMMWV", "HMMWV_M2", "HMMWV_Armored", "HMMWV_MK19", "HMMWV_TOW", "HMMWV_Avenger", "M1030", "MMT_USMC", "MTVR", "HMMWV_Ambulance", "MtvrReammo", "MtvrRefuel", "MtvrRepair", "AAV", "LAV25", "LAV25_HQ", "M1A1", "M1A2_TUSK_MG", "MLRS"];
    _isFaction = true;
};
if (str _vehicleClasses == """CDF""") then {
    _possibleVehicles = ["GRAD_CDF", "UAZ_CDF", "UAZ_AGS30_CDF", "UAZ_MG_CDF", "Ural_CDF", "UralOpen_CDF", "Ural_ZU23_CDF", "BMP2_Ambul_CDF", "UralReammo_CDF", "UralRefuel_CDF", "UralRepair_CDF", "BMP2_CDF", "BMP2_HQ_CDF", "BRDM2_CDF", "BRDM2_ATGM_CDF", "T72_CDF", "ZSU_CDF"];
    _isFaction = true;
};
if (str _vehicleClasses == """RU""") then {
    _possibleVehicles = ["GRAD_RU", "UAZ_RU", "UAZ_AGS30_RU", "Kamaz", "KamazOpen", "KamazReammo", "KamazRefuel", "KamazRepair", "GAZ_Vodnik_MedEvac", "2S6M_Tunguska", "BMP3", "BTR90", "BTR90_HQ", "T72_RU", "T90", "GAZ_Vodnik", "GAZ_Vodnik_HMG"];
    _isFaction = true;
};
if (str _vehicleClasses == """INS""") then {
    _possibleVehicles = ["O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "O_MBT_02_arty_F", "O_MBT_02_cannon_F"];
    _isFaction = true;
};
if (str _vehicleClasses == """GUE""") then {
    _possibleVehicles = ["TT650_Gue", "Offroad_DSHKM_Gue", "Offroad_SPG9_Gue", "Pickup_PK_GUE", "V3S_Gue", "Ural_ZU23_Gue", "BMP2_Gue", "BRDM2_Gue", "BRDM2_HQ_Gue", "T34", "T72_Gue"];
    _isFaction = true;
};
if (str _vehicleClasses == """CIV""") then {
    _possibleVehicles = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];;
    _isFaction = true;
};

if (!_isFaction) then {
    _possibleVehicles =+ _vehicleClasses;
};

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
            if(_side != civilian) then {
                _faction = _factionsArray select (floor (random (count _factionsArray)));
            };
            if(_side == civilian) then {
                _faction = civilian;
                _possibleVehicles = a3e_arr_Escape_EnemyCivilianCarTypes;
            };
            if(_faction == A3E_VAR_Side_Opfor) then {
                _possibleVehicles = a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses;
            };
            if (_faction == A3E_VAR_Side_Ind ) then {
                _possibleVehicles = a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_Ind;
            };

            _vehicleType = _possibleVehicles select floor (random count _possibleVehicles);
            _result = [_pos, _direction + 90, _vehicleType, _faction] call BIS_fnc_spawnVehicle;
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
			
            _activeVehiclesAndGroup set [count _activeVehiclesAndGroup, [_vehicle, _vehiclesGroup, _vehiclesCrew, _debugMarkerName, _result spawn _fnc_OnSpawnVehicle]];
            
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
    _tempVehiclesAndGroup = [];
    _deletedVehiclesCount = 0;
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
        } foreach units _referenceGroup;
        
        if (_closestUnitDistance < _maxSpawnDistance) then {
            _tempVehiclesAndGroup set [count _tempVehiclesAndGroup, _x];
        }
        else {
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
        };
	} foreach _activeVehiclesAndGroup;
    
    _activeVehiclesAndGroup = _tempVehiclesAndGroup;
    
    sleep 1;
};


