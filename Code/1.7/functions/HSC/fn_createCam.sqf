if(isNil("AT_Revive_StaticRespawns")) then {
	AT_Revive_StaticRespawns = [];
};
if(isNil("AT_Revive_EnableRespawn")) then {
	AT_Revive_EnableRespawn = true;
};
if(isNil("AT_Revive_clearedDistance")) then {
	AT_Revive_clearedDistance = 100;
};
ATHSC_Cam = objNull;
ATHSC_CamTarget = player;
ATHSC_AttempRespawn = false;
ATHSC_AttempRespawnCounter = 0;
ATHSC_NVEnabled = false;
ATHSC_CamDir = random 360;
ATHSC_CamHeight = 15;
ATHSC_Cam = "camera" camCreate (eyePos player);

ATHSC_Dialog = createDialog "ATHSC_Main";

//ATHSC_Cam switchCamera "Internal";

showCinemaBorder false;
ATHSC_Cam camSetPos (ASLToATL (eyePos player));
ATHSC_Cam camCommit 0;
ATHSC_Cam camSetTarget player;
ATHSC_Cam camSetPos ((getpos player) vectorAdd [-cos(ATHSC_CamDir)*8,sin(ATHSC_CamDir)*8, ATHSC_CamHeight]);
ATHSC_Cam cameraEffect ["internal", "back"];
ATHSC_Cam camCommit 2;

ATHSC_Run = true;

sleep 2;
[] spawn ATHSC_fnc_camLoop;