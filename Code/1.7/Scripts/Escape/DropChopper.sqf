if (!isServer) exitWith {};

private ["_chopper", "_dropPosition", "_onGroupDropped", "_debug", "_group", "_waypoint", "_dropUnits"];

_chopper = _this select 0;
_dropUnits = _this select 1;
_dropPosition = _this select 2;
if (count _this > 3) then {_onGroupDropped = _this select 3;} else {_onGroupDropped = {};};
if (count _this > 4) then {_debug = _this select 4;} else {_debug = false;};

_group = group _chopper;

if (_debug) then {
    player sideChat "Starting drop chopper script...";
};

if (vehicleVarName _chopper == "") exitWith {
	sleep 5;
	player sideChat "Drop chopper must have a name. Script exiting.";
};

_chopper setVariable ["waypointFulfilled", false];
_chopper setVariable ["missionCompleted", false];

[_chopper, _dropUnits, _dropPosition, _onGroupDropped, _debug] spawn {
	private ["_chopper", "_dropUnits", "_dropPosition", "_onGroupDropped", "_debug", "_i", "_dropGroup"];
    
    _chopper = _this select 0;
    _dropUnits = _this select 1;
    _dropPosition = _this select 2;
    _onGroupDropped = _this select 3;
    _debug = _this select 4;
    
	while {!(_chopper getVariable "waypointFulfilled")} do {
		sleep 1;
	};

	if (_debug) then {
		player sideChat "Drop chopper dropping cargo...";
	};
	


   for "_i" from 0 to ((count _dropUnits - 1)) step 1 do{
		_dropUnit = _dropUnits select _i;
		
		unassignVehicle _dropUnit;
		_dropUnit setPos [(getPos _chopper) select 0,(getPos _chopper) select 1, ((getPos _chopper) select 2) - 5];
		
		// _dropUnit action ["eject", _chopper]; 
        // waitUntil {vehicle _dropUnit != _chopper};
		
		[_dropUnit,_chopper,50,false,true,false] spawn{
			private ["_man2","_chopper","_openHeight","_para","_smokes","_flares","_chems","_smoke","_flare","_chem"];
			_man2 = _this select 0;
			_chopper = _this select 1;
			_openHeight = _this select 2;
			_smokes = _this select 3;
			_flares = _this select 4;
			_chems = _this select 5;
			waitUntil{((getPos _man2)select 2)<_openHeight};
			_para = createVehicle ["NonSteerable_Parachute_F", position _man2, [], ((direction _chopper)-25+(random 50)), 'NONE'];
			_para setPos (getPos _man2);
			_man2 moveInDriver _para;
			
			if(_smokes)then{
				waitUntil{((getPos _man2)select 2)<10};
				//_smoke = "SmokeShell" createVehicle (getPos _man2);
				_smoke = createVehicle ["SmokeShell", (getPos _man2), [], 0, "NONE"];
			};
			if(_flares)then{
				waitUntil{((getPos _man2)select 2)<5};
				//_flare = "F_40mm_Red" createVehicle [(getPos _man2) select 0,(getPos _man2) select 1,0]; //Chemlight_red
				_flare = createVehicle ["F_40mm_Red", [(getPos _man2) select 0,(getPos _man2) select 1,0], [], 0, "NONE"];
			};
			if(_chems)then{
				waitUntil{((getPos _man2)select 2)<2};
				//_chem = "Chemlight_red" createVehicle (getPos _man2);
				_chem = createVehicle ["Chemlight_red", (getPos _man2), [], 0, "NONE"];
			};
		};
		
		sleep .3;
	};
	
	
	
	

    _dropUnits = units (group (_dropUnits select 0));
    _dropGroup = group (_dropUnits select 0);
    [_dropGroup, _dropPosition] call _onGroupDropped;
    
	while {!(_chopper getVariable "missionCompleted")} do {
		sleep 1;
	};

	if (_debug) then {
		player sideChat "Drop chopper terminating...";
	};

	{
		deleteVehicle _x;
	} foreach units group _chopper;
	deleteVehicle _chopper;
};

if (_debug) then {
	//"SmokeShellRed" createVehicle _dropPosition;
	createVehicle ["SmokeShellRed", _dropPosition, [], 0, "NONE"];
	player sideChat "Drop chopper moving out...";
};

_chopper flyInHeight 250;
_chopper engineOn true;
_chopper move [position _chopper select 0, position _chopper select 1, 100];
while {(position _chopper) select 2 < 100} do {
	sleep 1;
};

_waypoint = _group addWaypoint [_dropPosition, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""waypointFulfilled"", true];"];


_waypoint = _group addWaypoint [getPos _chopper, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointStatements ["true", vehicleVarName _chopper + " setVariable [""missionCompleted"", true];"];



