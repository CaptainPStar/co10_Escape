private ["_referenceGroup", "_side", "_infantryClasses", "_mannedVehicleClasses", "_numberOfRoadBlocks", "_minSpawnDistance", "_maxSpawnDistance", "_minDistanceBetweenRoadBlocks", "_minSpawnDistanceAtStartup", "_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle", "_debug"];
private ["_roadBlocks", "_roadSegment", "_roadBlockItem", "_roadBlocksDeleted", "_instanceNo", "_tempRoadBlocks", "_units", "_group", "_firstLoop", "_minDistance", "_isFaction", "_factionsArray"];
private ["_possibleInfantryTypes", "_possibleVehicleTypes", "_fnc_FindRoadBlockSegment", "_fnc_CreateRoadBlock"];

_referenceGroup = _this select 0;
if (count _this > 1) then { _side = _this select 1; } else { _side = west; };
if (count _this > 2) then { _infantryClasses = _this select 2; } else { _infantryClasses = "USMC"; };
if (count _this > 3) then { _mannedVehicleClasses = _this select 3; } else { _mannedVehicleClasses = "USMC"; };
if (count _this > 4) then { _numberOfRoadBlocks = _this select 4; } else { _numberOfRoadBlocks = 10; };
if (count _this > 5) then { _minSpawnDistance = _this select 5; } else { _minSpawnDistance = 1500; };
if (count _this > 6) then { _maxSpawnDistance = _this select 6; } else { _maxSpawnDistance = 2000; };
if (count _this > 7) then { _minDistanceBetweenRoadBlocks = _this select 7; } else { _minDistanceBetweenRoadBlocks = 500; };
if (count _this > 8) then { _minSpawnDistanceAtStartup = _this select 8; } else { _minSpawnDistanceAtStartup = 300; };
if (count _this > 9) then { _fnc_OnSpawnInfantryGroup = _this select 9; } else { _fnc_OnSpawnInfantryGroup = {}; };
if (count _this > 10) then { _fnc_OnSpawnMannedVehicle = _this select 10; } else { _fnc_OnSpawnMannedVehicle = {}; };
if (count _this > 11) then { _debug = _this select 11; } else { _debug = false; };

_factionsArray = [A3E_VAR_Side_Ind , A3E_VAR_Side_Opfor];


_roadBlocks = [];

_fnc_FindRoadBlockSegment = {
    private ["_roadBlocks", "_referenceGroup", "_minSpawnDistance", "_maxSpawnDistance", "_minDistanceBetweenRoadBlocks", "_nullVal"];
    private ["_refUnit", "_isOk", "_tries", "_spawnDistanceDiff", "_refPosX", "_refPosY", "_dir", "_tooClose", "_tooFarAwayFromAll"];

    _roadBlocks = _this select 0;
    _referenceGroup = _this select 1;
    _minSpawnDistance = _this select 2;
    _maxSpawnDistance = _this select 3;
    _minDistanceBetweenRoadBlocks = _this select 4;
	private _result = objNull;
    
    _spawnDistanceDiff = _maxSpawnDistance - _minSpawnDistance;//Half?
    _roadSegment = _result;
    _refUnit = vehicle ((units _referenceGroup) select floor random count units _referenceGroup);
    
    _isOk = false;
    _tries = 0;
    while {!_isOk && _tries < 100} do {
        
        
        _dir = random 360;
        _refPosX = ((getPos _refUnit) select 0) + (_minSpawnDistance + _spawnDistanceDiff) * sin _dir;
        _refPosY = ((getPos _refUnit) select 1) + (_minSpawnDistance + _spawnDistanceDiff) * cos _dir;
        
        private _roadSegments = [_refPosX, _refPosY] nearRoads (_spawnDistanceDiff);
		_roadSegment = objNull;
		if(count _roadSegments > 0) then {
			_roadSegment = _roadSegments select floor random count _roadSegments;
            _isOk = true;
		}
        else {
            _isOk = false;
        };
         
        if(_isOK) then {
            // Check if road segment is at spawn distance
            _tooFarAwayFromAll = true;
            _tooClose = false;
            {
                private ["_tooFarAway"];
                
                _tooClose = false;
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
            } foreach units _referenceGroup;
            
            if (_tooClose || _tooFarAwayFromAll) then {
                _isOk = false;
            };
            
            // Check if road segment is not close to a house
            if ((nearestBuilding _roadSegment) distance _roadSegment < 50) then {
                _isOk = false;
            };
            
            // Check if road segment is not too close to another road block
            {
                private ["_anotherSegment"];
                _anotherSegment = _x select 1;
                
                if (_roadSegment distance _anotherSegment < _minDistanceBetweenRoadBlocks) then {
                    _isOk = false;
                };
            } foreach _roadBlocks;
        };
        
        _tries = _tries + 1;
    };
    
    if (_isOk) then {
        _result = _roadSegment;
    };
    
    _result;
};

