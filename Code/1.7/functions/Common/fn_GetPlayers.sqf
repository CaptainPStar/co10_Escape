private["_list"];
//_modifier = [_this, 0, 1] call BIS_fnc_param;
_list = [];
{
	if(alive _x) then {
		_list pushBack _x;
	};
} foreach allPlayers;
_list;