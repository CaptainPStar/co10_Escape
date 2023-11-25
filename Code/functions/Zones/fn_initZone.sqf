private["_zoneIndex"];


// ### Basic bootstrap and definitions ###
if(isNil("A3E_ZoneIndex")) then {
	A3E_ZoneIndex = 0;
	_zoneIndex = 0;
} else {
	A3E_ZoneIndex = A3E_ZoneIndex + 1;
	_zoneIndex = A3E_ZoneIndex;
};
if(isNil("A3E_Zones")) then {
	A3E_Zones = [];
};
params["_shape","_onInit",["_type","Default"]];

private _zonePosition = (_shape select 0);
private _zoneDir = (_shape select 1);
private _zoneShape = (_shape select 2);
private _zoneSizeXY = (_shape select 3);
private _zoneArea = (_zoneSizeXY select 0)*(_zoneSizeXY select 1);

//ToDo: A Zone should have a type depending on the marker color from the map, so in the future we can handcraft/discern villages and bases etc

private _name = format["A3E_ZoneMarker%1",_zoneIndex];
private _marker = createMarker [_name,_zonePosition];
_marker setMarkerDir _zoneDir;
_marker setMarkerShape _zoneShape;
_marker setMarkerSize _zoneSizeXY;
_marker setMarkerColor "ColorBlue";
_marker setMarkerAlpha 0;

if(A3E_Debug) then {
	_marker setMarkerAlpha 0.2;
	private _markerLabel = createMarker [format["A3E_ZoneMarkerLabel%1",_zoneIndex],_zonePosition];
	_markerLabel setmarkershape "ICON";		
	_markerLabel setmarkertype "mil_dot";
	_markerLabel setMarkerSize [0.4, 0.4];
	_markerLabel setMarkerAlpha 0.5;
	_markerLabel setMarkerText format["Zone #%1 (Type: %2)",_zoneIndex, _type];
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
_trigger setTriggerTimeout [1,1, 1, true];
private _activation = format["[%1] call A3E_FNC_activateZone;",_zoneIndex];
private _deactivation = format["[%1] call A3E_FNC_deactivateZone;",_zoneIndex];
_trigger setTriggerStatements["this && time > 1",_activation,""];

private _deactivationTrigger = createTrigger["EmptyDetector", _zonePosition, false];
_deactivationTrigger setTriggerInterval 5;
_deactivationTrigger triggerAttachVehicle [vehicle (units _playerGroup select 0)];
_deactivationTrigger setTriggerActivation["MEMBER", "PRESENT", true];
private _rectangle = false;
if(_zoneShape == "RECTANGLE") then {
	_rectangle = true;
};

//Deactivation trigger is 100m larger than activation, to prevent spawn/despawn oscillation
_deactivationTrigger setTriggerArea[(_zoneSizeXY select 0)+_triggerRange+100, (_zoneSizeXY select 1)+_triggerRange+100, _zoneDir, _rectangle];
_deactivationTrigger setTriggerTimeout [1, 1, 1, true];

_deactivationTrigger setTriggerStatements["this","",_deactivation];

private _zoneArray = [
			["trigger",_trigger],
			["deactivationtrigger",_deactivationTrigger],
			["marker",_marker],
			["zonearea",_zoneArea],
			["oninit",_onInit],
			["type",toUpper _type],
			["initialized",false],
			["active",false]
			];
A3E_Zones set [_zoneIndex,createHashMapFromArray _zoneArray];
_zoneIndex;



