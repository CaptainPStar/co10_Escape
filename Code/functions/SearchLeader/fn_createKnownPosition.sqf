params["_detectedUnitsPosition","_accuracy"];

private _knownPositionHelperObject = missionNamespace getvariable ["a3e_var_knownPositionHelperObject","Land_HelipadEmpty_F"];
private _knownPositionMinDistance =  missionNamespace getvariable ["a3e_var_knownPositionMinDistance",100];

private _knownPosition = objNull;
private _knownPositions =  missionNamespace getvariable ["A3E_KnownPositions",[]];

private _list = _knownPositions select {(_x distance _detectedUnitsPosition)<= _knownPositionMinDistance};

if(count(_list)==0) then {
	_knownPosition = createVehicle [_knownPositionHelperObject, _detectedUnitsPosition, [], 0, "CAN_COLLIDE"];
	_knownPosition setvariable["A3E_LastUpdated",diag_tickTime,true];
	_knownPosition setvariable["A3E_Accuracy",_accuracy,true];
	_knownPosition setvariable["A3E_FirstSight",diag_tickTime,true];
	_knownPosition setvariable["A3E_NumOfReports",1,true];
	[_knownPosition] spawn A3E_fnc_watchKnownPosition;
	//[_knownPosition] spawn a3e_fnc_OrderSearch;
} else {
	_knownPosition = (_list select 0);					
	_knownPosition setpos _detectedUnitsPosition;
	_knownPosition setvariable["A3E_LastUpdated",diag_tickTime,true];
	_knownPosition setvariable["A3E_Accuracy",_accuracy,true];
	private _numRep = _knownPosition getvariable["A3E_NumOfReports",1];
	_knownPosition setvariable["A3E_NumOfReports",_numRep+1,true];
	_firstsight = _knownPosition getvariable ["A3E_FirstSight",diag_tickTime];
};
