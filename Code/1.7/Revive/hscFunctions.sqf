#include "dik.hpp"

ATHSC_fnc_createCam = {
	if(isNil("AT_Revive_StaticRespawns")) then {
		AT_Revive_StaticRespawns = [];
	};
	if(isNil("AT_Revive_StaticRespawns")) then {
		AT_Revive_enableRespawn = true;
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
};
ATHSC_fnc_updateCam = {
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
};
ATHSC_fnc_exit = {
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
};
ATHSC_fnc_camLoop = {
	private["_index"];
	while{ATHSC_Run} do {
		[0.1] call ATHSC_fnc_updateCam;
		if(!AT_Revive_enableRespawn) then {
			[false,false,name ATHSC_CamTarget] call ATHSC_fnc_updateText;
		} else {
			_index = AT_Revive_StaticRespawns find ATHSC_CamTarget;
			if(_index >= 0) then {
				[] call ATHSC_fnc_updateText;
			} else {
				if([] call ATHSC_fnc_targetUnconscious) then {
					[false,true,name ATHSC_CamTarget] call ATHSC_fnc_updateText;
				} else {
					if([] call ATHSC_fnc_targetEnemysNear) then {
						[true,false,name ATHSC_CamTarget] call ATHSC_fnc_updateText;
					} else {
						[false,false,name ATHSC_CamTarget] call ATHSC_fnc_updateText;
					};
				};
			};
		};
	};
};
ATHSC_fnc_cycleEntity = {
	private["_list","_next","_index"];
	_next = [_this,0,true] call bis_fnc_param;
	_list = [];
	_list = [] + AT_Revive_StaticRespawns;
	_list pushBack player;
	if(isMultiplayer) then {
		{
			if(_x != player) then {
				_list pushBack _x;
			};
		} foreach (units group player);
	} else {
		_list pushBack Bob;
	};
	_index = _list find ATHSC_CamTarget;
	if(_next) then {
		_index = _index + 1;
	} else {
		_index = _index - 1;
	};
	if(_index>= count(_list)) then {
		_index = 0;
	};
	if(_index < 0) then {
		_index = count(_list)-1;
	};
	ATHSC_CamTarget = _list select _index;
	//systemchat format["Selected %1 (Pos %2 of %3)",ATHSC_CamTarget,_index,count(_list)];
	ATHSC_AttempRespawn = false;
};
ATHSC_fnc_attempRespawn = {
	private["_index"];
	_index = AT_Revive_StaticRespawns find ATHSC_CamTarget;
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
};
ATHSC_fnc_respawn = {
	player setpos getpos ATHSC_CamTarget;
	[player] call AT_FNC_Revive_InstantRevive;
	[] call ATHSC_fnc_exit;
};
ATHSC_fnc_targetUnconscious = {
	private["_return"];
	_return = false;
	_return = ATHSC_CamTarget getvariable ["AT_Revive_isUnconscious",false];
	_return;
};
ATHSC_fnc_targetEnemysNear = {
	private["_return","_objs"];
	_return = false;
	_objs = nearestObjects [ATHSC_CamTarget, [], AT_Revive_clearedDistance];
	if(({side _x == A3E_VAR_Side_Opfor || side _x == A3E_VAR_Side_Ind} count _objs)>0) then {
		_return = true;
	};
	_return;
};
ATHSC_fnc_keyDown = {
	private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
	_ctrl = _this select 0;
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	
	_handled = false;

	if(_dikCode == DIK_A) then {
		[true] call ATHSC_fnc_cycleEntity;
	};
	if(_dikCode == DIK_RIGHT) then {
		ATHSC_CamDir = ATHSC_CamDir + 5;
	};
	if(_dikCode == DIK_LEFT) then {
		ATHSC_CamDir = ATHSC_CamDir - 5;
	};
	if(_dikCode == DIK_DOWN) then {
		ATHSC_CamHeight = ATHSC_CamHeight + 0.5;
	};
	if(_dikCode == DIK_UP) then {
		ATHSC_CamHeight = ATHSC_CamHeight - 0.5;
	};
	if(_dikCode == DIK_D) then {
		[false] call ATHSC_fnc_cycleEntity;
	};
	if(_dikCode == DIK_SPACE) then {
		if(ATHSC_AttempRespawn) then {
			ATHSC_AttempRespawn = false;
		} else {
			if(AT_Revive_enableRespawn) then {
				[] spawn ATHSC_fnc_attempRespawn;
			};
		};
	};
	if(_dikCode == DIK_N) then {
		call ATHSC_fnc_toggleNV;
	};
	if(_dikCode == DIK_ESCAPE) then {
		call ATHSC_fnc_exit;
	};
	if(ATHSC_CamHeight<5) then {
		ATHSC_CamHeight = 5;
	};
	if(ATHSC_CamHeight > 25) then {
		ATHSC_CamHeight = 25;
	};
	if(ATHSC_CamDir>=360) then {
		ATHSC_CamDir = ATHSC_CamDir %360;
	};
	if(ATHSC_CamDir<0) then {
		ATHSC_CamDir = (360 - ATHSC_CamDir%360);
	};
	_handled;  
};
ATHSC_fnc_updateText = {
	private["_enemysNear","_targetUnconscious","_targetName","_line1","_line2","_control","_text"];
	disableSerialization;
	_enemysNear = [_this,0,false] call bis_fnc_param;
	_targetUnconscious = [_this,1,false] call bis_fnc_param;
	_targetName = [_this,2,"Respawn"] call bis_fnc_param;
	_line1 = format["You are watching %1",_targetName];
	_line2 = "";
	if(_enemysNear) then {
		_line2 = "<t color='#ff0000'>" + format["Can't spawn. Enemys are near!"] + "</t>";
	} else {
		if(_targetUnconscious) then {
			_line2 = "<t color='#ff0000'>" + "Can't spawn. Unit is unconscious!" + "</t>";
		} else {
			if(ATHSC_AttempRespawn) then {
				_line2 = "<t color='#00ff00'>" + format["Respawn in %1",ATHSC_AttempRespawnCounter] + "</t>";
			} else {
				_line2 = "<t color='#00ff00'>" + format["Press space to respawn at %1.",_targetName] + "</t>";
			};
		};
	};
	_control =  (uiNamespace getVariable 'ATHSC_Main_Dialog') displayCtrl 170002;
	if(AT_Revive_enableRespawn) then {
		_control ctrlSetStructuredText parseText (_line1 + "<br/>" + _line2);
	} else {
		_control ctrlSetStructuredText parseText (_line1);
	};
};
ATHSC_fnc_toggleNV = {
	if(ATHSC_NVEnabled) then {
		camUseNVG false;
		ATHSC_NVEnabled = false;
	} else {
		camUseNVG true;
		ATHSC_NVEnabled = true;
	};
};
