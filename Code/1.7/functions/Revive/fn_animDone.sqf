private["_unit","_anim","_injured","_ended","_success"];
_unit = _this select 0;
_anim = _this select 1;
if(count(_unit getvariable "AT_isHealing")>0 && _anim == "AinvPknlMstpSnonWrflDr_medic2") then {
		if(!((_unit getvariable "AT_isHealing") select 1)) then {
			_injured = (_unit getvariable "AT_isHealing") select 0;
			_ended = (_unit getvariable "AT_isHealing") select 1;
			_success = (_unit getvariable "AT_isHealing") select 2;
			_unit setvariable ["AT_isHealing",[_injured,true,true],true];
		};
};