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
"BUSSTOP",
"CHAPEL",
"CHURCH",
"CROSS",
"FENCE",
//"FOREST BORDER",
//"FOREST SQUARE",
//"FOREST TRIANGLE",
"FOREST",
"FORTRESS",
"FOUNTAIN",
"FUELSTATION",
//"HIDE", Birge pillars and special roads
"HOSPITAL",
"HOUSE",
"LIGHTHOUSE",
"POWER LINES",
"POWERSOLAR",
"POWERWAVE",
"POWERWIND",
"QUAY",
//"RAILWAY",
"ROCK",
"ROCKS",
"RUIN",
"SHIPWRECK",
"SMALL TREE",
"STACK",
"TOURISM",
"TRANSMITTER",
"TREE",
"VIEW-TOWER",
"WALL",
"WATERTOWER"];

{
	[_x, true] remoteExec ["hideObjectGlobal", 0, true];
} forEach nearestTerrainObjects [_position, _list, _radius, false, true];


