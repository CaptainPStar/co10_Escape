//Execute with
//TotalComCenterCount = 46;
//_nil = [TotalComCenterCount] execVM "buildall.sqf";
_TotalComCenterCount = _this select 0;
_comCenNo = 1;
_markerCoreName = "drn_var_communicationCenter";

while {_comCenNo <= _TotalComCenterCount} do {

_markerName = _markerCoreName + str _comCenNo;
drn_comCen = _markername;
_nil = [getMarkerPos drn_comCen, markerDir drn_comCen] execVM "Scripts\Escape\BuildCommunicationCenter.sqf";
_comCenNo = _comCenNo + 1;

	_pos = getmarkerpos drn_comCen;
	_marker = createMarker ["drn_CommunicationCenterMapMarker" + str _comCenNo, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "flag_CSAT";
};