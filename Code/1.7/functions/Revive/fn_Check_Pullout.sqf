private _vehicle = cursortarget;
private _return = false;
{
	if((_x getVariable ["AT_Revive_isUnconscious",false]) && (_x != _vehicle)) exitwith {
		_return = true;
	};
} foreach (crew _vehicle);
_return;