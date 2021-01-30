private _zoneIndex = _this select 0;
["Activating zone " + str _zoneIndex] call a3e_fnc_debugmsg;
´
_zone = a3e_patrolZones select _zoneIndex;

private _active = [_zone,"active"] call BIS_fnc_getFromPairs;
private _initialized = [_zone,"initialized"] call BIS_fnc_getFromPairs;
if(!(_active)) then {
	private _marker = [_zone,"marker"] call BIS_fnc_getFromPairs;
	
	_marker setMarkerColor "ColorYellow";
	if(A3E_Debug) then {
		_marker setMarkerAlpha 0.5;
	} else {
		_marker setMarkerAlpha 0;
	};

	
	private _side = [_zone,"side"] call BIS_fnc_getFromPairs;
	private _groups = [_zone,"patrols"] call BIS_fnc_getFromPairs;
	private _area = [_zone,"zoneArea"] call BIS_fnc_getFromPairs;
	
	if(!_initialized) then {
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
		
		
		for "_x" from 1 to _patrolCount do {
			private _pos = [_marker] call BIS_fnc_randomPosTrigger;
			//private _unitCount = round((missionNamespace getvariable ["A3E_Param_EnemyFrequency",1])*2+(random(2)-1));
			private _unitCount = [] call a3e_fnc_getDynamicSquadSize;
			private _grp = [_pos,_side,_unitCount] call A3E_FNC_spawnPatrol;
			_groups pushBack _grp;
			_grp setvariable ["A3E_PatrolZone_Index",_zoneIndex];
			[_grp, _marker] call A3E_fnc_Patrol;
			[_grp] spawn A3E_fnc_TrackGroup;
			
		};
		if(A3E_Debug) then {
			_marker setMarkerAlpha 0.5;
			private _markerText = createMarker [_marker+"_text",getMarkerpos _marker];
			_markerText setMarkerShape "ICON";
			_markerText setMarkerType "mil_dot";
			_markerText setMarkerText format["%1/%2sm/%3Grps/%4",_zoneIndex,(_area),_patrolCount,str _side];
		};
		[_zone,"active",true] call BIS_fnc_setToPairs;
		[_zone,"initialized",true] call BIS_fnc_setToPairs;
		[_zone,"patrols",_groups] call BIS_fnc_setToPairs;
	} else {
		private _grpArray = [];
		{
			private _pos = _x select 0;
			private _count = _x select 1;
			private _grp = [_pos,_side,_count] call A3E_FNC_spawnPatrol;
			_grpArray pushBack _grp;
			_grp setvariable ["A3E_PatrolZone_Index",_zoneIndex];
			[_grp, _marker] call A3E_fnc_Patrol;
			[_grp] spawn A3E_fnc_TrackGroup;
		} foreach _groups;
		
		[_zone,"patrols",_grpArray] call BIS_fnc_setToPairs;
		[_zone,"active",true] call BIS_fnc_setToPairs;
	};
};