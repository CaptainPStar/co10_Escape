params["_pos","_count"];

private _possibleInfantryTypes = missionNamespace getvariable ["A3E_UNITS_civilian_InfantryTypes",["C_man_p_beggar_F","C_man_1","C_Man_casual_4_v2_F","C_Man_casual_5_v2_F","C_Man_casual_6_v2_F","C_Man_casual_7_F","C_Man_casual_8_F"]];
private _side = civilian;

if(count _possibleInfantryTypes <= 0) then {
	["Escape warning: Infantry array for village initialization is empty. A3E_UNITS_civilian_InfantryTypes may contain an error.",["Spawning","ERROR"]] call a3e_fnc_log;
};

private _unitArray = _possibleInfantryTypes;

//Create a Group
private _group = creategroup _side;

["Creating civ group.",["Spawning"],[_side, _group]] call a3e_fnc_log;

for "_x" from 1 to _count do {
   private _unit = _group createUnit [selectRandom _unitArray, _pos, [], 0, "FORM"];
   [_unit] call A3E_fnc_onCivilianSpawn;
};
["Creating civ group with "+str (_count) +" units.",["Spawning"],[_side, units _group]] call a3e_fnc_log;
[_group] call A3E_fnc_onCivilianGroupSpawn;
_group