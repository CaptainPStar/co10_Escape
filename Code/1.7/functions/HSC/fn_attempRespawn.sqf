private _index = AT_Revive_StaticRespawns find ATHSC_CamTarget;
if(_index >= 0) then {
	call ATHSC_fnc_respawn;
} else {
	ATHSC_AttempRespawn = true;
	ATHSC_AttempRespawnCounter = 5;
	systemChat format["Attempting respawn at %1",name ATHSC_CamTarget];
	while{ATHSC_AttempRespawn && ATHSC_AttempRespawnCounter>0} do {
		sleep 1;
		ATHSC_AttempRespawnCounter = ATHSC_AttempRespawnCounter - 1;
		if([] call ATHSC_fnc_targetUnconscious) then {
			ATHSC_AttempRespawn =  false;
		};
		if([] call ATHSC_fnc_targetEnemysNear) then {
			ATHSC_AttempRespawn =  false;
		};
	};
	if(ATHSC_AttempRespawn && ATHSC_AttempRespawnCounter==0) then {
		call ATHSC_fnc_respawn;
	};
};