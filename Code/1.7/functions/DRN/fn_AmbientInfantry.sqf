/* AmbientInfantry.sqf
 * Summary: Makes a group of infantry units to search an area and engage detected enemies. The infantry group will move at "normal" speed to a search area (marker)
 * and then patrol that area until enemies are detected. If the search area marker moves to another place, they will again move at "normal" speed to the new area.
 * Arguments:
 *   _referenceGroup: Ambient infantry groups will be spawned around the units in this group (preferrably the player's group).
 *   _side: Side of spawned units.
 *   _infantryClasses: Array of classes to randomly spawn, e.g. ["USMC_Soldier_AA", "USMC_Soldier_MG"] will spawn 50% AA units and 50% MG units. It's also possible so send in name of a faction, e.g. "USMC" to spawn random infantry units from that faction.
 *   [_groupsCount]: How many active groups inside outer radius.
 *   [_minSpawnDistance]: Minimum spawn distance from nearest reference units in meters.
 *   [_maxSpawnDistance]: Maximum spawn distance from nearest reference unit in meters.
 *   [_minUnitsInGroup]: Minimum number of units in a group.
 *   [_maxUnitsInGroup]: Maximum number of units in a group.
 *   [_minSkill]: Skill of spawned unit is selected randomly between values _minSkill and _maxSkill.
 *   [_maxSkill]: Skill of spawned unit is selected randomly between values _minSkill and _maxSkill.
 *   [_garbageCollectDistance]: Dead units at this distance from _referenceGroup will be deleted.
 *   [_fnc_OnSpawnUnit]: Code run once for every spawned unit (after the whole group is created). The unit can be accessed through "_this". Default value is {}.
 *   [_fnc_OnSpawnGroup]: Code run once for every spawned group (after the whole group is created). The group can be accessed through "_this". Default value is {};
 *   [A3E_Debug]: true if debugmessages and areas will be shown for player. Default false.
 * Dependencies: CommonLib v1.01
 */

if (!isServer) exitWith {};

private ["_referenceGroup", "_side", "_groupsCount", "_minSpawnDistance", "_maxSpawnDistance", "_infantryClasses", "_minSkill", "_maxSkill", "_garbageCollectDistance"];
private ["_activeGroups", "_activeUnits", "_spawnPos", "_group", "_possibleInfantryTypes", "_infantryType", "_minDistance", "_skill", "_vehicleVarName", "_factionsArray"];
private ["_minUnitsInGroup", "_maxUnitsInGroup", "_i", "_atScriptStartUp", "_currentEntityNo", "_DebugMsg", "_farAwayUnits", "_farAwayUnitsCount", "_unitsToDeleteCount", "_groupsToDeleteCount"];
private ["_DebugMarkers", "_DebugMarkerNo", "_DebugMarkerName", "_isFaction", "_unitsToDelete", "_groupsToDelete", "_tempGroups", "_tempGroupsCount"];
private ["_fnc_OnSpawnUnit", "_fnc_OnSpawnGroup"];

_referenceGroup = _this select 0;
_side = _this select 1;
_infantryClasses = _this select 2;
if (count _this > 3) then {_groupsCount = _this select 3;} else {_groupsCount = 10;};
if (count _this > 4) then {_minSpawnDistance = _this select 4;} else {_minSpawnDistance = 1500;};
if (count _this > 5) then {_maxSpawnDistance = _this select 5;} else {_maxSpawnDistance = 2000;};
if (count _this > 6) then {_minUnitsInGroup = _this select 6;} else {_minUnitsInGroup = 4;};
if (count _this > 7) then {_maxUnitsInGroup = _this select 7;} else {_maxUnitsInGroup = 6;};
if (count _this > 8) then {_minSkill = _this select 8;} else {_minSkill = 0.4;};
if (count _this > 9) then {_maxSkill = _this select 9;} else {_maxSkill = 0.6;};
if (count _this > 10) then {_garbageCollectDistance = _this select 10;} else {_garbageCollectDistance = 750;};
if (count _this > 11) then {_fnc_OnSpawnUnit = _this select 11;} else {_fnc_OnSpawnUnit = {};};
if (count _this > 12) then {_fnc_OnSpawnGroup = _this select 12;} else {_fnc_OnSpawnGroup = {};};


//WHY!?!?!?!?!
_factionsArray = [A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Ind , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor , A3E_VAR_Side_Opfor ,A3E_VAR_Side_Opfor];


if (isNil "a3e_var_commonLibInitialized") then {
    [] spawn {
        while {true} do { player sideChat "Script AmbientInfantry.sqf needs CommonLib version 1.02"; sleep 5; };
    };
};

