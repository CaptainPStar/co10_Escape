private["_return","_objs"];
_return = false;
_objs = nearestObjects [ATHSC_CamTarget, [], AT_Revive_clearedDistance];
if(({side _x == A3E_VAR_Side_Opfor || side _x == A3E_VAR_Side_Ind} count _objs)>0) then {
	_return = true;
};
_return;