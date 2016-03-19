private["_marker","_trigger","_activation"];
params["_markerName","_markerPosition","_markerType",["_color","ColorRed"],["_hidden",false]];

_marker = createMarker [_markerName, _markerPosition];
_marker setMarkerShape "ICON";
_marker setMarkerColor _color;

if(Param_RevealMarkers == 0) then {
		_marker setMarkerType _markerType;
};
if(Param_RevealMarkers == 1 && !_hidden) then {
		_marker setMarkerType "hd_unknown";
		_trigger = createTrigger["EmptyDetector", _markerPosition];
		_trigger setTriggerArea[200, 200, 0, false];
		_trigger setTriggerActivation[A3E_VAR_Side_Blufor_Str, "PRESENT", false];
		_activation = format["%1 setmarkerType %2;",str _marker,str _markerType];
		_trigger setTriggerStatements["this && isserver",_activation ,""];
	};
if(Param_RevealMarkers == 2 || _hidden) then {
		_marker setMarkerType "Empty";
		_trigger = createTrigger["EmptyDetector", _markerPosition];
		_trigger setTriggerArea[200, 200, 0, false];
		_trigger setTriggerActivation["GROUP", "PRESENT", false];
		_trigger triggerAttachVehicle ([] call A3E_FNC_getPlayers);
		_activation = format["%1 setmarkerType %2;",str _marker,str _markerType];
		_trigger setTriggerStatements["this && isserver",_activation ,""];
	};
if(Param_RevealMarkers == 3) then {
		deleteMarker _marker;
	};
if(Param_RevealMarkers>3) then {
	diag_log "Unknown type of Param_RevealMarkers";
};