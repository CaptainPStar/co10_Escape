//waituntil{!isNil("BIS_fnc_init")};
if(!isServer) exitwith {};
["Server started."] spawn a3e_fnc_debugmsg;
if(isNil("a3e_var_commonLibInitialized")) then {
	call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
};

call compile preprocessFileLineNumbers "config.sqf";
call compile preprocessFileLineNumbers ("Island\WorldConfig.sqf");

//Parse the parameters
call a3e_fnc_parameterInit;

call compile preprocessFileLineNumbers "Scripts\Escape\Functions.sqf";
call compile preprocessFileLineNumbers "Scripts\Escape\AIskills.sqf";

if(!isNil("Param_Debug")) then {
	if((Param_Debug)==0) then {
		A3E_Debug = false;
	} else {
		A3E_Debug = true;
	};
} else {
	A3E_Debug = true;
	["Warning! Debug was set to true because of missing param!."] spawn a3e_fnc_debugmsg;
};
publicVariable "A3E_Debug";

//Load Statistics
[] spawn A3E_fnc_LoadStatistics;
// Add crashsite here
//##############


private ["_villagePatrolSpawnArea","_EnemyCount","_enemyMinSkill", "_enemyMaxSkill", "_searchChopperSearchTimeMin", "_searchChopperRefuelTimeMin", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency", "_fenceRotateDir", "_scriptHandle"];

_enemyFrequency = (Param_EnemyFrequency);
_enemySpawnDistance = (Param_EnemySpawnDistance);

[_enemyFrequency] call compile preprocessFileLineNumbers "Units\UnitClasses.sqf";


// Developer Variables



createCenter A3E_VAR_Side_Opfor;
createCenter A3E_VAR_Side_Ind;

if(isNil("Param_War_Torn")) then {
	Param_War_Torn = 0;
};
A3E_VAR_Side_Blufor setFriend [A3E_VAR_Side_Ind, 0];
A3E_VAR_Side_Ind setFriend [A3E_VAR_Side_Blufor, 0];

A3E_VAR_Side_Blufor setFriend [A3E_VAR_Side_Opfor, 0];
A3E_VAR_Side_Opfor setFriend [A3E_VAR_Side_Blufor, 0];
	
if(Param_War_Torn == 0) then {
	A3E_VAR_Side_Opfor Setfriend [A3E_VAR_Side_Ind, 1];
	A3E_VAR_Side_Ind setFriend [A3E_VAR_Side_Opfor, 1];
} else {
	A3E_VAR_Side_Opfor Setfriend [A3E_VAR_Side_Ind, 0];
	A3E_VAR_Side_Ind setFriend [A3E_VAR_Side_Opfor, 0];
};



[] spawn A3E_fnc_weather;

private ["_hour","_date"];
_hour = Param_TimeOfDay;
switch (Param_TimeOfDay) do {
    case 24: { 
		_hour = round(random(24));
	};
    case 25: {
		_hour = 6+round(random(12));  //Between 0600 and 1800
	};
	case 26: { 
		_hour = 20 + round(random(8)); //Between 2000 and 0400
		_hour = _hour % 24;
	};
    default { _hour = Param_TimeOfDay };
};
_date = date;
_date set [3,_hour];
_date set [4,0];

a3e_var_Escape_hoursSkipped = _hour - (date select 3);
publicVariable "a3e_var_Escape_hoursSkipped";
		
[_date] call bis_fnc_setDate;


setTimeMultiplier Param_TimeMultiplier;
call compile preprocessFileLineNumbers ("Island\CommunicationCenterMarkers.sqf");


// Game Control Variables, do not edit!

a3e_var_Escape_AllPlayersDead = false;
a3e_var_Escape_MissionComplete = false;
publicVariable "a3e_var_Escape_AllPlayersDead";
publicVariable "a3e_var_Escape_MissionComplete";

a3e_var_GrpNumber = 0;

if(isNil("Param_EnemySkill")) then {
	Param_EnemySkill = 1;
};

_enemyMinSkill = 0.40;
_enemyMaxSkill = 0.60;

//Kudos to Semiconductor

switch (Param_EnemySkill) do { 
    // Convert value from params.hpp into acceptable range 
    case 0: { _enemyMinSkill = 0.10; _enemyMaxSkill = 0.30; }; 
    case 1: { _enemyMinSkill = 0.30; _enemyMaxSkill = 0.50; }; 
    case 2: { _enemyMinSkill = 0.40; _enemyMaxSkill = 0.60; }; 
    case 3: { _enemyMinSkill = 0.60; _enemyMaxSkill = 0.80; }; 
    case 4: { _enemyMinSkill = 0.80; _enemyMaxSkill = 0.95; }; 
    default { _enemyMinSkill = 0.40; _enemyMaxSkill = 0.60; }; 
}; 

a3e_var_Escape_enemyMinSkill = _enemyMinSkill; 
a3e_var_Escape_enemyMaxSkill = _enemyMaxSkill; 
a3e_var_Escape_enemyMinSkill = _enemyMinSkill;
a3e_var_Escape_enemyMaxSkill = _enemyMaxSkill;

_searchChopperSearchTimeMin = (5 + random 10);
_searchChopperRefuelTimeMin = (5 + random 10);


_villagePatrolSpawnArea = (Param_VillageSpawnCount);

drn_searchAreaMarkerName = "drn_searchAreaMarker";

// Choose a start position

A3E_StartPos = [] call a3e_fnc_findFlatArea;
publicVariable "A3E_StartPos";


A3E_Var_ClearedPositions = [];
A3E_Var_ClearedPositions pushBack A3E_StartPos;
A3E_Var_ClearedPositions pushBack (getMarkerPos "drn_insurgentAirfieldMarker");

if(isNil("A3E_ClearedPositionDistance")) then {
	A3E_ClearedPositionDistance = 500;
};

// Build start position
_fenceRotateDir = random 360;

private _backPack = [A3E_StartPos, _fenceRotateDir] call selectRandom [a3e_fnc_BuildPrison, a3e_fnc_BuildPrison1, a3e_fnc_BuildPrison2, a3e_fnc_BuildPrison3, a3e_fnc_BuildPrison4, a3e_fnc_BuildPrison5];

A3E_FenceIsCreated = true;
publicVariable "A3E_FenceIsCreated";

//### The following is a mission function now

[true] call drn_fnc_InitVillageMarkers; 
[true] call drn_fnc_InitAquaticPatrolMarkers; 


_playerGroup = [] call A3E_fnc_GetPlayerGroup;


[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency, A3E_Debug] execVM "Scripts\Escape\EscapeSurprises.sqf";


// Initialize communication centers

[] call A3E_fnc_createComCenters;

_EnemyCount = [3] call A3E_fnc_GetEnemyCount;

[_playerGroup, "drn_CommunicationCenterPatrolMarker", A3E_VAR_Side_Opfor, "INS", 4, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance] call drn_fnc_InitGuardedLocations;

// Initialize Motor Pools

private _UseMotorPools = Param_MotorPools;
    if (_UseMotorPools == 1) then {
        [] call A3E_fnc_createMotorPool;
    };


// Initialize armor defence at communication centers


[_playerGroup, a3e_var_Escape_communicationCenterPositions, _enemySpawnDistance, _enemyFrequency] call drn_fnc_Escape_InitializeComCenArmor;



// Initialize ammo depots

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _playerGroup, _enemyFrequency] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency"];
	private ["_playerGroup", "_minEnemies", "_maxEnemies", "_bannedPositions", "_scriptHandle"];

	private _EnemyCount = [2] call A3E_fnc_GetEnemyCount;
	_EnemyCount params ["_minEnemies", "_maxEnemies"];
	
	_bannedPositions = + a3e_var_Escape_communicationCenterPositions + [A3E_StartPos, getMarkerPos "drn_insurgentAirfieldMarker"];
	a3e_var_Escape_ammoDepotPositions = _bannedPositions call drn_fnc_Escape_FindAmmoDepotPositions;
	
	[] call A3E_fnc_createAmmoDepots;
	
	[_playerGroup, "drn_AmmoDepotPatrolMarker", A3E_VAR_Side_Opfor , "INS", 3, _minEnemies, _maxEnemies, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] spawn drn_fnc_InitGuardedLocations;
};


