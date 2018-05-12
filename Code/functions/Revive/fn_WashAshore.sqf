private["_unit","_center","_pos","_distance","_vec","_found","_npos"];
params["_unit"];

_center = (position SouthWest) vectorAdd ((position NorthEast) vectordiff (position SouthWest));
_pos = getpos _unit;
_distance = _unit distance _center;
_vec = [((_center select 0)-(_pos select 0))/_distance,((_center select 1)-(_pos select 1))/_distance];
_found = false;

for[{_i = 0},{_i<=_distance && !_found},{_i=_i+1}] do {
	_npos = [((_pos select 0)+(_vec select 0)*_i),((_pos select 1)+(_vec select 1)*_i) ,0];
	if(!(surfaceIsWater _npos)) then {
		_found = true;
		_pos = _npos;
	}
};
if(_found) then {
	sleep 1;
	if(_unit == player) then {
		titleText ["", "BLACK",1];
	};
	sleep 1;
	_unit setVehiclePosition [_pos, [], 0, "NONE"];
	_msg = format["%1's body washed ashore.",name _unit];
	_msg remoteExec ["systemchat", 0, false];
	sleep 1;
	if(_unit == player) then {
		titleFadeOut 1;
	};
} else {
	systemchat "Can't find dry land.";
};