if (!isServer) exitWith {};

private ["_searchAreaMarkerName", "_debug"];
private ["_trigger","_trigger2","_marker", "_state", "_timeUntilMarkerSizeMediumMin", "_timeUntilMarkerSizeLargeMin", "_searchStartTimeSek", "_markerState", "_lostContactTimeSek", "_maxKnowledge", "_detectedUnit"];
private ["_unitIsDetected", "_enemyUnit", "_knowledge", "_detectedUnitsPosition", "_unitThatDetected", "_unitThatDetectedPositionAccuracy", "_minTimeUntilReportToHQSec", "_maxTimeUntilReportToHQSec", "_timeUntilReportToHQSec"];
private ["_reportingUnit", "_debugMsg", "_lastDebugMsg", "_reportingStartTime", "_worldSizeXY", "_searchAreaDiamSmall", "_searchAreaDiamMedium", "_searchAreaDiamLarge", "_searchAreaMarkerCreated"];
private["_knownPositionHelperObject","_knownPositionMinDistance","_firstsight","_strikesuccess","_lastArtilleryStrike"];

_searchAreaMarkerName = _this select 0;
if (count _this > 1) then {_debug = _this select 1;} else {_debug = false;};

_marker = "";
//will need to be appropriately changed for stratis
_worldSizeXY = 30000;
_searchAreaDiamSmall = 200;
_searchAreaDiamMedium = 700;
_searchAreaDiamLarge = 1500;
_timeUntilMarkerSizeMediumMin = 1;
_timeUntilMarkerSizeLargeMin = 3;
_minTimeUntilReportToHQSec = 6;
_maxTimeUntilReportToHQSec = 20;

_strikesuccess = false;
_lastArtilleryStrike = 0;

_knownPositionHelperObject = a3e_var_knownPositionHelperObject;
_knownPositionMinDistance = a3e_var_knownPositionMinDistance;

drn_var_SearchLeader_Detected = false;
drn_var_Escape_SearchLeader_civilianReporting = false;
_lostContactTimeSek = 0;
_lastDebugMsg = "";
_searchAreaMarkerCreated = false;

_state = "KNOW NOTHING";
_searchStartTimeSek = diag_tickTime;
_lostContactTimeSek = _searchStartTimeSek;
_markerState = "SMALL";

_timeUntilReportToHQSec = _minTimeUntilReportToHQSec + random (_maxTimeUntilReportToHQSec - _minTimeUntilReportToHQSec);

if (_debug) then {
    player sideChat "Starting search leader...";
};

// Create detection trigger

_trigger = createTrigger["EmptyDetector", [_worldSizeXY / 2, _worldSizeXY / 2, 0]];
_trigger setTriggerArea[_worldSizeXY, _worldSizeXY, 0, true];
_trigger setTriggerActivation["WEST", "EAST D", false];
_trigger setTriggerStatements["this", "drn_var_SearchLeader_Detected = true;", ""];

_trigger2 = createTrigger["EmptyDetector", [_worldSizeXY / 2, _worldSizeXY / 2, 0]];
_trigger2 setTriggerArea[_worldSizeXY, _worldSizeXY, 0, true];
_trigger2 setTriggerActivation["WEST", "GUER D", false];
_trigger2 setTriggerStatements["this", "drn_var_SearchLeader_Detected = true;", ""];

// Start thread that sets detected by civilian
[] spawn {
    while {true} do {
        if (drn_var_Escape_SearchLeader_civilianReporting) then {
            {
                if (side _x == civilian && _x distance ((call drn_fnc_Escape_GetPlayers) select 0) <300) exitWith {
                    drn_var_SearchLeader_Detected = true;
                    drn_var_Escape_SearchLeader_ReportingCivilian = _x;
                };
            } foreach allUnits;
        };
        
        sleep 5;
    };
};

//waitUntil {drn_var_SearchLeader_Detected};

_detectedUnitsPosition = [0, 0, 0];

