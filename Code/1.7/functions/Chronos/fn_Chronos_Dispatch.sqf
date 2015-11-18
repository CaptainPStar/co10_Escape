private["_process","_function","_callType","_timeout","_handle","_return"];
private["_lastCall","_time"];
_process = param[0];
_index = param[1];

_function = _process select 0;
_callType = _process select 1;
_time = _process select 2;
_lastCall = _process select 3;
_timeout = _process select 4;
_handle = _process select 5;
	


if(_calltype == "call") then {
	switch (typename _function) do {
		case "STRING": {
			call compile format["call %1;",_function];
		};
		case "CODE": {
			call _function;
		};
		default { 
			diag_log "Warning: Unknown datatype as chronos function."; 
		};
	};
} else {
	switch (typename _function) do {
		case "STRING": {
			_return = call compile format["_return = [] spawn %1;_return",_function];
		};
		case "CODE": {
			_return = [] spawn _function;
		};
		default { 
			diag_log "Warning: Unknown datatype as chronos function."; 
		};
	};
	(A3E_CronProcesses select _index) set [5,_return];
};
if(_timeout) then {
	A3E_CronProcesses deleteAt _index;
} else {
	(A3E_CronProcesses select _index) set [3,diag_tickTime];
};
