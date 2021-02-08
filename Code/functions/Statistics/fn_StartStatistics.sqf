
if(A3E_Param_SendStatistics == 1) then {

	private _island = getText (missionConfigFile >> "EscapeIsland");
	private _mod = getText (missionConfigFile >> "EscapeMod");
	private _version = getText (missionConfigFile >> "EscapeVersion");
	private _release = getText (missionConfigFile >> "EscapeRelease");

	"DummyLayer" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
	private _emptyDisplay = uiNamespace getVariable "RscTitleDisplayEmpty";
	private _html = _emptyDisplay ctrlCreate ["RscHTML", -1]; 
	_html ctrlSetBackgroundColor [0,0,0,1]; 
	_html ctrlSetPosition [0,0,0,0]; 
	_html ctrlCommit 0; 
	private _uri = "http://escape.anzp.de/track.php?event=startmission&map=" + _island + "&mod=" + _mod + "&version=" + _version + "&players="+str count(call BIS_fnc_listPlayers)+"&server="+serverName+"&release="+ _release;
	_html htmlLoad _uri;
	_emptyDisplay closeDisplay 1;
	
	private _trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 300;
	_trigger setTriggerActivation["NONE","PRESENT",true];
	_trigger setTriggerArea[0, 0, 0, false];
	missionnamespace setvariable ["A3E_var_PingTrg",true,false];
	_trigger setTriggerStatements["A3E_var_PingTrg", "[] spawn A3E_fnc_PingStatistics;A3E_var_PingTrg = false;", "A3E_var_PingTrg=true;"];
};