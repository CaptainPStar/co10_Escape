if(isNil("AT_Revive_StaticRespawns")) then {
	AT_Revive_StaticRespawns = [];
};
if(isNil("AT_Revive_enableRespawn")) then {
	AT_Revive_enableRespawn = false;
};
if(isNil("AT_Revive_clearedDistance")) then {
	AT_Revive_clearedDistance = 0;
};
if(isNil("AT_Revive_Camera")) then {
	AT_Revive_Camera = 1;
};

AT_Revive_Debug = false;
[] spawn
{
    waitUntil {!isNull player};
	
	[true] spawn ATR_FNC_InitPlayer;
	
	
	player addEventHandler 
	[
		"Respawn", 
		{ 
			[false] spawn ATR_FNC_InitPlayer;
		}
	];
};


if (!AT_Revive_Debug || isMultiplayer) exitWith {};

{
	if (!isPlayer _x) then 
	{
		_x addEventHandler ["HandleDamage", ATR_FNC_HandleDamage];
		_x setVariable ["AT_Revive_isUnconscious", false, true];
		_x setVariable ["AT_Revive_isDragged", objNull, true];
		_x setVariable ["AT_Revive_isDragging", objNull, true];
	};
} forEach switchableUnits;