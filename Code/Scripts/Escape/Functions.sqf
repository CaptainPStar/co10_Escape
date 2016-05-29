drn_fnc_Escape_OnSpawnGeneralSoldierUnit = {
	private["_nighttime"];
    _this setVehicleAmmo (0.2 + random 0.6);
	if(daytime > 20 OR daytime < 8) then {
		_nighttime = true;
	} else {
		_nighttime = false;
	};   
	//Hopefully fixing BIS broken scripts:
	_this setskill 0.2;
	_this setskill ["aimingspeed", 0.1];
	_this setskill ["spotdistance", 0.2];
	_this setskill ["aimingaccuracy", 0.2]; 
	_this setskill ["aimingshake", 0.1]; 
	_this setskill ["spottime", 0.1];
	_this setskill ["commanding", 0.2]; 
	_this setskill ["general", 0.3];
	_this setskill ["reloadspeed", 0.2];
	_this setskill ["courage", 0.2];
	_this setskill ["endurance", 0.2];
	

	
    //_this setSkill (a3e_var_Escape_enemyMinSkill + random (a3e_var_Escape_enemyMaxSkill - a3e_var_Escape_enemyMinSkill));
    
	//[_this, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
    
	
    //player sideChat str (precision _this);
    //player sideChat (str (precision _this) + "   "  + str(_this skill "aimingAccuracy"));
    
    _this removeItem "FirstAidKit";
	
	//Chance for a random scope (and no scope):
	if(random 100 < 70) then {

		removeAllPrimaryWeaponItems _this;
		if((random 100 < 30)) then {
			_scopes = A3E_arr_Scopes;
			if(Param_NoNightvision==0) then {
				_scopes = _scopes + A3E_arr_TWSScopes;
			};
			if(_nighttime) then {
				_scopes = _scopes + A3E_arr_NightScopes;
			};
			_scope = _scopes select floor(random(count(_scopes)));
			_this addPrimaryWeaponItem _scope;
		};
	};
	//Chance for random attachment
	if(((random 100 < 15) && (!_nighttime)) OR ((random 100 < 70) && (_nighttime))) then {
		if(random 100 < 70) then {
			_this addPrimaryWeaponItem "acc_flashlight";
		} else {
			_this addPrimaryWeaponItem "acc_pointer_IR";
		};
	};
	
	//Bipod chance
	if((random 100 < 20)) then {
		_this addPrimaryWeaponItem (a3e_arr_Bipods select floor(random(count(a3e_arr_Bipods))));
	};
	
	//Chance for silencers
	if(((random 100 < 10) && (!_nighttime)) OR ((random 100 < 40) && (_nighttime))) then {
		//Not yet
	};
    if (random 100 > 20) then {
        //_this additem "ItemMap";
        //_this assignItem "ItemMap";
		_this unlinkItem "ItemMap";
    };
	if (random 100 > 30) then {
        //_this additem "ItemCompass";
        //_this assignItem "ItemCompass";
		_this unlinkItem "ItemCompass";
    };
    if (random 100 > 5) then {
        //_this additem "ItemGPS";
       // _this assignItem "ItemGPS";
		_this unlinkItem "ItemGPS";
    };
	if ("Binocular" in (assignedItems _this)) then {
		if (random 100 > 30) then {
			//_this additem "ItemGPS";
		   // _this assignItem "ItemGPS";
			_this unlinkItem "Binocular";
		};
	};
	if ("Rangefinder" in (assignedItems _this)) then {
		if (random 100 > 30) then {
			//_this additem "ItemGPS";
		   // _this assignItem "ItemGPS";
			_this unlinkItem "Rangefinder";
		};
	};
	//if ("NVGoggles_OPFOR" in (assignedItems _this)) then {
	//		if((_nighttime) && (random 100 > 40) || !(_nighttime) && (random 100 > 5) || (Param_NoNightvision>0)) then {
	//			_this unlinkItem "NVGoggles_OPFOR";
	//		};
	//};
	//if ("NVGoggles_INDEP" in (assignedItems _this)) then {
	//		if((_nighttime) && (random 100 > 40) || !(_nighttime) && (random 100 > 5) || (Param_NoNightvision>0)) then {
	//			_this unlinkItem "NVGoggles_INDEP";
	//		};
	//};
	private["_nvgs"];
	_nvgs = hmd _this; //NVGoggles
	if(_nvgs != "") then {
		if((_nighttime) && (random 100 > 40) || !(_nighttime) && (random 100 > 5) || (Param_NoNightvision>0)) then {
			_this unlinkItem _nvgs;
		};
	} else {
		if((((_nighttime) && (random 100 < 40)) || (!(_nighttime) && (random 100 < 5))) && (Param_NoNightvision==0)) then {
			_this linkItem "NVGoggles_OPFOR";
		};
	};
};

