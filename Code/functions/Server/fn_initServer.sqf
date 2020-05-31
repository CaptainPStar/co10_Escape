//waituntil{!isNil("BIS_fnc_init")};
["Server started."] spawn a3e_fnc_debugmsg;

//ACE Revive
AT_Revive_Camera = Param_ReviveView; //Needs to be stored on server now
ACE_MedicalServer = false;
if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
	ACE_MedicalServer = true;
	["ace_unconscious", {params["_unit", "_isDown"]; [_unit,_isDown] spawn ACE_fnc_HandleUnconscious;}] call CBA_fnc_addEventHandler;
};
publicVariable "ACE_MedicalServer";

//Load Statistics
[] spawn A3E_fnc_LoadStatistics;



// Add crashsite here
//##############


private ["_EnemyCount","_enemyMinSkill", "_enemyMaxSkill", "_searchChopperSearchTimeMin", "_searchChopperRefuelTimeMin", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency"];

_enemyFrequency = (Param_EnemyFrequency);
_enemySpawnDistance = (Param_EnemySpawnDistance);

// prison is created locally, clients need flag texture path
publicVariable "A3E_VAR_Flag_Ind";

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
		_hour = 6+round(random(10));  //Between 0600 and 1600
	};
	case 26: { 
		_hour = 17 + round(random(11)); //Between 1700 and 0400
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


// Choose a start position

A3E_StartPos = [] call a3e_fnc_findFlatArea;
publicVariable "A3E_StartPos";


A3E_Var_ClearedPositions = [];
A3E_Var_ClearedPositions pushBack A3E_StartPos;
A3E_Var_ClearedPositions pushBack (getMarkerPos "drn_insurgentAirfieldMarker");

if(isNil("A3E_ClearedPositionDistance")) then {
	A3E_ClearedPositionDistance = 500;
};

private _backpack = [] call A3E_fnc_createStartpos;

//### The following is a mission function now

//Wait for players to actually arrive ingame. This may be a long time if server is set to persistent
waituntil{uisleep 1; count([] call A3E_FNC_GetPlayers)>0};

_playerGroup = [] call A3E_fnc_GetPlayerGroup;

a3e_searchTargets = [2];

private _hasHC = !(a3e_hcArray isEqualTo []);
if (_hasHC) then {
	"waiting for HC ready" call a3e_fnc_rptLog;
	waitUntil {a3e_hcReady isEqualTo []};
	"all HC ready" call a3e_fnc_rptLog;
	a3e_nextHC = 0;
	a3e_searchTargets append a3e_hcArray;
};
private _getExecTarget = if (!_hasHC) then {
	{2} // server
} else {
	{
		private _next = a3e_nextHC;
		a3e_nextHC = a3e_nextHC + 1;
		if (a3e_nextHC >= count a3e_hcArray) then {
			a3e_nextHC = 0;
		};
		a3e_hcArray select _next
	}
};

[[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency, A3E_Debug], "Scripts\Escape\EscapeSurprises.sqf"] remoteExec ["execVM", call _getExecTarget];


// Initialize communication centers

call compile preprocessFileLineNumbers ("Island\CommunicationCenterMarkers.sqf");
[] call A3E_fnc_createComCenters;

_EnemyCount = [3] call A3E_fnc_GetEnemyCount;

[_playerGroup, "drn_CommunicationCenterPatrolMarker", A3E_VAR_Side_Opfor, "INS", 4, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] call drn_fnc_InitGuardedLocations;

// Initialize armor defence at communication centers
[_playerGroup, a3e_var_Escape_communicationCenterPositions, _enemySpawnDistance, _enemyFrequency] call drn_fnc_Escape_InitializeComCenArmor;


// Initialize Motor Pools
if (Param_MotorPools == 1) then {
	_EnemyCount = [2] call A3E_fnc_GetEnemyCount;
	[] call A3E_fnc_createMotorPool;
	[_playergroup, "A3E_MotorPoolPatrolMarker", A3E_VAR_Side_Opfor, "INS", 3, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] call drn_fnc_InitGuardedLocations;
};

// Initialize ammo depots

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _playerGroup, _enemyFrequency] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency"];
	private ["_playerGroup", "_minEnemies", "_maxEnemies", "_bannedPositions"];

	private _EnemyCount = [2] call A3E_fnc_GetEnemyCount;
	_EnemyCount params ["_minEnemies", "_maxEnemies"];
	
	_bannedPositions = + a3e_var_Escape_communicationCenterPositions + [A3E_StartPos, getMarkerPos "drn_insurgentAirfieldMarker"];
	a3e_var_Escape_ammoDepotPositions = _bannedPositions call drn_fnc_Escape_FindAmmoDepotPositions;
	
	[] call A3E_fnc_createAmmoDepots;
	
	[_playerGroup, "drn_AmmoDepotPatrolMarker", A3E_VAR_Side_Opfor , "INS", 3, _minEnemies, _maxEnemies, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] call drn_fnc_InitGuardedLocations;
};


