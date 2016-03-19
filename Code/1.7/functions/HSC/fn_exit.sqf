if(ATHSC_Run) then {
	ATHSC_Run = false;
	[] spawn {
		cutText ["", "BLACK OUT",0.5];
		sleep 0.5;
		cutText ["", "BLACK IN",0.5];
		sleep 0.5;
	};
	sleep 0.5;
	if(!isNull ATHSC_Cam) then {
		ATHSC_Cam cameraEffect ["terminate","back"];
		camDestroy ATHSC_Cam;
		ATHSC_Cam = objNull;

	};
	player switchCamera "Internal";
	//cutRsc ["Default", "PLAIN"];
	(findDisplay 46) displayRemoveEventHandler ["keyDown", ATHSC_KeyDownHandler];
	(findDisplay 46) displayRemoveEventHandler ["mouseMoving", ATHSC_MouseHandler];
	(findDisplay 46) displayRemoveEventHandler ["mouseZChanged", ATHSC_MouseZHandler];
	ATHSC_KeyDownHandler = -1;
	ATHSC_MouseHandler = -1;
	ATHSC_MouseZHandler = -1;
	//(findDisplay 46) displayRemoveEventHandler ["mouseButtonClick", ATHSC_MouseKeyHandler];
	//[] spawn {
	//	sleep 1.0;
	//	//if(alive player && (player getvariable ["AT_Revive_isUnconscious",false]) && !A3E_var_Escape_AllPlayersDead) then {
	//	//	[] spawn ATHSC_fnc_createCam;
	//	//	//(findDisplay 46) displayRemoveEventHandler ["KeyDown",ATHSC_KeyDownHandler];
	//	//};
	//};
};