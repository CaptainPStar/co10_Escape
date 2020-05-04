
private _weightedArray = [];
{
    _x params ["_value", ["_weight", 1]];
    if !(_weight isEqualType 0) then {
        _value = _x;
        _weight = 1;
    };
    _weightedArray append [_value, _weight];
} forEach _this;

private _result = selectRandomWeighted _weightedArray;

if (_result isEqualType []) exitWith {
    // call recursively
    _result call A3E_fnc_selectRandomWeightedFromSet
};

_result
