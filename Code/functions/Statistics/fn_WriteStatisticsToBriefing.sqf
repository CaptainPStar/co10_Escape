params [["_statistics","Error - No params received"]];
if(!isDedicated) then {
	waituntil{!isNull player};
	player createDiaryRecord ["Diary", ["Statistics", _statistics]];
};