params["_position","_radius"];

private["_list"];
_list = [];
_list = nearestTerrainObjects [_position, [], _radius];

{
	[_x,true] remoteExec ["hideObject",0]; 
} foreach _list;
