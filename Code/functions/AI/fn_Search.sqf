private["_group","_targetposition","_searchRange","_oncomplete","_destinationPos","_waypoint"];
if(!isserver) exitwith {};

_group = _this select 0;
_targetposition = _this select 1;

_oncomplete = "";


[_group,"SAD"] call a3e_fnc_SetTaskState;

_oncomplete = format["if(isserver) then {[group this] spawn a3e_fnc_Patrol;};"];



_waypoint = [_group,_targetposition,"SAD","LINE","FULL","COMBAT",_oncomplete] call a3e_fnc_move;

if(!isNil("_waypoint")) then {
	_waypoint setWaypointTimeout [0, 20, 6];
};