drn_fnc_Escape_FindGoodPos = {
	private ["_i", "_startPos", "_isOk", "_result", "_roadSegments", "_dummyObject"];
    // Choose a random and flat position (for-loopen and markers are for test on new maps).
    for [{_i = 0},  {_i < 1}, {_i = _i + 1}] do {
        _isOk = false;
        while {!_isOk} do {
		
			_startPos = [(getpos SouthWest select 0) + random (getpos NorthEast select 0),(getpos SouthWest select 1) + random (getpos NorthEast select 1)];

            
            //diag_log ("startPos == " + str _startPos);
            _result = _startPos isFlatEmpty [5, 0, 0.25, 1, 0, false, objNull];
            _roadSegments = _startPos nearRoads 30;
			_buildings = _startPos nearObjects 30;
            
            if ((count _result > 0) && (count _roadSegments == 0) && (!surfaceIsWater _startPos) && (count _buildings == 0)) then {
				_startPos = _result;
                _dummyObject = "Land_Can_Rusty_F" createVehicleLocal _startPos;
                
                if (((nearestBuilding _dummyObject) distance _startPos) > 50) then {
                    _isOk = true;
                };
                
                deleteVehicle _dummyObject;
            };
        };
        
        //_marker = createMarker ["marker" + str _i, _startPos];
        //_marker setMarkerType "Warning";
    };
    
    _startPos
};

drn_fnc_Escape_FindAmmoDepotPositions = {
    private ["_occupiedPositions"];
    private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_maxDistance", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk"];
    
    _occupiedPositions = _this;
    
    _positions = [];
    _i = 0;
    _maxDistance = 1000;
    
    _countNW = 0;
    _countNE = 0;
    _countSE = 0;
    _countSW = 0;
    if(isNil("A3E_AmmoDepotCount")) then {
		A3E_AmmoDepotCount = 8;
	};
    while {count _positions < A3E_AmmoDepotCount} do {
        _isOk = false;
        _j = 0;
        
        while {!_isOk} do {
            _pos = call drn_fnc_Escape_FindGoodPos;
            _isOk = true;
            
            if (count _positions < 16) then {
                if (_pos select 0 <= ((getMarkerPos "center") select 0) && _pos select 1 > ((getMarkerPos "center") select 1)) then {
                    if (_countNW < 5) then {
                        _countNW = _countNW + 1;
                    }
                    else {
                        _isOk = false;
                    };
                };
                if (_pos select 0 > ((getMarkerPos "center") select 0) && _pos select 1 > ((getMarkerPos "center") select 1)) then {
                    if (_countNE < 5) then {
                        _countNE = _countNE + 1;
                    }
                    else {
                        _isOk = false;
                    };
                };
                if (_pos select 0 > ((getMarkerPos "center") select 0) && _pos select 1 <= ((getMarkerPos "center") select 1)) then {
                    if (_countSE < 5) then {
                        _countSE = _countSE + 1;
                    }
                    else {
                        _isOk = false;
                    };
                };
                if (_pos select 0 <= ((getMarkerPos "center") select 0) && _pos select 1 <= ((getMarkerPos "center") select 1)) then {
                    if (_countSW < 5) then {
                        _countSW = _countSW + 1;
                    }
                    else {
                        _isOk = false;
                    };
                };
            };
            
            _j = _j + 1;
            if (_j > 100) then {
                _isOk = true;
            };
        };
        
        _tooCloseAnotherPos = false;
        {
            if (_pos distance _x < _maxDistance) then {
                _tooCloseAnotherPos = true;
            };
        } foreach _positions;
        
        if (!_tooCloseAnotherPos) then {
            {
                if (_pos distance _x < _maxDistance) then {
                    _tooCloseAnotherPos = true;
                };
            } foreach _occupiedPositions;
        };
        
        if (!_tooCloseAnotherPos) then {
            _positions set [count _positions, _pos];
        };
        
        _i = _i + 1;
        if (_i > 100) exitWith {
            _positions
        };
    };
    
    _positions
};

