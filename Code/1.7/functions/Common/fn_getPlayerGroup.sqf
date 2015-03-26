private["_group"];
//_modifier = [_this, 0, 1] call BIS_fnc_param;

if(isMultiplayer) then {
	_group = grpNull;
	{
		if((isPlayer _x)) exitwith {
			_group = group _x;
		};
	} foreach playableUnits;
} else {
	_group = group player;
};

_group