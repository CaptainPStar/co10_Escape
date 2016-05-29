params["_vehicle"];
private _EH = _vehicle getvariable ["AT_Revive_VehicleWatchdog",-1];
if(_EH<0) then {
	_EH = _vehicle addEventHandler ["GetOut", {_this spawn ATR_FNC_WatchVehicle;}];
	_vehicle setvariable ["AT_Revive_VehicleWatchdog",_EH,false];
};
