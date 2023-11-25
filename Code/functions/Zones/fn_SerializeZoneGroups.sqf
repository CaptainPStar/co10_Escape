params["_zoneIndex"];

//["Starting serialization of zone "+str _zoneIndex,["Zones","Spawning","Serialization"]] call a3e_fnc_log;

private _zone = A3E_Zones select _zoneIndex;
private _marker = _zone get "marker";
private _groups = _zone get "groups";
private _serializedGroups = [];


{
	private _grp = _x;
	if(!isNull _grp) then {
		private _vehicleList = [];
		private _groupVehicles = [];
		private _units  = [];
		{
			private _unit = createHashMap;
			_unit set ["_class",typeof _x];
			_unit set ["_pos",getposATL _x];
			_unit set ["_dir",getdir _x];
			_unit set ["_loadout",getUnitLoadout [_x,false]];
			_unit set ["_rank",rank _x];
			private _hdmg = getAllHitPointsDamage _x;
			if((count _hdmg) >=3) then {
				_unit set ["_dmg",getAllHitPointsDamage _x];
			} else {
				_unit set ["_dmg",getdammage _x];
			};
			if(vehicle _x != _x) then {
				private _in = _vehicleList find (vehicle _x);
				if(_in<0) then {
					//Vehicle not yet serialized. Do it now!
					private _v = vehicle _x;
					private _veh = createHashMap;
					_veh set ["_class",typeof _v];
					_veh set ["_pos",getposATL _v];
					_veh set ["_dir",getdir _v];
					_veh set ["_fuel",fuel _v];
					private _hdmg = getAllHitPointsDamage _v;
					if((count _hdmg) >=3) then {
						_veh set ["_dmg",getAllHitPointsDamage _v];
					} else {
						_veh set ["_dmg",getdammage _v];
					};
					_vehicleList pushBack _v;
					_groupVehicles pushBack _veh;
				};

				_unit set ["_vehicleIndex",_in];
				_unit set ["_vehiclePosition",assignedVehicleRole  _x];
			};
			_units pushBack _unit;
		} foreach (units _x);
		private _ser = createHashMap;
		_ser set ["_homemarker",_marker];
		_ser set ["_units",_units];
		_ser set ["_vehicles",_groupVehicles];
		_ser set ["_side",side _x];
		_ser set ["_taskstate",[_x] call A3E_fnc_GetTaskState];
		_serializedGroups PushBack _ser;

		private _count = {alive _x} count (units _grp);
		if(_count > 0) then {
			{
				deletevehicle _x;
			} foreach (units _grp);
			deletegroup _x;
		};
		{deletevehicle _x;} foreach _vehicleList;
		["Group serialized and deleted",["Zones","Spawning","Serialization"]] call a3e_fnc_log;
	};
} foreach _groups;

_zone set ["serializedgroups",_serializedGroups];
_zone set ["groups",[]];