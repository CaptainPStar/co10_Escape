private["_msg","_side"];

_msg = [_this, 0, "Empty message", [""]] call BIS_fnc_param;
_side = [_this, 1, A3E_VAR_Side_Blufor, [sideUnknown]] call BIS_fnc_param;
[_side,"HQ"] SideChat _msg;