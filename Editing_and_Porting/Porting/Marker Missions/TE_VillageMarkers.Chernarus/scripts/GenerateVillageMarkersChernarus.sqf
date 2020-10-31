if (!isServer) exitWith {};

private ["_markerPreName", "_markerNo", "_markerName", "_fncMarkerExists", "_debug", "_item", "_code"];

_markerPreName = _this select 0;
if (count _this > 1) then {_debug = _this select 1;} else {_debug = false;};

drn_villageMarkers = [];

_fncMarkerExists = {
	private ['_exists', '_marker'];
	_marker = _this select 0;
	_exists = false;
	if (((getMarkerPos _marker) select 0) != 0 || ((getMarkerPos _marker) select 1 != 0)) then {
		_exists = true;
	};
	_exists
};

_markerNo = 1;
_markerName = _markerPreName + str _markerNo;

while {[_markerName] call _fncMarkerExists} do {

	drn_villageMarkers set [count drn_villageMarkers, _markerName];

	_markerNo = _markerNo + 1;
	_markerName = _markerPreName + str _markerNo;
};


diag_log """drn_villageMarkers = [];""";

{
	_item = (str getMarkerPos _x) + ", """ + markerShape _x + """, " + str markerDir _x + ", " + str markerSize _x;
	_code = """drn_villageMarkers set [count drn_villageMarkers, [" + _item + "]];""";

	diag_log _code;

} foreach drn_villageMarkers;

//player setPos getMarkerPos (_subCarMarkers select (count _subCarMarkers - 1));

if (_debug) then {
	player sideChat (str count drn_villageMarkers) + " generated.";
};