// Initialize search leader
[drn_searchAreaMarkerName, A3E_Debug] execVM "Scripts\Escape\SearchLeader.sqf";

// Start garbage collector
[_playerGroup, 750, A3E_Debug] spawn drn_fnc_CL_RunGarbageCollector;


remoteExec ["A3E_fnc_initVillages", call _getExecTarget];

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_prepareAquaticPatrols", call _getExecTarget];
[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initAmbientInfantry", call _getExecTarget];
[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initMilitaryTraffic", call _getExecTarget];

[_enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initCivilianTraffic", call _getExecTarget];
[_enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initRoadBlocks", call _getExecTarget];

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _playerGroup] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_playerGroup"];
	//Spawn crashsites
	private _crashSiteCount = ceil(random(missionNamespace getvariable["CrashSiteCountMax",3]));
	for "_i" from 1 to _crashSiteCount step 1 do {
		private _pos = [] call A3E_fnc_findFlatArea;
		[_pos] call A3E_fnc_crashSite;
	};

	private _EnemyCount = [2] call A3E_fnc_GetEnemyCount;

	//Spawn mortar sites
	[] call A3E_fnc_createMortarSites;
	[_playergroup, "A3E_MortarSitePatrolMarker", A3E_VAR_Side_Opfor, "INS", 2, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] call drn_fnc_InitGuardedLocations;
};


// Create search chopper
[
	[
		getMarkerPos "drn_searchChopperStartPosMarker",
		A3E_VAR_Side_Opfor,
		drn_searchAreaMarkerName,
		_searchChopperSearchTimeMin,
		_searchChopperRefuelTimeMin,
		_enemyMinSkill,
		_enemyMaxSkill,
		[],
		A3E_Debug
	],
	"Scripts\Escape\CreateSearchChopper.sqf"
] remoteExec ["execVM", call _getExecTarget];

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

			private _hmd = hmd _unit;
			if (_hmd isEqualTo "") then {
				private _cfgWeapons = configFile >> "CfgWeapons";
				{
					if (616 == getNumber (_cfgWeapons >> _x >> "ItemInfo" >> "type")) exitWith {
						_hmd = _x;
					};
				} forEach items _unit;
			};
			if (!(_hmd isEqualTo "") && {random 100 > 20 || {Param_NoNightvision == 1}}) then {
				_unit unlinkItem _hmd;
				_unit removeItem _hmd;
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
			_guardGroup reveal [_x,1.5];
		} foreach call A3E_fnc_GetPlayers;
	};
	A3E_fnc_soundAlarm = {
		params ["_guardGroups"];
		if(isNil("A3E_SoundPrisonAlarm")) then {
			A3E_SoundPrisonAlarm = true;
			publicvariable "A3E_SoundPrisonAlarm";
			{
				_x spawn A3E_fnc_revealPlayers;
			} foreach _guardGroups;
			sleep 30;
			A3E_SoundPrisonAlarm = false;
			publicvariable "A3E_SoundPrisonAlarm";
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
					};
					// If any player have picked up a weapon, escape has started
					if (count weapons _x > 0) exitWith {
						A3E_EscapeHasStarted = true;
						publicVariable "A3E_EscapeHasStarted";
					};
				};
            } foreach call A3E_FNC_GetPlayers;
        };
        
        // ESCAPE HAS STARTED
        //{
		//	[[[_x], {(_this select 0) setCaptive false;}], "BIS_fnc_spawn", _x, false] call BIS_fnc_MP;
		//} foreach call A3E_fnc_GetPlayers;
	   diag_log "Server: Escape has started.";
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
