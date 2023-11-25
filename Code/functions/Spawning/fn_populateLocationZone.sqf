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
	case "ROADBLOCK": {
		_patrolCount = 2;
	};
};

//private _groups = [];
//An unpopulated zone already may have units that were spawned in.
private _groups = _zone getordefault ["groups",[]];

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


//General purpose patrol groups
for "_x" from 1 to _patrolCount do {
	private _pos = [_marker] call BIS_fnc_randomPosTrigger;
	//private _unitCount = round((missionNamespace getvariable ["A3E_Param_EnemyFrequency",1])*2+(random(2)-1));
	private _unitCount = [] call a3e_fnc_getDynamicSquadSize;
	private _grp = [_pos,_side,_unitCount] call A3E_FNC_spawnPatrol;
	_groups pushBack _grp;
	//_grp setvariable ["A3E_PatrolZone_Index",_zoneIndex];
	if(random 100 <= 70) then {
		[_grp, _marker] call A3E_fnc_Guard;
	} else {
		[_grp, _marker] call A3E_fnc_GuardBuilding;
	};
};
_zone set ["groups",_groups];




//["Zone "+str _zoneIndex+" populated with "+str count(_groups)+" groups",["Zones","Spawning"]] call A3E_fnc_Log;