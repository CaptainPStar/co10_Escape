params["_pos","_side","_count"];

_count = _count - 1;
private _possibleInfantryTypes = [];

if(_side == A3E_VAR_Side_Ind) then {
	_possibleInfantryTypes = a3e_arr_Escape_InfantryTypes_Ind;
};
if(_side == A3E_VAR_Side_Opfor) then {
	_possibleInfantryTypes = a3e_arr_Escape_InfantryTypes;
};
if(count _possibleInfantryTypes <= 0) then {
	["Escape warning: Infantry array for village initialization is empty. a3e_arr_Escape_InfantryTypes may contain an error.",["Spawning","ERROR"]] call a3e_fnc_log;
};

private _leaderArray = _possibleInfantryTypes;
private _unitArray = _possibleInfantryTypes;

//Create a Group
private _group = creategroup _side;
[_group] call A3E_fnc_onEnemyGroupSpawn;

["Creating group with "+str (_count+1) +" units.",[]] call a3e_fnc_log;

_unit = _group createUnit [selectRandom _leaderArray, _pos, [], 0, "FORM"];
[_unit] call A3E_fnc_onEnemySoldierSpawn;
for "_x" from 1 to _count do {
   _unit = _group createUnit [selectRandom _unitArray, _pos, [], 0, "FORM"];
   [_unit] call A3E_fnc_onEnemySoldierSpawn;
};
_group