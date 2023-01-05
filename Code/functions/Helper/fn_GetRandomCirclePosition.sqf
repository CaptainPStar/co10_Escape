private["_pos","_radius","_rndpos"];
_pos = [_this,0,[0,0,0],[[]]] call bis_fnc_param;
_radius = [_this,1,50] call bis_fnc_param;
_water = [_this,2,false] call bis_fnc_param;
_isOk = false;

for [{_x=0},{_x<=10},{_x=_x+1}] do {
	_rndpos = [(_pos select 0)+2*random(_radius)-_radius,(_pos select 1)+2*random(_radius)-_radius,0];
	if((!_water && !(surfaceIsWater _rndpos)) || (_water && surfaceIsWater _rndpos)) exitwith {_isOk = true;};
};
if(!_isOk) then {
_rndpos = [];
};
_rndpos
