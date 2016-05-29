params["_target"];

_target enableSimulation true;
_target allowDamage true;
_target setDammage 0;
_target setFatigue 0;
_target setCaptive false;
[_target,false] remoteExec ["hideObject", 0, false];
_target setVariable ["AT_Revive_isUnconscious", false, true];
_target setVariable ["AT_Revive_isDragged", objNull, true];
_target setVariable ["AT_Revive_isDragging",objNull,true];
[_target,""] remoteExec ["switchMove", 0, false];
if(AT_Revive_Camera==1) then {
	[] call athsc_fnc_exit;
};