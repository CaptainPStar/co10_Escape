params["_zoneIndex"];

private _zone = a3e_patrolZones select _zoneIndex;

private _active = [_zone,"active"] call BIS_fnc_getFromPairs;
private _initialized = [_zone,"initialized"] call BIS_fnc_getFromPairs;

if(_active && _initialized) then {
	private _marker = [_zone,"marker"] call BIS_fnc_getFromPairs;
	private _trigger = [_zone,"trigger"] call BIS_fnc_getFromPairs;
	private _side = [_zone,"side"] call BIS_fnc_getFromPairs;
	private _groups = [_zone,"patrols"] call BIS_fnc_getFromPairs;
	_marker setMarkerColor "ColorRed";
	if(A3E_Debug) then {
		_marker setMarkerAlpha 0.5;
	} else {
		_marker setMarkerAlpha 0;
	};
	private _grpArray = [];
	private _grouplist = missionNamespace getvariable ["A3E_StatusOfPatrols",[]];
	{
		private _grp = _x;
		if(!isNull _grp) then {
			private _count = {alive _x} count (units _grp);
			if(_count > 0) then {
				_grpArray pushBack [getpos (leader _grp),_count];
				{
					deletevehicle _x;
				} foreach (units _grp);
				
				{
					if(_grp==_x#0) exitwith {
						_x set [3,true]; //set despawn flag, so searchleader will not miss this group
					};
				} foreach _grouplist;
				deletegroup _x;
			};
		};
		["Group deleted"] call a3e_fnc_debugmsg;
	} foreach _groups;
	[_zone,"active",false] call BIS_fnc_setToPairs;
	[_zone,"patrols",_grpArray] call BIS_fnc_setToPairs;
	
	//Delete trigger if this zone was completely cleared
	if(count _grpArray == 0) then {
		deletevehicle _trigger;
		_marker setMarkerColor "ColorWhite";
		[format ["Zone %1 deleted",_zoneIndex]] call a3e_fnc_debugmsg;
	};
};