diag_log "init Villages";

call drn_fnc_InitVillageMarkers; 

{
	private _zone = _x;
	[_zone] call A3E_fnc_initPatrolZone;
} foreach a3e_villageMarkers;