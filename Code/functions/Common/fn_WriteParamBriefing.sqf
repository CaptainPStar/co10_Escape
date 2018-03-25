params [["_settings","Error - No params received"]];
if(!isDedicated) then {
	waituntil{!isNull player};
	player createDiaryRecord ["Diary", ["Settings", _settings]];
};