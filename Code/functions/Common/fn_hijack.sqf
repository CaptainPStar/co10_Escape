private ["_isUnconscious","_generatorTrailer"];
private [ "_count", "_text","_engineer"];
params["_target","_unit","_id"];
_generatorTrailer = cursorTarget;
//BIS_fnc_DataTerminalAnimate
if((_generatorTrailer getvariable ["A3E_Terminal_Hacked",false])) exitwith {systemchat "Terminal already used!";};

_generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
[_generatorTrailer,"red","red","red"] spawn BIS_fnc_DataTerminalColor;
_count = 36;
_engineer = [(configFile >> "CfgVehicles" >> typeof _unit),"engineer",0] call BIS_fnc_returnConfigEntry;
if (_engineer == 1) then {
	_count = 12;
};


_stateSteps = floor(_count/3);
_state1 = _count-(_stateSteps)*0;
_state2 = _count-(_stateSteps)*1;
_state3 = _count-(_stateSteps)*2;
while {(_count > 0) && (_unit distance _generatorTrailer < 3) && !(_unit getVariable ["AT_Revive_isUnconscious",false])} do
{
	_text = "Hacking " + str _count;
	if(_count==_state1) then {
		[_generatorTrailer,1] spawn BIS_fnc_DataTerminalAnimate;
	};
	if(_count==_state2) then {
		[_generatorTrailer,2] spawn BIS_fnc_DataTerminalAnimate;
	};
	if(_count==_state3) then {
		[_generatorTrailer,3] spawn BIS_fnc_DataTerminalAnimate;
	};
	cutText [_text, "Plain", 1];
	sleep 1;

	_count = _count - 1;
};

[_generatorTrailer,0] spawn BIS_fnc_DataTerminalAnimate;
_isUnconscious = _unit getVariable ["AT_Revive_isUnconscious",false];
if (_count > 0 && _isUnconscious) exitWith {
    cutText ["Hacking aborted!", "Plain", 1];
	_generatorTrailer setvariable ["A3E_Terminal_Hacked",false,true];
	[_generatorTrailer,"green","green","green"] spawn BIS_fnc_DataTerminalColor;
};

if (_count > 0 && _unit distance _generatorTrailer > 3) exitWith {
    cutText ["You must get closer!", "Plain", 1];
	_generatorTrailer setvariable ["A3E_Terminal_Hacked",false,true];
	[_generatorTrailer,"green","green","green"] spawn BIS_fnc_DataTerminalColor;
};

cutText ["", "Plain", 1];

if(_count == 0) then {
	[getpos _generatorTrailer] remoteExec ["A3E_fnc_SelectExtractionZone",2];
	_generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
};
