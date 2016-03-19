params["_init"];
player removeAllEventHandlers "HandleDamage";
player removeAllEventHandlers "Killed";

if(isNil("AT_Revive_WeaponsOnRespawn")) then {
	AT_Revive_WeaponsOnRespawn = true;
};

player addEventHandler ["HandleDamage", ATR_FNC_HandleDamage];
player addEventHandler 
[
	"Killed",
	{
		_body = _this select 0;
		[_body] spawn 
		{
		
			waitUntil { alive player };
			_body = _this select 0;
			deleteVehicle _body;
		}
	}
];

player setVariable ["AT_Revive_isUnconscious", false, true];
player setVariable ["AT_Revive_isDragged", objNull, true];
player setVariable ["AT_Revive_isDragging", objNull, true];
player setVariable ["AT_Revive_isCarrying", objNull, true];
player setCaptive false;

[] spawn ATR_FNC_Actions;

//systemchat "AT Revive started";
if(!_init) then {
	//Player used respawn.. remove all his stuff and thread him like JIP
	if(!AT_Revive_WeaponsOnRespawn) then {
		removeallweapons player;
		removeAllItems player;
		removeBackpack player;
		
		player unassignItem "ItemMap";
		player removeItem "ItemMap";
		player unassignItem "ItemCompass";
		player removeItem "ItemCompass";
		player unassignItem "itemGPS";
		player removeItem "itemGPS";
		player unassignItem "NVGoggles";
		player removeItem "NVGoggles";
	
	};
	
	if(count(AT_Revive_StaticRespawns)>0) then {
		player setpos getpos (AT_Revive_StaticRespawns select 0);
	};
	if(AT_Revive_Camera==1) then {
		[] spawn ATHSC_fnc_createCam;
	};		
};