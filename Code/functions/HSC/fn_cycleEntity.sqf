private["_list","_next","_index"];
_next = [_this,0,true] call bis_fnc_param;
_list = [];
_list = [] + AT_Revive_StaticRespawns;
_list pushBack player;
if(isMultiplayer) then {
	{
		if(_x != player) then {
			_list pushBack _x;
		};
	} foreach (units group player);
} else {
	_list pushBack Bob;
};
_index = _list find ATHSC_CamTarget;
if(_next) then {
	_index = _index + 1;
} else {
	_index = _index - 1;
};
if(_index>= count(_list)) then {
	_index = 0;
};
if(_index < 0) then {
	_index = count(_list)-1;
};
ATHSC_CamTarget = _list select _index;
[ATHSC_Perspective] call ATHSC_fnc_updatePerspective;
//systemchat format["Selected %1 (Pos %2 of %3)",ATHSC_CamTarget,_index,count(_list)];
ATHSC_AttempRespawn = false;