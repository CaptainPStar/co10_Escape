params["_case"];

switch (_case) do {
case 1: {
	newHandle = [{
		ace_medical_effectUnconsciousCC ppEffectEnable false; 
		ace_medical_effectUnconsciousRB ppEffectEnable false; 
		ace_medical_effectBlind = false; ["unconscious", false] call ace_common_fnc_setDisableUserInputStatus
	}, 0, []] call CBA_fnc_addPerFrameHandler;
	[] spawn ATHSC_fnc_createCam;
};
case 2: {
	[] spawn ATHSC_fnc_exit;
	[newHandle] call CBA_fnc_removePerFrameHandler;
};
};