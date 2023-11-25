params["_vehicle"];
private _lockParam = missionNamespace getvariable["A3E_Param_VehicleLock",0];

switch (_lockParam) do {
	case 1: {
		if(count (allTurrets _vehicle) > 0) then {
			_vehicle lock 3;
		};
	};
    case 2: {
		_vehicle lock 3;
	};
    default {  };
};