params ["_group", "_newTarget"];

["Grp "+str _group+" spotted enemy "+name _newTarget,["AI","SearchLeader"]] call A3E_fnc_log;