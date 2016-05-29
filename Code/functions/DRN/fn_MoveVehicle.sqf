if (!isServer) exitWith {};

private ["_vehicle", "_firstDestinationPos", "_debug"];
private ["_speed", "_roadSegments", "_destinationSegment"];
private ["_destinationPos"];
private ["_waypoint", "_fuel"];

_vehicle = _this select 0;
if (count _this > 1) then {_firstDestinationPos = _this select 1;} else {_firstDestinationPos = [];};
if (count _this > 2) then {_debug = _this select 2;} else {_debug = false;};

/*
if (count _firstDestinationPos > 0) then {
    sleep random 30;
};
*/

// Set fuel to something in between 0.5 and 0.9.
_fuel = 0.2 + random (0.9 - 0.2);
_vehicle setFuel _fuel;

if (count _firstDestinationPos > 0) then {
    _destinationPos = + _firstDestinationPos;
}
else {
	_roadSegments = [];
	//#### What is petPos? Does we have pets now in Escape? Should be getPos... but Pets are a nice idea indeed :D
	//_refPos = petPos _vehicle;
	_refPos = getPos _vehicle;
    while {count _roadSegments == 0} do {
    	_trafficLocation = floor random 8;
        switch (_trafficLocation) do {
			case 0: { _roadSegments = ([(_refPos select 0) + 5000, (_refPos select 1) + 5000]  ) nearRoads 1500; };
			case 1: { _roadSegments = ([(_refPos select 0) - 5000, (_refPos select 1) + 5000] ) nearRoads 1500; };
	 		case 2: { _roadSegments = ([(_refPos select 0) + 5000, (_refPos select 1) - 5000] ) nearRoads 1500; };
			case 3: { _roadSegments = ([(_refPos select 0) - 5000, (_refPos select 1) - 5000] ) nearRoads 1500; };
			case 4: { _roadSegments = ([(_refPos select 0), (_refPos select 1) + 7071]  ) nearRoads 1500; };
			case 5: { _roadSegments = ([(_refPos select 0), (_refPos select 1) - 7071] ) nearRoads 1500; };
	 		case 6: { _roadSegments = ([(_refPos select 0) + 7071, (_refPos select 1)] ) nearRoads 1500; };
			case 7: { _roadSegments = ([(_refPos select 0) - 7071, (_refPos select 1)] ) nearRoads 1500; };
		};
	};
    _destinationSegment = _roadSegments select floor random count _roadSegments;
    _destinationPos = getPos _destinationSegment;
};

_speed = "NORMAL";
if (_vehicle distance _destinationSegment < 500) then {
    _speed = "LIMITED";
};

_waypoint = group _vehicle addWaypoint [_destinationPos, 10];
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointCompletionRadius 10;
_waypoint setWaypointStatements ["true", "_nil = [" + vehicleVarName _vehicle + ", [], " + str _debug + "] spawn drn_fnc_MoveVehicle;"];


