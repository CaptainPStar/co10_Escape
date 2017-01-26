private _vehicle = cursortarget;
{
	if((_x getVariable ["AT_Revive_isUnconscious",false])) exitwith {
		moveout _x;
	};
} foreach (crew _vehicle);