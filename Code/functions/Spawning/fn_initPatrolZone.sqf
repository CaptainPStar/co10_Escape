private["_zoneIndex"];


// ### Basic bootstrap and definitions ###
if(isNil("a3e_patrolZoneIndex")) then {
	a3e_patrolZoneIndex = 0;
	_zoneIndex = 0;
} else {
	a3e_patrolZoneIndex = a3e_patrolZoneIndex + 1;
	_zoneIndex = a3e_patrolZoneIndex;
};
if(isNil("a3e_patrolZones")) then {
	a3e_patrolZones = [];
};

params["_shape","_onInit",["_type","Default"]];

private _zonePosition = (_shape select 0);
private _zoneDir = (_shape select 1);
private _zoneShape = (_shape select 2);
private _zoneSizeXY = (_shape select 3);
private _zoneArea = (_zoneSizeXY select 0)*(_zoneSizeXY select 1);

//Select the side based on the zone size. Small zones are occupied by locals while large cities are occupied by OPFOR
private _side = A3E_VAR_Side_Ind;
if(_zoneArea > 5000) then {
	_side = A3E_VAR_Side_Opfor;
};

private _name = format["A3E_ZoneMarker%1",_zoneIndex];
private _marker = createMarker [_name,(_x select 0)];
_marker setMarkerDir (_x select 1);
_marker setMarkerShape (_x select 2);
_marker setMarkerSize (_x select 3);
_marker setMarkerColor "ColorBlue";
_name = format["A3E_ZoneMarkerText%1",_zoneIndex];
_marker setMarkerAlpha 0;

if(A3E_Debug) then {
	_marker setMarkerAlpha 0.2;
};

private _triggerRange = missionNamespace getvariable ["A3E_Param_EnemySpawnDistance",800];

private _trigger = createTrigger["EmptyDetector", _zonePosition, false];
_trigger setTriggerInterval 5;
private _playerGroup = [] call a3e_fnc_getPlayerGroup;
_trigger triggerAttachVehicle [vehicle (units _playerGroup select 0)];
_trigger setTriggerActivation["MEMBER", "PRESENT", true];
private _rectangle = false;
if(_zoneShape == "RECTANGLE") then {
	_rectangle = true;
};
_trigger setTriggerArea[(_zoneSizeXY select 0)+_triggerRange, (_zoneSizeXY select 1)+_triggerRange, _zoneDir, _rectangle];
_trigger setTriggerTimeout [1, 1, 1, true];
private _activation = format["[%1] call A3E_FNC_activatePatrolZone;",_zoneIndex];
private _deactivation = format["[%1] call A3E_FNC_deactivatePatrolZone;",_zoneIndex];
_trigger setTriggerStatements["this",_activation,""];

private _deactivationTrigger = createTrigger["EmptyDetector", _zonePosition, false];
_deactivationTrigger setTriggerInterval 5;
_deactivationTrigger triggerAttachVehicle [vehicle (units _playerGroup select 0)];
_deactivationTrigger setTriggerActivation["MEMBER", "PRESENT", true];
private _rectangle = false;
if(_zoneShape == "RECTANGLE") then {
	_rectangle = true;
};

//Deactivation trigger is 50m larger than activation, to prevent spawn/despawn oscillation
_deactivationTrigger setTriggerArea[(_zoneSizeXY select 0)+_triggerRange+50, (_zoneSizeXY select 1)+_triggerRange+50, _zoneDir, _rectangle];
_deactivationTrigger setTriggerTimeout [1, 1, 1, true];

_deactivationTrigger setTriggerStatements["this","",_deactivation];

private _zoneArray = [
			["trigger",_trigger],
			["deactivationtrigger",_deactivationTrigger],
			["marker",_marker],
			["zoneArea",_zoneArea],
			["initialized",false],
			["active",false],
			["patrols",[]],
			["housePatrols",[]]
			];
a3e_patrolZones set [_zoneIndex,createHashMapFromArray _zoneArray];




