ATHSC_Run = false;
if(!isNull ATHSC_Cam) then {
	ATHSC_Cam cameraEffect ["terminate","back"];
	camDestroy ATHSC_Cam;
	ATHSC_Cam = objNull;
	player switchCamera "Internal";
	closeDialog 123;
	[] spawn {
		sleep 1.0;
		if(alive player && (player getvariable ["AT_Revive_isUnconscious",false]) && !A3E_var_Escape_AllPlayersDead) then {
			[] spawn ATHSC_fnc_createCam;
			//(findDisplay 46) displayRemoveEventHandler ["KeyDown",ATHSC_KeyDownHandler];
		};
	};
};