params["_zoneIndex"];

private _zone = A3E_Zones select _zoneIndex;

private _active = _zone get "active";
private _initialized = _zone get "initialized";
private _marker = _zone get "marker";
if(_active && _initialized) then {
	_marker setMarkerColor "ColorRed";
	
	if(A3E_Debug) then {
		_marker setMarkerAlpha 0.5;
	} else {
		_marker setMarkerAlpha 0;
	};
	[_zoneIndex] call A3E_fnc_SerializeZoneGroups;
	_zone set ["active",false];

	
	//Delete trigger if this zone was completely cleared
	if(_zone getorDefault ["markedfordeletion",false]) then {
		deletevehicle _trigger;
		_marker setMarkerColor "ColorWhite";
		[format ["Zone %1 deleted",_zoneIndex],["Zones"]] call a3e_fnc_log;
	};
};