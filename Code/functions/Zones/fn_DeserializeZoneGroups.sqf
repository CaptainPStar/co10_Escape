params["_zoneIndex"];

private _zone = A3E_Zones select _zoneIndex;
private _marker = _zone get "marker";
private _groups = [];
private _serializedGroups = _zone get "serializedgroups";

["Starting deserialization of zone "+str _zoneIndex,["Zones","Spawning","Serialization"]] call a3e_fnc_log;

{
		private _ser = _x;
		private _groupVehicles = [];
		private _homemarker = _ser get "_homemarker";
		private _units = _ser get "_units";
		private _vehicles = _ser get "_vehicles";
		private _side = _ser get "_side";
		private _taskstate = _ser get "_taskstate";
		{
			(values _x) params (keys _x);
			private _veh = createVehicle [_class, _pos, [], 0, "None"];
			_veh setposATL _pos;
			_veh setdir _dir;
			_veh setfuel _fuel;
			if(typeName(_dmg)=="ARRAY") then {
				{
					_veh setHitIndex [_foreachIndex,_x];
				} foreach _dmg#2;
			} else {
				_veh setdammage _dmg;
			};
			_groupVehicles pushBack _veh;
		} foreach _vehicles;
		private _grp = creategroup _side;
		{
			(values _x) params (keys _x);
			private _unit = _grp createUnit [_class, _pos, [], 0, "FORM"];
			_unit setposATL _pos;
			_unit setdir _dir;
			_unit setrank _rank;
			_unit setUnitLoadout[_loadout,false];
			if(typeName(_dmg)=="ARRAY") then {
				{
					_unit setHitIndex [_foreachIndex,_x];
				} foreach _dmg#2;
			} else {
				_unit setdammage _dmg;
			};
			if("_vehicleIndex" in _x) then {
				private _veh = _groupVehicles select _vehicleIndex;
				switch(_vehiclePosition#0) do {
					case "driver": { 
						_unit assignAsDriver _veh;
						_unit moveInDriver _veh;
					};
					case "cargo": {
						if(count(_vehiclePosition==1)) then {
							_unit assignAsCargo _veh;
							_unit moveInCargo _veh;
						} else {
							_unit moveInTurret [_veh, _vehiclePosition#1];
							_unit assignAsTurret [_veh, _vehiclePosition#1];
						};
					};
					case "turret": { 
						_unit moveInTurret [_veh, _vehiclePosition#1];
						_unit assignAsTurret [_veh, _vehiclePosition#1];
					};
				};
			};
		} foreach _units;
		_grp setvariable ["a3e_homeMarker",_homemarker];
		switch(_taskstate) do {
			case "PATROL":
			{
				[_grp] call A3E_FNC_Patrol;
			};
			case "SAD":
			{
				[_grp] call A3E_FNC_Patrol;
			};
			case "STROLL":
			{
				[_grp] call A3E_FNC_Stroll;
			};
			case "OCCUPY":
			{
				[_grp] call A3E_FNC_OCCUPY;
			};
			case "SHELTER":
			{
				[_grp] call A3E_FNC_SeekShelter;
			};
			default
			{
				[_grp] call A3E_FNC_Patrol;
			};
		};
		[_grp] call A3E_fnc_TrackGroup_Add;
		_groups pushBack _grp;
		["Group "+str(_grp)+" deserialized",["Zones","Spawning","Serialization"]] call a3e_fnc_log;
} foreach _serializedGroups;

_zone set ["groups",_groups];
_zone set ["serializedgroups",[]];