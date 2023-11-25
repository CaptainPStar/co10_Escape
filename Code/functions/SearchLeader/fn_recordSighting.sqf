params["_reporter","_reported"];
//[format["This is %1 of squad %2. Reporting an enemy at %3. Looks like %4.",name _reporter, str(group _reporter),mapGridPosition _reported,name _reported]] remoteexec ["systemchat",0];
private _knowledge = _reporter targetKnowledge _reported;
[(_knowledge select 6),(_knowledge select 5)] call A3E_fnc_CreateKnownPosition;
[] spawn {
	sleep 60;
	[] call A3E_fnc_PlayerDetection;
};