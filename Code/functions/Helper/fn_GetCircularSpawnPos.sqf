params[["_minDis",1000],["_maxDis",2000],["_mode","NONE"]];
private _list = [] call A3E_fnc_GetPlayers;

private _return = [];


if(time<6) then {
	_minDis = 300;
};
for "_x" from 1 to 10 do {
	private _reference = getposASL (selectRandom _list);
	_distance = _minDis + random(_maxDis-_minDis);
	_dir = random 360;
	private _pos = [_reference,_minDis,_maxDis,_mode] call A3E_fnc_GetRandomCirclePosition;
	if(count(_pos)==3) then {
		private _nearestPlayerDis = [_pos,_list] call A3E_fnc_NearestObjectDis;
		if(_nearestPlayerDis>=_minDis) exitwith {
			_return = _pos;
		};
	};
};
_return