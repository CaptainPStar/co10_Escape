private _params = param [3];
private _target = cursortarget;
	
if(call ATR_FNC_Check_Revive) then {
	player setVariable ["AT_Revive_isDragging",_target,true];
	_target setVariable ["AT_Revive_isDragged",player,true];


	_target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;

	[_target] remoteExec ["ATR_FNC_FixRotation", 0, false];
	
	[player,"AcinPknlMstpSrasWrflDnon"] remoteExec ["switchMove", 0, false];
	
	//player playMoveNow "AcinPknlMstpSrasWrflDnon";
	
	

	private _id = player addAction ["<t color=""#FFA500"">" + "Release" + "</t>", ATR_FNC_Release, [], 10, true, true, "", "true"];
	
	
	waitUntil 
	{ 
		!alive player || (player getVariable "AT_Revive_isUnconscious") || !alive _target || !(_target getVariable "AT_Revive_isUnconscious") || isNull((player getVariable ["AT_Revive_isDragging",objNull])) || isNull((_target getVariable ["AT_Revive_isDragged",objNull])) 
	};

	player setVariable ["AT_Revive_isDragging",objNull,true];
	
	if (!isNull _target && alive _target) then
	{
		[_target,"AinjPpneMstpSnonWrflDnon"] remoteExec ["switchMove", 0, false];
		_target setVariable ["AT_Revive_isDragged", objNull, true];
		detach _target;
	};
	
	player removeAction _id;
};