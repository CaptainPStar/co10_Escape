private["_group","_position","_type","_formation","_speed","_combatmode","_onComplete","_script","_marker","_markername"];

_group = [_this,0,grpNull,[grpNull]] call bis_fnc_param;
_position = [_this,1,[0,0,0],[[]]] call bis_fnc_param;
_type = [_this,2,"MOVE",[""]] call bis_fnc_param;
_formation = [_this,3,"COLUMN",[""]] call bis_fnc_param;
_speed = [_this,4,"LIMITED",[""]] call bis_fnc_param;
_combatmode = [_this,5,"SAFE",[""]] call bis_fnc_param;
_onComplete = [_this,6,"",[""]] call bis_fnc_param;

(units _group) doFollow (leader _group);

if(count (waypoints _group) <= 1) then {
	_group addWaypoint [[0,0,0], 1];
};


[_group, 1] setWaypointPosition [_position, 1];
[_group, 1] setWaypointBehaviour _combatmode;
[_group, 1] setWaypointSpeed _speed;
[_group, 1] setWaypointFormation _formation;
[_group, 1] setWaypointType _type;

if(vehicle (leader _group) != (leader _group)) then {
	[_group, 1] setWaypointCompletionRadius 25;
} else {
	[_group, 1] setWaypointCompletionRadius 10;
};


[_group, 1] setWaypointStatements ["true", _onComplete];
_group setCurrentWaypoint [_group, 1];
//Return Waypoint
[_group, 1];