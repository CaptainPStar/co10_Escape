private["_marker","_knownPosition","_lastTime","_acc"];

_knownPosition = _this select 0;
if(a3e_debug_lastKnownPosition) then {
	_markername = format["KnownPosition_%1_%2",floor(getpos _knownPosition select 0),floor(getpos _knownPosition select 1)];
	_marker = createMarker [_markername,getpos _knownPosition];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot";
	_marker setMarkerColor "ColorYellow";
};
while{true} do {
	_lastTime = _knownPosition getvariable "A3E_LastUpdated";
	_acc = _knownPosition getvariable "A3E_Accuracy";
	if(a3e_debug_lastKnownPosition) then {
	_marker setmarkerpos getpos _knownPosition;
	_marker setmarkertext format["Seen %1 sec ago (Acc: %2)",(diag_tickTime-_lastTime),_acc];
	};
	if((diag_tickTime-_lastTime)>300) exitwith {};
	sleep 10;
}; 
if(a3e_debug_lastKnownPosition) then {
	deletemarker _marker;
};
deletevehicle _knownPosition;