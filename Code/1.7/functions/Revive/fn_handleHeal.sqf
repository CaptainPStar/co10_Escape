private["_unit","_reviver","_changeEH","_doneEH","_abortAction","_script","_return"];

_unit = _this select 0;
_reviver = _this select 1;
_canHeal = _this select 2;

if(!(_unit getvariable "AT_isConscious") && _canHeal) then {
    _return = true;
    _script = [_unit,_reviver] spawn at_fnc_revive;
    AISFinishHeal [_unit, _reviver, _canHeal];
 } else {
    _return = false;
 };
_return;
