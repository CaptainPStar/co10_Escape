player addAction ["<t color=""#cccc00"">" + "Hack Terminal" + "</t>", "Scripts\Escape\Hijack.sqf", [], 9, false, true, "", "call at_fnc_checkTerminalHack"];

at_fnc_checkTerminalHack = {
	_return = false;
	_target = cursorTarget;
	if(isNull _target) exitwith {false;};
	if((player distance _target)>3) exitwith {false;};
		if(typeof _target == "Land_PowerGenerator_F") then {
			if(!(_target getvariable ["A3E_Terminal_Hacked",false])) then {_return = true;};
		};
	_return
}
