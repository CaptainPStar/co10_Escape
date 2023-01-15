params["_zoneIndex"];

private _zone = A3E_Zones select _zoneIndex;
private _marker = _zone get "marker";
private _area = _zone get "zonearea";

private _sides = [A3E_VAR_Side_Ind,A3E_VAR_Side_Ind,A3E_VAR_Side_Ind];
if(_zoneArea > 5000) then {
	_sides pushBack A3E_VAR_Side_Opfor;
};


private _patrolsPerSqmSqrt = 0.01;
private _spawnCount = missionNamespace getvariable ["A3E_Param_VillageSpawnCount",1];
switch (_spawnCount) do
{
	case 1: // 1-2 players
	{
	   _patrolsPerSqmSqrt = 0.01;
	};
	case 2: // 3-5 players
	{
	   _patrolsPerSqmSqrt = 0.018;
	};
	case 3: // 6-8 players
	{
	   _patrolsPerSqmSqrt = 0.029;
	};
	default // 6-8 players
	{
		_patrolsPerSqmSqrt = 0.01;
	};
};

private _edgeSum2 = ((getMarkerSize _marker # 0)+(getMarkerSize _marker # 1))/2;
private _patrolCount = ceil(_patrolsPerSqmSqrt * sqrt(_area))+round(_edgeSum2/100);
systemchat str _patrolCount;
private _groups = [];

//General purpose patrol groups
for "_x" from 1 to _patrolCount do {
	private _pos = [_marker] call BIS_fnc_randomPosTrigger;
	//private _unitCount = round((missionNamespace getvariable ["A3E_Param_EnemyFrequency",1])*2+(random(2)-1));
	private _unitCount = [] call a3e_fnc_getDynamicSquadSize;
	private _grp = [_pos,selectRandom _sides,_unitCount] call A3E_FNC_spawnPatrol;
	_groups pushBack _grp;
	_grp setvariable ["A3E_PatrolZone_Index",_zoneIndex];
	[_grp, _marker] call A3E_fnc_Patrol;
	[_grp] call A3E_fnc_TrackGroup_Add;
};



//Spawn some civilians
if(_patrolCount > 2) then {

	private _count = (_patrolCount)+selectRandom[-4,-3,-3,-2,-2,-2,-1,-1,0,0,0,0,0,1,1,1,1];
	_count = 0 max _count;

	for "_x" from 1 to (_count) do {
		private _pos = [_marker] call BIS_fnc_randomPosTrigger;
		private _grp = [_pos,selectRandom[1,1,1,1,1,2]] call A3E_FNC_spawnCivilianStroller;
	
		_groups pushBack _grp;
		_grp setvariable ["A3E_PatrolZone_Index",_zoneIndex];
		[_grp, _marker] call A3E_fnc_Stroll;
		[_grp] call A3E_fnc_TrackGroup_Add;
	};
};

_zone set ["groups",_groups];


//["Zone "+str _zoneIndex+" populated with "+str count(_groups)+" groups",["Zones","Spawning"]] call A3E_fnc_Log;