if (A3E_Debug) then {
    ["Starting script Ambient Infantry..."] call drn_fnc_CL_ShowDebugTextAllClients;
};

_activeGroups = [];
_activeUnits = [];
A3E_DebugMarkers = [];
A3E_DebugMarkerNo = 0;

_isFaction = false;
if (str _infantryClasses == """USMC""") then {
    _possibleInfantryTypes = a3e_arr_AmbientInfantry_Inf_USMC;
    _isFaction = true;
};
if (str _infantryClasses == """CDF""") then {
    _possibleInfantryTypes = a3e_arr_AmbientInfantry_Inf_CDF;
    _isFaction = true;
};
if (str _infantryClasses == """RU""") then {
    _possibleInfantryTypes = a3e_arr_AmbientInfantry_Inf_RU;
    _isFaction = true;
};
if (str _infantryClasses == """INS""") then {
    _possibleInfantryTypes = a3e_arr_AmbientInfantry_Inf_INS;
    _isFaction = true;
};
if (str _infantryClasses == """GUE""") then {
    _possibleInfantryTypes = a3e_arr_AmbientInfantry_Inf_GUE;
    _isFaction = true;
};

if (!_isFaction) then {
    _possibleInfantryTypes =+ _infantryClasses;
};

_atScriptStartUp = true;

