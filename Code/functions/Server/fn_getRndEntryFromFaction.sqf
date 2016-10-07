params[["_factionArr",[],[[]]],["_entry","",[[],""]],["_factionID", -1, [[],0]]];

private _entries = [];
if(typename _entry == "ARRAY") then {
	_entries = _entry call a3e_fnc_expandProbabilities;
	
} else {
	_entries = [_entry];
};
private _allUnits = [];
{
	_allUnits append ([_factionArr,_x] call a3e_fnc_getAssocArrayEntry);
} foreach _entries;
private _return = objNull;
if(count(_allUnits) > 0) then {
	_return = selectRandom _allUnits;
};
_return;
