// findFlatAreaNear: finds a flat area near a given position.
// 
// Parameters:
//   _center_pos        the center of the area to search
//
//   max_offset_radius  the radius defining the search area in meters
//                      (default is 1000)
//                                     
//   _flat_area_radius  the radius of the area of flatness to search for
//                      in meters (default is 3)
//                                     
//   _gradient          the max allowed slope over flat_area_radius 
//                      in meters/meter (default is 0.1)
//                                     
//   _max_tries         max number of tries before
//                      giving up (default is infinite)
//
// Returns:
//   a 2D map location representing the center of the flat area, or an empty
//   array if no suitable location is found.

params [ "_center_pos",
        ["_max_offset_radius", 1000],
        ["_flat_area_radius", 3], 
        ["_gradient", 0.1],
        ["_max_tries", 0]];

private _position_was_found = false;
private _max_tries_exceeded = false;
private _check_max_tries = (_max_tries > 0);
private _ii = 0;
private _result = nil;
private _done = false;

while {!_done} do {
    private _offset = [random _max_offset_radius, random _max_offset_radius, 0];
    private _pos = _center_pos vectorAdd _offset;
    
    _result = _pos isFlatEmpty [5, 0, _gradient, _flat_area_radius, 0, false, objNull];

    private _road_segments = _pos nearRoads 30;
    private _buildings = _pos nearObjects 30;

    _position_was_found = call {count _result > 0} && {count _road_segments == 0} && 
                               {!surfaceIsWater _pos} && {count _buildings == 0} &&
                               {count(_result nearObjects ["House", 50]) == 0};
    _ii = _ii + 1;
    if (_check_max_tries) then {
        _max_tries_exceeded = (_ii >= _max_tries);
    };
    _done = _position_was_found || (_check_max_tries && _max_tries_exceeded);
};

if (!_position_was_found) then {
    _result = [];
};

// TODO: integrate this into a general purpose common debug logging system
// [["flat area: took %1 tries to find position %2", _ii, _result], 1] call A3E_fnc_debugLog;
_result;


