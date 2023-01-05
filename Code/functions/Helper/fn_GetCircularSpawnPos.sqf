private["_list","_pos","_return","_nearestPlayerDis"];
_list = [] call A3E_fnc_GetPlayers;
_minDis = [_this,0,1000] call bis_fnc_param;
_maxDis = [_this,1,2000] call bis_fnc_param;
_return = [];

_pos = [];

if(time<6) then {
	_minDis = 300;
};
for "_x" from 1 to 10 do {
	_pos = getposASL (_list select floor(random(count(_list))));
	_distance = _minDis + random(_maxDis-_minDis);
	_dir = random 360;
	_pos = [(_pos select 0)+cos(_dir)*_distance,(_pos select 1)+sin(_dir)*_distance,0];
	_nearestPlayerDis = [_pos,_list] call A3E_fnc_NearestObjectDis;
	if(_nearestPlayerDis>=_minDis &&  !(surfaceIsWater _pos)) exitwith {_return = _pos;};
};
_return