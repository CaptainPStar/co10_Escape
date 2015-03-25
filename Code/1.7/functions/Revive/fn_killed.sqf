private["_unit","_gear"];
_unit = _this select 0;
_gear = [_unit] call at_fnc_GearToString;
_unit setvariable ["AT_Revive_Gear",_gear];
