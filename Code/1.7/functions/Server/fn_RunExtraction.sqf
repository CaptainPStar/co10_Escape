if (!isServer) exitWith {};

private ["_extractionPointNo"];
private ["_spawnMarkerName", "_extractionMarkerName", "_extractionMarkerName2", "_result", "_boat1", "_boat2", "_group1", "_group2", "_waypoint"];

_extractionPointNo = _this select 0;
_spawnMarkerName = "drn_Escape_ExtracionBoatSpawnPos" + str _extractionPointNo;
_extractionMarkerName = "drn_Escape_ExtractionPos" + str _extractionPointNo;
_extractionMarkerName2 = "drn_Escape_ExtractionPos" + str _extractionPointNo + "_1";


_result = [[((getMarkerPos _spawnMarkerName) select 0) + 25, ((getMarkerPos _spawnMarkerName) select 1) + 20, 100], 0, (a3e_arr_extraction_chopper select floor (random count a3e_arr_extraction_chopper)), A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
_boat1 = _result select 0;
_group1 = _result select 2;

_result = [[((getMarkerPos _spawnMarkerName) select 0) - 25, ((getMarkerPos _spawnMarkerName) select 1) - 20, 100], 0, (a3e_arr_extraction_chopper select floor (random count a3e_arr_extraction_chopper)), A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
_boat2 = _result select 0;
_group2 = _result select 2;

_result = [[((getMarkerPos _spawnMarkerName) select 0) - 40, ((getMarkerPos _spawnMarkerName) select 1) - 40, 100], 0, (a3e_arr_extraction_chopper_escort select floor (random count a3e_arr_extraction_chopper_escort)), A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
_boat3 = _result select 0;
_group3 = _result select 2;

_waypoint = _group1 addWaypoint [getMarkerPos _extractionMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointStatements ["true", "vehicle this land 'LAND'"];

_waypoint = _group2 addWaypoint [getMarkerPos _extractionMarkerName2, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointStatements ["true", "vehicle this land 'LAND'"];

_waypoint = _group3 addWaypoint [getMarkerPos _extractionMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointFormation "WEDGE";



_boat1 flyinheight 30;
_boat2 flyinheight 30;
_boat3 flyinheight 30;

sleep 1;


// Verkar inte funka...
(driver _boat1) action ["LightOff", _boat1];
(driver _boat2) action ["LightOff", _boat2];

if (isMultiplayer) then {
    waitUntil {{vehicle _x == _boat1 || vehicle _x == _boat2} count (call A3E_fnc_GetPlayers) == count (call A3E_fnc_GetPlayers)};
}
else {
    waitUntil {{vehicle _x == _boat1 || vehicle _x == _boat2} count units group ((call A3E_fnc_GetPlayers) select 0) == count units group ((call A3E_fnc_GetPlayers) select 0)};
};

_boat1 land "NONE";
_boat2 land "NONE";

_waypoint = _group1 addWaypoint [getMarkerPos _spawnMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

_waypoint = _group2 addWaypoint [getMarkerPos _spawnMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

_waypoint = _group3 addWaypoint [getMarkerPos _spawnMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";


sleep 10;

["Task complete: Rendesvouz with allied forces."] call drn_fnc_CL_ShowTitleTextAllClients;
A3E_Task_Exfil_Complete = true;
publicvariable "A3E_Task_Exfil_Complete";
sleep 35;


a3e_var_Escape_MissionComplete = true;
publicVariable "a3e_var_Escape_MissionComplete";

