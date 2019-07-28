params["_unit", "_isDown"];
_unconsciousPlayers = [];
_players = call BIS_fnc_listPlayers;

if (isPlayer _unit) then {
	if (_isDown) then {
		_unit setCaptive true;
		[_unit] remoteExec ["ACE_fnc_CaptiveHandle",_unit];//Loop because for whatever reason unit gets set out of captive mode here and there
		if !(_unit call ace_medical_fnc_getUnconsciousCondition) then {[_unit,1] remoteExec ["ACE_fnc_GroundHandler",_unit];};
		if ((_unit call ace_medical_fnc_getUnconsciousCondition)&&!(_unit getVariable "ACE_Revive_isUnconscious")) then {
			_unit setVariable ["ACE_Revive_isUnconscious", true, true];
			[_unit,2] remoteExec ["ACE_fnc_GroundHandler",_unit];
			_msg = format["%1 is unconscious.",name _unit];
			_msg remoteExec ["systemchat", 0, false];
			if(surfaceIsWater getpos _unit && ((getPosASL _unit) select 2)<1 && (vehicle _unit == _unit)) then {[_unit] call ATR_FNC_WashAshore;}; //Wash ashore courtesy of ATR
			if(AT_Revive_Camera==1) then {[1] remoteExec ["ACE_fnc_ATCam",_unit];};
		};
		sleep 10; //In some cases ace_medical_fnc_getUnconsciousCondition will return false yet the time unconscious is very long, a limit of ten seconds is enough
		if (!(_unit getVariable "ACE_Revive_isUnconscious")&&!(_unit getVariable "ACE_Revive_justWoke")) then {[_unit, false] call ace_medical_fnc_setUnconscious;};
	};
	if !(_isDown) then {
		if((AT_Revive_Camera==1)&&(_unit getVariable "ACE_Revive_isUnconscious")) then {[2] remoteExec ["ACE_fnc_ATCam",_unit];};
		_unit setVariable ["ACE_Revive_isUnconscious", false, true];
		[_unit,2] remoteExec ["ACE_fnc_GroundHandler",_unit];
		_unit setVariable ["ACE_Revive_justWoke", true, true];
		sleep 3; //Let them get back on their feet
		_unit setCaptive false;
		_unit setVariable ["ACE_Revive_justWoke", false, true];
	};
};