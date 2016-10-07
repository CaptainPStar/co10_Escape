params[["_types","general",["",[]]],["_msg","No Message",[""]],["_data",[]]];

if(isNil("A3E_DebugLog")) then {
	A3E_DebugLog = [];
};
if(count A3E_DebugLog > 100) then {
	A3E_DebugLog deleteAt 0;
};
A3E_DebugLog append [[_types,_msg,time,_data]];