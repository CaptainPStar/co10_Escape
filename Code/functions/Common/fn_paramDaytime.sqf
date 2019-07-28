/*
	Author: Karel Moricky
	Edited by NeoArmageddon

	Description:
	Set time of the day

	Parameter(s):
	NUMBER - hour

	Returns:
	ARRAY - date
*/
params [["_hour", daytime, [0]]];
private _date = date;

if (_hour == 24) then {
	_hour = round (random 24);
};

_date set [3, _hour];
[_date] call BIS_fnc_setDate;
_date