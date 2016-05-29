if(isserver) then {
	if(isNil("A3E_CronTimer")) then {
		A3E_CronTimer = 0;
	};
	if(isNil("A3E_CronTime")) then {
		A3E_CronTime = 1; //s
	};
	if(isNil("A3E_CronProcesses")) then {
		A3E_CronProcesses= [];
	};
	if(isNil("A3E_CronTick")) then {
		A3E_CronTick=true;
	};

	private["_DTrg"];
	//_DTrg="EmptyDetector" createvehicle [0,0,0];
	_DTrg=createvehicle ["EmptyDetector",[0,0,0],false];
	_DTrg setTriggerArea[0,0,0,true];
	_DTrg setTriggerActivation["NONE","PRESENT",true];
	_DTrg setTriggerStatements["diag_tickTime>=A3E_CronTimer && A3E_CronTick",  "[] call a3e_fnc_chronos_run;A3E_CronTick = false;", "A3E_CronTick = true;"]; 
};