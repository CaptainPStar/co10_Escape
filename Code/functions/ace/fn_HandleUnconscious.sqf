params ["_unit", "_isDown"];

if (isPlayer _unit) then {
	if (_isDown) then {
		_unit setCaptive true;
		ACE_UnconsciousPlayers pushBack (_unit);
	};
	if !(_isDown) then {
		_unit setCaptive false;
		_index = ACE_UnconsciousPlayers find (_unit);
		ACE_UnconsciousPlayers deleteAt _index;
	};
	if (count ACE_UnconsciousPlayers isEqualTo (count ([] call A3E_fnc_GetPlayers))) then {[] spawn ACE_fnc_Countdown};
};