#include "\A3\UI_F\hpp\defineDIKCodes.inc"

private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;

_handled = true;
if(_dikCode == DIK_A) then {
	[true] call ATHSC_fnc_cycleEntity;
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

if(_dikCode == DIK_LEFT) then {
	ATHSC_CamDir = ATHSC_CamDir + 1.5;
};
if(_dikCode == DIK_RIGHT) then {
	ATHSC_CamDir = ATHSC_CamDir - 1.5;
};
if(_dikCode == DIK_UP) then {
	ATHSC_CamAngle = ATHSC_CamAngle + 1.5;
};
if(_dikCode == DIK_DOWN) then {
	ATHSC_CamAngle = ATHSC_CamAngle - 1.5;

};

if(ATHSC_CamAngle<5) then {
	ATHSC_CamAngle = 5;
};
if(ATHSC_CamAngle > 85) then {
	ATHSC_CamAngle = 85;
};
if(ATHSC_CamDir>=360) then {
	ATHSC_CamDir = ATHSC_CamDir%360;
};
if(ATHSC_CamDir<-360) then {
	ATHSC_CamDir = ATHSC_CamDir%360;
};

private _allowed = [];
_allowed pushBack (actionKeys "Watch");
_allowed pushBack (actionKeys "chat");
_allowed pushBack (actionKeys "networkStats");
_allowed pushBack (actionKeys "prevChannel");
_allowed pushBack (actionKeys "nextChannel");
_allowed pushBack (actionKeys "networkPlayers");
_allowed pushBack (actionKeys "nightVision");
_allowed pushBack (actionKeys "showMap");
_allowed pushBack (actionKeys "hideMap");
_allowed pushBack (actionKeys "compass");


if({_dikCode in _x} count _allowed > 0) then {
	_handled = false;
};
if(_dikCode in (actionKeys "nightVision")) then {
	call ATHSC_fnc_toggleNV;
};
if(_dikCode in (actionKeys "showMap") || _dikCode in (actionKeys "hideMap")) then {
	if(visibleMap) then {
		openMap [false,false];
	} else {
		openMap [true,true];
	};
	//_handled = false;
};
if(_dikCode == DIK_RETURN) then {
	_handled = false;
};    
if(_dikCode == DIK_NUMPADENTER || _dikCode == DIK_V) then {
	[] call ATHSC_fnc_updatePerspective;
};

if(_dikCode == DIK_ESCAPE) then {
	//[] spawn ATHSC_fnc_exit;
	_handled = false;
};
_handled;  