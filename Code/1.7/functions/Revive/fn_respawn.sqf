private["_unit","_corpse","_gear"];
_unit = _this select 0;
_corpse = _this select 1;


_unit setvariable ["AT_Revive_Action",-1,true];
_unit setvariable ["AT_isHealing",[],true];
_unit setvariable ["AT_Corpse",_corpse,false];

_gear = _corpse getvariable ["AT_Revive_Gear",""];
[_unit,_gear] spawn AT_fnc_GearFromString;


[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_switchMove",true] call BIS_fnc_MP;
[_unit] call at_fnc_setUnconscious;
deletevehicle _corpse;

