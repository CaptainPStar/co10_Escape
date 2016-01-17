player addAction ["<t color=""#cccc00"">" + "Hack Terminal" + "</t>", "_this call A3E_fnc_Hijack;", [], 9, false, true, "", "call at_fnc_checkTerminalHack"];

at_fnc_checkTerminalHack = {
	_return = false;
	_target = cursorTarget;
	if(isNull _target) exitwith {false;};
	if((player distance _target)>3) exitwith {false;};
		if(_target getvariable ["A3E_isTerminal",false]) then {
			if(!(_target getvariable ["A3E_Terminal_Hacked",false])) then {_return = true;};
		};
	_return;
};

player addAction ["<t color=""#cc0000"">" + "Heal" + "</t>", "_this call A3E_fnc_HealAtBuilding;", [], 9, false, true, "", "call at_fnc_checkHealAtBuilding"];

at_fnc_checkHealAtBuilding = {
	_return = false;
	_target = cursorTarget;
	if(isNull _target) exitwith {false;};
	if((player distance _target)>3) exitwith {false;};
		if(typeof _target == "Land_Medevac_House_V1_F") then {
			_return = true;
		};
	_return;
};