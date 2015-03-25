private["_group","_state"];
_group = _this select 0;
_state = _this select 1;

_group setvariable ["a2e_TaskState",_state,false];

if(a3e_debug_aistate) then {
	player sidechat format["%1 is now in state %2",_group,_state];
};