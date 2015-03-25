private ["_i", "_startPos", "_isOk", "_result", "_roadSegments", "_dummyObject","_mapsize"];
_isOk = false;
while {!_isOk} do {
	_mapsize = (getpos NorthEast) vectorDiff (getpos SouthWest);
	_startPos = (getpos SouthWest) vectoradd [random (_mapsize select 0),random (_mapsize select 1),0];

    _result = _startPos isFlatEmpty [5, 0, 0.25, 1, 0, false, objNull];
    _roadSegments = _startPos nearRoads 30;
                _buildings = _startPos nearObjects 30;

    if ((count _result > 0) && (count _roadSegments == 0) && (!surfaceIsWater _startPos) && (count _buildings == 0)) then {
                        _startPos = _result;

       if (count(_result nearObjects ["House",50])==0) then {
           _isOk = true;
       };
    };
};
[_startPos select 0,_startPos select 1,0]