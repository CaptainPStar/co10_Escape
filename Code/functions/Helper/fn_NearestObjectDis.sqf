private["_list","_minDis","_dis"];
_pos = [_this, 0, [], [[]], [2,3]] call BIS_fnc_param;
_list = [_this, 1, [], [[]]] call BIS_fnc_param;
if(count(_list)==0) exitwith {};
_minDis = (_list select 0) distance _pos;
{
	_dis = (_x distance _pos);
	if(_dis<_minDis) then {
		_minDis = _dis;
	};
} forEach _list;

_minDis;