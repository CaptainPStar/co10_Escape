disableserialization;
private _ok = createDialog "A3E_DebugView";
if(_ok) then {
	private _dialog = uiNamespace getVariable ['A3E_DebugView', displayNull];
	//private _menu = _dialog ctrlCreate ["RscListBox",-1];

	lbClear 630002;
	private _messages = [] call a3e_fnc_getDebugMessages;
	{
		lbAdd [630002, str (_x select 0)+" : "+(_x select 1)];
	} foreach _messages;
	while{dialog} do {
		sleep 0.01;
	};
};