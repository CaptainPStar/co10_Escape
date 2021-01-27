private _interval = missionNamespace getvariable ["A3E_var_SearchleaderInterval",30];

private _trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval (_interval/2);
_trigger setTriggerActivation["NONE","PRESENT",true];
_trigger setTriggerArea[0, 0, 0, false];
A3E_var_SearchLeaderTick = true;
_trigger setTriggerStatements["A3E_var_SearchLeaderTick", "[] spawn A3E_fnc_SearchLeader;A3E_var_SearchLeaderTick = false;", "A3E_var_SearchLeaderTick = true;"];
missionNamespace setvariable ["A3E_var_LastArtilleryStrike",(diag_tickTime + 300)];
//private _channelID = radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "OPFOR COM", "%UNIT_NAME", [], false];
//missionNamespace setvariable ["A3E_var_EnemyRadioChannel",_channelID, true];