drn_fnc_Escape_AllPlayersOnStartPos = {
    private ["_startPos"];
    private ["_allPlayersAtStartPos"];
    
    _startPos = _this select 0;
    
    _allPlayersAtStartPos = true;
    
    {
        if (_x distance _startPos > 30) exitWith {
            _allPlayersAtStartPos = false;
        };
    } foreach call A3E_fnc_GetPlayers;
    
    _allPlayersAtStartPos
};

drn_fnc_Escape_GetPlayerGroup = {
    private ["_units", "_unit", "_group"];
    
    _units = call A3E_fnc_GetPlayers;
    
    _unit = _units select 0;
    _group = group _unit;
    
    _group
};

drn_fnc_Escape_CreateExtractionPointServer = {
    private ["_extractionPointNo"];
    
    _extractionPointNo = _this select 0;
    
    if (isServer) then {
        [_extractionPointNo] execVM "Scripts\Escape\CreateExtractionPoint.sqf";
    }
    else {
        drn_EscapeExtractionEventArgs = [_extractionPointNo];
        publicVariable "drn_EscapeExtractionEventArgs";
    };
};
    
if (isServer) then {
    "drn_EscapeExtractionEventArgs" addPublicVariableEventHandler {
        drn_EscapeExtractionEventArgs call drn_fnc_Escape_CreateExtractionPointServer;
    };
};

drn_Escape_AskForTimeSynchronizationEventArgs = [];
drn_Escape_SynchronizeTimeEventArgs = [];

drn_fnc_Escape_SynchronizeTimeLocal = {
    setDate _this;
};

drn_fnc_Escape_AskForTimeSynchronization = {
    drn_Escape_AskForTimeSynchronizationEventArgs = [true];
    publicVariable "drn_Escape_AskForTimeSynchronizationEventArgs";
};

"drn_Escape_SynchronizeTimeEventArgs" addPublicVariableEventHandler {
    drn_Escape_SynchronizeTimeEventArgs call drn_fnc_Escape_SynchronizeTimeLocal;
};

if (isServer) then {
    drn_fnc_Escape_SynchronizeTimeAllClients = {
        drn_Escape_SynchronizeTimeEventArgs = + date;
        publicVariable "drn_Escape_SynchronizeTimeEventArgs";
    };

    "drn_Escape_AskForTimeSynchronizationEventArgs" addPublicVariableEventHandler {
        call drn_fnc_Escape_SynchronizeTimeAllClients;
    };
};

