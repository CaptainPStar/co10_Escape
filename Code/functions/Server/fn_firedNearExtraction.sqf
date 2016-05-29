diag_log ("Extraction smoke handler: " + str _this);
params ["_markerNo","_handler"];
diag_log ("Extraction Markernr: " + str _markerNo);
_handler params ["_unit","_firer","_distance","_weapon","_muzzle","_mode","_ammo"];


//if(!(_unit getvariable ["A3E_ExtractionOnStandby",false])) exitwith {};
//_unit setvariable ["A3E_ExtractionOnStandby",false];

private _parents = ([(configFile >> "CfgAmmo" >> _ammo),true] call BIS_fnc_returnParents);
private _allowed = ["SmokeShell","Chemlight_base","FlareBase","SmokeLauncherAmmo"];
if(count(_allowed arrayIntersect _parents) > 0) then {
	[_markerNo] spawn A3E_fnc_RunExtraction;
	deletevehicle _unit;
	diag_log "Extraction triggered.";
} else {
	diag_log "Ammo not allowed to trigger extraction."
};
