if (!isServer) exitWith {};

params["_extractionPointNo"];

private _extraction = (A3E_ExtractionPositions select {_x select 0 == _extractionPointNo}) select 0;

_spawnMarkerName = "A3E_CarExtractionSpawnPos" + str _extractionPointNo;
_extractionMarkerName = "A3E_CarExtractionPos" + str _extractionPointNo;
_extractionMarkerName2 = "A3E_CarExtractionPos" + str _extractionPointNo + "_1";

private _spawnVector = (getMarkerPos _spawnMarkerName) vectorDiff (getMarkerPos _extractionMarkerName);
private _dir = (getMarkerPos _spawnMarkerName) getDir (getMarkerPos _extractionMarkerName);
private _pos = ((getMarkerPos _extractionMarkerName) vectorAdd _spawnVector) vectorAdd [0,0,0];
private _result = [_pos,_dir, selectRandom a3e_arr_extraction_car, A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _car1 = _result select 0;
private _group1 = _result select 2;


_pos = ((getMarkerPos _extractionMarkerName2) vectorAdd (_spawnVector vectorMultiply 1.2)) vectorAdd [0,0,0];
_result = [_pos,_dir, selectRandom a3e_arr_extraction_car, A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _car2 = _result select 0;
private _group2 = _result select 2;

_pos = ((getMarkerPos _extractionMarkerName) vectorAdd (_spawnVector vectorMultiply 0.8)) vectorAdd [0,0,0];
_result = [_pos,_dir, selectRandom a3e_arr_extraction_car_escort, A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _car3 = _result select 0;
private _group3 = _result select 2;

_car1 setvariable ["State","Init"];
_car2 setvariable ["State","Init"];
[_car1, getMarkerPos _extractionMarkerName,(_spawnVector vectorMultiply 5)] spawn A3E_fnc_ExtractionCar;
[_car2, getMarkerPos _extractionMarkerName2,(_spawnVector vectorMultiply 5)] spawn A3E_fnc_ExtractionCar;

_waypoint = _group3 addWaypoint [getMarkerPos _extractionMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointType "SAD";


diag_log format["fn_RunExtractionCar: Extraction cars spawned: %1, %2 and %3",_car1,_car2,_car3];

A3E_EvacHeli1 = _car1;
publicvariable "A3E_EvacHeli1";
A3E_EvacHeli2 = _car2;
publicvariable "A3E_EvacHeli2";
A3E_EvacHeli3 = _car3;
publicvariable "A3E_EvacHeli3";

_group1 setGroupIdGlobal ["Angel One"];
_group2 setGroupIdGlobal ["Angel Two"];
_group3 setGroupIdGlobal ["Shepherd"];




[_car1] spawn {
	params["_car"];
	sleep 5;
	[driver _car,"We are here to get you out. Shepherd is providing cover."] remoteExec ["sideChat",0,false];
};
_heloGuard = {
	params["_car"];
	sleep 6;
	private _msg = ["We are taking damage!","Under fire!","We are under fire!","Taking damage!","I thought the extraction zone was safe!"];
	waituntil{sleep 0.5;((getDammage _car)>0.1)};
	if(alive (driver _car)) then {
		[driver _car,selectRandom _msg] remoteExec ["sideChat",0,false];
	};
	waituntil{sleep 0.5;!(alive _car)};
	if(!(isNull _car)) then {
		[[A3E_VAR_Side_Blufor,"HQ"],format["%1 is down!",groupId (group (driver _car))]] remoteExec ["sideChat",0,false];
	};
};

_extractionGuard = {
	params["_car1","_car2","_marker"];
	sleep 6;
	waituntil{sleep 0.5;!(alive _car1) and !(alive _car2)};
	if(!(isNull _car1 or isNull _car2)) then {
		[[A3E_VAR_Side_Blufor,"HQ"],"Both vehicles are down!"] remoteExec ["sideChat",0,false];
		_marker setMarkerType "hd_objective";
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "";
	};
};


[_car1] spawn _heloGuard;
[_car2] spawn _heloGuard;
[_car3] spawn _heloGuard;
[_car1,_car2,(_extraction select 4)] spawn _extractionGuard;

sleep 1;


// Verkar inte funka...
(driver _car1) action ["LightOff", _car1];
(driver _car2) action ["LightOff", _car2];


while {{(_x in  _car1) || (_x in _car2) || (_x in _car3)} count (call A3E_fnc_GetPlayers) != count(call A3E_fnc_GetPlayers)} do {
	sleep 1;
};
_car1 setvariable ["State","Evac"];
_car2 setvariable ["State","Evac"];



if(alive (driver _car1)) then {
[driver _car1,"Everybody on board? Okay, let's get the hell out of here!"] remoteExec ["sideChat",0,false];
} else {
	if(alive (driver _car2)) then {
		[driver _car2,"Everybody on board? Okay, let's get the hell out of here!"] remoteExec ["sideChat",0,false];
	};
};


sleep 10;

["Task complete: Rendesvouz with allied forces."] call drn_fnc_CL_ShowTitleTextAllClients;
A3E_Task_Exfil_Complete = true;
publicvariable "A3E_Task_Exfil_Complete";
sleep 35;

if({vehicle _x == _car1 || vehicle _x == _car2} count (call A3E_fnc_GetPlayers) == count (call A3E_fnc_GetPlayers)) then {
	a3e_var_Escape_MissionComplete = true;
	publicVariable "a3e_var_Escape_MissionComplete";
} else {
	a3e_var_Escape_MissionFailed_LeftBehind = true;
	publicVariable "a3e_var_Escape_MissionFailed_LeftBehind";
};

