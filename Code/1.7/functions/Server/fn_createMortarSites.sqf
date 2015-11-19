if(!isserver) exitwith {};

private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount"];

_positions = [];
_i = 0;

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

if(isNil("A3E_MortarSiteCountMax")) then {
	A3E_MortarSiteCountMax = 6;
};
if(isNil("A3E_MortarSiteCountMin")) then {
	A3E_MortarSiteCountMin = 4;
};
A3E_MortarSiteCountMin = A3E_MortarSiteCountMin * Param_Artillery;
A3E_MortarSiteCountMax = A3E_MortarSiteCountMax * Param_Artillery;
_mortarSiteCount = A3E_MortarSiteCountMin + random (A3E_MortarSiteCountMax-A3E_MortarSiteCountMin);

_regionCount = ceil(_mortarSiteCount/4);
while {count _positions < _mortarSiteCount} do {
    _isOk = false;
    _j = 0;

    while {!_isOk} do {
        _pos = call A3E_fnc_findFlatArea;
        _isOk = true;


        if (_pos select 0 <= ((getpos center) select 0) && _pos select 1 > ((getpos center)select 1)) then {
            if (_countNW <= _regionCount) then {
                _countNW = _countNW + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 > ((getpos center) select 1)) then {
            if (_countNE <= _regionCount) then {
                _countNE = _countNE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 <= ((getpos center) select 1)) then {
            if (_countSE <= _regionCount) then {
                _countSE = _countSE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 <= ((getpos center)select 0) && _pos select 1 <= ((getpos center) select 1)) then {
            if (_countSW <= _regionCount) then {
                _countSW = _countSW + 1;
            }
            else {
                _isOk = false;
            };
        };

        _j = _j + 1;
        if (_j > 100) then {
            _isOk = true;
        };
    };

    _tooCloseAnotherPos = false;

	//Check if too close to another depot, comcenter or start
	{
        if (_pos distance _x < A3E_ClearedPositionDistance) then {
            _tooCloseAnotherPos = true;
        };
    } foreach A3E_Var_ClearedPositions;


    if (!_tooCloseAnotherPos) then {
        _positions pushBack  _pos;
		A3E_Var_ClearedPositions pushBack _pos;
    };

    _i = _i + 1;
    if (_i > 100) exitWith {
        _positions
    };
};

{	
	[_x] call A3E_fnc_MortarSite;
	_playergroup = [] call A3E_fnc_getPlayerGroup;
	[_playergroup, "A3E_MortarSitePatrolMarker", A3E_VAR_Side_Opfor, "INS", 1, 1, 2, Param_EnemySkill, Param_EnemySkill, Param_EnemySpawnDistance, false] spawn drn_fnc_InitGuardedLocations;
} foreach _positions;