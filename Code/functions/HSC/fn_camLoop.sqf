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