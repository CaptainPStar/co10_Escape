private ["_obj", "_unit", "_id"];


_obj = _this select 0;
_unit = _this select 1;
_id = _this select 2;

_unit setDamage 0.0;
_unit playActionNow "Medic";
