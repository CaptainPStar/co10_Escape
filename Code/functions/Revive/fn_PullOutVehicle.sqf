private _vehicle = cursortarget;
{
	if((_x getVariable ["AT_Revive_isUnconscious",false])) exitwith {
		_x setUnconscious false;
		moveout _x;
		_x setUnconscious true;
	};
} foreach (crew _vehicle);