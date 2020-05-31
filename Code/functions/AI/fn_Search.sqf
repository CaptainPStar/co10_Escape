private["_group","_targetposition","_searchRange","_oncomplete","_destinationPos","_waypoint","_homeMarker"];

_group = _this select 0;
_targetposition = _this select 1;

_oncomplete = "";


[_group,"SAD"] call a3e_fnc_SetTaskState;


	_homeMarker = _group getvariable "a3e_homeMarker";
	if(!isNil("_homeMarker")) then {
		_oncomplete = format["[group this,""%1""] spawn a3e_fnc_Patrol;",_homeMarker];
	} else {
		_oncomplete = "[group this,nil] spawn a3e_fnc_Patrol;";
	};


_waypoint = [_group,_targetposition,"SAD","LINE","FULL","AWARE",_oncomplete] call a3e_fnc_move;

if(!isNil("_waypoint")) then {
	_waypoint setWaypointTimeout [0, 20, 6];
};