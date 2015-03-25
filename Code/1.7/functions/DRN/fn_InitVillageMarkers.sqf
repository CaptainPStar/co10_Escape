call compile preprocessFileLineNumbers ("Island\VillageMarkers" + ".sqf");

drn_fnc_VillageMarkers_PutVillageMarkersOnMap = {
	private ["_showMarkers"];
	private ["_markerName", "_villageIndex"];

	if (count _this > 0) then {_showMarkers = _this select 0;} else {_showMarkers = true};
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
	} foreach drn_villageMarkers;
};

if (isServer) then {
	[false] call drn_fnc_VillageMarkers_PutVillageMarkersOnMap;
};

drn_var_villageMarkersInitialized = true;
