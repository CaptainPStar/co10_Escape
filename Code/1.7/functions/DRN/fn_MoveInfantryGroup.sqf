if (!isServer) exitWith {};
//This file is obsolete now!
private ["_unit", "_debug"];
private ["_destinationPos", "_worldSizeX", "_worldSizeY", "_group"];
private ["_waypoint", "_waypointFormations", "_formation"];

//This needs to be changed for stratis
//will need to be centred and decreased for efficiency
_worldSizeX = 30000;
_worldSizeY = 30000;

_unit = _this select 0;
if (count _this > 1) then {_debug = _this select 1;} else {_debug = false;};

_group = group _unit;
_searchRange = 5000;
_destinationPos = [((getPos _unit) select 0) - _searchRange + (random (2* _searchRange)), ((getPos _unit) select 1) - _searchRange + (random (2* _searchRange))];
while {surfaceIsWater [_destinationPos select 0, _destinationPos select 1]} do {
    _destinationPos = [((getPos _unit) select 0) - _searchRange + (random (2* _searchRange)), ((getPos _unit) select 1) - _searchRange + (random (2* _searchRange))];
};

_waypointFormations = ["COLUMN", "STAG COLUMN", "FILE", "DIAMOND"];
_formation = _waypointFormations select (floor random count _waypointFormations);

_waypoint = _group addWaypoint [_destinationPos, 0];
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointFormation _formation;
_waypoint setWaypointCompletionRadius 10;
_waypoint setWaypointStatements ["true", "_nil = [" + vehicleVarName _unit + ", " + str _debug + "] execVM ""Scripts\DRN\AmbientInfantry\MoveInfantryGroup.sqf"";"];
