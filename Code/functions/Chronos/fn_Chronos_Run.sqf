private["_time","_debug"];
_debug = true;
systemchat str A3E_CronTimer;
A3E_CronTimer = diag_tickTime + A3E_CronTime;
{
	private["_function","_callType","_timeout","_handle","_lastCall","_time"];
	_function = _x select 0;
	_callType = _x select 1;
	_time = _x select 2;
	_lastCall = _x select 3;
	_timeout = _x select 4;
	_handle = _x select 5;
	

	if(diag_tickTime>=(_lastCall+_time)) then {
		systemchat "Calling function";
		if(_callType=="call") then {
			[_x,_foreachindex] call a3e_fnc_chronos_dispatch;
		} else {
			if(_callType == "spawn" && scriptDone _handle) then {
				[_x,_foreachindex] call a3e_fnc_chronos_dispatch;
			} else {
				systemchat format["A script is running too slow: %1",str _function];
			};
		};
	};
} foreach A3E_CronProcesses;

