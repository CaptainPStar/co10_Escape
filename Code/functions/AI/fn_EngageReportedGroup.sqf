private["_group","_lastPosition","_leader","_lastSeen","_accuracy","_position","_markername","_marker"];

_group = _this select 0;
_lastKnownPosition = _this select 1;
_lastPosition = getpos _lastKnownPosition;

_leader = (leader _group);
{
	if(alive _leader) exitwith {};
	_leader = _x;
} foreach (units _group);


_lastSeen = diag_tickTime - (_lastKnownPosition getvariable ["A3E_LastUpdated",diag_tickTime]);
_accuracy = _lastSeen * 2;
_position = [((getpos _lastKnownPosition) select 0) + (random _accuracy - random _accuracy),((getpos _lastKnownPosition) select 1) + (random _accuracy - random _accuracy),0];

[_group,_position] call a3e_fnc_move;

if(A3E_Debug) then {
	_markername = format["Investigate%1",_group];
	_marker = createMarker [_markername,_position];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot";
	_marker setMarkerColor "ColorRed";
	_marker setmarkerText format["%1 investigates",_group];
};


while{true} do {
	if(_lastSeen > 300) exitwith {};
	_lastSeen = diag_tickTime - (_lastKnownPosition getvariable ["A3E_LastUpdated",diag_tickTime]);	
	if(!([_group] call A3E_fnc_InCombat)) then {
		if(_lastSeen > 200) exitwith {};
		_accuracy = _lastSeen * 2;
		_position = [((getpos _lastKnownPosition) select 0) + (random _accuracy - random _accuracy),((getpos _lastKnownPosition) select 1) + (random _accuracy - random _accuracy),0];


		[_group,_position] call a3e_fnc_move;

		if(A3E_Debug) then {
			_marker setmarkerpos _position;
		};
	};
	sleep random 60;
	if(isNil("_group")) exitwith {};
};

if(A3E_Debug) then {
	deletemarker _marker;
};