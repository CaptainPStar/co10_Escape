params ["_unit"];

_index = ACE_UnconsciousPlayers find _unit;
ACE_UnconsciousPlayers deleteAt _index;
if ((count ACE_UnconsciousPlayers isEqualTo (count ([] call A3E_fnc_GetPlayers))) && !(countStarted)) then {[] spawn ACE_fnc_Countdown};