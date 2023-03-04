params[["_msg","No Message",[""]],["_types","General",["",[]]],["_data",[]]];

if(isNil("A3E_DebugLog")) then {
	A3E_DebugLog = [];
};
if(count A3E_DebugLog > (missionNamespace getvariable ["A3E_MaxLogMessages",100])) then {
	A3E_DebugLog deleteAt 0;
};

private _filter = (missionNamespace getvariable ["A3E_DebugLogFilter",[]]);
if(_types isEqualType "") then
{
	_types = [_types];
};

A3E_DebugLog append [[_types,_msg,time,_data]];

//Write to Chat/rpt if Debug is on
if((missionNamespace getvariable ["A3E_Debug",false] && ({_x in _types} count _filter) == 0 )
	|| (!(missionNamespace getvariable ["A3E_Debug",false]) && ({_x in _types}count _filter) > 0 )
	) then {
	["Log: "+ _msg + " "+str _types+" "+str _data] call a3e_fnc_systemChat;
	["Escape Log: "+ _msg+" "+str _data] call a3e_fnc_rptLog;
};