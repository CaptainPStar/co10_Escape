private["_markerName","_markerPosition","_markerType","_marker","_trigger","_activation"];
_markerName = [_this,0] call bis_fnc_param;
_markerPosition = [_this,1] call bis_fnc_param;
_markerType = [_this,2] call bis_fnc_param;

_marker = createMarker [_markerName, _markerPosition];
_marker setMarkerShape "ICON";
_marker setMarkerColor "ColorRed";
if(Param_RevealMarkers == 0) then {
	_marker setMarkerType "hd_unknown";
	_trigger = createTrigger["EmptyDetector", _markerPosition];
	_trigger setTriggerArea[200, 200, 0, false];
	_trigger setTriggerActivation[A3E_VAR_Side_Blufor_Str, "PRESENT", false];
	_activation = format["%1 setmarkerType %2;",str _marker,str _markerType];
	_trigger setTriggerStatements["this && isserver",_activation ,""];
} else {
	_marker setMarkerType _markerType;
};

