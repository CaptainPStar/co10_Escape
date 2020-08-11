diag_log ("fn_firedNearExtraction: Extraction smoke handler: " + str _this);
params ["_markerNo","_extractionType","_handler"];
diag_log ("fn_firedNearExtraction: Extraction Markernr: " + str _markerNo);
diag_log ("fn_firedNearExtraction: Extraction Type: " + str _extractionType);
_handler params ["_unit","_firer","_distance","_weapon","_muzzle","_mode","_ammo"];


//if(!(_unit getvariable ["A3E_ExtractionOnStandby",false])) exitwith {};
//_unit setvariable ["A3E_ExtractionOnStandby",false];

private _parents = ([(configFile >> "CfgAmmo" >> _ammo),true] call BIS_fnc_returnParents);
private _allowed = ["SmokeShell","Chemlight_base","FlareBase","SmokeLauncherAmmo"];
if(count(_allowed arrayIntersect _parents) > 0 ) then {
	switch (_extractionType) do {
		case "air": {
			[_markerNo] spawn A3E_fnc_RunExtraction;
			diag_log format["fn_firedNearExtraction: air extraction marker, calling helicopters to marker number %1",_markerNo];
		};
		case "sea": {
			[_markerNo] spawn A3E_fnc_RunExtractionBoat;
			diag_log format["fn_firedNearExtraction: sea extraction marker, calling boats to marker number %1",_markerNo];
		};
		case "land": {
			[_markerNo] spawn A3E_fnc_RunExtractionCar;
			diag_log format["fn_firedNearExtraction: land extraction marker, calling cars to marker number %1",_markerNo];
		};
	};

	deletevehicle _unit;
	//diag_log format["Extraction triggered at %1",_markerNo];
	private _pgrp = [] call A3E_fnc_getPlayerGroup;
	[leader _pgrp,"Stay sharp! Extraction should be on its way."] remoteExec ["groupChat",0,false];
} else {
	diag_log "fn_firedNearExtraction: Ammo not allowed to trigger extraction."
};
