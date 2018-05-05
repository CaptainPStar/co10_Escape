params[["_perspective",-1]];

if(_perspective == 1) then {
	if(ATHSC_CamTarget iskindof "Man") then {
		if(!isNull ATHSC_Cam) then {
			ATHSC_Cam cameraEffect ["terminate","back"];
			camDestroy ATHSC_Cam;
			ATHSC_Cam = objNull;
		};
		ATHSC_CamTarget switchCamera "Internal";
		ATHSC_Perspective = 1;
	} else {
		if(ATHSC_Perspective == 1) then {
			[0] call ATHSC_fnc_updatePerspective;
		};
	};
} else {
	if(_perspective == 0) then {
		private _camPos = (getposATL ATHSC_CamTarget) vectorAdd (([[0,1,0],[ATHSC_CamAngle,0,ATHSC_CamDir]] call ATHSC_FNC_rotateVector) vectorMultiply ATHSC_CamDistance);
		ATHSC_Cam = "camera" camCreate _camPos;
		ATHSC_Cam camSetPos _camPos;
		ATHSC_Cam cameraEffect ["internal", "back"];
		ATHSC_Cam camCommit 0;
		ATHSC_Cam camSetTarget ATHSC_CamTarget;
		ATHSC_Perspective = 0;
	} else {
		if(ATHSC_Perspective == 1) then {
			[0] call ATHSC_fnc_updatePerspective;
		} else {
			[1] call ATHSC_fnc_updatePerspective;
		};
	};
};