while {1 == 1} do {
	if (drn_var_SearchLeader_Detected) then {

		deleteVehicle _trigger;
		deleteVehicle _trigger2;

		// Find the enemy that detected us

		_maxKnowledge = 0;
		_detectedUnit = objNull;
		_unitIsDetected = false;
		_unitThatDetected = "";
		_unitThatDetectedPositionAccuracy = 100;

		{
			scopeName "scopeAllGroups";

			private ["_leader"];
			private ["_nearestEnemy"];
			private ["_positionAccuracy"];

			_leader = leader _x;
			{
				if (alive _leader) exitWith {};
				_leader = _x;
			} foreach units _x;

            if (alive _leader && (side _x == east || side _x == resistance)) then {
				_nearestEnemy = _leader findNearestEnemy position _leader;
				
                if (!isNull _nearestEnemy) then {
                    {
                        _enemyUnit = (_x select 4);
                        if (_enemyUnit == _nearestEnemy && _enemyUnit in (units (call drn_fnc_Escape_GetPlayerGroup))) then {
                            private ["_enemysSupposedPos"];
                            
                            _enemysSupposedPos = (_x select 0);
                            _positionAccuracy = (_x select 5);
                            
                            {
                                _knowledge = (_leader knowsAbout _x);
                                if (alive _x && _knowledge > _maxKnowledge && _positionAccuracy < 15) then {
                                    _maxKnowledge = _knowledge;
                                    _unitIsDetected = true;
                                    _detectedUnit = _x;
                                    _detectedUnitsPosition = _enemysSupposedPos;
                                    _unitThatDetected = _leader;
                                    _reportingUnit = (units group _unitThatDetected) select floor random count (units group _unitThatDetected);
                                    _unitThatDetectedPositionAccuracy = _positionAccuracy;
                                    
                                    //"SmokeShellGreen" createVehicle _enemysSupposedPos;
                                };
                            } foreach (call drn_fnc_Escape_GetPlayers);
                            
                            breakTo "scopeAllGroups";
                        };
                    } foreach (_leader nearTargets (_leader distance _nearestEnemy) + 100);
                };
            };
        } foreach allGroups;
        
        // Check if detected by civilian
        if (drn_var_Escape_SearchLeader_civilianReporting && !_unitIsDetected) then {
			//We need to check if civilian knows about player atm this is cheating for AI
            _unitIsDetected = true;
            _detectedUnit = (call drn_fnc_Escape_GetPlayers) select 0;
            _unitThatDetected = drn_var_Escape_SearchLeader_ReportingCivilian;
            _reportingUnit = _unitThatDetected;
            _unitThatDetectedPositionAccuracy = 0;
            _maxKnowledge = 4;
            _detectedUnitsPosition = getPos _detectedUnit;
        };

		if (_unitIsDetected) then {
			_lostContactTimeSek = diag_tickTime;

			if (_debug) then {
                _debugMsg = (name _unitThatDetected) + "(" + str side _unitThatDetected + ")" + " detected " + (name _detectedUnit) + "(Position accuracy: " + str _unitThatDetectedPositionAccuracy + ").";
				if (_debugMsg != _lastDebugMsg) then {
					player sideChat _debugMsg;
					_lastDebugMsg = _debugMsg;
				};
			};

            if (_state == "KNOW NOTHING") then {
                _state = "REPORTING";
                _reportingStartTime = diag_tickTime;
                if (drn_var_Escape_SearchLeader_civilianReporting) then {
                    _timeUntilReportToHQSec = 1;
                }
                else {
                    _timeUntilReportToHQSec = _minTimeUntilReportToHQSec + random (_maxTimeUntilReportToHQSec - _minTimeUntilReportToHQSec);
                };
            };
		}
		else {
			drn_var_SearchLeader_Detected = false;

			_trigger = createTrigger["EmptyDetector", [_worldSizeXY / 2, _worldSizeXY / 2, 0]];
			_trigger setTriggerArea[_worldSizeXY, _worldSizeXY, 0, true];
			_trigger setTriggerActivation["WEST", "EAST D", false];
			_trigger setTriggerStatements["this", "drn_var_SearchLeader_Detected = true;", ""];
			
			_trigger2 = createTrigger["EmptyDetector", [_worldSizeXY / 2, _worldSizeXY / 2, 0]];
			_trigger2 setTriggerArea[_worldSizeXY, _worldSizeXY, 0, true];
			_trigger2 setTriggerActivation["WEST", "GUER D", false];
			_trigger2 setTriggerStatements["this", "drn_var_SearchLeader_Detected = true;", ""];
			
			if (_debug) then {
				_debugMsg = "Enemy lost contact of player group.";
				if (_debugMsg != _lastDebugMsg) then {
					player sideChat _debugMsg;
					_lastDebugMsg = _debugMsg;
				};
			};
		};
	};

	if (_state == "KNOW NOTHING") then {
	
		// If there has been more than X minutes since lost contact, enlarge the search area to size MEDIUM
		if (diag_tickTime > _lostContactTimeSek + _timeUntilMarkerSizeMediumMin * 60 && _markerState == "SMALL") then {

			if (_searchAreaMarkerCreated) then {

				_markerState = "MEDIUM";
				_marker setMarkerSize [_searchAreaDiamMedium / 2, _searchAreaDiamMedium / 2];

				if (_debug) then {
					_debugMsg = "Search area has expanded to size MEDIUM.";
					if (_debugMsg != _lastDebugMsg) then {
						player sideChat _debugMsg;
						_lastDebugMsg = _debugMsg;
					};
				};
			};
		};

		// If there has been more than X+Y minutes since lost contact, enlarge the search area to size LARGE
		if (diag_tickTime > _lostContactTimeSek + _timeUntilMarkerSizeLargeMin * 60 && _markerState == "MEDIUM") then {
            if (_searchAreaMarkerCreated) then {
                _markerState = "LARGE";
                _marker setMarkerSize [_searchAreaDiamLarge / 2, _searchAreaDiamLarge / 2];
                
                if (_debug) then {
                    _debugMsg = "Search area has expanded to size LARGE.";
                    if (_debugMsg != _lastDebugMsg) then {
                        player sideChat _debugMsg;
                        _lastDebugMsg = _debugMsg;
                    };
                };
            };
        };
    };
    
    if (_state == "REPORTING") then {
        if (alive _reportingUnit) then {
            if (diag_tickTime > _reportingStartTime + _timeUntilReportToHQSec) then {
                
                _state = "KNOW NOTHING";
                
                // Reveal players for enemy units in the vicinity (if its not dark)
                if ((date select 3) > 6 && (date select 3) < 18) then {
                    {
                        if (side _x == east && count units _x > 0) then {
                            if (((units _x) select 0) distance _detectedUnit < (350 * (1 - fog))) then {
                                _x reveal _detectedUnit;
                            };
                        };
                    } foreach allGroups;
                };
				
				
				//Create a spot of last known Position
				if(count(_detectedUnitsPosition nearObjects [_knownPositionHelperObject, _knownPositionMinDistance])==0) then {
					_knownPosition = createVehicle [_knownPositionHelperObject, _detectedUnitsPosition, [], 0, "CAN_COLLIDE"];
					_knownPosition setvariable["A3E_LastUpdated",diag_tickTime,true];
					_knownPosition setvariable["A3E_Accuracy",_unitThatDetectedPositionAccuracy,true];
					_knownPosition setvariable["A3E_FirstSight",diag_tickTime,true];
					[_knownPosition] spawn A3E_fnc_watchKnownPosition;
					[_knownPosition] spawn a3e_fnc_OrderSearch;
				} else {
					_list = _detectedUnitsPosition nearObjects [_knownPositionHelperObject, _knownPositionMinDistance];
					_knownPosition = (_list select 0);					
					(_list select 0) setpos _detectedUnitsPosition;
					(_list select 0) setvariable["A3E_LastUpdated",diag_tickTime,true];
					(_list select 0) setvariable["A3E_Accuracy",_unitThatDetectedPositionAccuracy,true];
					_firstsight = (_list select 0) getvariable ["A3E_FirstSight",diag_tickTime];
					if((diag_tickTime-_firstsight)>=a3e_var_artilleryTimeThreshold && (diag_tickTime > (a3e_var_artillery_cooldown+_lastArtilleryStrike))) then {
						if(random 100 < a3e_var_artillery_chance) then {
							if (a3e_debug_artillery) then {
								player sidechat "HQ is trying to call an artillery strike";
							};
							_strikesuccess = [getpos (_list select 0)] call a3e_fnc_FireArtillery;
							if(_strikesuccess) then {
								_lastArtilleryStrike = diag_tickTime;
								_strikesuccess = false;
							};
						} else {
							//Create a smaller cooldown for the next try
							_lastArtilleryStrike = diag_tickTime - a3e_var_artillery_cooldown + a3e_var_artillery_chance_cooldown;
						};
					};
				};
				//Alert nearby Patrols
				
                
				// If search area marker is not yet created, create it.
				if (!_searchAreaMarkerCreated) then {
					_marker = createMarkerLocal [_searchAreaMarkerName, _detectedUnitsPosition];
					_marker setMarkerShapeLocal "RECTANGLE";
					_marker setMarkerSizeLocal [_searchAreaDiamSmall, _searchAreaDiamSmall];
					_searchAreaMarkerCreated = true;

					if (!_debug) then {
						_marker setMarkerAlphaLocal 0;
					};
				};
				_marker setMarkerPosLocal _detectedUnitsPosition;
				_markerState = "SMALL";
				_marker setMarkerSize [_searchAreaDiamSmall / 2, _searchAreaDiamSmall / 2];

				if (_debug) then {
					_debugMsg = name _reportingUnit + " has reported in to HQ.";
					if (_debugMsg != _lastDebugMsg) then {
						player sideChat _debugMsg;
						_lastDebugMsg = _debugMsg;
					};
				};

				_timeUntilReportToHQSec = _minTimeUntilReportToHQSec + random (_maxTimeUntilReportToHQSec - _minTimeUntilReportToHQSec);
			};
		}
		else { // if reporting unit is not still alive
			_state = "KNOW NOTHING";

			if (_debug) then {
				_debugMsg = name _reportingUnit + " is dead and cannot report in to HQ.";
				if (_debugMsg != _lastDebugMsg) then {
					player sideChat _debugMsg;
					_lastDebugMsg = _debugMsg;
				};
			};

			_timeUntilReportToHQSec = _minTimeUntilReportToHQSec + random (_maxTimeUntilReportToHQSec - _minTimeUntilReportToHQSec);
		};
	};

	sleep 1;
};
