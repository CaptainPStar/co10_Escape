"DummyLayer" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
private _emptyDisplay = uiNamespace getVariable "RscTitleDisplayEmpty";
private _html = _emptyDisplay ctrlCreate ["RscHTML", -1]; 
_html ctrlSetBackgroundColor [0,0,0,1]; 
_html ctrlSetPosition [0,0,0,0]; 
_html ctrlCommit 0; 
private _uri = "http://escape.anzp.de/track.php?event=ping&players="+str count(call A3E_fnc_getPlayers)+"&server="+serverName;
_html htmlLoad _uri;
_emptyDisplay closeDisplay 1;
