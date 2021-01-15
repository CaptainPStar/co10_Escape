params["_boat","_extractPos","_evacVec"];

private _extract = false;

while {alive _boat && !_extract} do {
	private _state = _boat getvariable ["State","Unknown"];
	switch (_state) do {
		case "Init": { 
			systemchat "Init Boat";
			_boat setvariable ["State","Approach"];
			private _waypoint = (group _boat) addWaypoint [_extractPos, 0];
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointFormation "WEDGE";
			_waypoint setWaypointStatements ["true", "(vehicle this) setvariable [""State"",""Land""];"];
		};
		case "Approach": { 
			systemchat "Approaching";
			if(_boat distance _extractPos < 100) then {
				_boat setSpeedMode "NORMAL";
			};
			if(_boat distance _extractPos < 40) then {
				_boat setSpeedMode "LIMITED";
			};
		};
		case "Land": { 
			systemchat "Landing";
			_boat land "LAND";
			sleep 10;
			if(_boat getvariable ["State","Unknown"] != "Evac") then {
				_boat setvariable ["State","WaitForPlayers"];
			};
		};
		case "WaitForPlayers": {
			systemchat "Waiting";
			if(!isTouchingGround _boat) then {
				if(_boat getvariable ["State","Unknown"] != "Evac") then {
					_boat setvariable ["State","Land"];
				};
			};
		};
		case "Evac": { 
			systemchat "Extracting";
			sleep (random 4 + 1);
			_boat land "NONE";
			_boat setSpeedMode "FULL";
			private _waypoint = (group _boat) addWaypoint [_extractPos vectorAdd _evacVec, 0];
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