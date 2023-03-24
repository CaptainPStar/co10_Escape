private["_marker","_size","_pos","_shape","_dir","_x_pos","_y_pos","_a","_b","_i"];
_marker = [_this, 0, "noMarker", [""]] call BIS_fnc_param;


_size = getMarkerSize _marker;
_shape = markerShape _marker;
_area = 0;

if(_shape == "ELLIPSE") then {
    _area = 3.141*(_size select 0)*(_size select 1);
} else {
    _area = 4*(_size select 0)*(_size select 1);
};
_area=_area/1000000;
_area;