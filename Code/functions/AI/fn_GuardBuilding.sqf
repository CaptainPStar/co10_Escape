private["_group","_markername","_searchRange","_oncomplete","_destinationPos","_waypoint","_leader","_players"];
params["_group",["_markerName","noMarker"]];

if(!isserver) then {
	diag_log "Escape Warning: AI patrol script executed locally.";
};
_oncomplete = "";

if(_markerName == "noMarker") then {
	_markerName = _group getvariable ["a3e_homeMarker","noMarker"];
};

_oncomplete = format["if(isserver) then {[group this,""%1""] spawn A3E_FNC_Guard;};",_markerName];


_Building = [(getpos leader _group)] call A3E_fnc_getRndBuildingWithPositions;



if(count(_Building)>0) then {
	_Building params["_BuildingObject","_BuildingPositions"];
	_positionIndex = floor(random(count(_BuildingPositions)));
	_BuildingPos = _BuildingPositions select _positionIndex;
	
	private["_list"];
	_list = nearestObjects [(_BuildingPos select 0), ["Man"], 1];
	if(( count _list)==0) then {
		_waypoint = [_group,position _BuildingObject,_BuildingObject,_positionIndex,"MOVE","COLUMN","LIMITED","SAFE",_oncomplete] call A3E_fnc_MoveInBuilding;
	} else {
		_movePos = [(getpos _BuildingObject select 0) + (random 50) - 25,(getpos _BuildingObject select 1) + (random 50) - 25,0];
		_waypoint = [_group,_movePos,"MOVE","COLUMN","LIMITED","SAFE",_oncomplete] call a3E_fnc_move;
	};
	
	_waypoint setWaypointTimeout [10, 30, 60];
	[_group,"GARRISONED"] call a3e_fnc_SetTaskState;
} else {
	//No Building near. Do normal patrol duty
	[_group,_markerName] spawn A3E_fnc_Guard;
};