params["_endType"];

private _island = getText (missionConfigFile >> "EscapeIsland");
private _mod = getText (missionConfigFile >> "EscapeMod");
private _version = getText (missionConfigFile >> "EscapeVersion");

private _statisticsVersion = profileNamespace getVariable ["A3E_Statistics_Version", -1]; 
private _statistics = profileNamespace getVariable ["A3E_Statistics", []]; 

_statistics pushBack [_version,_mod,_island,_endType, count (call BIS_fnc_listPlayers), time, A3E_Task_Prison_Complete,A3E_Task_Map_Complete,A3E_Task_ComCenter_Complete,A3E_Task_Exfil_Complete];

profileNamespace setVariable ["A3E_Statistics", _statistics]; 
saveProfileNamespace;

with uiNamespace do { 
 private _html = findDisplay 46 ctrlCreate ["RscHTML", -1]; 
 _html ctrlSetBackgroundColor [0,0,0,1]; 
 _html ctrlSetPosition [0,0,0,0]; 
 _html ctrlCommit 0; 
 _html htmlLoad "http://escape.anzp.de/track.php?map=" + _island + "&mod=" + _mod + "&version=" + _version + "&players="+str count(call BIS_fnc_listPlayers)+"&end="+_endType+"&t1="+str A3E_Task_Prison_Complete+"&t2="+str A3E_Task_Map_Complete+"&t3="+str A3E_Task_ComCenter_Complete+"&t4="+str A3E_Task_Exfil_Complete; 
};