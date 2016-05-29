!isNull cursorTarget
	&& {call ATR_FNC_Check_Revive}
	&& {("FirstAidKit" in items player) || {"FirstAidKit" in items cursorTarget}}
	&& {!(1 == ([(configfile >> "CfgVehicles" >> typeof player),"attendant",0] call BIS_fnc_returnConfigEntry) && {"Medikit" in items player})}
;
