if (!isServer) exitWith {};

params["_extractionPointNo",["_isWater",false]];

private _extraction = (A3E_ExtractionPositions select {_x select 0 == _extractionPointNo}) select 0;

private _spawnMarkerName = "A3E_ExtractionSpawnPos" + str _extractionPointNo;
private _extractionMarkerName = "A3E_ExtractionPos" + str _extractionPointNo;
//_extractionMarkerName2 = "A3E_ExtractionPos" + str _extractionPointNo + "_1";

private _dir = (getMarkerPos _spawnMarkerName) getDir (getMarkerPos _extractionMarkerName);
private _result = [[((getMarkerPos _spawnMarkerName) select 0) + 80, ((getMarkerPos _spawnMarkerName) select 1), 50],_dir, (a3e_arr_extraction_chopper select floor (random count a3e_arr_extraction_chopper)), A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _boat1 = _result select 0;
private _group1 = _result select 2;

private _waypoint = _group1 addWaypoint [getMarkerPos _extractionMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointStatements ["true", ""];

sleep 5;

_result = [[((getMarkerPos _spawnMarkerName) select 0), ((getMarkerPos _spawnMarkerName) select 1) + 80, 200], _dir, (a3e_arr_extraction_chopper_escort select floor (random count a3e_arr_extraction_chopper_escort)), A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _boat3 = _result select 0;
private _group3 = _result select 2;

_waypoint = _group3 addWaypoint [getMarkerPos _extractionMarkerName, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointType "LOITER";
_waypoint setWaypointLoiterRadius 100;

sleep 5;

_result = [[((getMarkerPos _spawnMarkerName) select 0) - 80, ((getMarkerPos _spawnMarkerName) select 1), 100], _dir, (a3e_arr_extraction_chopper select floor (random count a3e_arr_extraction_chopper)), A3E_VAR_Side_Blufor] call BIS_fnc_spawnVehicle;
private _boat2 = _result select 0;
private _group2 = _result select 2;

_waypoint = _group2 addWaypoint [getMarkerPos _extractionMarkerName2, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointStatements ["true", ""];

diag_log format["fn_RunExtraction: Extraction choppers spawned: %1, %2 and %3",_boat1,_boat2,_boat3];

A3E_EvacHeli1 = _boat1;
publicvariable "A3E_EvacHeli1";
A3E_EvacHeli2 = _boat2;
publicvariable "A3E_EvacHeli2";
A3E_EvacHeli3 = _boat3;
publicvariable "A3E_EvacHeli3";

_group1 setGroupIdGlobal ["Angel One"];
_group2 setGroupIdGlobal ["Angel Two"];
_group3 setGroupIdGlobal ["Archangel"];



_boat1 flyinheight 30;
_boat2 flyinheight 50;
_boat3 flyinheight 100;

[_boat1] spawn {
	params["_heli"];
	sleep 5;
	[driver _heli,"We are here to get you out. Archangel is providing cover."] remoteExec ["sideChat",0,false];
};
_heloGuard = {
	params["_heli"];
	sleep 6;
	private _msg = ["We are taking damage!","Under fire!","We are under fire!","Taking damage!","I thought the landing zone was safe!"];
	waituntil{sleep 0.5;((getDammage _heli)>0.1)};
	if(alive (driver _heli)) then {
		[driver _heli,selectRandom _msg] remoteExec ["sideChat",0,false];
	};
	waituntil{sleep 0.5;!(alive _heli)};
	if(!(isNull _heli)) then {
		[[A3E_VAR_Side_Blufor,"HQ"],format["%1 is going down!",groupId (group (driver _heli))]] remoteExec ["sideChat",0,false];
	};
};

_extractionGuard = {
	params["_heli1","_heli2","_marker"];
	sleep 6;
	waituntil{sleep 0.5;!(alive _heli1) and !(alive _heli2)};
	if(!(isNull _heli1 or isNull _heli2)) then {
		[[A3E_VAR_Side_Blufor,"HQ"],"Both birds are down!"] remoteExec ["sideChat",0,false];
		_marker setMarkerType "hd_objective";
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "";
	};
};

//Make helis charged :D
[_boat1,_boat2] spawn {
	params["_heli1","_heli2"];
	while{alive _heli1 || alive _heli2} do {
		private _distance = _heli1 distance _heli2;
		if(_distance < 30) then {
			private _vDis = vectorNormalized(getposATL _heli1 vectordiff getposATL _heli2);
			_heli1 setVelocity ((velocity _heli1) vectorAdd (_vDis vectorMultiply (15/_distance)));
			_heli2 setVelocity ((velocity _heli1) vectorAdd (_vDis vectorMultiply (-15/_distance)));
		};
		sleep 0.5;
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


while {{(_x in  _boat1) || (_x in _boat2)} count (call A3E_fnc_GetPlayers) != count(call A3E_fnc_GetPlayers)} do {
	sleep 1;
	if(alive _boat1 && (unitReady _boat1)) then {
		_boat1 land "GET IN";
	};
	if(alive _boat2 && (unitReady _boat2)) then {
		_boat2 land "GET IN";
	};
};
//When all are in, lock helis to prevent Joshi and Darcy from 'accidentally' ejecting
if({(_x in  _boat1) || (_x in _boat2)} count (call A3E_fnc_GetPlayers) == count(call A3E_fnc_GetPlayers)) then {
	_boat1 lock true;
	_boat2 lock true;
};
_boat1 land "NONE";
_boat2 land "NONE";


if(alive (driver _boat1)) then {
[driver _boat1,"Everybody on board? Okay, let's get the hell out of here!"] remoteExec ["sideChat",0,false];
} else {
	if(alive (driver _boat2)) then {
		[driver _boat2,"Everybody on board? Okay, let's get the hell out of here!"] remoteExec ["sideChat",0,false];
	};
};
private _away = (getMarkerPos _extractionMarkerName) vectorAdd (((getMarkerPos _spawnMarkerName) vectorDiff (getMarkerPos _extractionMarkerName))vectorMultiply 3);
_waypoint = _group1 addWaypoint [_away vectoradd [random 200, random 200, 0], 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

//sleep 5;

_waypoint = _group2 addWaypoint [_away vectoradd [random 200, random 200, 0], 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

sleep 10;

_waypoint = _group3 addWaypoint [_away vectoradd [random 200, random 200, 0], 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";


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

