private _vehicle = cursortarget;
private _isDragging = player getVariable ["AT_Revive_isDragging",false];
private _freeCargoPositions = _vehicle emptyPositions "cargo";
private _return = false;
if(_freeCargoPositions >0 && !isNull(_isDragging)) then {
	_return = true;
};
_return;