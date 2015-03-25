private["_group","_position","_type","_formation","_speed","_combatmode","_onComplete","_script","_marker","_markername"];

_group = [_this,0,grpNull,[grpNull]] call bis_fnc_param;
_position = [_this,1,[0,0,0],[[]]] call bis_fnc_param;
_type = [_this,2,"MOVE",[""]] call bis_fnc_param;
_formation = [_this,3,"COLUMN",[""]] call bis_fnc_param;
_speed = [_this,4,"LIMITED",[""]] call bis_fnc_param;
_combatmode = [_this,5,"SAFE",[""]] call bis_fnc_param;
_onComplete = [_this,6,"",[""]] call bis_fnc_param;


if(a3e_debug_EnemyPosition) then {
	_script = _group getvariable "a3e_debug_positionScript";
	if(isNil("_script")) then {
		_script = [_group] spawn a3e_fnc_TrackGroup;
		_group setvariable ["a3e_debug_positionScript",_script,false];
	};
};
if(a3e_debug_Waypoints) then {
	_marker = _group getvariable ["a3e_debug_moveMarker","noMarker"];
	if(_marker == "noMarker") then {
		_marker = [getpos ((units _group) select 0),_position] call a3e_fnc_drawMapLine;
		_group setvariable ["a3e_debug_moveMarker",_marker,false];
	} else {
		[getpos leader _group,_position,_marker] call a3e_fnc_drawMapLine;
	};
};

if(count (waypoints _group) <= 1) then {
	_group addWaypoint [[0,0,0], 1];
};


[_group, 1] setWaypointPosition [_position, 1];
[_group, 1] setWaypointBehaviour _combatmode;
[_group, 1] setWaypointSpeed _speed;
[_group, 1] setWaypointFormation _formation;
[_group, 1] setWaypointType _type;
[_group, 1] setWaypointCompletionRadius 10;
[_group, 1] setWaypointStatements ["true", _onComplete];
_group setCurrentWaypoint [_group, 1];
//Return Waypoint
[_group, 1];