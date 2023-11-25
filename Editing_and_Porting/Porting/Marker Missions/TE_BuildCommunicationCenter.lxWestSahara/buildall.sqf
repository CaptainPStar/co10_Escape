//Execute with
//_nil = [] execVM "buildall.sqf";
private ["_markerCoreName"];
private ["_comCenNo", "_markerName"];

_comCenNo = 1;
_markerCoreName = "a3e_var_communicationCenter_";
_markerName = _markerCoreName + str _comCenNo;



_i = 0;
while {[_markerName] call drn_fnc_CL_MarkerExists} do {

	drn_comCen = _markername;
	_nil = [getMarkerPos drn_comCen, markerDir drn_comCen] execVM "Scripts\Escape\BuildCommunicationCenter.sqf";

	_pos = getmarkerpos drn_comCen;
	_marker = createMarker ["drn_CommunicationCenterMapMarker" + str _comCenNo, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "flag_CSAT";
	
	_comCenNo = _comCenNo + 1;
	_markerName = _markerCoreName + str _comCenNo;
	_i = _i + 1;
};

player sideChat (str _i + " ComCenters built.");