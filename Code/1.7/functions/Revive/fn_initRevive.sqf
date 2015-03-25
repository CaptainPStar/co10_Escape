private["_unit","_script"];

_unit = _this select 0;
if((local _unit)) then {
		player sidechat "Init Revive";
		_unit setvariable["AT_isConscious",(alive _unit),true];
		_unit setvariable ["AT_isHealing",[],true];
		_unit setvariable ["AT_isCrawling",false,false];
		
		//_script = [_unit] spawn at_fnc_consciousHandler;
		//_unit setvariable ["AT_ConsciousScript",_script,false];
		
		DumVar = _unit addeventhandler ["Respawn",{_this call at_fnc_respawn;}];
		DumVar = _unit addeventhandler ["HandleDamage",{_this call at_fnc_handleDamage;}];
		DumVar = _unit addeventhandler ["Killed",{_this call at_fnc_killed;}];
		_unit setvariable ["AT_Revive_Action",-1,false];
	};


//};
