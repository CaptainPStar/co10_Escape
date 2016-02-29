// Find Flat area: picks a random location on the map, then searches
// for a flat area within a grid of +/- _offset_radius. The "radius"
// is meant in the sense of "chessboard" (or Chebyshev) distance (in
// other words, the region searched is always a square).
// 
// 
// Parameters:
//   _flat_area_radius         (default is 3):  the radius of the area of
//                                              flatness to search for
//
//   _offset_radius         (default is 1000):  the radius of the search area
//                                              after a random map point is
//                                              selected (meters)
//
//   _gradient               (default is 0.1):  the max allowed gradient over
//                                              the flatness radius
//
//   _max_tries_within_grid (default is 1000):  the maximum number of random
//                                              locations in the grid square
//                                              to search
// 
//  _max_num_search_areas   (default is 1000):  the maximum number of areas 
//                                              to search before giving up
//                                              altogether. A value of 0 will 
//                                              indicate to try forever.
// 
// Returns:
//   a 2D map location representing the center of the flat area, or an empty
//   array if no suitable location is found.

params [["_flat_area_radius", 3],
        ["_offset_radius", 200],
        ["_gradient", 0.1],
        ["_max_tries_within_grid", 1000],
        ["_max_num_search_areas", 0]];


// southwest corner of the map
private _sw = (getPos SouthWest) vectorAdd [_offset_radius, _offset_radius, 0];
// northeast corner of the map
private _ne = (getPos NorthEast) vectorDiff [_offset_radius, _offset_radius, 0];

private _mapsize = _ne vectorDiff _sw;

private _final_pos = [];

private _ii = 0;
private _max_num_search_areas_excceded = false;

// keep looping until a position is found or until max
while {0 == (count _final_pos)} do {
    private _init_pos = _sw vectoradd [random (_mapsize select 0), random (_mapsize select 1), 0];
    // TODO: integrate this into a general purpose common debug logging system
    // [["flat area: searching position %1, try #%2", _init_pos, _ii], 1] call A3E_fnc_debugLog;
    private _arg_vector = [_init_pos, _offset_radius, _flat_area_radius, _gradient, _max_tries_within_grid];
    _final_pos =  _arg_vector call A3E_fnc_findFlatAreaNear;
    _ii = _ii + 1;
    if (_ii > _max_num_search_areas) then {
        _max_num_search_areas_excceded = true;
    };
};

// error case, return [] if not found
private _retval = [];

if (_max_num_search_areas_excceded) then {
    // convert to 2D position vector
    _retval = [_final_pos select 0, _final_pos select 1, 0]
};

_retval;