// Initialize search leader
[drn_searchAreaMarkerName, A3E_Debug] execVM "Scripts\Escape\SearchLeader.sqf";

// Create motorized search group

[_enemyFrequency, _enemyMinSkill, _enemyMaxSkill] spawn {
	params ["_enemyFrequency", "_enemyMinSkill", "_enemyMaxSkill"];
	private _spawnSegment = [] call A3E_fnc_FindSpawnRoad;
	
	if(!isNull _spawnSegment) then {
		[getPos _spawnSegment, drn_searchAreaMarkerName, _enemyFrequency, _enemyMinSkill, _enemyMaxSkill, A3E_Debug] execVM "Scripts\Escape\CreateMotorizedSearchGroup.sqf";
	} else {
		diag_log "Unable to find spawn road for initial Motorized Searchgroup";
	};
};


// Start garbage collector
[_playerGroup, 750, A3E_Debug] spawn drn_fnc_CL_RunGarbageCollector;


// Run initialization for scripts that need the players to be gathered at the start position
[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency, _villagePatrolSpawnArea] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_enemyFrequency", "_villagePatrolSpawnArea"];

    private ["_fnc_OnSpawnAmbientInfantryGroup", "_fnc_OnSpawnAmbientInfantryUnit", "_scriptHandle"];
    private ["_playerGroup", "_minEnemiesPerGroup", "_maxEnemiesPerGroup", "_fnc_OnSpawnGroup"];
    
    
    _playerGroup = [] call A3E_fnc_GetPlayerGroup;
    
        switch (_enemyFrequency) do
        {
            case 1: // 1-2 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 4;
            };
            case 2: // 3-5 players
            {
                _minEnemiesPerGroup = 3;
                _maxEnemiesPerGroup = 6;
            };
            default // 6-8 players
            {
                _minEnemiesPerGroup = 4;
                _maxEnemiesPerGroup = 8;
            };
        };
        
        _fnc_OnSpawnGroup = {
            {
                _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
            } foreach units _this;
        };
        
       [_playerGroup, "drn_villageMarker", A3E_VAR_Side_Opfor, "INS", 5, _minEnemiesPerGroup, _maxEnemiesPerGroup, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _villagePatrolSpawnArea, A3E_Debug] call drn_fnc_InitVillagePatrols;

        switch (_enemyFrequency) do
        {
            case 1: // 1-2 players
            {
                _minEnemiesPerGroup = 2;
                _maxEnemiesPerGroup = 4;
            };
            case 2: // 3-5 players
            {
                _minEnemiesPerGroup = 3;
                _maxEnemiesPerGroup = 6;
            };
            default // 6-8 players
            {
                _minEnemiesPerGroup = 4;
                _maxEnemiesPerGroup = 8;
            };
        };
        
        _fnc_OnSpawnGroup = {
            {
                _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
            } foreach units _this;
        };
        
        [(units _playerGroup) select 0, A3E_VAR_Side_Opfor, a3e_arr_Escape_InfantryTypes, _minEnemiesPerGroup, _maxEnemiesPerGroup, 500000, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance + 250, _fnc_OnSpawnGroup, A3E_Debug] call drn_fnc_InitAquaticPatrols;


    
   

    // Initialize ambient infantry groups

	_fnc_OnSpawnAmbientInfantryUnit = {
		_this call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
	};
	
	_fnc_OnSpawnAmbientInfantryGroup = {
		private ["_unit", "_enemyUnit"];
		private ["_scriptHandle"];
		
		_unit = units _this select 0;
		
		while {!(isNull _unit)} do {
			_enemyUnit = _unit findNearestEnemy (getPos _unit);
			if (!(isNull _enemyUnit)) exitWith {
				
				private _i = 0;
				for [{_i = (count waypoints _this) - 1}, {_i >= 0}, {_i = _i - 1}] do {
					deleteWaypoint [_this, _i];
				};
				
				_scriptHandle = [_this, drn_searchAreaMarkerName, (getPos _enemyUnit), A3E_Debug] spawn drn_fnc_searchGroup;
				_this setVariable ["drn_scriptHandle", _scriptHandle];
			};
			
			sleep 5;
		};
	};
	
	private ["_infantryGroupsCount", "_radius", "_groupsPerSqkm"];

	switch (_enemyFrequency) do
	{
		case 1: // 1-2 players
		{
			_minEnemiesPerGroup = 2;
			_maxEnemiesPerGroup = 4;
			_groupsPerSqkm = 1;
		};
		case 2: // 3-5 players
		{
			_minEnemiesPerGroup = 2;
			_maxEnemiesPerGroup = 8;
			_groupsPerSqkm = 1.2;
		};
		default // 6-8 players
		{
			_minEnemiesPerGroup = 2;
			_maxEnemiesPerGroup = 12;
			_groupsPerSqkm = 1.4;
		};
	};

	_radius = (_enemySpawnDistance + 500) / 1000;
	_infantryGroupsCount = round (_groupsPerSqkm * _radius * _radius * 3.141592);
	
	[_playerGroup, A3E_VAR_Side_Opfor, a3e_arr_Escape_InfantryTypes, _infantryGroupsCount, _enemySpawnDistance + 200, _enemySpawnDistance + 500, _minEnemiesPerGroup, _maxEnemiesPerGroup, _enemyMinSkill, _enemyMaxSkill, 750, _fnc_OnSpawnAmbientInfantryUnit, _fnc_OnSpawnAmbientInfantryGroup, A3E_Debug] spawn drn_fnc_AmbientInfantry;

    
    // Initialize the Escape military and civilian traffic
	private ["_vehiclesPerSqkm", "_radius", "_vehiclesCount", "_fnc_onSpawnCivilian"];
	
	// Civilian traffic
	
	switch (_enemyFrequency) do
	{
		case 1: // 1-3 players
		{
			_vehiclesPerSqkm = 1.6;
		};
		case 2: // 4-6 players
		{
			_vehiclesPerSqkm = 1.4;
		};
		default // 7-8 players
		{
			_vehiclesPerSqkm = 1.2;
		};
	};
	
	_radius = _enemySpawnDistance + 500;
	_vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);
	
	_fnc_onSpawnCivilian = {
		private ["_vehicle", "_crew"];
		_vehicle = _this select 0;
		_crew = _this select 1;
		//_vehiclesGroup = _result select 2;
		
		{
			{
				_x removeWeapon "ItemMap";
			} foreach _crew; // foreach crew
			
			_x addeventhandler ["killed",{
				if ((_this select 1) in (call A3E_fnc_GetPlayers)) then {
					if(isNil("a3e_var_Escape_SearchLeader_civilianReporting")) then {
						a3e_var_Escape_SearchLeader_civilianReporting = true;
						publicVariable "a3e_var_Escape_SearchLeader_civilianReporting";
						(_this select 1) addScore -5;
					} else {
						(_this select 1) addScore -1;
					};
					(_this select 1) addRating 1000; //Even out the minus score by killing civilians
					[name (_this select 1) + " has killed a civilian."] call drn_fnc_CL_ShowCommandTextAllClients;
				};
				if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
					_killer = (_this select 0) getVariable ["ace_medical_lastDamageSource", objNull];
					if (_killer in (call A3E_fnc_GetPlayers)) then {
						if(isNil("a3e_var_Escape_SearchLeader_civilianReporting")) then {
								a3e_var_Escape_SearchLeader_civilianReporting = true;
								publicVariable "a3e_var_Escape_SearchLeader_civilianReporting";
								(_killer) addScore -5;
							} else {
								(_killer) addScore -1;
							};
							(_killer) addRating 1000; //Even out the minus score by killing civilians
							[name (_killer) + " has killed a civilian."] call drn_fnc_CL_ShowCommandTextAllClients;
					};
				};
			}];
		} foreach _crew;
		
		if (random 100 < 20) then {
			private ["_weaponItem"];
			
			_weaponItem = selectRandom a3e_arr_CivilianCarWeapons;
			
			_vehicle addWeaponCargoGlobal [_weaponItem select 0, 1];
			_vehicle addMagazineCargoGlobal [_weaponItem select 1, _weaponItem select 2];
		};
	};
	
	[civilian, [], _vehiclesCount, _enemySpawnDistance, _radius, 0.5, 0.5, _fnc_onSpawnCivilian, A3E_Debug] spawn drn_fnc_MilitaryTraffic;

	
	// Enemy military traffic
	
	switch (_enemyFrequency) do
	{
		case 1: // 1-3 players
		{
			_vehiclesPerSqkm = 0.6;
		};
		case 2: // 4-6 players
		{
			_vehiclesPerSqkm = 0.8;
		};
		default // 7-8 players
		{
			_vehiclesPerSqkm = 1;
		};
	};
	
	_radius = _enemySpawnDistance + 500;
	_vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);
	[_vehiclesCount,_enemySpawnDistance,_radius,_enemyMinSkill, _enemyMaxSkill] spawn {
		params["_vehiclesCount","_enemySpawnDistance","_radius","_enemyMinSkill", "_enemyMaxSkill"];
		sleep 300;
		[A3E_VAR_Side_Opfor, [], _vehiclesCount/2, _enemySpawnDistance, _radius, _enemyMinSkill, _enemyMaxSkill, drn_fnc_Escape_TrafficSearch, A3E_Debug] spawn drn_fnc_MilitaryTraffic;
		[A3E_VAR_Side_Ind, [], _vehiclesCount/2, _enemySpawnDistance, _radius, _enemyMinSkill, _enemyMaxSkill, drn_fnc_Escape_TrafficSearch, A3E_Debug] spawn drn_fnc_MilitaryTraffic;
    };

	private ["_areaPerRoadBlock", "_maxEnemySpawnDistanceKm", "_roadBlockCount"];
	private ["_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle"];
	
	_fnc_OnSpawnInfantryGroup = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach units _this;};
	_fnc_OnSpawnMannedVehicle = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_this select 1);};
	
	switch (_enemyFrequency) do {
		case 1: {
			_areaPerRoadBlock = 4.19;
		};
		case 2: {
			_areaPerRoadBlock = 3.14;
		};
		default {
			_areaPerRoadBlock = 2.5;
		};
	};
	
	_maxEnemySpawnDistanceKm = (_enemySpawnDistance + 500) / 1000;
	_roadBlockCount = round ((_maxEnemySpawnDistanceKm * _maxEnemySpawnDistanceKm * 3.141592) / _areaPerRoadBlock);
	
	if (_roadBlockCount < 1) then {
		_roadBlockCount = 1;
	};
	//A3E_VAR_Side_Ind
	[a3e_arr_Escape_InfantryTypes, a3e_arr_Escape_RoadBlock_MannedVehicleTypes, _fnc_OnSpawnInfantryGroup, _fnc_OnSpawnMannedVehicle, A3E_Debug] spawn A3E_fnc_RoadBlocks;

	//Spawn crashsites

	private _crashSiteCount = ceil(random(missionNamespace getvariable["CrashSiteCountMax",3]));
	for "_i" from 1 to _crashSiteCount step 1 do {
		private _pos = [] call A3E_fnc_findFlatArea;
		[_pos] call A3E_fnc_crashSite;
	};

	switch (_enemyFrequency) do
	{
	    case 1: // 1-2 players
	    {
	        _minEnemiesPerGroup = 2;
	        _maxEnemiesPerGroup = 4;
	    };
	    case 2: // 3-5 players
	    {
	        _minEnemiesPerGroup = 3;
	        _maxEnemiesPerGroup = 6;
	    };
	    default // 6-8 players
	    {
	        _minEnemiesPerGroup = 4;
	        _maxEnemiesPerGroup = 8;
	    };
	};
	
	
	
	//Spawn mortar sites
	[] call A3E_fnc_createMortarSites;
};