while {true} do {
	scopeName "mainScope";

	// While there are too few active groups, add a group

    while {count _activeGroups < _groupsCount} do {
        private ["_spawnX", "_spawnY","_unitsInGroup", "_faction"];

        if (_atScriptStartUp) then {
            _minDistance = 350;
            if (_minDistance > _maxSpawnDistance) then {
                _minDistance = _minSpawnDistance / 5;
            };
        }
        else {
            _minDistance = _minSpawnDistance;
        };
        
        // Get a random spawn position
        _spawnPos = [units _referenceGroup, _minDistance, _maxSpawnDistance] call a3e_fnc_RandomSpawnPos;
        _skill = _minSkill + random (_maxSkill - _minSkill);
        
        _faction = _factionsArray select (floor (random (count _factionsArray)));
        if(_faction == A3E_VAR_Side_Opfor) then {
            _possibleInfantryTypes = a3e_arr_Escape_InfantryTypes;
        };
        if (_faction == A3E_VAR_Side_Ind) then {
            _possibleInfantryTypes = a3e_arr_Escape_InfantryTypes_Ind;
        };

        // Create group
        _unitsInGroup = _minUnitsInGroup + floor (random (_maxUnitsInGroup - _minUnitsInGroup));
        _group = createGroup _faction;
        
        for [{_i = 0}, {_i < _unitsInGroup}, {_i = _i + 1}] do {
            _infantryType = _possibleInfantryTypes select floor (random count _possibleInfantryTypes);
            //_infantryType createUnit [_spawnPos, _group,"", _skill, "PRIVATE"];
			_group createUnit [_infantryType, _spawnPos, [], 0, "FORM"];
        };

        {
            //setskills
            _x setUnitRank "PRIVATE";
//			[_x, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;

            // Run custom code for units and group
            _x setVariable ["drn_scriptHandle", _x spawn _fnc_OnSpawnUnit]; // Squint complaining, but is ok.
		} foreach units _group;
        
        _group setVariable ["drn_scriptHandle", _group spawn _fnc_OnSpawnGroup]; // Squint complaining, but is ok.
        
        // Name group
        sleep random 0.05;
        if (isNil "drn_AmbientInfantry_CurrentEntityNo") then {
            drn_AmbientInfantry_CurrentEntityNo = 0
        };

        _currentEntityNo = drn_AmbientInfantry_CurrentEntityNo;
        drn_AmbientInfantry_CurrentEntityNo = drn_AmbientInfantry_CurrentEntityNo + 1;
        
        _vehicleVarName = "drn_AmbientInfantry_Entity_" + str _currentEntityNo;
        ((units _group) select 0) setVehicleVarName _vehicleVarName;
        ((units _group) select 0) call compile format ["%1=_this;", _vehicleVarName];
        
        // Start group
        //[((units _group) select 0), A3E_Debug] spawn drn_fnc_MoveInfantryGroup;
		
		_script = [_group, nil] spawn A3E_fnc_Patrol;
		_group setvariable["A3E_GroupPatrolScript",_script];
		
        _activeGroups set [count _activeGroups, _group];
        _activeUnits = _activeUnits + units _group;

        if (A3E_Debug) then {
            ["Infantry group created! Total groups = " + str count _activeGroups] call drn_fnc_CL_ShowDebugTextAllClients;
        };
	};
    
    _atScriptStartUp = false;

	
    _farAwayUnits = [];
    _farAwayUnitsCount = 0;
    
    // If any group is too far away, delete it
    {
        private ["_unit"];
        private ["_unitIsFarAway"];
        _unit = _x;

        _unitIsFarAway = true;
        {
            private ["_hasGroup", "_group", "_groupUnit", "_referenceUnit"];
            _referenceUnit = vehicle _x;
            
            // A unit is far away if its alive and beyond max spawn distance, or if it's dead and beyond garbage collect distance.
            if ((((alive _unit) && (_referenceUnit distance _unit < _maxSpawnDistance)) || ((!alive _unit) && (_referenceUnit distance _unit < _garbageCollectDistance)))) exitWith {
                _unitIsFarAway = false;
            };
        } foreach units _referenceGroup;
        
        if (_unitIsFarAway) then {
            _farAwayUnits set [_farAwayUnitsCount, _unit];
            _farAwayUnitsCount = _farAwayUnitsCount + 1;
        };

    } foreach _activeUnits;
    
    _unitsToDelete = [];
    _groupsToDelete = [];
    _unitsToDeleteCount = 0;
    _groupsToDeleteCount = 0;
    {
        private ["_unit"];
        private ["_hasGroup", "_wholeGroupFarAway"];
        _unit = _x;
        
        _group = group _unit;
        _hasGroup = false;
        if (str _group != "<NULL-group>") then {
            _hasGroup = true;
        };
        
        if (_hasGroup) then {
            // Delete all units in the group, if all units are far away
            _wholeGroupFarAway = true;
            {
                if  (!(_x in _farAwayUnits)) then {
                    _wholeGroupFarAway = false;
                };
            } foreach units group _unit;
            
            if (_wholeGroupFarAway) then {
                _unitsToDelete set [_unitsToDeleteCount, _unit];
                _unitsToDeleteCount = _unitsToDeleteCount + 1;
                
                if (!(_group in _groupsToDelete)) then {
                    _groupsToDelete set [_groupsToDeleteCount, _group];
                    _groupsToDeleteCount = _groupsToDeleteCount + 1;
                };
            };
        }
        else {
            _unitsToDelete set [count _unitsToDelete, _unit];
            _unitsToDeleteCount = _unitsToDeleteCount + 1;
        };
    } foreach _farAwayUnits;
    
    // Delete units that are marked for delete
    _activeUnits = + _activeUnits - _unitsToDelete;
    _activeGroups = + _activeGroups - _groupsToDelete;
    
    {
        private ["_scriptHandle"];
        
        _scriptHandle = _x getVariable ["drn_scriptHandle",nil];
		if(!isNil("_scriptHandle")) then {
			if (!(scriptDone _scriptHandle)) then {
				terminate _scriptHandle;
			};
		};
        
        deleteVehicle _x;
    } foreach _unitsToDelete;
    
    {
        private ["_scriptHandle"];
        
        _scriptHandle = _x getVariable ["drn_scriptHandle",nil];
        if(!isNil("_scriptHandle")) then {
			if (!(scriptDone _scriptHandle)) then {
				terminate _scriptHandle;
			};
		};
        _script = _group getvariable ["A3E_GroupPatrolScript",nil];
		if(!isNil("_script")) then {
			if (!(scriptDone _script)) then {
				terminate _script;
			};
		};
        deleteGroup _x;
    } foreach _groupsToDelete;
    
    A3E_DebugMsg = "";
    if (count _unitsToDelete > 0) then {
        A3E_DebugMsg = str (count _unitsToDelete) + " units deleted by Ambient Infantry. ";
    };
    
    if (count _groupsToDelete > 0) then {
        A3E_DebugMsg = A3E_DebugMsg + str (count _groupsToDelete) + " groups deleted by Ambient Infantry. ";
    };
    
    if (A3E_Debug && A3E_DebugMsg != "") then {
        [A3E_DebugMsg] call drn_fnc_CL_ShowDebugTextAllClients;
    };

    _tempGroupsCount = 0;
    _tempGroups = [];
    
    // Remove dead groups from active groups list
    {
        private ["_activeGroup"];
        _activeGroup = _x;

        if (({alive _x} count units _activeGroup) > 0) then {
            _tempGroups set [_tempGroupsCount, _activeGroup];
            _tempGroupsCount = _tempGroupsCount + 1;
        }
        else {
            if (A3E_Debug) then {
                ["Ambient Infantry deleting group with all dead units."] call drn_fnc_CL_ShowDebugTextAllClients;
            };
        };
        
    } foreach _activeGroups;
    
    _activeGroups = _tempGroups;
    
    if (A3E_Debug) then {
        sleep 1;
    }
    else {
        sleep 60;
    };
};


