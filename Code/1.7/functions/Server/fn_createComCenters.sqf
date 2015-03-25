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
    };
_commCentreMarkers = drn_arr_communicationCenterMarkers;

    if(isNil("A3E_ComCenterCount")) then {
            A3E_ComCenterCount = 5;
    };

while {count _chosenComCenIndexes < A3E_ComCenterCount && count _commCentreMarkers > 0} do {

    _index = floor(random(count(_commCentreMarkers)));
            _currentPos = (_commCentreMarkers select _index) select 0;


    if (!(_index in _chosenComCenIndexes)) then {
        _currentPos = (_commCentreMarkers select _index) select 0;

        _tooClose = false;
        {		
            //Sometimes this try to access out of boundary!
            _pos = (_commCentreMarkers select _x) select 0;
            if (_pos distance _currentPos < _distanceBetween) then {
                _tooClose = true;
            };
            if (_currentPos distance drn_startPos < _distanceBetween) then {
                _tooClose = true;
            };
        } foreach _chosenComCenIndexes;

        if (!_tooClose) then {
            _chosenComCenIndexes set [count _chosenComCenIndexes, _index];
        } else {
            _commCentreMarkers = _commCentreMarkers - [_commCentreMarkers select _index];
        };
    };
};
 _comCenPositions = [];
 _instanceNo = 0;
{
    private ["_index"];
    private ["_pos", "_dir"];

    _index = _x;
    _comCenItem = drn_arr_communicationCenterMarkers select _index;

    _pos = _comCenItem select 0;
    _dir = _comCenItem select 1;
    _comCenPositions set [count _comCenPositions, _pos];

    //scriptHandle = 
    [_pos, _dir,drn_arr_ComCenStaticWeapons,drn_arr_ComCenParkedVehicles] call a3e_fnc_BuildComCenter;
    //waitUntil {scriptDone _scriptHandle};

    _marker = createMarker ["drn_CommunicationCenterMapMarker" + str _instanceNo, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "flag_CSAT";


    _marker = createMarkerLocal ["drn_CommunicationCenterPatrolMarker" + str _instanceNo, _pos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlpha 0;
    _marker setMarkerSizeLocal [75, 75];

    _instanceNo = _instanceNo + 1;
} foreach _chosenComCenIndexes;

drn_var_Escape_communicationCenterPositions = _comCenPositions;
publicVariable "drn_var_Escape_communicationCenterPositions";
    