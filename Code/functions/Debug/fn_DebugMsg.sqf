//This function is depreciated and will be exchanged with a3e_fnc_log

params[["_msg","No Message",[""]],["_types","general",["",[]]]];
waituntil{time>2};

[_types,_msg] remoteExec ["a3e_fnc_logMessage", 0, false];

if(A3E_Debug) then {
    [[_msg],"a3e_fnc_systemChat",true] call BIS_fnc_MP;
	 [[_msg],"a3e_fnc_rptLog",true] call BIS_fnc_MP;
};