private["_unit","_anim","_injured","_ended","_success"];
_unit = _this select 0;
_anim = _this select 1;
if(_anim == "amovppnemstpsraswrfldnon_injured") then {
    if(!(_unit getvariable "AT_isCrawling")) then {
	_unit setcaptive false;
        _unit setvariable ["AT_isCrawling",true,false];
        [_unit] spawn {
            private["_unit","_endtime"];
            _unit = _this select 0;
            _endtime = time + random 30 + 15;
            waituntil{time>_endtime || !(_unit getvariable "AT_isCrawling")};
             if((_unit getvariable "AT_isCrawling") && !(_unit getvariable "AT_isConscious")) then {
               _unit setcaptive true;
               [[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
               _unit setvariable ["AT_isCrawling",false,false];
             }
        };
    };
};
