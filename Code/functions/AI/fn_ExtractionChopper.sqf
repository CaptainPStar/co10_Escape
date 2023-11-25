params["_heli","_extractPos","_evacVec"];

private _extract = false;

while {alive _heli && !_extract} do {
	private _state = _heli getvariable ["State","Unknown"];
	switch (_state) do {
		case "Init": { 
			["Extraction choppers created.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			_heli setvariable ["State","Approach"];
			private _waypoint = (group _heli) addWaypoint [_extractPos, 30];
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointFormation "WEDGE";
			_waypoint setWaypointStatements ["true", "(vehicle this) setvariable [""State"",""Land""];"];
		};
		case "Approach": { 
			["Extraction choppers switch to approach.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			if(_heli distance _extractPos < 300) then {
				_heli setSpeedMode "NORMAL";
				_heli flyinheight 30;
			};
			if(_heli distance _extractPos < 60) then {
				_heli setSpeedMode "LIMITED";
				_heli flyinheight 20;
			};
		};
		case "Land": { 
			["Extraction choppers are landing.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			_heli land "LAND";
			sleep 10;
			if(_heli getvariable ["State","Unknown"] != "Evac") then {
				_heli setvariable ["State","WaitForPlayers"];
			};
		};
		case "WaitForPlayers": {
			["Extraction choppers are awaiting players.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			if(!isTouchingGround _heli) then {
				if(_heli getvariable ["State","Unknown"] != "Evac") then {
					_heli setvariable ["State","Land"];
				};
			};
		};
		case "Evac": { 
			["Extraction choppers are moving out for evac.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			sleep (random 4 + 1);
			_heli land "NONE";
			_heli setSpeedMode "FULL";
			private _waypoint = (group _heli) addWaypoint [_extractPos vectorAdd _evacVec, 0];
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointFormation "WEDGE";
			_waypoint setWaypointStatements ["true", ""];
			_extract = true;
		};
		default { };
	};
	sleep 2;
};