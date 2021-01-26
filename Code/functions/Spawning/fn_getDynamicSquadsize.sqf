params[["_overWriteBase",-1],["_overWriteMod",-1],["_min",2],["_max",12]];

private _base = missionNamespace getvariable ["A3E_Param_EnemyGroupSize",2];
if(_overWriteBase >= 0) then {
	_base  = _overWriteBase;
};
private _mod = missionNamespace getvariable ["A3E_Param_DynamicGroupSizeMultiplier",0.5];
if(_overWriteMod >= 0) then {
	_base  = _overWriteMod;
};
private _numPlayers = count([] call A3E_fnc_GetPlayers);
private _unitsPerGroup = (_base + round(_numPlayers *_mod) + selectRandom [-1,0,1]) max _min;
_unitsPerGroup = _unitsPerGroup min _max;
_unitsPerGroup;