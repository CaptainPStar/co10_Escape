private ["_communicationCenterMarkers", "_comCenNo", "_comCenMarkerNames", "_markerCoreName", "_markerName", "_instanceNo", "_marker", "_minEnemies", "_maxEnemies", "_chosenComCenIndexes", "_index", "_comCenPositions", "_comCenItem", "_distanceBetween", "_currentPos", "_tooClose", "_pos", "_scriptHandle"];

_comCenMarkerNames = [];
_comCenNo = 1;
_markerCoreName = "drn_var_communicationCenter";
_markerName = _markerCoreName + str _comCenNo;

private["_index","_chosenComCenIndexes","_commCentreMarkers"];
_chosenComCenIndexes = [];

_distanceBetween = A3E_MinComCenterDistance;

if(isNil("drn_arr_communicationCenterMarkers")) then {
    drn_arr_communicationCenterMarkers = [];
	diag_log "Warning: Comcenter Templatearray was empty!";
};
_commCentreMarkers = [] + drn_arr_communicationCenterMarkers;

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
		if (_pos distance _x < A3E_MinComCenterDistance) then {
			_ok = false;
		};
	} foreach _comCenPositions;
	if (_pos distance drn_startPos < A3E_MinComCenterDistance) then {
			_ok = false;
	};
	if(_ok) then {
		[_pos, _dir,drn_arr_ComCenStaticWeapons,drn_arr_ComCenParkedVehicles] call a3e_fnc_BuildComCenter;
		["drn_CommunicationCenterMapMarker" + str _instanceNo,_pos,"flag_CSAT"] call A3E_fnc_createLocationMarker;

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
drn_var_Escape_communicationCenterPositions = _comCenPositions;
publicVariable "drn_var_Escape_communicationCenterPositions";