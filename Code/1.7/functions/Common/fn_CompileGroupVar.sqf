_group = _this select 0;

_nr = _group getvariable "a3e_GroupNumber";
if(isNil("_nr")) then {
	a3e_var_GrpNumber = a3e_var_GrpNumber +1;
	_nr = a3e_var_GrpNumber;
	_group setvariable ["a3e_GroupNumber",_nr,false];
};

//Compile Groupvar

_varname = format["a3e_Groupvar%1",_nr];
if(isNil(_varname)) then {
	player sidechat format["Compiling %1",_varname];
	call compile format["%1 = group (%2);",_varname,((units _group) select 0)];
} else {
	player sidechat format["%1 already compiled",_varname];
};
_varname;