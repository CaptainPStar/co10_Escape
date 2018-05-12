private["_commit","_target"];
_commit = param [0,0];
if(!(isNull ATHSC_Cam)) then {

	_target = ATHSC_CamTarget;
	if(vehicle _target != _target) then {
		_target = vehicle _target;
		_commit = 0.05;
	};
	if(ATHSC_Perspective==0) then {
		ATHSC_Cam camSetTarget _target;
		//ATHSC_Cam camSetRelPos [0, 8, 15];
		private _camVector = [[0,1,0],[ATHSC_CamAngle,0,ATHSC_CamDir]] call ATHSC_FNC_rotateVector;
		ATHSC_Cam camSetPos ((getPosATL _target) vectorAdd (_camVector vectorMultiply ATHSC_CamDistance));
		ATHSC_Cam cameraEffect ["internal", "back"];
		ATHSC_Cam camCommit _commit;
	};
};
