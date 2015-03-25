private["_static","_gunner","_group","_side","_possibleInfantryTypes","_infantryType","_unit"];
_static = [_this,0,objNull] call bis_fnc_param;
_side = [_this,1,resistance] call bis_fnc_param;

_group = createGroup _side;
_possibleInfantryTypes = drn_arr_Escape_InfantryTypes;
switch (_side) do {
    case east: { _possibleInfantryTypes = drn_arr_Escape_InfantryTypes;};
    case resistance: {_possibleInfantryTypes = drn_arr_Escape_InfantryTypes_Ind;};
};
_infantryType = _possibleInfantryTypes select floor (random count _possibleInfantryTypes);
_unit = _group createUnit [_infantryType, getpos _static, [], 0, "FORM"];    
_unit assignAsGunner _static;
_unit moveInGunner _static;
_unit;