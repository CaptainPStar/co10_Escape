if (!isServer) exitWith {};

//backup for unitclasses without boat classnames
if ((count a3e_arr_extraction_boat <1) && (A3E_VAR_Side_Blufor == west)) then {
a3e_arr_extraction_boat = ["B_Boat_Armed_01_minigun_F"];
a3e_arr_extraction_boat_escort = ["B_Boat_Armed_01_minigun_F"];
};
if ((count a3e_arr_extraction_boat <1) && (A3E_VAR_Side_Blufor == east)) then {
a3e_arr_extraction_boat = ["O_T_Boat_Armed_01_hmg_F"];
a3e_arr_extraction_boat_escort = ["O_T_Boat_Armed_01_hmg_F"];
};

params["_extractionPointNo"];

private _extraction = (A3E_ExtractionPositions select {_x select 0 == _extractionPointNo}) select 0;

_spawnMarkerName = "A3E_BoatExtractionSpawnPos" + str _extractionPointNo;
_extractionMarkerName = "A3E_BoatExtractionPos" + str _extractionPointNo;
_extractionMarkerName2 = "A3E_BoatExtractionPos" + str _extractionPointNo + "_1";

private _spawnVector = (getMarkerPos _spawnMarkerName) vectorDiff (getMarkerPos _extractionMarkerName);
private _dir = (getMarkerPos _spawnMarkerName) getDir (getMarkerPos _extractionMarkerName);
private _pos = ((getMarkerPos _extractionMarkerName) vectorAdd _spawnVector) vectorAdd [0,0,0];
private _result = [_pos,_dir, selectRandom a3e_arr_extraction_boat, A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _boat1 = _result select 0;
private _group1 = _result select 2;


_pos = ((getMarkerPos _extractionMarkerName2) vectorAdd (_spawnVector vectorMultiply 1.2)) vectorAdd [0,0,0];
_result = [_pos,_dir, selectRandom a3e_arr_extraction_boat, A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _boat2 = _result select 0;
private _group2 = _result select 2;

_pos = ((getMarkerPos _extractionMarkerName) vectorAdd (_spawnVector vectorMultiply 0.8)) vectorAdd [0,0,0];
_result = [_pos,_dir, selectRandom a3e_arr_extraction_boat_escort, A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _boat3 = _result select 0;
private _group3 = _result select 2;

_boat1 setvariable ["State","Init"];
_boat2 setvariable ["State","Init"];
[_boat1, getMarkerPos _extractionMarkerName,(_spawnVector vectorMultiply 5)] spawn A3E_fnc_ExtractionCar;
[_boat2, getMarkerPos _extractionMarkerName2,(_spawnVector vectorMultiply 5)] spawn A3E_fnc_ExtractionCar;

_waypoint = _group3 addWaypoint [getMarkerPos _extractionMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointType "SAD";


diag_log format["fn_RunExtractionCar: Extraction boats spawned: %1, %2 and %3",_boat1,_boat2,_boat3];

A3E_EvacHeli1 = _boat1;
publicvariable "A3E_EvacHeli1";
A3E_EvacHeli2 = _boat2;
publicvariable "A3E_EvacHeli2";
A3E_EvacHeli3 = _boat3;
publicvariable "A3E_EvacHeli3";

_group1 setGroupIdGlobal ["Dolphin One"];
_group2 setGroupIdGlobal ["Dolphin Two"];
_group3 setGroupIdGlobal ["Hammerhead"];




[_boat1] spawn {
	params["_boat"];
	sleep 5;
	[driver _boat,"We are here to get you out. Hammerhead is providing cover."] remoteExec ["sideChat",0,false];
};
_heloGuard = {
	params["_boat"];
	sleep 6;
	private _msg = ["We are taking damage!","We are sinking!","Under fire!","We are under fire!","Taking damage!","I thought the extraction zone was safe!","I thought the coast zone was clear!"];
	waituntil{sleep 0.5;((getDammage _boat)>0.1)};
	if(alive (driver _boat)) then {
		[driver _boat,selectRandom _msg] remoteExec ["sideChat",0,false];
	};
	waituntil{sleep 0.5;!(alive _boat)};
	if(!(isNull _boat)) then {
		[[A3E_VAR_Side_Blufor,"HQ"],format["%1 is down!",groupId (group (driver _boat))]] remoteExec ["sideChat",0,false];
	};
};

_extractionGuard = {
	params["_boat1","_boat2","_marker"];
	sleep 6;
	waituntil{sleep 0.5;!(alive _boat1) and !(alive _boat2)};
	if(!(isNull _boat1 or isNull _boat2)) then {
		[[A3E_VAR_Side_Blufor,"HQ"],"Both boats are sunk!"] remoteExec ["sideChat",0,false];
		_marker setMarkerType "hd_objective";
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "";
	};
};


[_boat1] spawn _heloGuard;
[_boat2] spawn _heloGuard;
[_boat3] spawn _heloGuard;
[_boat1,_boat2,(_extraction select 4)] spawn _extractionGuard;

sleep 1;


// Verkar inte funka...
(driver _boat1) action ["LightOff", _boat1];
(driver _boat2) action ["LightOff", _boat2];


while {{(_x in  _boat1) || (_x in _boat2) || (_x in _boat3)} count (call A3E_fnc_GetPlayers) != count(call A3E_fnc_GetPlayers)} do {
	sleep 1;
};
_boat1 setvariable ["State","Evac"];
_boat2 setvariable ["State","Evac"];



if(alive (driver _boat1)) then {
[driver _boat1,"Everybody on board? Okay, let's get the hell out of here!"] remoteExec ["sideChat",0,false];
} else {
	if(alive (driver _boat2)) then {
		[driver _boat2,"Everybody on board? Okay, let's get the hell out of here!"] remoteExec ["sideChat",0,false];
	};
};


sleep 10;

["Task complete: Rendesvouz with allied forces."] call drn_fnc_CL_ShowTitleTextAllClients;
A3E_Task_Exfil_Complete = true;
publicvariable "A3E_Task_Exfil_Complete";
sleep 35;

if({vehicle _x == _boat1 || vehicle _x == _boat2} count (call A3E_fnc_GetPlayers) == count (call A3E_fnc_GetPlayers)) then {
	a3e_var_Escape_MissionComplete = true;
	publicVariable "a3e_var_Escape_MissionComplete";
} else {
	a3e_var_Escape_MissionFailed_LeftBehind = true;
	publicVariable "a3e_var_Escape_MissionFailed_LeftBehind";
};

