if(isserver) then {
	if(isNil("A3E_CronTimer")) then {
		A3E_CronTimer = 0;
	};
	if(isNil("A3E_CronTime")) then {
		A3E_CronTime = 5; //s
	};
	if(isNil("A3E_CronProcesses")) then {
		A3E_CronProcesses= [];
	};
	if(isNil("A3E_CronTick")) then {
		A3E_CronTick=true;
	};
	if(isNil("A3E_CronTrigger")) then {
		A3E_CronTrigger = objNull; //
	};
	private["_trigger"];

	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval A3E_CronTime;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", true];
	_trigger setTriggerTimeout [0, 0, 0, false];
	_trigger setTriggerStatements["A3E_CronTick", "A3E_CronTick = false; [] call a3e_fnc_chronos_run;", "A3E_CronTick = true;"];
	
	A3E_CronTrigger = _trigger;
};