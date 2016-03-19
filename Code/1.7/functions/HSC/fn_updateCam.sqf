private["_commit","_target"];
_commit = param [0,0];
if(!(isNull ATHSC_Cam)) then {
	_target = ATHSC_CamTarget;
	if(vehicle _target != _target) then {
		_target = vehicle _target;
		_commit = 0.05;
	};
	ATHSC_Cam camSetTarget _target;
	//ATHSC_Cam camSetRelPos [0, 8, 15];
	ATHSC_Cam camSetPos ((getpos _target) vectorAdd [-sin(ATHSC_CamDir)*8,cos(ATHSC_CamDir)*8, ATHSC_CamHeight]);
	ATHSC_Cam cameraEffect ["internal", "back"];
	ATHSC_Cam camCommit _commit;
};