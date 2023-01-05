// A3E_fnc_cleanupTerrain
//
// Removes all the objects within the radius distance of the _position specified on all clients.
//
// This creates a bunch of JIP remoteExec's so it can be a touch expensive
//
// Usage: [<position list>, <radius>] call A3E_fnc_cleanupTerrain
params [["_position", [], [[]], 3], ["_radius", 0, [0]]];

//List of map classes to remove
private _list = [
"BUILDING",
"BUNKER",
"BUSH",
"CROSS",
"FENCE",
"FOREST",
"FORTRESS",
"FOUNTAIN",
"FUELSTATION",
//"HIDE", Birge pillars and special roads
"HOSPITAL",
"HOUSE",
"LIGHTHOUSE",
"POWER LINES",
"QUAY",
"ROCK",
"ROCKS",
"RUIN",
"SHIPWRECK",
"SMALL TREE",
"STACK",
"TOURISM"];

{
	[_x, true] remoteExec ["hideObject", 0, true];
} forEach nearestTerrainObjects [_position, _list, _radius, false, true];


