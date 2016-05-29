private["_group","_state","_position","_homeMarker","_localRange","_range"];
_position = _this select 0;

{
	_group = _x;
	if((side _group) == A3E_VAR_Side_Ind  || (side _group) == A3E_VAR_Side_Opfor) then {
		if((((units _group) select 0) distance _position)<a3e_var_maxSearchRange) then {
			_state = [_group] call a3e_fnc_GetTaskState;
			if(_state == "PATROL" || _state == "SAD") then {
				_homeMarker = _group getvariable ["a3e_homeMarker","noMarker"];
				if(_homeMarker != "noMarker") then {
					//Limiting the range of Garnisons
					if((getMarkersize _homeMarker select 0)>(getMarkersize _homeMarker select 1)) then {
						_range = (getMarkersize _homeMarker select 0);
					} else {
						_range = (getMarkersize _homeMarker select 1);
					};
					if((((units _group) select 0) distance _position)<_range) then {
						[_group,getposATL _position] spawn a3e_fnc_Search;
					};
				} else {
					if((random 100) < 50) then {
						[_group,getposATL _position] spawn a3e_fnc_Search;
					};
				};
				
				
			};
		};
	};
} foreach AllGroups;