drn_fnc_Escape_TrafficSearch = {
    private ["_vehicle", "_referenceMarker", "_distanceFromReferenceMarker", "_minTimeBetweenStopsSek", "_maxTimeBetweenStopsSek"];
    private ["_gunner", "_commander", "_angle", "_i", "_startSearchTime", "_searchTime", "_glanceTime", "_startGlanceTime", "_turnDir", "_startTime", "_waitTime", "_detectedEnemies"];
    private ["_fnc_LookInDirection", "_fnc_hasDetectedEnemies"];
    
    _vehicle = _this select 0;
    _referenceMarker = drn_searchAreaMarkerName;
    _distanceFromReferenceMarker = 1000;
    _minTimeBetweenStopsSek = 30;
    _maxTimeBetweenStopsSek = 180;
    
    scopeName "mainScope";
    _gunner = gunner _vehicle;
    _commander = commander _vehicle;
    _angle = 0;
    
    {
        _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
    } foreach units group _vehicle;
    
    if ((isNull _gunner) && (isNull _commander)) exitWith {};
    
    _fnc_LookInDirection = {
        private ["_unit", "_dir"];
        private ["_x", "_y", "_pos"];
        
        _unit = _this select 0;
        _dir = _this select 1;
        
        _x = ((getPos _unit) select 0) - (1000 * cos (_dir + 90));
        _y = ((getPos _unit) select 1) + (1000 * sin (_dir + 90));
        _pos = [_x, _y, 0];
        
        _unit doWatch _pos;

//        deleteMarkerLocal "debugMarker";
//        _marker = createMarkerLocal ["debugMarker", _pos];
//        _marker setMarkerTypeLocal "Warning";
    };
    
    _fnc_hasDetectedEnemies = {
        private ["_unit"];
        private ["_nearestEnemy", "_result"];
        
        _unit = _this select 0;
        
        _nearestEnemy = _unit findNearestEnemy (getPos _unit);
        _result = false;
        
        if (!isNull _nearestEnemy) then {
            _result = true;
        };
        
        _result
    };
    
    sleep (_minTimeBetweenStopsSek + random (_maxTimeBetweenStopsSek - _minTimeBetweenStopsSek));
    _detectedEnemies = false;
    
    while {damage _vehicle < 0.1 && !_detectedEnemies} do {
        private ["_pos", "_makeSearchStop"];
        
        _makeSearchStop = true;
        if (_referenceMarker != "") then {
            if ((getMarkerPos _referenceMarker) distance _vehicle > _distanceFromReferenceMarker) then {
                _makeSearchStop = false;
            };
        };
        
        if (_makeSearchStop) then {
            _startSearchTime = time;
            _searchTime = 15 + random 30;
            _turnDir = [1, -1] select floor random 2;
            _angle = getDir _vehicle;
            while {time < _startSearchTime + _searchTime} do {
                _glanceTime = 1 + random 6;
                _startGlanceTime = time;
                _i = 0;
                while {time < _startGlanceTime + _glanceTime} do {
                    if (!isNull _gunner) then {
                        if ([_gunner] call _fnc_hasDetectedEnemies) then {
                            _detectedEnemies = true;
                            breakTo "mainScope";
                        };
                        if (_i == 0) then {
                            [_gunner, _angle] call _fnc_LookInDirection;
                        };
                    };
                    if (!isNull _commander) then {
                        if ([_commander] call _fnc_hasDetectedEnemies) then {
                            _detectedEnemies = true;
                            breakTo "mainScope";
                        };
                        if (_i == 0) then {
                            [_commander, _angle] call _fnc_LookInDirection;
                        };
                    };
                    
                    _vehicle limitSpeed 0;
                    sleep 0.05;
                    _i = _i + 1;
                };
                
                _angle = _angle + (10 + random 120) * _turnDir;
                if (_angle > 360) then {
                    _angle = _angle - 360;
                };
            };
            
            if (!isNull _gunner) then {
                [_gunner, getDir _vehicle] call _fnc_LookInDirection;
            };
            if (!isNull _commander) then {
                [_commander, getDir _vehicle] call _fnc_LookInDirection;
            };
            
            _startTime = time;
            _waitTime = 2;
            while {time < _startTime + _waitTime} do {
                _vehicle limitSpeed 0;
                sleep 0.05;
            };

            if (!isNull _gunner) then {
                if ([_gunner] call _fnc_hasDetectedEnemies) then {
                    _detectedEnemies = true;
                    breakTo "mainScope";
                };
            };
            if (!isNull _commander) then {
                if ([_commander] call _fnc_hasDetectedEnemies) then {
                    _detectedEnemies = true;
                    breakTo "mainScope";
                };
            };
            
            if (!isNull _gunner) then {
                _gunner doWatch objNull;
            };
            if (!isNull _commander) then {
                _commander doWatch objNull;
            };
            
            _startTime = time;
            _waitTime = 2;
            while {time < _startTime + _waitTime} do {
                _vehicle limitSpeed 0;
                sleep 0.05;
            };
        };
        
        _startTime = time;
        _waitTime = _minTimeBetweenStopsSek + random (_maxTimeBetweenStopsSek - _minTimeBetweenStopsSek);
        while {time < _startTime + _waitTime} do {
            if (!isNull _gunner) then {
                if ([_gunner] call _fnc_hasDetectedEnemies) then {
                    _detectedEnemies = true;
                    breakTo "mainScope";
                };
            };
            if (!isNull _commander) then {
                if ([_commander] call _fnc_hasDetectedEnemies) then {
                    _detectedEnemies = true;
                    breakTo "mainScope";
                };
            };
            
            sleep 5;
        };
    };
    
    if (_detectedEnemies) then {
        (group _vehicle) setBehaviour "COMBAT";
        (group _vehicle) setCombatMode "RED";
    };
};


