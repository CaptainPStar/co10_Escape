private["_group","_markername","_searchRange","_oncomplete","_destinationPos","_waypoint","_leader"];
if(!isserver) exitwith {};

_group = _this select 0;
_markerName = _this select 1;

_oncomplete = "";

[_group,"PATROL"] call a3e_fnc_SetTaskState;

private["_counter"];
_counter = 0;
	
_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
//player sidechat _markerName;
while {!(surfaceIsWater [_destinationPos select 0, _destinationPos select 1])  && _counter<50} do {
	_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
	_counter = _counter + 1;
};

_oncomplete = format["if(isserver) then {group this,""%1""] spawn a3e_fnc_AquaticPatrol;};",_markerName];
_group setvariable ["a3e_homeMarker",_markerName,false];




_waypoint = [_group,_destinationPos,"MOVE","COLUMN","NORMAL","AWARE",_oncomplete] call a3e_fnc_move;
if(!isNil("_waypoint")) then {
	_waypoint setWaypointTimeout [0, 30, 60];
};