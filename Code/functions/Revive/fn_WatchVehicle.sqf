params["_vehicle","_null","_unit"];

if(local _unit && (_unit getVariable ["AT_Revive_isUnconscious",false])) then {
	private _hnd = [_unit] spawn ATR_FNC_ragdoll;
	waituntil{scriptDone _hnd};
	sleep 0.5;
	[_unit,"AinjPpneMstpSnonWrflDnon"] remoteExec ["switchmove", 0, false];
};