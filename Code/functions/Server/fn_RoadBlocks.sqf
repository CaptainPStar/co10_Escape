params["_infantryClasses", "_mannedVehicleClasses" , "_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle"];

private _factionsArray = [A3E_VAR_Side_Ind , A3E_VAR_Side_Opfor];


if(isNil("A3E_arr_RoadBlocks")) then {
	missionnameSpace setvariable ["A3E_arr_RoadBlocks",[],true];
};

private _fnc_FindRoadBlockSegment = { 
	//Function for checking if road segment is valid for a roadblock
	params["_referenceUnits"];
	private _fn_checkRoadSegment = {
		params["_roadSegment","_referenceUnits"];
		// Check if road segment is not too close to another road block
		private _minSpawnDistance = (missionNamespace getvariable["MinRoadblockSpawnDistance",1500]);
		private _maxSpawnDistance = (missionNamespace getvariable["MaxRoadblockSpawnDistance",2000]);
		private _minDistanceBetweenRoadBlocks = (missionNamespace getvariable["MinRoadblockDistance",300]);
		
		if(count(roadsConnectedTo _roadSegment) != 2) exitwith {false;};
		
		if({(_roadSegment distance (_x select 1) < _minDistanceBetweenRoadBlocks)} count (missionnameSpace getvariable ["A3E_arr_RoadBlocks",[]]) > 0) exitwith {false;};
		
		 // Check if road segment is not close to a house
		if ((nearestBuilding _roadSegment) distance _roadSegment < 50) exitwith {false;};
		
		// Check if road segment is at spawn distance
		if(({(vehicle _x) distance (getPos _roadSegment) < _minSpawnDistance || (vehicle _x) distance (getPos _roadSegment) > _maxSpawnDistance} count _referenceUnits) >0) exitwith {false;};
		true;
	};
	
	private _minSpawnDistance = (missionNamespace getvariable["MinRoadblockSpawnDistance",1500]);
	private _maxSpawnDistance = (missionNamespace getvariable["MaxRoadblockSpawnDistance",2000]);
	
    private _spawnDistanceDiff = (_maxSpawnDistance - _minSpawnDistance)/2;
	
	
    private _refUnit = vehicle (selectRandom _referenceUnits);
    
	if(isNil "_refUnit") exitwith {objNull;};
	if(isNull(_refUnit)) exitwith {objNull;};
    private _tries = 0;
	private _isOk = false;
	private _roadSegment = objNull;
    while {!_isOk && _tries < 20} do {

        private _dir = random 360;
        private _refPosX = ((getPos _refUnit) select 0) + (_minSpawnDistance + _spawnDistanceDiff) * sin _dir;
        private _refPosY = ((getPos _refUnit) select 1) + (_minSpawnDistance + _spawnDistanceDiff) * cos _dir;
        
        private _roadSegments = [_refPosX, _refPosY] nearRoads (_spawnDistanceDiff);
		if(count _roadSegments > 0) then {
			_roadSegment = selectRandom _roadSegments;
            _isOk = true;
		}
        else {
            _isOk = false;
        };
		if(!([_roadSegment,_referenceUnits] call _fn_checkRoadSegment)) then {
			_isOk = false;
		};
        
        _tries = _tries + 1;
    };
    
    if (_isOk) exitwith {_roadSegment;};
    objNull;
};

