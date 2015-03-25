private ["_params", "_action"];

_params = _this select 3;
_action = _params select 0;

if (_action == "revive") exitwith
{
	[cursorTarget] spawn AT_FNC_Revive_HandleRevive;
};

if (_action == "drag") exitwith
{
	[cursorTarget] spawn AT_FNC_Revive_Drag;
};

if (_action == "release") exitwith
{
	[] spawn AT_FNC_Revive_Release;
};