private ["_markerBaseName", "_arrayName", "_markerStartNo"];
private ["_markerNo", "_markerName", "_i", "_isIcon"];

_markerBaseName = "drn_var_communicationCenter";
_arrayName = "drn_arr_communicationCenterMarkers";
_markerStartNo = 1;

_markerNo = _markerStartNo;
_markerName = _markerBaseName + str _markerNo;

diag_log ("""" + _arrayName + " = [];""");

_isIcon = false;
if (markerShape _markerName == "ICON") then {
	_isIcon = true;
};

_i = 0;
while {[_markerName] call drn_fnc_CL_MarkerExists} do {
	if (_isIcon) then {
		diag_log ("""" + _arrayName + " set [" + str _i + ", [" + str (getMarkerPos _markerName) + ", " + str markerDir _markerName + "]];""");
	}
	else {
		diag_log ("""" + _arrayName + " set [" + str _i + ", [" + str (getMarkerPos _markerName) + ", " + str markerDir _markerName + ", """ + markerShape _markerName + """, " + str markerSize _markerName + "]];""");
	};

	_markerNo = _markerNo + 1;
	_markerName = _markerBaseName + str _markerNo;
	_i = _i + 1;
};

//diag_log ("""" + _arrayName + "Initialized = true;""");
//diag_log ("""publicVariable """ + _arrayName + "Initialized"";""");

player sideChat (str _i + " markers generated.");
