private["_marker"];
params["_knownPosition"];

private _knownPositions =  missionNamespace getvariable ["A3E_KnownPositions",[]];
_knownPositions pushBack _knownPosition;
missionNamespace setvariable ["A3E_KnownPositions",_knownPositions];

private _debug = A3E_Debug;

if(_debug) then {
	_markername = format["KnownPosition_%1_%2",floor(getpos _knownPosition select 0),floor(getpos _knownPosition select 1)];
	_marker = createMarker [_markername,getpos _knownPosition];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot";
	_marker setMarkerColor "ColorYellow";
};
while{true} do {
	private _lastTime = _knownPosition getvariable ["A3E_LastUpdated",0];
	private _acc = _knownPosition getvariable ["A3E_Accuracy",0];
	private _num = _knownPosition getvariable ["A3E_NumOfReports",1];
	if(_debug) then {
		_marker setmarkerpos getpos _knownPosition;
		_marker setmarkertext format["%1 sec ago (#%2 Acc: %3)",(diag_tickTime-_lastTime),_num, parseNumber (_acc toFixed 2)];
	};
	if((diag_tickTime-_lastTime)>600) exitwith {};
	sleep 10;
}; 
if(_debug) then {
	deletemarker _marker;
};
A3E_KnownPositions deleteAt (A3E_KnownPositions find _knownPosition);
deletevehicle _knownPosition;