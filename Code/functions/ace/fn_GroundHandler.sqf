params["_unit","_case"];

switch (_case) do {
case 1: {
	_eventID = _unit addEventHandler ["Dammaged", { //Create EventHandler incase player gets damaged on ground
		params ["_unit"];
		if ((_unit call ace_medical_fnc_getUnconsciousCondition)&&!(_unit getVariable "ACE_Revive_isUnconscious")) then {
			_unconsciousPlayers = [];
			_unit setVariable ["ACE_Revive_isUnconscious", true, true];
			_players = call BIS_fnc_listPlayers;
			_unit removeEventHandler ["Dammaged", _unit getVariable "ACE_Revive_UnitGroundEventID"];
			_msg = format["%1 is unconscious.",name _unit];
			_msg remoteExec ["systemchat", 0, false];
			if(AT_Revive_Camera==1) then {[1] remoteExec ["ACE_fnc_ATCam",_unit];};
		};
	}];
	_unit setVariable ["ACE_Revive_UnitGroundEventID", _eventID, true];
};
case 2: {_unit removeEventHandler ["Dammaged", _unit getVariable "ACE_Revive_UnitGroundEventID"];};
};