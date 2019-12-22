private _zoneIndex = _this select 0;
["Activating zone " + str _zoneIndex] call a3e_fnc_debugmsg;
//[_zoneIndex,[_trigger,_marker,_side,_zoneArea,false,false,[],[]]];
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

	
	private _trigger = [_zone,"trigger"] call BIS_fnc_getFromPairs;
	private _side = [_zone,"side"] call BIS_fnc_getFromPairs;
	private _groups = [_zone,"patrols"] call BIS_fnc_getFromPairs;
	private _area = [_zone,"zoneArea"] call BIS_fnc_getFromPairs;
	
	if(!_initialized) then {
		if(isNil("A3E_PatrolsPerSqm")) then {
			A3E_PatrolsPerSqm = 0.0005;
		};
		private _patrolCount = ceil(A3E_PatrolsPerSqm * _area);
		for "_x" from 1 to _patrolCount do {
			private _pos = [_marker] call BIS_fnc_randomPosTrigger;
			private _grp = [_pos,_side,(random 3) + 2] call A3E_FNC_spawnPatrol;
			_groups pushBack _grp;
			_grp setvariable ["A3E_PatrolZone_Index",_zoneIndex];
			[_grp, _marker] call A3E_fnc_Patrol;
			[_grp] spawn A3E_fnc_TrackGroup;
			
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