_fnc_CreateRoadBlock = {
    private ["_roadSegment", "_side", "_possibleInfantryTypes", "_possibleVehicleTypes", "_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle"];
    private ["_dir", "_pos", "_angle", "_posX", "_posY", "_result", "_group", "_barrier", "_guardTypes", "_units", "_vehicle", "_crew", "_possibleVehicles", "_nullRoad"];
    
    _roadSegment = _this select 0;
    _side = _this select 1;
    _fnc_OnSpawnInfantryGroup = _this select 2;
    _fnc_OnSpawnMannedVehicle = _this select 3;
    _instanceNo = param[4];

    _units = [];
    private _vehicles = [];
    _dir = direction _roadSegment;
    _pos = getPos _roadSegment;
    
    if (random 100 < 50) then {
        _angle = 0;
    }
    else {
        _angle = 180;
    };
    
	private _marker = createMarkerLocal [format["a3e_roadBlockArea%1",_instanceNo], _pos];
    _marker setMarkerAlpha 0;
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [15, 15];
	

    if(_side == A3E_VAR_Side_Opfor) then {
        _possibleVehicles = a3e_arr_Escape_RoadBlock_MannedVehicleTypes;
    };
    if (_side == A3E_VAR_Side_Ind) then {
        _possibleVehicles = a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind;
    };
		
	
    _result = [_pos, _dir, _possibleVehicles select floor random count _possibleVehicles, _side] call BIS_fnc_spawnVehicle;
    _vehicle = _result select 0;
    _crew = _result select 1;
    _group = _result select 2;
    
    _vehicles pushback _vehicle;
    _units append (units _group);
	
	_result spawn _fnc_OnSpawnMannedVehicle;
	
    _gun = a3e_arr_ComCenStaticWeapons select floor random count a3e_arr_ComCenStaticWeapons;
   // private _static = [_gun, (_pos vectoradd [10,0,0]), _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
	private _static = createVehicle [_gun, (_pos vectoradd [10,0,0]), [], 0, "NONE"];
	_vehicles pushBack _static;
	_units pushback ([_static,_side] call A3E_fnc_AddStaticGunner); 
	// A3E_fnc_Roadblock ["_center","_rotation","_static","_vehicle"];
	_units append ([_pos,(_dir + _angle),_static,_vehicle] call A3E_fnc_Roadblock);
    
    _group = createGroup _side;

    if(_side == A3E_VAR_Side_Opfor) then {
        _guardTypes = a3e_arr_Escape_InfantryTypes;
    };
    if (_side == A3E_VAR_Side_Ind) then {
        _guardTypes = a3e_arr_Escape_InfantryTypes_Ind;
    };
    
    //(_guardTypes select floor random count _guardTypes) createUnit [_pos, _group, "", 0.5, "LIEUTNANT"];
    //(_guardTypes select floor random count _guardTypes) createUnit [_pos, _group, "", 0.5, "LIEUTNANT"];
    //(_guardTypes select floor random count _guardTypes) createUnit [_pos, _group, "", 0.5, "LIEUTNANT"];
    //(_guardTypes select floor random count _guardTypes) createUnit [_pos, _group, "", 0.5, "LIEUTNANT"];
    _group createUnit [(_guardTypes select floor random count _guardTypes), _pos, [], 0, "FORM"];
    _group createUnit [(_guardTypes select floor random count _guardTypes), _pos, [], 0, "FORM"];
    _group createUnit [(_guardTypes select floor random count _guardTypes), _pos, [], 0, "FORM"];
    _group createUnit [(_guardTypes select floor random count _guardTypes), _pos, [], 0, "FORM"];
    
    {
        _x setUnitRank "LIEUTNANT";
    } foreach units _group;
    
    _units append (units _group);
    
	[_group, _marker] spawn a3e_fnc_Patrol;
	
    //_waypoint = _group addWaypoint [_pos, 0];
    //_waypoint setWaypointType "MOVE";
    //_waypoint setWaypointBehaviour "AWARE";
    //_waypoint setWaypointCombatMode "YELLOW";
    
    _group spawn _fnc_OnSpawnInfantryGroup;
    
    [_units,_vehicles];
};

