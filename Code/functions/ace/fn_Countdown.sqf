countStarted = true;
timeLeft = 30;
publicVariable "timeLeft";
while {(timeLeft > 0) && (count ACE_UnconsciousPlayers isEqualTo (count ([] call A3E_fnc_GetPlayers)))} do {
	[{titleText [format["Mission ending in %1",timeLeft], "PLAIN"];},"BIS_fnc_spawn",TRUE,FALSE] spawn BIS_fnc_MP;
	timeLeft = timeLeft - 1;
	publicVariable "timeLeft";
	sleep 1;
};
waitUntil {(timeLeft == 0) || !(count ACE_UnconsciousPlayers isEqualTo (count ([] call A3E_fnc_GetPlayers)))};
countStarted = false;
if (count ACE_UnconsciousPlayers isEqualTo (count ([] call A3E_fnc_GetPlayers))) then {
	ACE_allUnconscious = true;
	sleep 2;
	[{titleText ["", "PLAIN"];},"BIS_fnc_spawn",TRUE,FALSE] spawn BIS_fnc_MP;
}
else {[{titleText ["", "PLAIN"];},"BIS_fnc_spawn",TRUE,FALSE] spawn BIS_fnc_MP;};