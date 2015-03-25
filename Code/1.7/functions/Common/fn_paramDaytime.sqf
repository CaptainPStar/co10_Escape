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

private ["_hour","_date"];
_hour = [_this,0,daytime,[0]] call bis_fnc_param;
_date = date;
if(_hour==24) then {
	_hour = round(random(24));
};
_date set [3,_hour];
[_date] call bis_fnc_setDate;
_date