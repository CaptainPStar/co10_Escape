private["_marker"];


params["_knownPosition"];

if(isNil("A3E_KnownPositions")) then {
	A3E_KnownPositions = [];
};

A3E_KnownPositions pushBack _knownPosition;

if(a3e_debug) then {
	_markername = format["KnownPosition_%1_%2",floor(getpos _knownPosition select 0),floor(getpos _knownPosition select 1)];
	_marker = createMarker [_markername,getpos _knownPosition];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot";
	_marker setMarkerColor "ColorYellow";
};
while{true} do {
	private _lastTime = _knownPosition getvariable ["A3E_LastUpdated",0];
	private _acc = _knownPosition getvariable ["A3E_Accuracy",0];
	if(a3e_debug) then {
		_marker setmarkerpos getpos _knownPosition;
		_marker setmarkertext format["Seen %1 sec ago (Acc: %2)",(diag_tickTime-_lastTime),_acc];
	};
	if((diag_tickTime-_lastTime)>300) exitwith {};
	sleep 10;
}; 
if(a3e_debug) then {
	deletemarker _marker;
};
A3E_KnownPositions deleteAt (A3E_KnownPositions find _knownPosition);
deletevehicle _knownPosition;