if(!isserver) exitwith {};

private ["_occupiedPositions"];
private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_maxDistance", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount"];

_occupiedPositions = [];
_positions = [];
_i = 0;
_maxDistance = 1000;

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

if(isNil("A3E_AmmoDepotCount")) then {
            A3E_AmmoDepotCount = 8;
    };
_regionCount = ceil(A3E_AmmoDepotCount/4);
while {count _positions < A3E_AmmoDepotCount} do {
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
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 > ((getpos center)select 1)) then {
            if (_countNE <= _regionCount) then {
                _countNE = _countNE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 <= ((getpos center)select 1)) then {
            if (_countSE <= _regionCount) then {
                _countSE = _countSE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 <= ((getpos center)select 0) && _pos select 1 <= ((getpos center)select 1)) then {
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
    {
        if (_pos distance _x < _maxDistance) then {
            _tooCloseAnotherPos = true;
        };
    } foreach _positions;

    if (!_tooCloseAnotherPos) then {
        {
            if (_pos distance _x < _maxDistance) then {
                _tooCloseAnotherPos = true;
            };
        } foreach _occupiedPositions;
    };

    if (!_tooCloseAnotherPos) then {
        _positions set [count _positions, _pos];
    };

    _i = _i + 1;
    if (_i > 100) exitWith {
        _positions
    };
};


{
    [_x,a3e_arr_Escape_AmmoDepot_StaticWeaponClasses,a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses] call A3E_fnc_AmmoDepot;
} foreach _positions;