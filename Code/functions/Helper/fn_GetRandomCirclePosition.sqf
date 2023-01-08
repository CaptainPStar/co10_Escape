params["_startPos",["_minDis",1000],["_maxDis",2000],["_mode","NONE"]];

private _return = [];
private _pos = [];

for "_x" from 1 to 10 do {
	private _distance = _minDis + random(_maxDis-_minDis);
	_dir = random 360;
	_pos = [(_startPos select 0)+cos(_dir)*_distance,(_startPos select 1)+sin(_dir)*_distance,0];
	if(_mode != "ROAD") then {
		if(!(surfaceIsWater _pos) && _mode=="NONE") exitwith {_return = _pos;};
		if((surfaceIsWater _pos) && _mode=="WATER") exitwith {_return = _pos;};
	} else {
		private _roads = _pos nearRoads 50;
		_roads = _roads select {
			private _info = getRoadInfo _x;
			private _ret = false;
			_ret = (!(_info#2) && !(_info#8));
			_ret;
		};
		if(count(_roads)>0) exitwith {
			_return = getpos(selectRandom _roads);
		};
	};
};
_return