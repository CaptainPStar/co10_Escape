private ["_useRevive"];
private ["_volume", "_dynamicWeather", "_isJipPlayer"];
private ["_showIntro", "_showPlayerMapAndCompass", "_fog", "_playerIsImmortal", "_playersEnteredWorld"];

_isJipPlayer = false;
if (!isServer && isNull player) then
{
    _isJipPlayer = true;
};

call compile preprocessFileLineNumbers "config.sqf";
call compile preprocessFileLineNumbers ("Island\WorldConfig.sqf");

_debug = a3e_debug;

// Initialization

a3e_var_Escape_firstPreloadDone = false;

if(isNil("a3e_var_commonLibInitialized")) then {
	call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
};

a3e_var_Escape_playerEnteredWorld = false;


onPreloadFinished {
	if (!a3e_var_Escape_firstPreloadDone) then {
		a3e_var_Escape_firstPreloadDone = true;

		if (!isNull player) then {
            a3e_var_Escape_playerEnteredWorld = true;
            removeAllWeapons player;
            removeAllItems player;
            removeBackpack player;
		};
	};
};


enableSaving [true, true];

if (!isDedicated) then {
    waitUntil {!isNull player};
    player setCaptive true;
};

// Initialization
a3e_arr_JipSpawnPos = [];
//call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
//call drn_fnc_CL_InitParams;

//Wait until server has parsed the parameters
waituntil {!isNil("A3E_ParamsParsed")};

call compile preprocessFileLineNumbers "Scripts\Escape\Functions.sqf";
call compile preprocessFileLineNumbers "Scripts\Escape\AIskills.sqf";

//[_isJipPlayer] call compile preprocessFileLineNumbers "Briefing.sqf";

[] call a3e_fnc_briefing;

setTerrainGrid (Param_Grass);

if (isServer) then {
    a3e_var_Escape_hoursSkipped = 0;
    
    if (isMultiplayer) then {
        private ["_hour"];
        
        if (Param_TimeOfDay == 24) then {
            _hour = floor random 24;
        }
        else {
            _hour = Param_TimeOfDay;
        };
        
        a3e_var_Escape_hoursSkipped = _hour - (date select 3);
        publicVariable "a3e_var_Escape_hoursSkipped";
        setDate [date select 0, date select 1, date select 2, _hour, 0];
    };
};

if (!isDedicated) then {
	// Player Initialization

	removeAllWeapons player;
	removeAllItems player;
	removeBackpack player;

	player addWeapon "ItemRadio";
	player addWeapon "ItemWatch";


	drn_fnc_Escape_DisableLeaderSetWaypoints = {
		if (!visibleMap) exitwith {};
		
		{
			player groupSelectUnit [_x, false]; 
		} foreach units group player;
	};

	// If multiplayer, then disable the cheating "move to" waypoint feature.
	if (isMultiplayer) then {
		[] spawn {
			waitUntil {!isNull(findDisplay 46)}; 
			// (findDisplay 46) displayAddEventHandler ["KeyDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
			(findDisplay 46) displayAddEventHandler ["MouseButtonDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
		};
	};


	if (!isMultiplayer) then {
		{
			if (_x != p1) then {
				deleteVehicle _x;
			};
		} foreach units group player;
	};

};


