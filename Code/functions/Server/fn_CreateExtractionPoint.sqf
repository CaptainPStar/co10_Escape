params["_markerNo"];


private _markerName = "A3E_ExtractionPos" + str _markerNo;
private _markerName2 = "A3E_ExtractionPos" + str _markerNo + "_1";


private _location = "Land_HelipadEmpty_F" createvehicle (getMarkerPos _markerName);
private _location2 = "Land_HelipadEmpty_F" createvehicle (getMarkerPos _markerName2);
private _location3 = "Land_TacticalBacon_F" createvehicle (getMarkerPos _markerName);

//_location setvariable ["A3E_ExtractionOnStandby",true];

private _isWater = surfaceIsWater (getMarkerPos _markerName);

private _code = compile format["[%1,%2,_this] call A3E_fnc_firedNearExtraction;",_markerNo,_isWater];

_location3 addeventhandler["firedNear",_code];
diag_log format["fn_CreateExtractionPoint: eventhandler added at %1",(getpos _location)];
diag_log format["%1",(str _code)];