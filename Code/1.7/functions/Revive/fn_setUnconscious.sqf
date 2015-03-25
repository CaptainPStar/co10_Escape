private["_unit","_script","_ragdoll","_processed"];
    _unit = _this select 0;
    if(count(_this)>1) then {
        _ragdoll = _this select 1;
    } else {
        _ragdoll = true;
    };
    _unit setcaptive true;  
	if(!(isplayer _unit)) then {
		_unit disableAI "ANIM";
	};
    if(local _unit) then {    
	   _processed = false;

        if((vehicle _unit) != _unit) then {
             _unit action ["Eject", vehicle _unit];
			 _processed = true;
             [_unit] spawn {
                 private["_unit"];
                 _unit = _this select 0;
                 waituntil{(vehicle _unit == _unit)};
				 [[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
             };
        };
		if(surfaceIsWater (position _unit)) then {
           [_unit] spawn at_fnc_washAshore;
		   	_processed = true;
        };
		if(!_processed) then {
			[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
		};
		_unit setvariable["AT_IsConscious",false,true];
        _script = [_unit] spawn at_fnc_consciousHandler;       
};