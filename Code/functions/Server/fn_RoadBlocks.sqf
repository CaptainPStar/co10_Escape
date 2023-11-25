private _factionsArray = [A3E_VAR_Side_Ind, A3E_VAR_Side_Ind, A3E_VAR_Side_Ind , A3E_VAR_Side_Opfor];

private _minSpawnDistance = (missionNamespace getvariable["A3E_MinRoadblockSpawnDistance",1500]);
private _maxSpawnDistance = (missionNamespace getvariable["A3E_MaxRoadblockSpawnDistance",2000]);
private _minDistanceBetweenRoadBlocks = (missionNamespace getvariable["A3E_MinRoadblockDistance", 1500]);
private _maxNumberOfRoadBlocks = missionnameSpace getvariable ["A3E_MaxNumberOfRoadblocks",15];

private _roadBlocks = missionnameSpace getvariable ["A3E_RoadBlocks",[]];

if(count(_roadBlocks)>=_maxNumberOfRoadBlocks) exitwith {["Max number of roadblocks reached",["Roadblocks"]] call A3E_fnc_Log;};

//params[["_minDis",1000],["_maxDis",2000],["_mode","NONE"]];

private _pos = [_minSpawnDistance,_maxSpawnDistance,"ROAD"] call a3e_fnc_getCircularSpawnPos;

if(count(_pos)<3) exitwith {["Unable to find a suitable position for Roadblock. Skipping.",["Roadblocks"]] call A3E_fnc_Log;};

if({_pos distance _x < _minDistanceBetweenRoadBlocks} count _roadBlocks > 0) exitwith {["Roadblock too near to other roadblock. Skipping.",["Roadblocks"]] call A3E_fnc_Log;};

private _roads = _pos nearRoads 10;

if(count(_roads)==0) exitwith {["No road at position. Skipping.",["Roadblocks"]] call A3E_fnc_Log;};

private _roadSegment = _roads#0;

private _roadConnectedTo = roadsConnectedTo _roadSegment;

if(count(_roadConnectedTo) == 0) exitwith {["RoadSegment is has no connected roads. Skipping.",["Roadblocks"]] call A3E_fnc_Log;};

_connectedRoad = _roadConnectedTo select 0;

private _dir = [_roadConnectedTo select 0, _roadConnectedTo  select 1] call BIS_fnc_DirTo;

_pos = getPos _roadSegment;

if (random 100 < 50) then {
	_dir = _dir + 180;
};

private _templatesAvailable = missionnamespace getvariable ["A3E_RoadblockTemplates",[]];

if(count _templatesAvailable == 0) exitwith {
	["No roadblocks spawned because there are no templates defined/loaded.",["Roadblocks"]] call A3E_fnc_Log;
};

private _templatePositions = [_pos,_dir, selectRandom _templatesAvailable]  call a3e_fnc_IsoTemplateRestore;

[format["A3E_Roadblock_%1",count(_roadBlocks)],_pos,"hd_warning","ColorRed",false,false] call a3e_fnc_createLocationMarker;

private _side = selectRandom _factionsArray;
private _zoneIndex = [_pos,30,_side,"ROADBLOCK"] call A3E_fnc_initLocationZone;

private _zone = A3E_Zones # _zoneIndex;
private _groups = _zone getordefault ["groups",[]];

private _vehicles = _templatePositions getordefault ["parkedvehicles",[]];

private  _possibleVehicles = [];
if(_side == A3E_VAR_Side_Opfor) then {
	_possibleVehicles = a3e_arr_Escape_RoadBlock_MannedVehicleTypes;
};
if (_side == A3E_VAR_Side_Ind) then {
	_possibleVehicles = a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind;
};

if(count(_possibleVehicles) > 0) then {
	{
		_x params ["_type","_realPos","_dir","_init"];
		private _result = [_realPos, _dir, selectRandom _possibleVehicles, _side] call BIS_fnc_spawnVehicle;
		private _vehicle = _result select 0;
		_vehicle setpos _realPos;
		_vehicle setdir _dir;

		private _crew = _result select 1;
		private _group = _result select 2;
		_groups pushback _group;
		[_vehicle] call a3e_fnc_onVehicleSpawn;
		[_group] call a3e_fnc_onEnemyGroupSpawn;
		{
			[_x] call a3e_fnc_onEnemySoldierSpawn;
		} foreach _crew;
		
	} foreach _vehicles;
};

private _statics = _templatePositions getordefault ["statics",[]];
if(count(a3e_arr_ComCenStaticWeapons) > 0) then {
	{
		_x params ["_type","_realPos","_dir","_init"];
		private _gun = selectRandom a3e_arr_ComCenStaticWeapons;
	   // private _static = [_gun, (_pos vectoradd [10,0,0]), _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
		private _static = createVehicle [_gun, _realPos, [], _dir, "NONE"];
		_static setpos _realPos;
		_static setdir _dir;
		private _unit = ([_static,_side] call A3E_fnc_AddStaticGunner); 
		[_static] call a3e_fnc_onVehicleSpawn;
		[group _unit] call a3e_fnc_onEnemyGroupSpawn;
		[_unit] call a3e_fnc_onEnemySoldierSpawn;
		_groups pushback (group _unit);
	} foreach _statics;
};
_zone set ["groups",_groups];


_roadBlocks pushBack _pos;
missionnameSpace setvariable ["A3E_RoadBlocks",_roadBlocks];

["Roadblock created.",["Roadblocks"],[_pos,_templatePositions]] call A3E_fnc_Log;