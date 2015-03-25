private["_unit","_dummy","_state"];
_unit = _this select 0;
_group = creategroup (side _unit);
[[_unit],"at_fnc_hide",true] call BIS_fnc_MP;
_dummy = _group createUnit [typeof _unit, [0,0,0], [], 0, "FORM"];
if(!isNull _dummy) then {
    _dummy setposASL getPosASL _unit;
    _dummy setdir getdir _unit;
    _dummy setVelocity velocity _unit;
    _state = animationState _unit;
    [_dummy,_unit] spawn at_fnc_copyGear;
    [[_dummy,_state],"at_fnc_switchMove",true] call BIS_fnc_MP;
    _dummy setdammage 1;
    if(_unit==player) then {
        _dummy switchCamera "Internal";
    };
    for[{_i=0},{_i<50},{_i=_i+1}] do {
        if(((_dummy selectionPosition "Neck") select 2)<0.1) then {
            _i = 50;
            sleep 0.5;
        };
        sleep 0.1;
    };
    _unit setposASL getposASL _dummy;
    _unit setdir getdir _dummy;
    if(!(isplayer _unit)) then {
        _unit disableAI "ANIM";
    };
    [[_unit,"amovppnemstpsraswrfldnon_injured"],"at_fnc_switchMove",true] call BIS_fnc_MP;
    [[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
    if(_unit==player) then {
        _unit switchCamera "Internal";
    };
    [[_unit],"at_fnc_unhide",true] call BIS_fnc_MP;
    _dummy setposASL [0,0,0];
    deletevehicle _dummy;
} else {
    [[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
};
