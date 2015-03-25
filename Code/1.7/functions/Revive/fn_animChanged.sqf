private["_unit","_anim","_injured","_ended","_success"];
_unit = _this select 0;
_anim = _this select 1;
if(count(_unit getvariable "AT_isHealing")>0 && _anim == "AinvPknlMstpSnonWrflDr_medicEnd") then {
	_injured = (_unit getvariable "AT_isHealing") select 0;
	_ended = (_unit getvariable "AT_isHealing") select 1;
	_success = (_unit getvariable "AT_isHealing") select 2;
	
	if(!_ended) then {
		_unit setvariable ["AT_isHealing",[_injured,true,false],true];
		player sidechat "Healing aborted";
	} else {
		player sidechat "Anim changed but healing was successful";
	};
} else {
	player sidechat format["Wrong Anim Change: %1",_anim];
};