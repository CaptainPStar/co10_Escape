if (!isServer) exitWith {};

private ["_markerNo", "_markerName"];

_markerNo = _this select 0;
_markerName = "drn_Escape_ExtractionPos" + str _markerNo;
//private _pos = getMarkerPos _markerName;

private _location = "Land_HelipadEmpty_F" createvehicle (getMarkerPos _markerName);

//_location setvariable ["A3E_ExtractionOnStandby",true];

private _code = compile format["[%1,_this] call A3E_fnc_firedNearExtraction;",_markerNo];

_location addeventhandler["firedNear",_code];

a3e_var_Escape_ExtractionMarkerNo = _markerNo;
publicVariable "a3e_var_Escape_ExtractionMarkerNo";
