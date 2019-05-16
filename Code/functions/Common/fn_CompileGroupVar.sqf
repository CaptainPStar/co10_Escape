params ["_group"];

private _nr = _group getvariable "a3e_GroupNumber";
if(isNil("_nr")) then {
	a3e_var_GrpNumber = a3e_var_GrpNumber +1;
	_nr = a3e_var_GrpNumber;
	_group setvariable ["a3e_GroupNumber",_nr,false];
};

private _varname = format["a3e_Groupvar%1",_nr];
if isNil _varname then {
	missionNamespace setVariable [_varname, _group];
} else {
	player sidechat format["%1 already compiled",_varname];
};
_varname;