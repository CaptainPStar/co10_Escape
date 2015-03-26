private["_list"];
//_modifier = [_this, 0, 1] call BIS_fnc_param;

if(isMultiplayer) then {
	_list = [];
	{
		if(isPlayer _x) then {
			_list pushBack _x;
		};
	} foreach playableUnits;
} else {
	_list = units group player;
};

_list;