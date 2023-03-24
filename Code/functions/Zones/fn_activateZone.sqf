private _zoneIndex = _this select 0;
["Activating zone " + str _zoneIndex,["Zones","Spawning"]] call a3e_fnc_log;

_zone = A3E_Zones select _zoneIndex;

private _active = _zone get "active";
private _initialized = _zone get "initialized";
if(!(_active)) then {
	private _marker = _zone get "marker";
	
	_marker setMarkerColor "ColorYellow";
	if(A3E_Debug) then {
		_marker setMarkerAlpha 0.5;
	} else {
		_marker setMarkerAlpha 0;
	};
	
	if(!_initialized) then {
		private _onInit = _zone get "oninit";
		[_zoneIndex] call (missionNamespace getvariable _onInit);
		_zone set ["active",true];
		_zone set ["initialized",true];

	} else {
		[_zoneIndex] call A3E_fnc_DeserializeZoneGroups;
		_zone set ["active",true];
	};
};