diag_log ("fn_firedNearExtraction: Extraction smoke handler: " + str _this);
params ["_markerNo","_isWater","_handler"];
diag_log ("fn_firedNearExtraction: Extraction Markernr: " + str _markerNo);
_handler params ["_unit","_firer","_distance","_weapon","_muzzle","_mode","_ammo"];


//if(!(_unit getvariable ["A3E_ExtractionOnStandby",false])) exitwith {};
//_unit setvariable ["A3E_ExtractionOnStandby",false];

private _parents = ([(configFile >> "CfgAmmo" >> _ammo),true] call BIS_fnc_returnParents);
private _allowed = ["SmokeShell","Chemlight_base","FlareBase","SmokeLauncherAmmo"];
if(count(_allowed arrayIntersect _parents) > 0 ) then {
	if (_isWater) then {
		[_markerNo] spawn A3E_fnc_RunExtractionBoat;
		diag_log format["fn_firedNearExtraction: marker in water, calling boats to marker number %1",_markerNo];
	} else {
		[_markerNo] spawn A3E_fnc_RunExtraction;
		diag_log format["fn_firedNearExtraction: marker on land, calling helicopters to marker number %1",_markerNo];
	};

	deletevehicle _unit;
	//diag_log format["Extraction triggered at %1",_markerNo];
	private _pgrp = [] call A3E_fnc_getPlayerGroup;
	[leader _pgrp,"Stay sharp! Extraction should be on its way."] remoteExec ["groupChat",0,false];
} else {
	diag_log "fn_firedNearExtraction: Ammo not allowed to trigger extraction."
};
