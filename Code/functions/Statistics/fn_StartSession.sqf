private _fnc_guid = {
	params["_servername"];
	private _guid = hashValue(_servername)+"-"+hashValue(systemTimeUTC);
	_guid;
};


if(A3E_Param_SendStatistics == 1) then {

	private _island = getText (missionConfigFile >> "EscapeIsland");
	private _mod = getText (missionConfigFile >> "EscapeMod");
	private _version = getText (missionConfigFile >> "EscapeVersion");
	private _release = getText (missionConfigFile >> "EscapeRelease");
	private _build = getText (missionConfigFile >> "EscapeBuild");
	private _players = str count(call BIS_fnc_listPlayers);
	private _servername = serverName;
	if(_servername == "") then  {
		_servername = "Local";
	};
	private _guid = _servername call _fnc_guid;
	missionNamespace setvariable ["A3E_SessionGUID",_guid];

// replace with the actual server URL where your API is hosted
	
	private _baseURL = "http://co10esc.anzp.de/api/session/";

		
	private _uri = _baseURL + "startsession?"
	+"uid="+_guid
	+"&server="+_servername
	+"&missionVersion="+_version
	+"&server=" + _servername
	+"&build=" + _build 
	+"&players=" + _players
	+"&mod=" + _mod
	+"&terrain=" + _island;

	"DummyLayer" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
	private _emptyDisplay = uiNamespace getVariable "RscTitleDisplayEmpty";
	private _html = _emptyDisplay ctrlCreate ["RscHTML", -1]; 
	_html ctrlSetBackgroundColor [0,0,0,1]; 
	_html ctrlSetPosition [0,0,0,0]; 
	_html ctrlCommit 0; 
	_html htmlLoad _uri;
	_emptyDisplay closeDisplay 1;
	
};