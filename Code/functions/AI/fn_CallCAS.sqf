_center = createCenter sideLogic;    
_group = createGroup _center;    
_pos = getpos player;     
_cas = _group createUnit ["ModuleCAS_F",_pos , [], 0, ""];   
_cas setDir 180;
_cas setVariable ["vehicle","I_Plane_Fighter_03_CAS_F"]; 
_cas setVariable ["type", 1];

private["_position","_success","_cas"];
_position = [_this,0,[0,0,0],[[]]] call bis_fnc_param;


_success = false;

_cas = _group createUnit ["ModuleCAS_F",_position , [], 0, ""]; 
_cas setDir (random 360);
_cas setVariable ["vehicle",(a3e_arr_CASplane select floor (random count a3e_arr_CASplane)),true];
_cas setVariable ["type", 0,true]; //0=guns	1=missiles	2=both



[_position] spawn {
			{
				private["_group","_group","_rotation","_pos","_fleepos"];
				_position = _this select 0;
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
		};
_success = true;