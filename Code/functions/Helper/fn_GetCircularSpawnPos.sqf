params[["_minDis",1000],["_maxDis",2000],["_mode","NONE"]];
private _list = [] call A3E_fnc_GetPlayers;
private _return = [];

_pos = [];

if(time<6) then {
	_minDis = 300;
};
for "_x" from 1 to 10 do {
	_pos = getposASL (selectRandom _list);
	_distance = _minDis + random(_maxDis-_minDis);
	_dir = random 360;
	_pos = [(_pos select 0)+cos(_dir)*_distance,(_pos select 1)+sin(_dir)*_distance,0];
	private _nearestPlayerDis = [_pos,_list] call A3E_fnc_NearestObjectDis;
	if(_nearestPlayerDis>=_minDis) then {
		if(_mode != "ROAD") then {
			if(!(surfaceIsWater _pos) && _mode=="NONE") exitwith {_return = _pos;};
			if((surfaceIsWater _pos) && _mode=="WATER") exitwith {_return = _pos;};
		} else {
			private _roads = _pos nearRoads 50;
			_roads = _roads select {
				private _info = getRoadInfo _x;
				private _return = false;
				_return = (!_info#2 && !_info#8);
				_return;
			};
			if(count(_roads>0)) then {
				
				_return = getpos(selectRandom _roads);
			};
		};
	};
};
_return