params["_unit", "_killer"];
_unit setVariable ["AT_Revive_isUnconscious", true, true];
	
private _msg = format["%1 is unconscious.",name _unit];
_msg remoteExec ["systemchat", 0, false];

private _inVehicle = false;
if(vehicle _unit == _unit) then {
	_ragdoll = [_unit] spawn ATR_FNC_ragdoll;
	waituntil{scriptDone _ragdoll};
} else {
	private["_vehicle"];
	_vehicle = vehicle _unit;
	if(getdammage _vehicle < 1) then {
		_inVehicle = true;
		[_unit] call ATR_FNC_SwitchVehicleDeadAnimation;
	} else {
		moveOut _unit;
		_ragdoll = [_unit] spawn ATR_FNC_ragdoll;
	};
};

_unit setDamage 0.9;
_unit setVelocity [0,0,0];
_unit allowDammage false;
_unit setCaptive true;
if(surfaceIsWater getpos _unit && ((getPosASL _unit) select 2)<1 && (vehicle _unit == _unit)) then {
	[_unit] call ATR_FNC_WashAshore;
};

if(AT_Revive_Camera==1) then {
	[] spawn ATHSC_fnc_createCam;
};
sleep 0.5;

if(vehicle _unit == _unit) then {
	[_unit,"AinjPpneMstpSnonWrflDnon"] remoteExec ["switchmove", 0, false];
};
_unit enableSimulation false;

// Call this code only on players
if (isPlayer _unit) then 
{
	
	while { !isNull _unit && alive _unit && (_unit getVariable "AT_Revive_isUnconscious")} do
	{			
		if(vehicle _unit == _unit && _inVehicle) then {
			_inVehicle = false;
			_unit enableSimulation true;
			_ragdoll = [_unit] spawn ATR_FNC_ragdoll;
			waituntil{scriptDone _ragdoll};
			sleep 0.25;
			_unit enableSimulation false;
		};
		if(vehicle _unit != _unit && !_inVehicle) then {
			_inVehicle = true;
			_unit enableSimulation true;
			[_unit] call ATR_FNC_SwitchVehicleDeadAnimation;
			sleep 0.25;
			_unit enableSimulation false;
		};
		sleep 0.5;
	};
	private _pos = getposATL _unit;
	
	// Player got revived
	//sleep 6;
	

	_unit enableSimulation true;
	_unit allowDamage true;
	_unit setCaptive false;
	
	sleep 0.5;
	_unit setPosATL _pos; //Fix the stuck in the ground bug

};