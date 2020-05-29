private["_success"];
params["_position"];


_success = false;
diag_log ("Calling CAS to "+ str _position);
private _cas = "Logic" createVehicleLocal _position;
_cas setDir (random 360);
_cas setVariable ["vehicle",selectRandom a3e_arr_CASplane,true];
_cas setVariable ["bis_fnc_initModules_disableAutoActivation", false, !isServer ];
_cas setVariable ["type", selectRandom[0,0,1,2,3],true];


[_position,_cas] spawn {
	params["_position","_cas"];
	{
		private["_group","_group","_rotation","_pos","_fleepos"];
		_group = _x;
		if((side _group) == A3E_VAR_Side_Opfor  || (side _group) == A3E_VAR_Side_Ind ) then {
			if((((units _group) select 0) distance _position)<a3e_var_artillery_fleeingDistance) then {
				_pos = getposATL((units _x) select 0);
				_rotation = [_position,getposATL((units _group) select 0)] call bis_fnc_DirTo;
				_rotation = _rotation;
				_fleepos = [(_pos select 0)+sin(_rotation)*2*a3e_var_artillery_fleeingDistance,(_pos select 1)+cos(_rotation)*2*a3e_var_artillery_fleeingDistance,0];
				[_group,_fleepos] spawn a3e_fnc_Flee;
			};
		};
	} foreach AllGroups;
	[_cas,nil,true] spawn BIS_fnc_moduleCAS;
	deletevehicle _cas;
};

_success = true;
_success;