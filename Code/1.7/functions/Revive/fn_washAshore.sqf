private["_unit","_center","_pos","_distance","_vec","_found","_npos"];

_unit = _this select 0;
if(!isNil("center")) then {
    _center = getpos center;
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
        if(_unit == player) then {
            titleText ["You are being washed ashore...", "BLACK",2];
        };
        sleep 1;
       _unit setpos _pos; 
        [[_unit switchmove "AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
       sleep 2;
       if(_unit == player) then {
            titleFadeOut 2;
       };
    } else {
        player sidechat "Can't find dry land.";
    }
} else {
    player sidechat "Warning, no mapcenter present";
};