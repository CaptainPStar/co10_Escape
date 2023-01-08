private["_group","_markername","_searchRange","_oncomplete","_destinationPos","_waypoint","_leader","_players"];
params["_group",["_markerName","noMarker"]];
if(!isserver) then {
	diag_log "Escape Warning: AI patrol script executed locally.";
};
_oncomplete = "";

if(_markerName == "noMarker") then {
	_markerName = _group getvariable ["a3e_homeMarker","noMarker"];
};


if((random 100)<=35) then {

	//Switch randomly to House Patrol
	private _houses = nearestObjects [leader _group, ["House", "Building"], 50];
	if(count(_houses) > 0) exitwith {
		[_group,_markerName] spawn A3E_fnc_GuardBuilding;
	};
};


[_group,"GUARD"] call a3e_fnc_SetTaskState;

private["_counter"];
_counter = 0;
	
if(_markerName != "noMarker") then {
	_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
	while {surfaceIsWater [_destinationPos select 0, _destinationPos select 1]  && _counter<50} do {
		_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
		_counter = _counter + 1;
	};
	_oncomplete = format["if(isserver) then {[group this,""%1""] spawn a3e_fnc_Guard;};",_markerName];
	
	_group setvariable ["a3e_homeMarker",_markerName,false];

} else {
	["A group tasked with guarding has no home marker. Going on patrol.",["AI","Spawning"]] call A3E_fnc_Log;
	[_group] call A3E_fnc_Patrol;
};

_waypoint = [_group,_destinationPos,"MOVE","COLUMN","LIMITED","SAFE",_oncomplete] call a3e_fnc_move;
if(!isNil("_waypoint")) then {
	_waypoint setWaypointTimeout [0, 20, 6];
};