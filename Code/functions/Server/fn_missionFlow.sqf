private ["_trigger"];

a3e_var_Escape_AllPlayersDead = false;
a3e_var_Escape_SearchLeader_civilianReporting = false;
a3e_var_Escape_MissionComplete = false;
a3e_var_Escape_MissionFailed_LeftBehind = false;
	
if(isServer) then {


	//Win mission server
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [3, 3, 3, true];
	_trigger setTriggerStatements["a3e_var_Escape_MissionComplete && !a3e_var_Escape_SearchLeader_civilianReporting && !a3e_var_Escape_AllPlayersDead", """end2"" call A3E_fnc_endMissionServer;", ""];
	
	
	//Mission win (but failed by killing civilians)
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [3, 3, 3, true];
	_trigger setTriggerStatements["a3e_var_Escape_MissionComplete && a3e_var_Escape_SearchLeader_civilianReporting && !a3e_var_Escape_AllPlayersDead", """end4"" call A3E_fnc_endMissionServer;", ""];
	
	//Mission failed by MIA
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [3, 3, 3, true];
	_trigger setTriggerStatements["a3e_var_Escape_MissionFailed_LeftBehind && !a3e_var_Escape_AllPlayersDead", """end3"" call A3E_fnc_endMissionServer;", ""];

	//Mission failed
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [2, 2, 2, true];
	_trigger setTriggerStatements["a3e_var_Escape_AllPlayersDead", """end1"" call A3E_fnc_endMissionServer;", ""];
	
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	A3E_fnc_InlineEverybodyUnconscious = {
		private _return = 	(
								((([] call A3E_fnc_GetPlayers) findIf {!(_x getVariable ["AT_Revive_isUnconscious",false]);}) == -1) 
							OR 	((([] call A3E_fnc_GetPlayers) findIf {!(_x getVariable ["ACE_Revive_isUnconscious",false]);}) == -1)
							);
		_return;
	
	};
	_trigger setTriggerStatements["A3E_EscapeHasStarted && ([] call A3E_fnc_InlineEverybodyUnconscious)", "missionNamespace setvariable [""a3e_var_Escape_AllPlayersDead"",true,true];[] spawn A3E_FNC_FailTasks;", ""];
	
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	_trigger setTriggerStatements["A3E_EscapeHasStarted && ({(_x distance A3E_StartPos) > 50} count (call BIS_fnc_listPlayers))>0", "A3E_Task_Prison_Complete = true;publicVariable ""A3E_Task_Prison_Complete"";", ""];
	
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	_trigger setTriggerStatements["A3E_EscapeHasStarted && ({""ItemMap"" in (assignedItems _x)} count playableunits)>0", "A3E_Task_Map_Complete = true; publicvariable ""A3E_Task_Map_Complete"";", ""];
};
