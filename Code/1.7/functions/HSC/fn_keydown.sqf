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
if(_dikCode == DIK_N) then {
	call ATHSC_fnc_toggleNV;
};
if(_dikCode == DIK_M) then {
	//_handled = false;
};
     
if(_dikCode == DIK_NUMPADENTER) then {
	[] call ATHSC_fnc_updatePerspective;
};

if(_dikCode == DIK_ESCAPE) then {
	//[] spawn ATHSC_fnc_exit;
	_handled = false;
};
_handled;  