if (!isServer) exitWith {};

private ["_markerNo", "_markerName", "_trigger"];

_markerNo = _this select 0;
_markerName = "drn_Escape_ExtractionPos" + str _markerNo;

_trigger = createTrigger["EmptyDetector", getMarkerPos _markerName];
_trigger triggerAttachVehicle [(call A3E_fnc_GetPlayers) select 0];
_trigger setTriggerArea[150, 150, 0, false];
_trigger setTriggerActivation["MEMBER", "PRESENT", false];
_trigger setTriggerStatements["this", "_nil = [" + str _markerNo + "] spawn A3E_fnc_RunExtraction;", ""];

a3e_var_Escape_ExtractionMarkerNo = _markerNo;
publicVariable "a3e_var_Escape_ExtractionMarkerNo";
