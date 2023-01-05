private["_group","_state"];
_group = _this select 0;

_state = toUpper (_group getvariable ["A3E_TaskState","IDLE"]);
_state;