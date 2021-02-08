private["_group","_targetposition","_searchRange","_oncomplete","_destinationPos","_waypoint","_homeMarker"];
if(!isserver) exitwith {};

_group = _this select 0;
_targetposition = _this select 1;

_oncomplete = "";


[_group,"FLEE"] call a3e_fnc_SetTaskState;


	
_oncomplete = "if(isserver) then {[group this] spawn a3e_fnc_Patrol;};";



_waypoint = [_group,_targetposition,"MOVE","LINE","FULL","AWARE",_oncomplete] call a3e_fnc_move;

if(!isNil("_waypoint")) then {
	_waypoint setWaypointTimeout [0, 0, 0];
};