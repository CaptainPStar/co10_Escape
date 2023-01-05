params["_zoneIndex"];

private _zone = A3E_Zones select _zoneIndex;
private _marker = _zone get "marker";
private _area = _zone get "zonearea";
private _side = _zone getorDefault ["side",A3E_VAR_Side_Ind];
private _type = _zone get "type";

_patrolCount = 4;
switch(_type) do {
	case "COMCENTER": {
		_patrolCount = 6;
	};
	case "MORTAR": {
		_patrolCount = 2;
	};
	case "AMMODEPOT": {
		_patrolCount = 4;
	};
	case "MOTORPOOL": {
		_patrolCount = 5;
	};
};

private _groups = [];


private _buildingsPositions = [_x] call a3e_fnc_getBuildingsInMarker;
[format["Found %1 enterable Buildings... in Zone %2",count(_buildingsPositions),_zoneIndex],["Spawning","Garisson"],[_buildingsPositions]] call a3e_fnc_log;

//Spawn some random units in the buildings:
private _guardCount = (2 max (_patrolCount/2)) min count(_buildingsPositions);

private _possibleInfantryTypes = a3e_arr_Escape_InfantryTypes_Ind;
if(_side == A3E_VAR_Side_Ind) then {
	_possibleInfantryTypes = a3e_arr_Escape_InfantryTypes_Ind;
};
if(_side == A3E_VAR_Side_Opfor) then {
	_possibleInfantryTypes = a3e_arr_Escape_InfantryTypes;
};

for "_x" from 1 to _guardCount do {
	private _pos = selectRandom _buildingsPositions;
	private _grp = creategroup _side;
	_unit = _grp createUnit [selectRandom _possibleInfantryTypes, _pos, [], 0, "NONE"];
   _unit setpos _pos;
   _unit setdir (random 360);
	[_unit] call A3E_fnc_onEnemySoldierSpawn;
	[_grp, _marker] call A3E_fnc_GuardBuilding;
	[_grp] call A3E_fnc_TrackGroup_Add;
	_groups pushBack _grp;
};



//General purpose patrol groups
for "_x" from 1 to _patrolCount do {
	private _pos = [_marker] call BIS_fnc_randomPosTrigger;
	//private _unitCount = round((missionNamespace getvariable ["A3E_Param_EnemyFrequency",1])*2+(random(2)-1));
	private _unitCount = [] call a3e_fnc_getDynamicSquadSize;
	private _grp = [_pos,_side,_unitCount] call A3E_FNC_spawnPatrol;
	_groups pushBack _grp;
	//_grp setvariable ["A3E_PatrolZone_Index",_zoneIndex];
	[_grp, _marker] call A3E_fnc_Guard;
	[_grp] call A3E_fnc_TrackGroup_Add;
};
_zone set ["groups",_groups];




//["Zone "+str _zoneIndex+" populated with "+str count(_groups)+" groups",["Zones","Spawning"]] call A3E_fnc_Log;