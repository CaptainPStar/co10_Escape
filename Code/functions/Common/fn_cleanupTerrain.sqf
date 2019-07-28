// A3E_fnc_cleanupTerrain
//
// Removes all the objects within the radius distance of the _position specified on all clients.
//
// This creates a bunch of JIP remoteExec's so it can be a touch expensive
//
// Usage: [<position list>, <radius>] call A3E_fnc_cleanupTerrain
params [["_position", [], [[]], 3], ["_radius", 0, [0]]];

{
	[_x, true] remoteExec ["hideObject", 0, true];
} forEach nearestTerrainObjects [_position, [], _radius, false, true];