_fnc_CreateRoadBlock = {
    params ["_roadSegment", "_side", "_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle","_instanceNo"];
    

    private _units = [];
    private _vehicles = [];
	
	private _roadConnectedTo = roadsConnectedTo _roadSegment;
	_connectedRoad = _roadConnectedTo select 0;
	private _dir = [_roadConnectedTo select 0, _roadConnectedTo  select 1] call BIS_fnc_DirTo;
	
    private _pos = getPos _roadSegment;
    private _angle = 0;
    if (random 100 < 50) then {
        _angle = 180;
    };
    
	private _marker = createMarkerLocal [format["a3e_roadBlockArea%1",_instanceNo], _pos];
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [15, 15];
	
	private _possibleVehicles = [];
    if(_side == A3E_VAR_Side_Opfor) then {
        _possibleVehicles = a3e_arr_Escape_RoadBlock_MannedVehicleTypes;
    };
    if (_side == A3E_VAR_Side_Ind) then {
        _possibleVehicles = a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind;
    };
		
	
    private _result = [_pos, _dir, selectRandom _possibleVehicles, _side] call BIS_fnc_spawnVehicle;
    private _vehicle = _result select 0;
	[_vehicle] call a3e_fnc_onVehicleSpawn;
    private _crew = _result select 1;
    private _group = _result select 2;
    
    _vehicles pushback _vehicle;
    _units append (units _group);
	
	_result spawn _fnc_OnSpawnMannedVehicle;
	
    private _gun = selectRandom a3e_arr_ComCenStaticWeapons;
   // private _static = [_gun, (_pos vectoradd [10,0,0]), _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
	private _static = createVehicle [_gun, (_pos vectoradd [10,0,0]), [], 0, "NONE"];
	[_static] call a3e_fnc_onVehicleSpawn;
	_vehicles pushBack _static;
	_units pushback ([_static,_side] call A3E_fnc_AddStaticGunner); 

    _units append ([_pos, _dir + _angle, _static, _vehicle] call selectRandom [A3E_fnc_Roadblock3]);

    _group = createGroup _side;
	private _guardTypes = [];
    if(_side == A3E_VAR_Side_Opfor) then {
        _guardTypes = a3e_arr_Escape_InfantryTypes;
    };
    if (_side == A3E_VAR_Side_Ind) then {
        _guardTypes = a3e_arr_Escape_InfantryTypes_Ind;
    };
    
    _group createUnit [selectRandom _guardTypes, _pos, [], 0, "FORM"];
    _group createUnit [selectRandom _guardTypes, _pos, [], 0, "FORM"];
    _group createUnit [selectRandom _guardTypes, _pos, [], 0, "FORM"];
    _group createUnit [selectRandom _guardTypes, _pos, [], 0, "FORM"];
    
    {
        _x setUnitRank "LIEUTENANT";
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


while {true} do {
	private _numberOfRoadBlocks = missionnameSpace getvariable ["MaxNumberOfRoadblocks",10];
	private _roadBlocks = missionnameSpace getvariable ["A3E_arr_RoadBlocks",[]];
    if(count (missionnameSpace getvariable ["A3E_arr_RoadBlocks",[]]) < _numberOfRoadBlocks) then { 
        if (isNil "a3e_var_RoadBlocks_InstanceNo") then {
            a3e_var_RoadBlocks_InstanceNo = 0;
        }
        else {
            a3e_var_RoadBlocks_InstanceNo = a3e_var_RoadBlocks_InstanceNo + 1;
        };
        _instanceNo = a3e_var_RoadBlocks_InstanceNo;
        private _roadSegment = [([] call A3E_fnc_getPlayers)] call _fnc_FindRoadBlockSegment;
        if(!isNil "_roadSegment") then {
			if(!isNull _roadSegment) then {
				private _side = selectRandom _factionsArray;
				private _composition = [_roadSegment, _side, _fnc_OnSpawnInfantryGroup, _fnc_OnSpawnMannedVehicle,_instanceNo] call _fnc_CreateRoadBlock;
				_roadBlocks pushback [_instanceNo, _roadSegment, _composition select 0, _composition select 1];
				
				if (missionNamespace getvariable["DebugRoadblocks",false]) then {
					["Road block created. Number of road blocks: " + str count _roadBlocks] call drn_fnc_CL_ShowDebugTextAllClients;
					["drn(missionnamespace getvariable [DebugRoadblocks,false])Marker_RoadBlocks_" + str _instanceNo, getPos _roadSegment, "mil_dot", "ColorRed", "Road Block"] call drn_fnc_CL_SetDebugMarkerAllClients;
				};
			};
		};
	};

    if (missionNamespace getvariable["DebugRoadblocks",false]) then {
        sleep 1;
    }
    else {
        sleep 60;
    };
    
    // Delete road blocks
    private _tempRoadBlocks = [];
    private _roadBlocksDeleted = 0;
	private _maxSpawnDistance = (missionNamespace getvariable["MaxRoadblockSpawnDistance",2000]);
	private _players = [] call A3E_fnc_getPlayers;
    {
        
        private _roadBlockItem = _x;
		private _roadBlockIndex = _forEachIndex;
        private _instanceNo = _roadBlockItem select 0;
        private _roadSegment = _roadBlockItem select 1;
        private _roadBlockObjects = _roadBlockItem select 2;
		private _roadBlockVehicles = _roadBlockItem select 3;
		
        private _farAway = true;
        {
            
			if ((vehicle _x) distance _roadSegment < _maxSpawnDistance) exitwith {
				_farAway = false;
			};
        } foreach _players;
        
        if (_farAway) then {
            private ["_groups", "_units"];
            
            // Delete road block
            {
				deleteVehicle _x;
			} foreach _roadBlockObjects;
			
			 {
				private _vehicle = _x;
				if(count((crew _vehicle) arrayIntersect _players)==0 && ({(_x distance _vehicle)<500} count _players)==0 && (_x distance _roadSegment) < 500) then {
					deleteVehicle _x;
				};
			} foreach _roadBlockVehicles;
    
             _roadBlocksDeleted = _roadBlocksDeleted + 1;
             
			 _roadBlocks deleteAt _roadBlockIndex;
			 
             if (missionNamespace getvariable["DebugRoadblocks",false]) then {
                 ["Road block deleted. Number of road blocks: " + str ((count _roadBlocks) - _roadBlocksDeleted)] call drn_fnc_CL_ShowDebugTextAllClients;
                 ["drn(missionnamespace getvariable [DebugRoadblocks,false])Marker_RoadBlocks_" + str _instanceNo] call drn_fnc_CL_DeleteDebugMarkerAllClients;
             };
        };
        
    } foreach _roadBlocks;
	missionnameSpace setvariable ["A3E_arr_RoadBlocks",_roadBlocks];
};
