params["_endtype"];


if(A3E_Param_SendStatistics == 1) then {

	private _island = getText (missionConfigFile >> "EscapeIsland");
	private _mod = getText (missionConfigFile >> "EscapeMod");
	private _version = getText (missionConfigFile >> "EscapeVersion");
	private _release = getText (missionConfigFile >> "EscapeRelease");
	private _build = getText (missionConfigFile >> "EscapeBuild");
	private _players = str count(call BIS_fnc_listPlayers);
	private _servername = serverName;
	private _guid = missionNamespace getvariable ["A3E_SessionGUID","00000000000-00000000000"];
	private _revives = missionNamespace getvariable ["A3E_Revive_Count",0];
	private _kills = missionNamespace getvariable ["A3E_Kill_Count",0];
// replace with the actual server URL where your API is hosted
	
	private _baseURL = "http://co10esc.anzp.de/api/session/";

		
	private _uri = _baseURL + "endsession?"
	+"uid="+_guid
	+"&kills="+str _kills
	+"&revives="+str _revives
	+"&end=" + _endtype;
	
	"DummyLayer" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
	private _emptyDisplay = uiNamespace getVariable "RscTitleDisplayEmpty";
	private _html = _emptyDisplay ctrlCreate ["RscHTML", -1]; 
	_html ctrlSetBackgroundColor [0,0,0,1]; 
	_html ctrlSetPosition [0,0,0,0]; 
	_html ctrlCommit 0; 
	_html htmlLoad _uri;
	_emptyDisplay closeDisplay 1;
	
};