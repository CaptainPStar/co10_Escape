private _inCam = missionNamespace getvariable["ATHSC_Run",false];
if(_inCam) then {
	missionNamespace setvariable["ATHSC_Run",false];
	"HSC" cutFadeOut 0;
	("HSC" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
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
	(findDisplay 46) displayRemoveEventHandler ["keyDown", ATHSC_KeyDownHandler];
	(findDisplay 46) displayRemoveEventHandler ["mouseMoving", ATHSC_MouseHandler];
	(findDisplay 46) displayRemoveEventHandler ["mouseZChanged", ATHSC_MouseZHandler];
	ATHSC_KeyDownHandler = -1;
	ATHSC_MouseHandler = -1;
	ATHSC_MouseZHandler = -1;
};