_firstLoop = true;
//_nullRoad = ((getMarkerPos "RoadBlockNullRoad") nearRoads 50) select 0;

while {true} do {
	private ["_roadSegment"];
    // Spawn road blocks
    while {count _roadBlocks < _numberOfRoadBlocks} do {
        
        sleep random 0.05;
        if (isNil "a3e_var_RoadBlocks_InstanceNo") then {
            a3e_var_RoadBlocks_InstanceNo = 0;
        }
        else {
            a3e_var_RoadBlocks_InstanceNo = a3e_var_RoadBlocks_InstanceNo + 1;
        };
        
        _instanceNo = a3e_var_RoadBlocks_InstanceNo;
        
        if (_firstLoop) then {
            _minDistance = _minSpawnDistanceAtStartup;
        }
        else {
            _minDistance = _minSpawnDistance;
        };
		
        _roadSegment = [_roadBlocks, _referenceGroup, _minDistance, _maxSpawnDistance, _minDistanceBetweenRoadBlocks] call _fnc_FindRoadBlockSegment;
        if(!(isNil "_roadSegment")) then {
			if (!isNull _roadSegment) then {
				private _side = _factionsArray select (floor (random (count _factionsArray)));
				private _composition = [_roadSegment, _side, _fnc_OnSpawnInfantryGroup, _fnc_OnSpawnMannedVehicle,_instanceNo] call _fnc_CreateRoadBlock;
				_roadBlocks pushback [_instanceNo, _roadSegment, _composition select 0, _composition select 1];
				
				if (false) then {
					["Road block created. Number of road blocks: " + str count _roadBlocks] call drn_fnc_CL_ShowDebugTextAllClients;
					["drn_DebugMarker_RoadBlocks_" + str _instanceNo, getPos _roadSegment, "mil_dot", "ColorRed", "Road Block"] call drn_fnc_CL_SetDebugMarkerAllClients;
				};
			};
        };
    };
    
    if (false) then {
        sleep 1;
    }
    else {
        sleep 60;
    };
    
    // Delete road blocks
    _tempRoadBlocks = [];
    _roadBlocksDeleted = 0;
    {
        
        private _roadBlockItem = _x;
		private _roadBlockIndex = _forEachIndex;
        private _instanceNo = _roadBlockItem select 0;
        private _roadSegment = _roadBlockItem select 1;
        private _roadBlockObjects = _roadBlockItem select 2;
		private _roadBlockVehicles = _roadBlockItem select 3;
		
		private _players = [] call A3E_fnc_getPlayers;
        private _farAway = true;
        {
            
			if ((vehicle _x) distance _roadSegment < _maxSpawnDistance) exitwith {
				_farAway = false;
			};
        } foreach _players;
        
        if (_farAway) then {
            private ["_groups", "_units"];
            
            //_units = _roadBlockItem select 2;
            
            // Delete road block
            {
				deleteVehicle _x;
			} foreach _roadBlockObjects;
			
			 {
				_farAway = true;
				{
					if ((vehicle _x) distance _roadSegment < _maxSpawnDistance) exitwith {
						_farAway = false;
					};
				} foreach _players;
				if(_farAway && count((crew _x) arrayIntersect _players)==0) then {
					deleteVehicle _x;
				};
			} foreach _roadBlockVehicles;
			
            /*_groups = [];
            {
                _group = group _x;
                if (str _group != "<NULL-group>" && !(_group in _groups)) then {
                    _groups set [count _groups, _group];
                };
                
                deleteVehicle _x;
            } foreach _units;
            
            {
                deleteGroup _x;
            } foreach _groups;*/
             
             _roadBlocksDeleted = _roadBlocksDeleted + 1;
             
			 _roadBlocks deleteAt _roadBlockIndex;
			 
             if (false) then {
                 ["Road block deleted. Number of road blocks: " + str ((count _roadBlocks) - _roadBlocksDeleted)] call drn_fnc_CL_ShowDebugTextAllClients;
                 ["drn_DebugMarker_RoadBlocks_" + str _instanceNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
             };
        };
        
    } foreach _roadBlocks;
	
    _firstLoop = false;
};








