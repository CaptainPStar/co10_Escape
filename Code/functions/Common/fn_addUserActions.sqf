// Terminal Hack Action Check
at_fnc_checkTerminalHack = {
    private _return = false;
    private _target = cursorObject;
    if (!isNull _target) then {
        player reveal _target; // Force reveal for engine optimization workaround
        if ((player distance _target) <= 3) then {
            if (_target getVariable ["A3E_isTerminal",false] && {!(_target getVariable ["A3E_Terminal_Hacked",false])}) then {
                player setVariable ["A3E_CurrentTerminal", _target];
                _return = true;
            } else {
                player setVariable ["A3E_CurrentTerminal", nil];
            };
        } else {
            player setVariable ["A3E_CurrentTerminal", nil];
        };
    } else {
        player setVariable ["A3E_CurrentTerminal", nil];
    };
    _return;
};

// Healing Action Check
at_fnc_checkHealAtBuilding = {
    private _return = false;
    private _target = cursorObject;
    if (!isNull _target) then {
        player reveal _target; // Force reveal for consistency
        if ((player distance _target) <= 3) then {
            if (typeof _target == "Land_Medevac_House_V1_F") then {
                _return = true;
            };
        };
    };
    _return;
};

// Add Actions (Localized)
A3E_localvar_HackAction = player addAction [
    format ["<t color=""#cccc00"">%1</t>", localize "STR_A3E_action_hackTerminal"], 
    "_this call A3E_fnc_Hijack;", 
    [], 
    9, 
    false, 
    true, 
    "", 
    "call at_fnc_checkTerminalHack"
];

A3E_localvar_HealAction = player addAction [
    format ["<t color=""#cc0000"">%1</t>", localize "STR_A3E_action_heal"], 
    "_this call A3E_fnc_HealAtBuilding;", 
    [], 
    9, 
    false, 
    true, 
    "", 
    "call at_fnc_checkHealAtBuilding"
];