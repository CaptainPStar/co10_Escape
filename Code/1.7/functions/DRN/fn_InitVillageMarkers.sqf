call compile preprocessFileLineNumbers ("Island\VillageMarkers.sqf");

if (isServer) then {

	if(isNil "a3e_villageMarkers") exitwith {
		["Village markers not found!"] call BIS_fnc_error;
	};
	private ["_showMarkers"];
	private ["_markerName", "_villageIndex"];

	_showMarkers = A3E_Debug;
	_villageIndex = 0;

	{
		private ["_marker", "_pos", "_shape", "_dir", "_size"];

		_markerName = "drn_villageMarker" + str _villageIndex;

		_pos = _x select 0;
		_dir = _x select 1;
        _shape = _x select 2;
		_size = _x select 3;

		_marker = createMarkerLocal [_markerName, _pos];
		
		if (!_showMarkers) then {
			_marker setMarkerAlphaLocal 0;
		};

		_marker setMarkerShapeLocal _shape;
		_marker setMarkerDirLocal _dir;
		_marker setMarkerSizeLocal _size;

		_villageIndex = _villageIndex + 1;
	} foreach a3e_villageMarkers;
	a3e_var_villageMarkersInitialized = true;
};
