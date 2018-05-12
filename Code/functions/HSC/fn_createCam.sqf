if(isNil("AT_Revive_StaticRespawns")) then {
	AT_Revive_StaticRespawns = [];
};
if(isNil("AT_Revive_EnableRespawn")) then {
	AT_Revive_EnableRespawn = true;
};
if(isNil("AT_Revive_clearedDistance")) then {
	AT_Revive_clearedDistance = 100;
};
if(isNil("ATHSC_Cam")) then {
	ATHSC_Cam = objNull;
};
if(!isNull ATHSC_Cam) then {
	[] call ATHSC_fnc_exit;
};
ATHSC_Cam = objNull;
ATHSC_CamTarget = player;
ATHSC_AttempRespawn = false;
ATHSC_AttempRespawnCounter = 0;
ATHSC_NVEnabled = false;
ATHSC_CamDir = random 360;
ATHSC_CamDistance = 15;
ATHSC_CamAngle = 45;
ATHSC_Perspective = 0;
ATHSC_KeyPress = [];
ATHSC_Cam = "camera" camCreate (eyePos player);
cutText ["", "BLACK",0.1];
sleep 0.5;




ATHSC_KeyDownHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call ATHSC_FNC_keydown;"];
ATHSC_MouseHandler = (findDisplay 46) displayAddEventHandler ["MouseMoving", "_this call ATHSC_FNC_mouseMove;"];
ATHSC_MouseZHandler = (findDisplay 46) displayAddEventHandler ["MouseZChanged", "_this call ATHSC_FNC_mouseZMove;"];
//ATHSC_MouseKeyHandler = (findDisplay 46) displayAddEventHandler ["MouseButtonClick", "_this call ATHSC_FNC_mousekeyclick;"];


//ATHSC_Cam switchCamera "Internal";

showCinemaBorder false;
ATHSC_Cam camSetPos ((getpos player) vectorAdd ([[0,1,0],[ATHSC_CamAngle,0,ATHSC_CamDir]] call ATHSC_FNC_rotateVector));
ATHSC_Cam cameraEffect ["internal", "back"];
ATHSC_Cam camCommit 0;
ATHSC_Cam camSetTarget player;
[] spawn {
	sleep 0.5;
	cutText ["", "BLACK IN"];
	sleep 1.0;
	("HSC" call BIS_fnc_rscLayer) cutRsc ["HSC_View", "PLAIN", 2, false];
};
private _distance = ATHSC_CamDistance;
for[{_i=1},{_i<ATHSC_CamDistance},{_i=_i+1}] do {
	private _camVector = [[0,1,0],[ATHSC_CamAngle,0,ATHSC_CamDir]] call ATHSC_FNC_rotateVector;
	ATHSC_Cam camSetPos ((getpos player) vectorAdd (_camVector vectorMultiply _i));
	ATHSC_Cam camCommit 0.1;
	sleep 0.1;
};
ATHSC_CamDistance = _distance;
ATHSC_Run = true;

[] spawn ATHSC_fnc_camLoop;