at_fnc_checkTerminalHack = {
	private _return = false;
	private _target = cursorTarget;
	if(isNull _target) exitwith {false;};
	if((player distance _target)>3) exitwith {false;};
		if(_target getvariable ["A3E_isTerminal",false]) then {
			if(!(_target getvariable ["A3E_Terminal_Hacked",false])) then {_return = true;};
		};
	_return;
};


at_fnc_checkHealAtBuilding = {
	private _return = false;
	private _target = cursorTarget;
	if(isNull _target) exitwith {false;};
	if((player distance _target)>3) exitwith {false;};
		if(typeof _target == "Land_Medevac_House_V1_F") then {
			_return = true;
		};
	_return;
};

A3E_localvar_HackAction = player addAction [format ["<t color=""#cccc00"">%1</t>", localize "STR_A3E_action_hackTerminal"], "_this call A3E_fnc_Hijack;", [], 9, false, true, "", "call at_fnc_checkTerminalHack"];
A3E_localvar_HealAction = player addAction [format ["<t color=""#cc0000"">%1</t>", localize "STR_A3E_action_heal"], "_this call A3E_fnc_HealAtBuilding;", [], 9, false, true, "", "call at_fnc_checkHealAtBuilding"];
