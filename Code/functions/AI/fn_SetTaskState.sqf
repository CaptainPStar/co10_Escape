private["_group","_state"];
_group = _this select 0;
_state = _this select 1;

_group setvariable ["A3E_TaskState",_state,false];

//[format["Ambient AI: %1 is now in state %2",_group,_state]] call a3e_fnc_debugmsg;