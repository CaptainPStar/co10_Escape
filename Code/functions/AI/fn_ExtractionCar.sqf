params["_car","_extractPos","_evacVec"];

private _extract = false;

while {alive _car && !_extract} do {
	private _state = _car getvariable ["State","Unknown"];
	switch (_state) do {
		case "Init": { 
			["Extraction vehicles created.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			_car setvariable ["State","Approach"];
			private _waypoint = (group _car) addWaypoint [_extractPos, 0];
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointFormation "WEDGE";
			_waypoint setWaypointStatements ["true", "(vehicle this) setvariable [""State"",""Land""];"];
		};
		case "Approach": { 
			["Extraction vehicles switch to approach.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			if(_car distance _extractPos < 100) then {
				_car setSpeedMode "NORMAL";
			};
			if(_car distance _extractPos < 30) then {
				_car setSpeedMode "LIMITED";
			};
		};
		case "Land": { 
			["Extraction vehicles are parking.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			_car land "LAND";
			sleep 10;
			if(_car getvariable ["State","Unknown"] != "Evac") then {
				_car setvariable ["State","WaitForPlayers"];
			};
		};
		case "WaitForPlayers": {
			["Extraction vehicles are awaiting players.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			if(!isTouchingGround _car) then {
				if(_car getvariable ["State","Unknown"] != "Evac") then {
					_car setvariable ["State","Land"];
				};
			};
		};
		case "Evac": { 
			["Extraction vehicles are moving out for evac.",["Extraction"],[_extractPos]] call A3E_fnc_Log;
			sleep (random 4 + 1);
			_car land "NONE";
			_car setSpeedMode "FULL";
			private _waypoint = (group _car) addWaypoint [_extractPos vectorAdd _evacVec, 0];
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