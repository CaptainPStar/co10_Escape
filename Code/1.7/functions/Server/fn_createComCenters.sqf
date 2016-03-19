private ["_communicationCenterMarkers", "_comCenNo", "_comCenMarkerNames", "_markerCoreName", "_markerName", "_instanceNo", "_marker", "_minEnemies", "_maxEnemies", "_chosenComCenIndexes", "_index", "_comCenPositions", "_comCenItem", "_distanceBetween", "_currentPos", "_tooClose", "_pos", "_scriptHandle"];

_comCenMarkerNames = [];
_comCenNo = 1;
_markerCoreName = "a3e_var_communicationCenter";
_markerName = _markerCoreName + str _comCenNo;

private["_index","_chosenComCenIndexes","_commCentreMarkers"];
_chosenComCenIndexes = [];

if(isNil("A3E_MinComCenterDistance")) then {
	A3E_MinComCenterDistance = 2000;
};

if(isNil("a3e_communicationCenterMarkers")) then {
    a3e_communicationCenterMarkers = [];
	diag_log "Warning: Comcenter Templatearray was empty!";
};
_commCentreMarkers = [] + a3e_communicationCenterMarkers;

    if(isNil("A3E_ComCenterCount")) then {
            A3E_ComCenterCount = 4;
    };
//Shuffle comcenters
_suffledComCenterMarkers = [];
_totalMarkerCount = (count _commCentreMarkers);
while{count _commCentreMarkers>0} do {
	_suffledComCenterMarkers pushBack (_commCentreMarkers deleteAt floor(random(count(_commCentreMarkers))));
};
_createdCount = 0;
	
 _comCenPositions = [];
 _instanceNo = 0;
for [{_i=0},{_i<_totalMarkerCount},{_i=_i+1}] do {
	private["_ok","_pos","_dir"];
	_ok = true;
	_pos = (_suffledComCenterMarkers select _i) select 0;
	_dir = (_suffledComCenterMarkers select _i) select 1;
	{
		if ((_pos distance _x) < A3E_MinComCenterDistance) then {
			_ok = false;
		};
	} foreach _comCenPositions;
	if ((_pos distance A3E_StartPos) < A3E_MinComCenterDistance) then {
			_ok = false;
	};
	if(_ok) then {
		[_pos, _dir,a3e_arr_ComCenStaticWeapons,a3e_arr_ComCenParkedVehicles] call a3e_fnc_BuildComCenter;
		A3E_Var_ClearedPositions pushBack _pos;
		["drn_CommunicationCenterMapMarker" + str _instanceNo,_pos,"o_hq"] call A3E_fnc_createLocationMarker;

		_marker = createMarkerLocal ["drn_CommunicationCenterPatrolMarker" + str _instanceNo, _pos];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerAlpha 0;
		_marker setMarkerSizeLocal [75, 75];

		_instanceNo = _instanceNo + 1;
		_createdCount = _createdCount + 1;
		_comCenPositions pushBack _pos;
	};
	if (_createdCount>=A3E_ComCenterCount) exitWith {
	//Nothing
	};
};
a3e_var_Escape_communicationCenterPositions = _comCenPositions;
publicVariable "a3e_var_Escape_communicationCenterPositions";