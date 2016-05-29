private["_static","_gunner","_group","_side","_possibleInfantryTypes","_infantryType","_unit"];
_static = [_this,0,objNull] call bis_fnc_param;
_side = [_this,1,A3E_VAR_Side_Ind] call bis_fnc_param;

_group = createGroup _side;
_possibleInfantryTypes = a3e_arr_Escape_InfantryTypes;
switch (_side) do {
    case A3E_VAR_Side_Opfor: { _possibleInfantryTypes = a3e_arr_Escape_InfantryTypes;};
    case A3E_VAR_Side_Ind: {_possibleInfantryTypes = a3e_arr_Escape_InfantryTypes_Ind;};
};
if(!(isNull _static)) then {
	_infantryType = _possibleInfantryTypes select floor (random count _possibleInfantryTypes);
	_unit = _group createUnit [_infantryType, getpos _static, [], 0, "FORM"];    
	_unit assignAsGunner _static;
	_unit moveInGunner _static;
} else {
	_unit = objNull;
};
_unit;