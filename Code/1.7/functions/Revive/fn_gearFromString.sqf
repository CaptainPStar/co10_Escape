private["_unit","_gearString"];
_unit = _this select 0;
_gearString = _this select 1;

[_unit] call compile format["_unit = _this select 0;%1",_gearString];