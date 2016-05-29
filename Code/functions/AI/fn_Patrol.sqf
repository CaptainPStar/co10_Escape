private["_group","_markername","_searchRange","_oncomplete","_destinationPos","_waypoint","_leader","_players"];
if(!isserver) exitwith {};

_group = _this select 0;
_markerName = _this select 1;

_oncomplete = "";

[_group,"PATROL"] call a3e_fnc_SetTaskState;

if(!isNil("_markerName")) then {
	_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
	while {surfaceIsWater [_destinationPos select 0, _destinationPos select 1]} do {
		_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
	};
	_oncomplete = format["[group this,""%1""] spawn a3e_fnc_Patrol;",_markerName];
	
	_group setvariable ["a3e_homeMarker",_markerName,false];

} else {
	_leader = (leader _group);
	_searchRange = 3000;
	_players = [] call A3E_fnc_GetPlayers;
	_destinationPos = [_players,_searchRange] call a3e_fnc_RandomPatrolPos;
	if(str _destinationPos == "[0,0,0]") then {
		_destinationPos = getpos _leader;
	};
	
	private["_counter"];
	_counter = 0;
	while {(_destinationPos distance _leader)>(_searchRange*1.5) && _counter<100} do {
			_destinationPos = [_players,_searchRange] call a3e_fnc_RandomPatrolPos;
			_counter = _counter + 1;
	};
	_oncomplete = "[group this,nil] spawn a3e_fnc_Patrol;";
};

_waypoint = [_group,_destinationPos,"MOVE","COLUMN","LIMITED","SAFE",_oncomplete] call a3e_fnc_move;
if(!isNil("_waypoint")) then {
	_waypoint setWaypointTimeout [0, 20, 6];
};