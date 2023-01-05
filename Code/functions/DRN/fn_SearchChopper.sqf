// Search Chopper v1.0
// Author: Engima of Östgöta Ops


private ["_chopper", "_searchAreaMarker", "_searchTimeMin", "_refuelTimeMin", "_debug", "_group", "_side", "_state", "_exitScript", "_position", "_waypoint", "_moveOutTimeSek", "_refuelStartTimeSek"];
private ["_oldGroup", "_homePos"];

_chopper = _this select 0;
_searchAreaMarker = _this select 1;
_searchTimeMin = _this select 2;
_refuelTimeMin = _this select 3;
if (count _this > 4) then {_debug = _this select 4;} else {_debug = false;};

if (isNil "a3e_var_commonLibInitialized") exitWith {
	private ["_message"];
	_message = "Scripts\DRN\CommonLib\CommonLib.sqf must be called before call to Scripts/DRN/SearchChopper/SearchChopper.sqf.";
	[_message] call A3E_fnc_DebugMsg;
};

_group = group _chopper;
_side = side leader _group;
_state = "IDLE";
_homePos = getPos _chopper;
private _updateSearchAreaTime = 0;
["Starting search chopper script..."] call A3E_fnc_DebugMsg;


if (vehicleVarName _chopper == "") exitWith {
	["Search chopper must have a name. Script exiting."] call A3E_fnc_DebugMsg;
};


_exitScript = false;

while {!_exitScript} do {
	switch (_state) do {
		case "IDLE": {
			
			_waypoint = _group addWaypoint [(getpos _chopper) vectoradd [-25,100,0], 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "LIMITED";
			
			_waypoint = _group addWaypoint [(getpos _chopper) vectoradd [75,75,0], 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "LIMITED";
			
			_waypoint = _group addWaypoint [(getpos _chopper) vectoradd [-25,-100,0], 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "LIMITED";
			
			_waypoint = _group addWaypoint [(getpos _chopper) vectoradd [-25,100,0], 0];
			_waypoint setWaypointType "CYCLE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "LIMITED";
			
			while {!([_searchAreaMarker] call drn_fnc_CL_MarkerExists)} do {
				sleep 1;
			};
		};
		case "READY": {
			_state = "MOVING OUT";
			_moveOutTimeSek = diag_tickTime;

			if (_debug) then {
				["Search chopper state: MOVING OUT."] call A3E_fnc_DebugMsg;
			};

			_chopper flyInHeight 100;
			_chopper setVariable ["waypointFulfilled", false];
			
			_chopper engineOn true;
			_chopper move [position _chopper select 0, position _chopper select 1, 85];
			while {(position _chopper) select 2 < 75} do {
				sleep 1;
			};

			_position = [_searchAreaMarker] call drn_fnc_CL_GetRandomMarkerPos;

			_waypoint = _group addWaypoint [_position, 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "SAFE";
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];
			_group setCurrentWaypoint _waypoint;
			if (_debug) then {
				//"SmokeShellBlue" createVehicle _position;
				createVehicle ["SmokeShellBlue", _position, [], 0, "NONE"];
			};
		};
		case "SEARCHING": {
			if (_debug) then {
				["Search chopper state: SEARCHING."] call A3E_fnc_DebugMsg;
			};
			
			_chopper setVariable ["waypointFulfilled", false];

			_position = [_searchAreaMarker] call drn_fnc_CL_GetRandomMarkerPos;
			_waypoint = _group addWaypoint [_position, 0];
			_waypoint setWaypointType "LOITER";
			_waypoint setWaypointLoiterType "CIRCLE_L";
			_waypoint setWaypointLoiterRadius (200+random 60);
			_waypoint setWaypointBehaviour "COMBAT";
			_waypoint setWaypointSpeed "LIMITED";
			_group setCurrentWaypoint _waypoint;
			_chopper flyInHeight 60 + random 40;

			if (_debug) then {
				//"SmokeShellRed" createVehicle _position;
				createVehicle ["SmokeShellRed", _position, [], 0, "NONE"];
			};
		};
		case "RETURNING": {
			if (_debug) then {
				["Search chopper state: RETURNING."] call A3E_fnc_DebugMsg;
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
			_group setCurrentWaypoint _waypoint;
			if (_debug) then {
				//"SmokeShellBlue" createVehicle _homePos;
				createVehicle ["SmokeShellBlue", _homePos, [], 0, "NONE"];
			};

			_chopper flyInHeight 100;
		};
		case "LANDING": {
				["Search chopper state: LANDING."] call A3E_fnc_DebugMsg;
			_chopper land "LAND";
			_chopper setVariable ["waypointFulfilled", false];
		};
		case "REFUELING": {
			// Do nothing
		};
		case "DEAD": {
				["Search chopper state: DEAD."] call A3E_fnc_DebugMsg;
		};
		default {
			["ERROR IN SearchChopper.sqf: Case " + _state + " not taken care of (1st switch)!"] call A3E_fnc_DebugMsg;
		};
	};

	while {1 == 1} do {

		// Check to see if chopper is still alive
		if (!alive _chopper) exitWith {
			_state = "DEAD";
			_exitScript = true;
		};
		if(_state == "IDLE") exitWith {
			_state = "READY";
		};
		// Check if current waypoint is fulfilled
		if (_chopper getVariable "waypointFulfilled") exitWith {

			switch (_state) do {
				case "MOVING OUT": {
					_state = "SEARCHING";
				};
				case "RETURNING": {
					_state = "LANDING";
				};
				default {
					["ERROR IN SearchChopper.sqf: Case " + _state + " not taken care of (2nd switch)!"] call A3E_fnc_DebugMsg;
				};
			};
		};

		if (_state == "LANDING") exitWith {
			_state = "REFUELING";
			if (_debug) then {
				["Search chopper state: REFUELING."] call A3E_fnc_DebugMsg;
			};

			_refuelStartTimeSek = diag_tickTime;
			_chopper setFuel 1;
		};

		if (_state == "REFUELING") exitWith {
			if (diag_tickTime > _refuelStartTimeSek + (_refuelTimeMin * 60)) then {
				_state = "READY";
			};
		};

		// Check if search time is up
		if ((diag_tickTime > _moveOutTimeSek + (_searchTimeMin * 60)) && (_state == "SEARCHING" || _state == "MOVING OUT")) exitWith {
			_state = "RETURNING";
		};
		
		if (_state == "SEARCHING") exitWith {
			sleep 15;
			_state = "SEARCHING";
		};
		sleep 1;
	};

	sleep 2;
};

if (_exitScript) then {
	if (_debug) then {
		["Search chopper unable to continue. Script exiting."] call A3E_fnc_DebugMsg;
	};
};

