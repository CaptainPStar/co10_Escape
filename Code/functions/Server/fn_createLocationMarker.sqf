private["_marker","_trigger","_activation"];
params["_markerName","_markerPosition","_markerType",["_color","ColorRed"],["_hidden",false]];

_marker = createMarker [_markerName, _markerPosition];
_marker setMarkerShape "ICON";
_marker setMarkerColor _color;

if(isNil("A3E_POIs")) then {
	A3E_POIs = [];
};

//private _hidden = true;
private _unknown = true;
private _accuracy = 0;
if(Param_RevealMarkers == 0) then {
		_marker setMarkerType _markerType;
};
if(Param_RevealMarkers == 1 && !_hidden) then {
		_marker setMarkerType "hd_unknown";
		_trigger = createTrigger["EmptyDetector", _markerPosition, false];
		_trigger setTriggerInterval 5;
		_trigger setTriggerArea[200, 200, 0, false];
		_trigger setTriggerActivation[A3E_VAR_Side_Blufor_Str, "PRESENT", false];
		_activation = format["[%1,true] spawn A3E_fnc_UpdateLocationMarker;",str _marker];
		_trigger setTriggerStatements["this",_activation ,""];
	};
if(Param_RevealMarkers == 2 || _hidden) then {
		_hidden = true; //true for all markers when reveal == 2 or hidden from param (wrecks)
		_marker setMarkerType "hd_unknown";
		_marker setMarkerAlpha 0;
		_trigger = createTrigger["EmptyDetector", _markerPosition, false];
		_trigger setTriggerInterval 5;
		_trigger setTriggerArea[200, 200, 0, false];
		_trigger setTriggerActivation["GROUP", "PRESENT", false];
		_trigger triggerAttachVehicle [([] call A3E_FNC_getPlayers) select 0];
		_activation = format["[%1,true] spawn A3E_fnc_UpdateLocationMarker;",str _marker];
		_trigger setTriggerStatements["this",_activation ,""];
	};
if(Param_RevealMarkers == 3) then {
		_marker setMarkerType "Empty";
		_marker setMarkerAlpha 0;
	};
if(Param_RevealMarkers>3) then {
	diag_log "Unknown type of Param_RevealMarkers";
};

A3E_POIs pushBack [_marker,_markerType,_color,_markerPosition,_hidden,_unknown,_accuracy];