private _return = [] call ATR_FNC_Check_Revive;
private _target = cursorTarget;
if(_return && (("FirstAidKit" in items player) || ("FirstAidKit" in items _target))) then {
	_return = true;
} else {
	_return = false;
};
_return;