// Create search chopper

private ["_scriptHandle"];
_scriptHandle = [getMarkerPos "drn_searchChopperStartPosMarker", A3E_VAR_Side_Opfor, drn_searchAreaMarkerName, _searchChopperSearchTimeMin, _searchChopperRefuelTimeMin, _enemyMinSkill, _enemyMaxSkill, [], A3E_Debug] execVM "Scripts\Escape\CreateSearchChopper.sqf";
waitUntil {scriptDone _scriptHandle};


// Spawn creation of start position settings
[A3E_StartPos, _backPack, _enemyFrequency] spawn {
	params ["_startPos", "_backPack", "_enemyFrequency"];
    private ["_guardGroup", "_marker", "_guardCount", "_guardGroups", "_unit", "_createNewGroup"];
    
	 
    // Spawn guard

	private _i = 0;	
	for [{_i = 0}, {_i < (Param_EnemyFrequency*2)}, {_i = _i + 1}] do {
		private _weapon = a3e_arr_PrisonBackpackWeapons select floor(random(count(a3e_arr_PrisonBackpackWeapons)));
		_backpack addWeaponCargoGlobal[(_weapon select 0),1];
		_backpack addMagazineCargoGlobal[(_weapon select 1),3];
	};
	
    // Spawn more guards
    _marker = createMarkerLocal ["drn_guardAreaMarker", _startPos];
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [50, 50];
    
    _guardCount = (2 + (_enemyFrequency)) + floor (random 2);

    _guardGroups = [];
    _createNewGroup = true;
    
    for [{_i = 0}, {_i < _guardCount}, {_i = _i + 1}] do {
        private ["_pos"];
        
        _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        while {_pos distance _startPos < 10} do {
            _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        };
        
        if (_createNewGroup) then {
            _guardGroup = createGroup A3E_VAR_Side_Ind;
            _guardGroups set [count _guardGroups, _guardGroup];
            _createNewGroup = false;
        };
        
        //(a3e_arr_Escape_StartPositionGuardTypes select floor (random count a3e_arr_Escape_StartPositionGuardTypes)) createUnit [_pos, _guardGroup, "", (0.5), "CAPTAIN"];
        _guardGroup createUnit [(a3e_arr_Escape_StartPositionGuardTypes select floor (random count a3e_arr_Escape_StartPositionGuardTypes)), _pos, [], 0, "FORM"];
        
        if (count units _guardGroup >= 2) then {
            _createNewGroup = true;
        };
    };
    
    {
        _guardGroup = _x;
        
        _guardGroup setFormDir floor (random 360);
        
        {
            _unit = _x; //(units _guardGroup) select 0;
            _unit setUnitRank "CAPTAIN";
			_unit unlinkItem "ItemMap";
            _unit unlinkItem "ItemCompass";
            _unit unlinkItem "ItemGPS";
			if (ACE_MedicalServer) then {_unit addItem "ACE_epinephrine"};//Add Epinephrine for each unit
			removeBackpackGlobal _unit;
			
			if(random 100 < 80) then {
				removeAllPrimaryWeaponItems _unit;
				
			};
			private["_hmd"];
			_hmd = hmd _unit;
            if ((random 100 > 20) || (Param_NoNightvision==1)) then {
				if(_hmd != "") then {
					_unit unlinkItem _hmd;
				};
            };
            
            //_unit setSkill a3e_var_Escape_enemyMinSkill;
			//[_unit, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
			
			//This should remove all types of handgrenades (for example RHS)
            _unit removeMagazines "Handgrenade";
            
            _unit setVehicleAmmo 0.3 + random 0.7;

        } foreach units _guardGroup;
        
        [_guardGroup, _marker] spawn A3E_fnc_Patrol;
        
    } foreach _guardGroups;
        
	//Add an alert trigger to the prison
	A3E_fnc_revealPlayers = {
		private _guardGroup = _this;
		{
			_guardGroup reveal _x;
		} foreach call A3E_fnc_GetPlayers;
	};
	A3E_fnc_soundAlarm = {
		params ["_guardGroups"];
		if(isNil("A3E_SoundPrisonAlarm")) then {
			A3E_SoundPrisonAlarm = true;
			publicvariable "A3E_SoundPrisonAlarm";
			sleep 30;
			A3E_SoundPrisonAlarm = false;
			publicvariable "A3E_SoundPrisonAlarm";
			{
				_x spawn A3E_fnc_revealPlayers;
			} foreach _guardGroups;
		};
	};
    // Start thread that waits for escape to start
    [_guardGroups] spawn {
        params ["_guardGroups"];
        
        sleep 5;
        
        while {isNil("A3E_EscapeHasStarted")} do {
			sleep 1;
            // If any member of the group is to far away from fence, then escape has started
            {
				if(_x getvariable ["A3E_PlayerInitializedServer",false]) then {
					if ((_x distance A3E_StartPos) > 15 && (_x distance A3E_StartPos) < 100) exitWith {
						A3E_EscapeHasStarted = true;
						publicVariable "A3E_EscapeHasStarted";
						systemChat "Player ran away!";
					};
					// If any player have picked up a weapon, escape has started
					if (count weapons _x > 0) exitWith {
						A3E_EscapeHasStarted = true;
						publicVariable "A3E_EscapeHasStarted";
						systemChat "Player has weapon!";
					};
				};
            } foreach call A3E_FNC_GetPlayers;
        };
        
        // ESCAPE HAS STARTED
        //{
		//	[[[_x], {(_this select 0) setCaptive false;}], "BIS_fnc_spawn", _x, false] call BIS_fnc_MP;
		//} foreach call A3E_fnc_GetPlayers;
	   systemChat "Server: Escape has started.";
    };
	//Spawn alarm watchdog
	[_guardGroups] spawn {
		params ["_guardGroups"];
		while{isNil("A3E_SoundPrisonAlarm")} do {
			if(!isNil("A3E_EscapeHasStarted")) then {
				{
					private ["_guardGroup"];					
					_guardGroup = _x;
					{
						if((_guardGroup knowsAbout _x)>2.5) exitwith {
							[_guardGroups] call A3E_fnc_soundAlarm;
						};
					} foreach call A3E_fnc_GetPlayers;
				} foreach _guardGroups;
			};
			if(!isNil("A3E_PrisonGateObject")) then {
				if((A3E_PrisonGateObject animationPhase "Door_1_rot") > 0.5 ||
				(A3E_PrisonGateObject animationPhase "Door_2_rot") > 0.5) then {
					if(isNil("A3E_EscapeHasStarted")) then {
						A3E_EscapeHasStarted = true;
						publicVariable "A3E_EscapeHasStarted";
					};
					[_guardGroups] call A3E_fnc_soundAlarm;
				};
			};
			sleep 0.5;
		};
	};
	
	//Watch for captive state
	[] spawn {
		while{isNil("A3E_EscapeHasStarted")} do {
			{
				if(isNil("A3E_EscapeHasStarted") && !(captive _x)) then {
					[_x, true] remoteExec ["setCaptive", _x, false];
				};
			} foreach call A3E_fnc_GetPlayers;
			sleep 0.5;
		};
		{
			[_x, false] remoteExec ["setCaptive", _x, false];
		} foreach call A3E_fnc_GetPlayers;
	};
};
