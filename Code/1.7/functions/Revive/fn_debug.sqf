private["_msg","_threshold"];
_msg = [_this, 0, "Missing Debugstring", [""]] call BIS_fnc_param;
_threshold =  [_this, 1, 1, [0]] call BIS_fnc_param;
if(false) then {
    player globalchat format["%1",_msg];
};


