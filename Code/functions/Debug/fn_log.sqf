_this spawn {
	params[["_msg","No Message",[""]],["_types","General",["",[]]],["_data",[]]];
	waituntil{time>1};
	[_msg,_types,_data] remoteExec ["a3e_fnc_logMessage", 0, false];
};