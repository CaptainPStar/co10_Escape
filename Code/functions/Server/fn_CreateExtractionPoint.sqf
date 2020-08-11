params["_markerNo","_extractionType"];
diag_log format["fn_CreateExtractionPoint: Type is %1",_extractionType];

private _markertype = "air";
switch (_extractionType) do {
		case "air": {
			_markertype = "A3E_HeliExtractionPos";
		};
		case "sea": {
			_markertype = "A3E_BoatExtractionPos";
		};
		case "land": {
			_markertype = "A3E_CarExtractionPos";
		};
};
	
private _markerName = _markertype + str _markerNo;
private _markerName2 = _markertype + str _markerNo + "_1";


private _location = "Land_HelipadEmpty_F" createvehicle (getMarkerPos _markerName);
private _location2 = "Land_HelipadEmpty_F" createvehicle (getMarkerPos _markerName2);
private _location3 = "Land_TacticalBacon_F" createvehicle (getMarkerPos _markerName);

//_location setvariable ["A3E_ExtractionOnStandby",true];

//private _isWater = surfaceIsWater (getMarkerPos _markerName);

private _code = compile format["[%1,""%2"",_this] call A3E_fnc_firedNearExtraction;",_markerNo,_extractionType];

_location3 addeventhandler["firedNear",_code];
diag_log format["fn_CreateExtractionPoint: eventhandler added at %1",(getpos _location)];
diag_log format["%1",(str _code)];