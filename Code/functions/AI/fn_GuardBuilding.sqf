private["_group","_markername","_searchRange","_oncomplete","_destinationPos","_waypoint","_leader","_players"];
params["_group",["_markerName","noMarker"]];
if(!isserver) then {
	diag_log "Escape Warning: AI patrol script executed locally.";
};
_oncomplete = "";

if(_markerName == "noMarker") then {
	_markerName = _group getvariable ["a3e_homeMarker","noMarker"];
};

[_group,"GARISSONED"] call a3e_fnc_SetTaskState;

	
if(_markerName != "noMarker") then {
	
	private _buildingsPositions = [_markerName] call a3e_fnc_getBuildingsInMarker;
	if(count(_buildingsPositions)==0) then {
		["A group tasked with guarding a building has buildings near. Going on guard duty instead.",["AI","Spawning"]] call A3E_fnc_Log;
		[_group,_markerName] call A3E_fnc_Guard;
	} else {
	private _pos = selectRandom _buildingsPositions;
	private _posIndex = -1;
	private _posHouse = objNull;
	private _lastPos = [0,0,0];
	{
		private _building = _x;
		{
			if((_lastPos distance _pos) > (_x distance _pos)) then {
				_lastPos = _x;
				_posHouse = _building;
				_posIndex = _forEachIndex;
			};
		} foreach (_x buildingPos -1);
	} foreach nearestObjects [_pos, ["House", "Building"], 50, true];
	
	_oncomplete = format["if(isserver) then {[group this,""%1""] spawn a3e_fnc_GuardBuilding;};",_markerName];
	
	_group setvariable ["a3e_homeMarker",_markerName,false];
	
	
	if(count (waypoints _group) <= 1) then {
		_group addWaypoint [[0,0,0], 1];
	};


	[_group, 1] setWaypointPosition [_position, 1];
	[_group, 1] setWaypointBehaviour "SAFE";
	[_group, 1] setWaypointSpeed "LIMITED";
	[_group, 1] setWaypointFormation "COLUMN";
	[_group, 1] setWaypointType "MOVE";
	[_group, 1] setWaypointHousePosition _posIndex;
	[_group, 1] waypointAttachObject _posHouse;
	[_group, 1] setWaypointCompletionRadius 0;
	[_group, 1] setWaypointStatements ["true", _oncomplete];
	[_group, 1] setWaypointTimeout [20, 60, 120];
	_group setCurrentWaypoint [_group, 1];
	

	//Return Waypoint
	[_group, 1];
	
	};
} else {
	["A group tasked with guarding a building has no home marker. Going on patrol.",["AI","Spawning"]] call A3E_fnc_Log;
	[_group] call A3E_fnc_Patrol;
};

