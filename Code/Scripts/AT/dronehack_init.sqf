call compile preprocessFile "Scripts\AT\hackdrone.sqf";

[] spawn
{
    waitUntil {!isNull player};
	
	[] spawn at_fnc_dh_init;
	
	
	player addEventHandler 
	[
		"Respawn", 
		{ 
			[] spawn at_fnc_dh_init;
		}
	];
};