if(!isserver) exitwith {};

if (isNil "A3E_MinComCenterDistance") then {
	A3E_MinComCenterDistance = 2000;
};

if (isNil "a3e_communicationCenterMarkers") then {
    a3e_communicationCenterMarkers = [];
	diag_log "Warning: Comcenter Templatearray was empty!";
};

private _comCenterMarkers = [] + a3e_communicationCenterMarkers;

if (isNil "A3E_ComCenterCount") then {
	A3E_ComCenterCount = 4;
};

//Shuffle comcenters
private _shuffledComCenterMarkers = [];
while {(count _comCenterMarkers) > 0} do {
	_shuffledComCenterMarkers pushBack (_comCenterMarkers deleteAt floor(random(count(_comCenterMarkers))));
};

// iterate over the set of all potential commcenter markers and make commCenters at no more than A3E_ComCenterCount of them.
//
// This ensures that the Comm Centres are never any less than A3E_MinComCenterDistance from each other or the starting point.

private _createdCount = 0;
private _comCenPositions = [];
private _instanceNo = 0;
{
	_x params ["_pos", "_rotation"];
	_rotation = _rotation + 180;
	private _ok = true;
	{
		if ((_pos distance _x) < A3E_MinComCenterDistance) then {
			_ok = false;
		};
	} foreach _comCenPositions;

	if ((_pos distance A3E_StartPos) < A3E_MinComCenterDistance) then {
			_ok = false;
	};

	if _ok then {
		// pick one of the BuildComCenter methods at random

		private _specialLists =	[_pos,_rotation,"com_cup_bk"] call A3E_fnc_isoTemplateRestore;
		
		private _vehicles = [_specialLists,"ParkedVehicles",[]] call BIS_fnc_getFromPairs;
		{
			_x params["_type","_realPos","_dir","_code"];
			private _veh = createVehicle [selectRandom a3e_arr_ComCenParkedVehicles, _realPos, [], 0, "NONE"];
			_veh setpos _realPos;
			_veh setDir (_rotation+_dir);
			[_veh,_code] spawn {(_this#0) call compile (_this#1);};
		} foreach _vehicles;
		
		private _statics = [_specialLists,"Statics",[]] call BIS_fnc_getFromPairs;
		{
			_x params["_type","_realPos","_dir","_code"];
			private _static = createVehicle [selectRandom a3e_arr_ComCenStaticWeapons, _realPos, [], 0, "NONE"];
			_static setposASL _realPos;
			_static setDir (_rotation+_dir);
			[_static,_code] spawn {(_this#0) call compile (_this#1);};
			[_static,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
		} foreach _statics;

		private _flags = [_specialLists,"Flags",[]] call BIS_fnc_getFromPairs;
		{
			_x forceFlagTexture A3E_VAR_Flag_Opfor;
		} foreach _flags;
		
		private _ammoboxes = [_specialLists,"Ammoboxes",[]] call BIS_fnc_getFromPairs;
		{
			_x params["_type","_realPos","_dir","_code"];
			private _box = createVehicle ["Box_East_Wps_F", _realPos, [], 0, "NONE"];
			_box setposATL _realPos;
			_box setDir (_rotation+_dir);
			[_box,_code] spawn {(_this#0) call compile (_this#1);};
			
			private ["_weapons", "_weaponMagazines", "_weaponCount"];
			 _weapons = [];
			_weaponMagazines = [];

			for "_i" from 0 to (count a3e_arr_AmmoDepotBasicWeapons - 1) do {
				private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];

				_handGunItem = a3e_arr_AmmoDepotBasicWeapons select _i;

				_weaponClassName = _handGunItem select 0;
				_probabilityOfPrecence = _handGunItem select 1;
				_minCount = _handGunItem select 2;
				_maxCount = _handGunItem select 3;
				_magazines = _handGunItem select 4;
				_magazinesPerWeapon = _handGunItem select 5;

				if (random 100 <= _probabilityOfPrecence) then {
					_weaponCount = floor (_minCount + random (_maxCount - _minCount));
					_weapons pushBack [_weaponClassName, _weaponCount];

					for "_j" from 0 to (count _magazines) - 1 do {
						_weaponMagazines pushBack [_magazines select _j, _weaponCount * _magazinesPerWeapon];
					};
				};
			};

			if (count _weapons > 0 || count _weaponMagazines > 0) then {
				clearWeaponCargoGlobal _box;
				clearMagazineCargoGlobal _box;
				clearItemCargoGlobal _box;
				clearBackpackCargoGlobal _box;

				{
					_box addWeaponCargoGlobal _x;
				} foreach _weapons;

				{
					_box addMagazineCargoGlobal _x;
				} foreach _weaponMagazines;
			};

		} foreach _ammoboxes;
		
		A3E_Var_ClearedPositions pushBack _pos;
		[format ["drn_CommunicationCenterMapMarker%1", _instanceNo], _pos, "o_hq"] call A3E_fnc_createLocationMarker;

		private _marker = createMarkerLocal [format ["drn_CommunicationCenterPatrolMarker%1", _instanceNo], _pos];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerAlphaLocal 0;
		_marker setMarkerSizeLocal [75, 75];

		_instanceNo = _instanceNo + 1;
		_createdCount = _createdCount + 1;
		_comCenPositions pushBack _pos;
	};
	if (_createdCount >= A3E_ComCenterCount) exitWith {};
} forEach _shuffledComCenterMarkers;
if (_createdCount < A3E_ComCenterCount) then  {
	diag_log ("Escape Warning: Could only create "+str(_createdCount)+"/"+str(A3E_ComCenterCount)+" comcenters");

};
a3e_var_Escape_communicationCenterPositions = _comCenPositions;
publicVariable "a3e_var_Escape_communicationCenterPositions";
