//############################
// Register a function or code to chronos scheduling system
// Param1: Function or Code
// Param2: Call or Spawn (Default Spawn)
// Param3: Interval of calling the function or timeout
// Param4: true, when Timeout (Single call; Default: false) 
//############################

private["_function","_calltype","_time","_isTimeout","_lastCall"];

_function = [_this, 0, ""] call BIS_fnc_param;
_calltype = [_this, 1, "spawn"] call BIS_fnc_param;
_time = [_this, 2, 1] call BIS_fnc_param;
_isTimeout = [_this, 3, false] call BIS_fnc_param;
_lastCall = diag_tickTime;
A3E_CronProcesses pushBack [_function,_calltype, _time, _lastCall, _isTimeout,scriptNull];