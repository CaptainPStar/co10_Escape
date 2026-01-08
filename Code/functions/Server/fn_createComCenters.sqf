if(!isserver) exitwith {};

if (isNil "A3E_MinComCenterDistance") then {
	A3E_MinComCenterDistance = 2000;
};

if (isNil "a3e_communicationCenterMarkers") then {
    a3e_communicationCenterMarkers = [];
	diag_log "Warning: Comcenter Templatearray was empty!";
};

private _comCenterMarkers = [] + a3e_communicationCenterMarkers;

if (isNil "A3E_ComCenterCount") then {
	A3E_ComCenterCount = 4;
};

//Shuffle comcenters
private _shuffledComCenterMarkers = [];
while {(count _comCenterMarkers) > 0} do {
	_shuffledComCenterMarkers pushBack (_comCenterMarkers deleteAt floor(random(count(_comCenterMarkers))));
};

// iterate over the set of all potential commcenter markers and make commCenters at no more than A3E_ComCenterCount of them.
//
// This ensures that the Comm Centres are never any less than A3E_MinComCenterDistance from each other or the starting point.
private _createdCount = 0;
private _comCenPositions = [];
private _instanceNo = 0;
{
	_x params ["_pos", "_dir"];
	private _ok = true;
	{
		if ((_pos distance _x) < A3E_MinComCenterDistance) then {
			_ok = false;
		};
	} foreach _comCenPositions;

	if ((_pos distance A3E_StartPos) < A3E_MinComCenterDistance) then {
			_ok = false;
	};

	if _ok then {
		// pick one of the BuildComCenter methods at random
		private _ComCenterTemplates = missionnamespace getvariable ["A3E_ComCenterTemplates",["a3e_fnc_BuildComCenter","a3e_fnc_BuildComCenter2","a3e_fnc_BuildComCenter3","a3e_fnc_BuildComCenter4","a3e_fnc_BuildComCenter5"]];
		[[_pos, _dir, a3e_arr_ComCenStaticWeapons, a3e_arr_ComCenParkedVehicles], _ComCenterTemplates] call A3E_fnc_callRandomFunction;

		A3E_Var_ClearedPositions pushBack _pos;
		[format ["drn_CommunicationCenterMapMarker%1", _instanceNo], _pos, "o_hq"] call A3E_fnc_createLocationMarker;

		private _marker = createMarkerLocal [format ["drn_CommunicationCenterPatrolMarker%1", _instanceNo], _pos];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerAlphaLocal 0;
		_marker setMarkerSizeLocal [75, 75];

		_instanceNo = _instanceNo + 1;
		_createdCount = _createdCount + 1;
		_comCenPositions pushBack _pos;
	};
	if (_createdCount >= A3E_ComCenterCount) exitWith {};
} forEach _shuffledComCenterMarkers;

a3e_var_Escape_communicationCenterPositions = _comCenPositions;

{
	[_x,80,selectRandom[A3E_VAR_Side_Opfor],"COMCENTER"] call A3E_fnc_initLocationZone;
} foreach _comCenPositions;

publicVariable "a3e_var_Escape_communicationCenterPositions";

[[] call A3E_fnc_GetPlayerGroup, _comCenPositions, A3E_Param_EnemySpawnDistance, A3E_Param_EnemyFrequency] call drn_fnc_Escape_InitializeComCenArmor;
