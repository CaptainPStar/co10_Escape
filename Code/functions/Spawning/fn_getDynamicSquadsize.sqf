params[["_overWriteBase",-1],["_overWriteMod",-1],["_min",2],["_max",12]];

private _base = missionNamespace getvariable ["A3E_Param_EnemyGroupSize",5];

if(_overWriteBase >= 0) then {
	_base  = _overWriteBase;
};
private _mod = missionNamespace getvariable ["A3E_Param_DynamicGroupSizeMultiplier",1];
if(_overWriteMod >= 0) then {
	_mod  = _overWriteMod;
};
private _numPlayers = count([] call A3E_fnc_GetPlayers);
private _unitsPerGroup = _base;
if(_base<0) then {
	switch (_base) do {
		case -1: { _unitsPerGroup = round(_numPlayers*0.5); };
		case -2: { _unitsPerGroup = round(_numPlayers*1);};
		case -3: { _unitsPerGroup = round(_numPlayers*1.5); };
		default {  };
	};
};

_unitsPerGroup = _unitsPerGroup + selectRandom [-1,-1,0,0,0,1,1,1,2];
_unitsPerGroup = _unitsPerGroup max _min;
_unitsPerGroup = _unitsPerGroup min _max;
_unitsPerGroup;