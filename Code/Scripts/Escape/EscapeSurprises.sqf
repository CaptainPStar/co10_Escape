if (!isServer) exitWith {};

private ["_minEnemySkill", "_maxEnemySkill", "_debug"];
private ["_surprises", "_surprise", "_executedSurprises", "_surpriseID", "_surpriseTimeSec", "_condition", "_isExecuted", "_surpriseArgs", "_timeInSek", "_enemyFrequency", "_spawnSegment"];

_minEnemySkill = _this select 0;
_maxEnemySkill = _this select 1;
_enemyFrequency = _this select 2;
if (count _this > 3) then { _debug = _this select 3; } else { _debug = false; };
// Create all surprises

waitUntil {([drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists)};

_surprises = [];

// A surprise have members [ID, MissionTimeSec, Condition, IsExecuted, Surprice Arguments].

// Drop Chopper

_surpriseArgs = [(_enemyFrequency + 2) + floor random (_enemyFrequency * 2)]; // [NoOfDropUnits]
_timeInSek = 5 * 60 + random (60 * 60);
//_timeInSek = 10;
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_condition = {true};
_surprise = ["DROPCHOPPER", _timeInSek, _condition, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);


_surpriseArgs = [(_enemyFrequency + 2) + floor random (_enemyFrequency * 2)]; // [NoOfDropUnits]
_timeInSek = 5 * 60 + random (60 * 60);
//_timeInSek = 15;
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_condition = {true};
_surprise = ["DROPCHOPPER_I", _timeInSek, _condition, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);

// Russian Search Chopper

_surpriseArgs = [_minEnemySkill, _maxEnemySkill];
_timeInSek = 45 * 60 + random (30 * 60);
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_surprise = ["RUSSIANSEARCHCHOPPER", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);

//Search Drone

_surpriseArgs = [_minEnemySkill, _maxEnemySkill];
_timeInSek = 5 * 60 + random (30 * 60);
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_surprise = ["SEARCHDRONE", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);

//Leaflet Drone

_surpriseArgs = [_minEnemySkill, _maxEnemySkill];
_timeInSek = 5 * 60 + random (30 * 60);
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_surprise = ["LEAFLETDRONE", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);


// Motorized Search Group

_surpriseArgs = [_minEnemySkill, _maxEnemySkill];
_timeInSek = 20 * 60 + random (60 * 60);
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_surprise = ["MOTORIZEDSEARCHGROUP", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);

// Reinforcement Truck

_surpriseArgs = [_minEnemySkill, _maxEnemySkill];
_timeInSek = 10 * 60 + random (30 * 60);
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_surprise = ["REINFORCEMENTTRUCK", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);

// Enemies in a civilian car

_surpriseArgs = [_minEnemySkill, _maxEnemySkill];
_timeInSek = 60 + random (60);
_timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
_surprise = ["CIVILIANENEMY", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
_surprises set [count _surprises, _surprise];
diag_log ("ESCAPE SURPRISE: " + str _surprise);


// Execute surprises

_executedSurprises = 0;

while {true} do {
    {
        _surprise = _x;
        _surpriseID = _x select 0;
        _surpriseTimeSec = _x select 1;
        _condition = _x select 2;
        _isExecuted = _x select 3;
        _surpriseArgs = _x select 4;
        
        if (!_isExecuted && time > _surpriseTimeSec) then {
            
            if (call _condition) then {
                _surprise set [3, true];
                _executedSurprises = _executedSurprises + 1;
                
                if (_debug) then {
                    ["Starting surprise: " + _surpriseID] call drn_fnc_CL_ShowDebugTextAllClients;
                };
                
                if (_surpriseID == "MOTORIZEDSEARCHGROUP") then {
                    private ["_enemyMinSkill", "_enemyMaxSkill"];
                    
                    _enemyMinSkill = _surpriseArgs select 0;
                    _enemyMaxSkill = _surpriseArgs select 1;
                    
                    _spawnSegment = [] call A3E_fnc_FindSpawnRoad;
                    if(!isNull _spawnSegment) then {
                        [getPos _spawnSegment, drn_searchAreaMarkerName, _enemyFrequency, _enemyMinSkill, _enemyMaxSkill, A3E_Debug] execVM "Scripts\Escape\CreateMotorizedSearchGroup.sqf";
                    } else {
                        diag_log "ESCAPE SURPRISE: Unable to find spawn road for Motorized Searchgroup";
                    };
                    _surpriseArgs = [_minEnemySkill, _maxEnemySkill];
                    _timeInSek = 20 * 60 + random (60 * 60);
                    _timeInSek = time + _timeInSek * (4 - _enemyFrequency);
                    _surprise = ["MOTORIZEDSEARCHGROUP", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
                
                if (_surpriseID == "DROPCHOPPER") then {
                    private ["_noOfDropUnits", "_noOfDropUnits"];
                    private ["_dropUnitTypeArray", "_dropGroup", "_soldierType", "_soldier", "_dropUnits", "_i", "_dropPosition"];
                    private ["_onGroupDropped","_helitype","_crewtype"];
                    
                    _noOfDropUnits = _surpriseArgs select 0;
                    
                    _dropGroup = createGroup A3E_VAR_Side_Opfor;
                    _dropUnits = [];
                    
                    for [{_i = 0}, {_i < _noOfDropUnits}, {_i = _i + 1}] do {
                        _soldierType = A3E_arr_recon_InfantryTypes select floor (random count A3E_arr_recon_InfantryTypes);
                        _soldier = _dropGroup createUnit [_soldierType, [0,0,30], [], 0, "FORM"];
                        //_soldier setSkill (_minEnemySkill + random (_maxEnemySkill - _minEnemySkill));
						//[_soldier, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
                        _soldier setRank "CAPTAIN";
                        _soldier call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
                        _dropUnits pushBack _soldier;
                    };
                    
                    _dropPosition = [drn_searchAreaMarkerName] call drn_fnc_CL_GetRandomMarkerPos;
                    
                    _onGroupDropped = {
                        private ["_group", "_dropPos"];
                        
                        _group = _this select 0;
                        _dropPos = _this select 1;
                        
                        //[_group, drn_searchAreaMarkerName, _dropPos, a3e_var_Escape_DebugSearchGroup] execVM "Scripts\DRN\SearchGroup\SearchGroup.sqf";
                        [_group, drn_searchAreaMarkerName, _dropPos, A3E_Debug] spawn DRN_fnc_SearchGroup;
                    };
                    _helitype = a3e_arr_O_transport_heli select floor(random(count(a3e_arr_O_transport_heli)));
					_crewtype = a3e_arr_O_pilots select floor(random(count(a3e_arr_O_pilots)));
                    [getMarkerPos "drn_dropChopperStartPosMarker", A3E_VAR_Side_Opfor, _helitype, _crewtype, _dropUnits, _dropPosition, _minEnemySkill, _maxEnemySkill, _onGroupDropped, A3E_Debug] execVM "Scripts\Escape\CreateDropChopper.sqf";
                    
                    // Create next drop chopper
                    _surpriseArgs = [(_enemyFrequency + 2) + floor random (_enemyFrequency * 2)]; // [NoOfDropUnits]
                    _timeInSek = random (45 * 60);
					//_timeInSek = 15;
                    _timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
                    _condition = {true};
                    _surprise = ["DROPCHOPPER", _timeInSek, _condition, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
                
				if (_surpriseID == "DROPCHOPPER_I") then {
                    private ["_noOfDropUnits", "_noOfDropUnits"];
                    private ["_dropUnitTypeArray", "_dropGroup", "_soldierType", "_soldier", "_dropUnits", "_i", "_dropPosition"];
                    private ["_onGroupDropped","_helitype","_crewtype"];
                    
                    _noOfDropUnits = _surpriseArgs select 0;
                    
                    _dropGroup = createGroup A3E_VAR_Side_Ind;
                    _dropUnits = [];
                    
                    for [{_i = 0}, {_i < _noOfDropUnits}, {_i = _i + 1}] do {
                        _soldierType = a3e_arr_recon_I_InfantryTypes select floor (random count a3e_arr_recon_I_InfantryTypes);
                        _soldier = _dropGroup createUnit [_soldierType, [0,0,30], [], 0, "FORM"];
                        //_soldier setSkill (_minEnemySkill + random (_maxEnemySkill - _minEnemySkill));
						//[_soldier, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
                        _soldier setRank "CAPTAIN";
                        _soldier call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
                        _dropUnits pushBack _soldier;
                    };
                    
                    _dropPosition = [drn_searchAreaMarkerName] call drn_fnc_CL_GetRandomMarkerPos;
                    
                    _onGroupDropped = {
                        private ["_group", "_dropPos"];
                        
                        _group = _this select 0;
                        _dropPos = _this select 1;
                        
                        //[_group, drn_searchAreaMarkerName, _dropPos, a3e_var_Escape_DebugSearchGroup] execVM "Scripts\DRN\SearchGroup\SearchGroup.sqf";
                        [_group, drn_searchAreaMarkerName, _dropPos, A3E_Debug] spawn DRN_fnc_SearchGroup;
                    };
                    _helitype = a3e_arr_I_transport_heli select floor(random(count(a3e_arr_I_transport_heli)));
					_crewtype = a3e_arr_I_pilots select floor(random(count(a3e_arr_I_pilots)));
                    [getMarkerPos "drn_dropChopperStartPosMarker", A3E_VAR_Side_Ind, _helitype, _crewtype, _dropUnits, _dropPosition, _minEnemySkill, _maxEnemySkill, _onGroupDropped, A3E_Debug] execVM "Scripts\Escape\CreateDropChopper.sqf";
                    
                    // Create next drop chopper
                    _surpriseArgs = [(_enemyFrequency + 2) + floor random (_enemyFrequency * 2)]; // [NoOfDropUnits]
                    _timeInSek = random (45 * 60);
					//_timeInSek =  15;
                    _timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
                    _condition = {true};
                    _surprise = ["DROPCHOPPER_I", _timeInSek, _condition, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
				
                if (_surpriseID == "RUSSIANSEARCHCHOPPER") then {
                    private ["_chopper", "_result", "_group","_helitype","_crewtype"];
                    _helitype = a3e_arr_O_attack_heli select floor(random(count(a3e_arr_O_attack_heli)));
					_crewtype = a3e_arr_O_pilots select floor(random(count(a3e_arr_O_pilots)));
                    //_chopper = "O_Heli_Light_02_F" createVehicle getMarkerPos "drn_russianSearchChopperStartPosMarker";
                    _chopper = createVehicle [_helitype, (getMarkerPos "drn_russianSearchChopperStartPosMarker"), [], 0, "FLY"];
                    _chopper lock false;
					[_chopper] call a3e_fnc_onVehicleSpawn;
                    _chopper setVehicleVarName "drn_russianSearchChopper";
                    _chopper call compile format ["%1=_this;", "drn_russianSearchChopper"];
                    
                    _group = createGroup A3E_VAR_Side_Opfor;

                    //"O_Pilot_F" createUnit [[0, 0, 30], _group, "", (_minEnemySkill + random (_maxEnemySkill - _minEnemySkill)), "LIEUTNANT"];
                    //"O_Pilot_F" createUnit [[0, 0, 30], _group, "", (_minEnemySkill + random (_maxEnemySkill - _minEnemySkill)), "LIEUTNANT"];
                    _group createUnit [_crewtype, [0, 0, 30], [], 0, "FORM"];
                    _group createUnit [_crewtype, [0, 0, 30], [], 0, "FORM"];

                    ((units _group) select 0) assignAsDriver _chopper;
                    ((units _group) select 0) moveInDriver _chopper;
                    ((units _group) select 1) assignAsGunner _chopper;
                    ((units _group) select 1) moveInGunner _chopper;
                    
                    {
                        _x setUnitRank "LIEUTENANT";
                        _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
                    } foreach units _group;
                    
                    //[_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), a3e_var_Escape_debugSearchChopper] execVM "Scripts\DRN\SearchChopper\SearchChopper.sqf";
                    [_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), A3E_Debug] spawn DRN_fnc_SearchChopper;
                  
                    // Create new russian search chopper
                    _surpriseArgs = [_minEnemySkill, _maxEnemySkill];
                    _timeInSek = 30 * 60 + random (45 * 60);
                    _timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
                    _surprise = ["RUSSIANSEARCHCHOPPER", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
				
				
				if (_surpriseID == "SEARCHDRONE") then {
                    private ["_chopper", "_result"];

					_chopper = createVehicle [selectRandom a3e_arr_searchdrone, getMarkerPos "drn_russianSearchChopperStartPosMarker", [], random 360, "FLY"];
					createVehicleCrew _chopper;
					
					_chopper lock false;
					_chopper setVehicleVarName "a3e_searchdrone";
					_chopper call compile format ["%1=_this;", "a3e_searchdrone"];

                    
                    //[_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), a3e_var_Escape_debugSearchChopper] execVM "Scripts\DRN\SearchChopper\SearchChopper.sqf";
                    [_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), A3E_Debug] spawn A3E_fnc_SearchDrone;
                  
                    // Create new russian search chopper
                    _surpriseArgs = [_minEnemySkill, _maxEnemySkill];
                    _timeInSek = 30 * 60 + random (45 * 60);
                    _timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
                    _surprise = ["SEARCHDRONE", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
				
				if (_surpriseID == "LEAFLETDRONE") then {
                    private ["_chopper", "_result", "_group","_helitype","_arr"];
					
					_arr = [(getMarkerPos "drn_russianSearchChopperStartPosMarker"), 0, "I_UAV_06_F", A3E_VAR_Side_Ind] call bis_fnc_spawnvehicle;
					_chopper = _arr select 0;
					_group = _arr select 2;
					_chopper lock false;
					_chopper setVehicleVarName "a3e_leafletdrone";
					_chopper call compile format ["%1=_this;", "a3e_leafletdrone"];
					_chopper addmagazine "1Rnd_Leaflets_Guer_F";
					_chopper addweapon "Bomb_Leaflets";

                    
                    //[_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), a3e_var_Escape_debugSearchChopper] execVM "Scripts\DRN\SearchChopper\SearchChopper.sqf";
                    [_chopper, drn_searchAreaMarkerName, (5 + random 15), (5 + random 15), A3E_Debug] spawn A3E_fnc_LeafletDrone;
                  
                    // Create new russian search chopper
                    _surpriseArgs = [_minEnemySkill, _maxEnemySkill];
                    _timeInSek = 30 * 60 + random (45 * 60);
                    _timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
                    _surprise = ["LEAFLETDRONE", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
                
                if (_surpriseID == "REINFORCEMENTTRUCK") then {
                    private ["_enemyMinSkill", "_enemyMaxSkill", "_playerPos"];
                    
                    _enemyMinSkill = _surpriseArgs select 0;
                    _enemyMaxSkill = _surpriseArgs select 1;

                    _spawnSegment = [] call A3E_fnc_FindSpawnRoad;

                    if(!isNull _spawnSegment) then {
                        [getPos _spawnSegment, _enemyMinSkill, _enemyMaxSkill,_enemyFrequency,  A3E_Debug] execVM "Scripts\Escape\CreateReinforcementTruck.sqf";
                    } else {
                        diag_log ("ESCAPE SURPRISE: Unable to find road segment for Reinforcement truck");
                    };
                    _surpriseArgs = [_minEnemySkill, _maxEnemySkill];
                    _timeInSek = random (45 * 60);
                    _timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
                    _surprise = ["REINFORCEMENTTRUCK", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
                
                if (_surpriseID == "CIVILIANENEMY") then {
                    
                    _spawnSegment = [] call A3E_fnc_FindSpawnRoad;
                    if(!isNull _spawnSegment) then {
                         [call A3E_fnc_GetPlayerGroup, getPos _spawnSegment, A3E_VAR_Side_Opfor, a3e_arr_Escape_EnemyCivilianCarTypes, A3E_arr_recon_InfantryTypes, _enemyFrequency] execVM "Scripts\Escape\CreateCivilEnemy.sqf";
                    } else {
                        diag_log ("ESCAPE SURPRISE: Unable to find road segment for Civil Enemy");
                    };

                    
                    _surpriseArgs = [_minEnemySkill, _maxEnemySkill];
                    _timeInSek = 15 * 60 + random (45 * 60);
                    _timeInSek = time + (_timeInSek * (0.5 + (4 - _enemyFrequency) / 4));
                    _surprise = ["CIVILIANENEMY", _timeInSek, {[drn_searchAreaMarkerName] call drn_fnc_CL_MarkerExists}, false, _surpriseArgs];
                    _surprises set [count _surprises, _surprise];
                    diag_log ("ESCAPE SURPRISE: " + str _surprise);
                };
            };
        };
    } foreach _surprises;
    
    sleep 60;
};


