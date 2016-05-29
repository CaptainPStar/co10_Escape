private _vehicle = cursortarget;
private _isDragging = player getVariable ["AT_Revive_isDragging",objNull];
private _freeCargoPositions = _vehicle emptyPositions "cargo";
if(_freeCargoPositions>0 && !isNull(_isDragging)) then {
	[] call ATR_FNC_Release;
	sleep 0.5;
	[_isDragging,_vehicle] remoteExec ["ATR_FNC_MoveInjuredInVehicle", _isDragging];
	[_vehicle] remoteExec ["ATR_FNC_AddVehicleWatchdog", 0]; 
};