drn_fnc_Escape_AddRemoveComCenArmor = {
    private ["_comCenArmorIndex", "_armorClasses", "_armorObjects"];
    private ["_comCenArmorItem", "_result", "_pos", "_crew"];
    
    _comCenArmorIndex = _this select 0;
    
    _comCenArmorItem = a3e_arr_Escape_ComCenArmors select _comCenArmorIndex;
    
    _pos = _comCenArmorItem select 0;
    _armorClasses = _comCenArmorItem select 1;
    _armorObjects = _comCenArmorItem select 2;
    
    if (count _armorObjects == 0) then {
        private ["_spawnedArmors", "_vehicle", "_group", "_waypoint", "_roadSegments", "_spawnPos"];
        
        _spawnedArmors = [];
        
        {
            _roadSegments = (_pos nearRoads 250);
            if (count _roadSegments == 0) then {
				_roadSegments = (_pos nearRoads 500);
			};
			if (count _roadSegments == 0) then {
				_roadSegments = (_pos nearRoads 1000);
			};
            _spawnPos = getPos (_roadSegments select floor random count _roadSegments);
            _result = [_spawnPos, 0, _x, A3E_VAR_Side_Opfor] call BIS_fnc_spawnVehicle;
            _vehicle = _result select 0;
            _crew = _result select 1;
            _group = _result select 2;
            
            {
                _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
            } foreach _crew;
            
            _waypoint = _group addWaypoint [_pos, 70];
            _waypoint setWaypointType "GUARD";
            _waypoint setWaypointBehaviour "AWARE";
            _waypoint setWaypointCombatMode "YELLOW";
            
            _spawnedArmors set [count _spawnedArmors, _vehicle];
        } foreach _armorClasses;
        
        _comCenArmorItem set [2, _spawnedArmors];
    }
    else {
        private ["_group"];
        private _players = [] call A3E_fnc_getPlayers;
       /* {
            _group = group _x;
            
            {
                deleteVehicle _x;
            } foreach crew _x;
            
            deleteVehicle _x;
            deleteGroup _group;
        } foreach _armorObjects;*/
        
		 {
			if(count((crew _x) arrayIntersect _players)==0) then {
				private _group = group _x;
				
				{
					deleteVehicle _x;
				} foreach crew _x;
				
				deleteVehicle _x;
			};
		} foreach _armorObjects;

        _comCenArmorItem set [2, []];
    };
};

drn_fnc_Escape_InitializeComCenArmor = {
    private ["_referenceGroup", "_comCenPositions", "_enemySpawnDistance", "_enemyFrequency"];
    private ["_index", "_pos", "_trigger"];
    
    _referenceGroup = _this select 0;
    _comCenPositions = _this select 1;
    _enemySpawnDistance = _this select 2;
    _enemyFrequency = _this select 3;
    
    a3e_arr_Escape_ComCenArmors = [];
    _index = 0;

    {
        _pos = _x;
        
        switch (_enemyFrequency) do
        {
            case 1:
            {
                a3e_arr_Escape_ComCenArmors set [count a3e_arr_Escape_ComCenArmors, [_pos, [a3e_arr_ComCenDefence_lightArmorClasses select floor random count a3e_arr_ComCenDefence_lightArmorClasses], []]];
            };
            case 2:
            {
                a3e_arr_Escape_ComCenArmors set [count a3e_arr_Escape_ComCenArmors, [_pos, [a3e_arr_ComCenDefence_heavyArmorClasses select floor random count a3e_arr_ComCenDefence_heavyArmorClasses], []]];
            };
            default
            {
                a3e_arr_Escape_ComCenArmors set [count a3e_arr_Escape_ComCenArmors, [_pos, [a3e_arr_ComCenDefence_lightArmorClasses select floor random count a3e_arr_ComCenDefence_lightArmorClasses, a3e_arr_ComCenDefence_heavyArmorClasses select floor random count a3e_arr_ComCenDefence_heavyArmorClasses], []]];
            };
        };
        
        _trigger = createTrigger["EmptyDetector", _pos];
        _trigger triggerAttachVehicle [units _referenceGroup select 0];
        _trigger setTriggerArea[_enemySpawnDistance + 50, _enemySpawnDistance + 50, 0, false];
        _trigger setTriggerActivation["MEMBER", "PRESENT", true];
        _trigger setTriggerTimeout [2, 2, 2, true];
        _trigger setTriggerStatements["this", "_nil = [" + str _index + "] spawn drn_fnc_Escape_AddRemoveComCenArmor;", "_nil = [" + str _index + "] spawn drn_fnc_Escape_AddRemoveComCenArmor;"];
        
        _index = _index + 1;
    } foreach _comCenPositions;
};

