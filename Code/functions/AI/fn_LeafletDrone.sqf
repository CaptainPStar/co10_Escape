// Search Chopper v1.0
// Author: Engima of Östgöta Ops

if (!isServer) exitWith {};

private ["_chopper", "_searchAreaMarker", "_searchTimeMin", "_refuelTimeMin", "_group", "_side", "_state", "_exitScript", "_position", "_waypoint", "_moveOutTimeSek", "_refuelStartTimeSek"];
private ["_oldGroup", "_homePos"];

_chopper = _this select 0;
_searchAreaMarker = _this select 1;
_searchTimeMin = _this select 2;
_refuelTimeMin = _this select 3;


if (isNil "a3e_var_commonLibInitialized") exitWith {
	private ["_message"];
	_message = "Scripts\DRN\CommonLib\CommonLib.sqf must be called before call to functions/AI/fn_LeafletDrone.sqf.";
	player sideChat _message;
	diag_log _message;
};

_group = group _chopper;
_side = side leader _group;
_state = "READY";
_homePos = getPos _chopper;

if (A3E_Debug) then {
    player sideChat "Starting leaflet drone script...";
};

if (vehicleVarName _chopper == "") exitWith {
	sleep 5;
	player sideChat "leaflet drone must have a name. Script exiting.";
};

while {!([_searchAreaMarker] call drn_fnc_CL_MarkerExists)} do {
	sleep 1;
};
if (A3E_Debug) then {
    player sideChat "Leaflet drone moving out...";
};
_exitScript = false;

while {!_exitScript} do {
	switch (_state) do {
		case "READY": {
			_state = "MOVING OUT";
			_moveOutTimeSek = diag_tickTime;

			if (A3E_Debug) then {
				player sideChat "leaflet drone state: MOVING OUT.";
			};

			_chopper flyInHeight 60;
			_chopper setVariable ["waypointFulfilled", false];
			
			_chopper engineOn true;
			_chopper move [position _chopper select 0, position _chopper select 1, 85];
			while {(position _chopper) select 2 < 50} do {
				sleep 1;
			};
			
			_position = [_searchAreaMarker] call drn_fnc_CL_GetRandomMarkerPos;

			_waypoint = _group addWaypoint [_position, 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];

			if (A3E_Debug) then {
				//"SmokeShellBlue" createVehicle _position;
				createVehicle ["SmokeShellBlue", _position, [], 0, "NONE"];
			};
		};
		case "SEARCHING": {
			if (A3E_Debug) then {
				player sideChat "leaflet drone state: SEARCHING.";
			};

			_chopper setVariable ["waypointFulfilled", false];
			
			if (({(_x distance _chopper)<200} count ([] call A3E_fnc_GetPlayers))>0) then {
			_chopper fire "Bomb_Leaflets";
			
			diag_log format["fn_LeafletDrone: Leaflets dropped at %1",(getpos _chopper)];
			if (A3E_Debug) then {
				player sideChat format["fn_LeafletDrone: Leaflets dropped at %1",(getpos _chopper)];
				};
			};
			_position = getpos ([] call A3E_fnc_GetRandomPlayer);
			_waypoint = _group addWaypoint [_position, 50];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "LIMITED";
			//_waypoint setWaypointLoiterType "CIRCLE";
			//_waypoint setWaypointLoiterRadius ((random 75) + 75);
			_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];

			_chopper flyInHeight 25;

			if (A3E_Debug) then {
				//"SmokeShellRed" createVehicle _position;
				//createVehicle ["SmokeShellRed", _position, [], 0, "NONE"];
			};
		};
		case "RETURNING": {
			if (A3E_Debug) then {
				player sideChat "leaflet drone state: RETURNING.";
			};

			_oldGroup = _group;
			_group = createGroup _side;
			{[_x] joinSilent _group;} foreach units _oldGroup;
			deleteGroup _oldGroup;

			_chopper setVariable ["waypointFulfilled", false];

			_waypoint = _group addWaypoint [_homePos, 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "NORMAL";
			_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];

			if (A3E_Debug) then {
				//"SmokeShellBlue" createVehicle _homePos;
				createVehicle ["SmokeShellBlue", _homePos, [], 0, "NONE"];
			};

			_chopper flyInHeight 100;
		};
		case "LANDING": {
			if (A3E_Debug) then {
				player sideChat "leaflet drone state: LANDING.";
			};

			_chopper land "LAND";
			_chopper setVariable ["waypointFulfilled", false];
		};
		case "REFUELING": {
			// Do nothing
		};
		case "DEAD": {
			if (A3E_Debug) then {
				player sideChat "Search chopper state: DEAD.";
			};
		};
		default {
			player sideChat "ERROR IN fn_leafletDrone.sqf: Case " + _state + " not taken care of (1st switch)!";
		};
	};

	while {true} do {

		// Check to see if chopper is still alive
		if (!alive _chopper) exitWith {
			_state = "DEAD";
			_exitScript = true;
		};

		// Check if current waypoint is fulfilled
		if (_chopper getVariable "waypointFulfilled") exitWith {

			switch (_state) do {
				case "MOVING OUT": {
					_state = "SEARCHING";
				};
				case "SEARCHING": {
					_state = "SEARCHING";
				};
				case "RETURNING": {
					_state = "LANDING";
				};
				default {
					player sideChat "ERROR IN fnLeafletDrone.sqf: Case " + _state + " not taken care of (2nd switch)!";
				};
			};
		};

		if (_state == "LANDING") exitWith {
			_state = "REFUELING";
			if (A3E_Debug) then {
				player sideChat "leaflet drone state: REFUELING.";
			};

			_refuelStartTimeSek = diag_tickTime;
			_chopper setFuel 1;
			_chopper addmagazine "1Rnd_Leaflets_Guer_F";
		};

		if (_state == "REFUELING") exitWith {
//			player sideChat "Tick time == " + str diag_tickTime + " AND right side == " + str (_refuelStartTimeSek + (_refuelTimeMin * 60));
			if (diag_tickTime > _refuelStartTimeSek + (_refuelTimeMin * 60)) then {
				_state = "READY";
			};
		};

		// Check if search time is up
		if ((diag_tickTime > _moveOutTimeSek + (_searchTimeMin * 60)) && (_state == "SEARCHING" || _state == "MOVING OUT")) exitWith {
			_state = "RETURNING";
		};
		if (!("1Rnd_Leaflets_Guer_F" in magazines _chopper) && !(_state == "RETURNING")) exitWith {
			_state = "RETURNING";
		};
		sleep 1;
	};

	sleep 2;
};

if (_exitScript) then {
	if (A3E_Debug) then {
		player sideChat "leaflet drone unable to continue. Script exiting.";
	};
};