drn_fnc_Escape_FindSpawnSegment = {
    private ["_referenceGroup", "_minSpawnDistance", "_maxSpawnDistance"];
    private ["_refUnit", "_roadSegments", "_roadSegment", "_isOk", "_tries", "_result", "_spawnDistanceDiff", "_refPosX", "_refPosY", "_dir", "_tooFarAwayFromAll", "_tooClose"];

    _referenceGroup = _this select 0;
    _minSpawnDistance = _this select 1;
    _maxSpawnDistance = _this select 2;
    
    _spawnDistanceDiff = _maxSpawnDistance - _minSpawnDistance;
    _roadSegment = "NULL";
    _refUnit = vehicle ((units _referenceGroup) select floor random count units _referenceGroup);

    _isOk = false;
    _tries = 0;
    while {!_isOk && _tries < 25} do {
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
                
            } foreach units _referenceGroup;
            
            _isOk = true;
            if (_tooClose || _tooFarAwayFromAll) then {
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

drn_fnc_Escape_PopulateVehicle = {
    private ["_vehicle", "_side", "_unitTypes", "_enemyFrequency"];
    private ["_group", "_maxSoldiersCount", "_soldierCount", "_continue", "_unitType", "_insurgentSoldier"];
    
    _vehicle = _this select 0;
    _side = _this select 1;
    _unitTypes = _this select 2;
    if (count _this > 3) then { _enemyFrequency = _this select 3; } else { _enemyFrequency = 3; };
    
    _maxSoldiersCount = _enemyFrequency + 3 + floor random (4 * _enemyFrequency);
    _group = createGroup _side;
    
    _soldierCount = 0;
    
    // Driver
    _continue = true;
    while {_continue && (_soldierCount <= _maxSoldiersCount)} do {
        _unitType = _unitTypes select floor random count _unitTypes;
        _insurgentSoldier = _group createUnit [_unitType, [0,0,0], [], 0, "FORM"];
        
        _insurgentSoldier setRank "LIEUTNANT";
        _insurgentSoldier moveInDriver _vehicle;
        
        if (vehicle _insurgentSoldier != _insurgentSoldier) then {
            _insurgentSoldier assignAsDriver _vehicle;
            _soldierCount + _soldierCount + 1;
        }
        else {
            deleteVehicle _insurgentSoldier;
            _continue = false;
        };
    };
    
    // Gunner
    _continue = true;
    while {_continue && _soldierCount <= _maxSoldiersCount} do {
        _unitType = _unitTypes select floor random count _unitTypes;
        _insurgentSoldier = _group createUnit [_unitType, [0,0,0], [], 0, "FORM"];
        
        _insurgentSoldier setRank "LIEUTNANT";
        _insurgentSoldier moveInGunner _vehicle;
        
        if (vehicle _insurgentSoldier != _insurgentSoldier) then {
            _insurgentSoldier assignAsGunner _vehicle;
            _soldierCount + _soldierCount + 1;
        }
        else {
            deleteVehicle _insurgentSoldier;
            _continue = false;
        };
    };
    
    // Commander
    _continue = true;
    while {_continue && _soldierCount <= _maxSoldiersCount} do {
        _unitType = _unitTypes select floor random count _unitTypes;
        _insurgentSoldier = _group createUnit [_unitType, [0,0,0], [], 0, "FORM"];
        
        _insurgentSoldier setRank "LIEUTNANT";
        _insurgentSoldier moveInCommander _vehicle;
        
        if (vehicle _insurgentSoldier != _insurgentSoldier) then {
            _insurgentSoldier assignAsCommander _vehicle;
            _soldierCount + _soldierCount + 1;
        }
        else {
            deleteVehicle _insurgentSoldier;
            _continue = false;
        };
    };
    
    // Cargo
    _continue = true;
    while {_continue && _soldierCount <= _maxSoldiersCount} do {
        _unitType = _unitTypes select floor random count _unitTypes;
        _insurgentSoldier = _group createUnit [_unitType, [0,0,0], [], 0, "FORM"];
        
        _insurgentSoldier setRank "LIEUTNANT";
        _insurgentSoldier moveInCargo _vehicle;
        
        if (vehicle _insurgentSoldier != _insurgentSoldier) then {
            _insurgentSoldier assignAsCargo _vehicle;
            _soldierCount + _soldierCount + 1;
        }
        else {
            deleteVehicle _insurgentSoldier;
            _continue = false;
        };
    };
    
    _group
};

if (isServer) then {
    a3e_var_Escape_FunctionsInitializedOnServer = true;
    publicVariable "a3e_var_Escape_FunctionsInitializedOnServer";
};


