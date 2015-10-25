//General mission flow triggerActivated

	//Mission won
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [5, 5, 5, false];
	_trigger setTriggerStatements["a3e_var_Escape_MissionComplete", "[""end2"",true,2] call BIS_fnc_endMission;", ""];

	waituntil{sleep 0.1;!isNil("A3E_PrisonLoudspeakerObject")};
	private["_soundpos","_trigger"];
	_soundpos = getpos A3E_PrisonLoudspeakerObject;
	_soundpos set[2,3];
	_trigger = createTrigger["EmptyDetector", _soundpos];
	_trigger setTriggerArea[25, 25, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", true];
	_trigger setTriggerStatements["A3E_SoundPrisonAlarm", "!A3E_SoundPrisonAlarm", ""];
	_trigger setSoundEffect ["$NONE$", "", "", "AlarmSfx"];
	
	//All players are unconscious
if(isserver) then {
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	_trigger setTriggerStatements["isServer && isMultiplayer && A3E_EscapeHasStarted && ({(_x getVariable ""AT_Revive_isUnconscious"")} count playableUnits == count playableUnits)", "a3e_var_Escape_AllPlayersDead = true;publicVariable ""a3e_var_Escape_AllPlayersDead"";[] spawn A3E_FNC_FailTasks;", ""];
};
	//Exit HSC cam because missions is ending
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["a3e_var_Escape_AllPlayersDead || a3e_var_Escape_MissionComplete", "[] call ATHSC_fnc_exit;", ""];

	//Skip date so the played hours match		
	//expCond="a3e_var_Escape_AllPlayersDead || a3e_var_Escape_MissionComplete;";
	//expActiv="setDate [date select 0, date select 1, date select 2, (date select 3) - a3e_var_Escape_hoursSkipped, date select 4];";

	//Mission failed
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [2, 2, 2, false];
	_trigger setTriggerStatements["a3e_var_Escape_AllPlayersDead", "[""end1"",false,2] call BIS_fnc_endMission;", ""];
		

// Task escape the prison
A3E_Task_Prison = player createSimpleTask ["Escape the prison"];
A3E_Task_Prison setSimpleTaskDescription [
   "Your squad is being held in an improvised prison waiting for OPFOR forces to pick you up for questioning. But the NATO loyal local resistance has hidden a backpack with pistols somewhere in the prison. Arm yourself and escape the prison!",
   "Escape the prison",
   "Escape the prison"
];
A3E_Task_Prison setTaskState "CREATED";


if(isNil("A3E_Task_Prison_Complete")) then {
	A3E_Task_Prison_Complete = false;
};
if(isNil("A3E_Task_Prison_Failed")) then {
	A3E_Task_Prison_Failed = false;
};

	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_Prison_Complete", "A3E_Task_Prison setTaskState ""Succeeded"";", ""];
		
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_Prison_Failed", "A3E_Task_Prison setTaskState ""Failed"";", ""];

if(isserver) then {
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	_trigger setTriggerStatements["isServer && A3E_EscapeHasStarted && ({(_x distance A3E_StartPos) > 50} count playableUnits)>0", "A3E_Task_Prison_Complete = true;publicVariable ""A3E_Task_Prison_Complete"";", ""];
};

// Task find Map
A3E_Task_Map= player createSimpleTask ["Find a map"];
A3E_Task_Map setSimpleTaskDescription [
   "Find a map of the enemy territory. You can find a map in the inventory of some of the enemy patrols. Not every enemy carries a map. On the map you may find information about enemy ammodepots, comcenters and more.",
   "Find a map",
   "Find a map"
];
A3E_Task_Map setTaskState "CREATED";


if(isNil("A3E_Task_Map_Complete")) then {
	A3E_Task_Map_Complete = false;
};
if(isNil("A3E_Task_Map_Failed")) then {
	A3E_Task_Map_Failed = false;
};

if(isserver) then {
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [0, 0, 0, false];
	_trigger setTriggerStatements["isserver && A3E_EscapeHasStarted && ({""ItemMap"" in (assignedItems _x)} count playableunits)>0", "A3E_Task_Map_Complete = true; publicvariable ""A3E_Task_Map_Complete"";", ""];
};
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_Map_Complete", "A3E_Task_Map setTaskState ""Succeeded"";", ""];
		
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_Map_Failed", "A3E_Task_Map setTaskState ""Failed"";", ""];



// Task Hack Commcenter
A3E_Task_ComCenter = player createSimpleTask ["Hack Communication Center"];
A3E_Task_ComCenter setSimpleTaskDescription [
   "Infiltrate a OPFOR communicationcenter, hack the comterminal (box in the middle of the comcenter) and request extraction from NATO HQ.",
   "Hack Communication Center",
   "Hack Communication Center"
];
A3E_Task_ComCenter setTaskState "CREATED";


if(isNil("A3E_Task_ComCenter_Complete")) then {
	A3E_Task_ComCenter_Complete = false;
};
if(isNil("A3E_Task_ComCenter_Failed")) then {
	A3E_Task_ComCenter_Failed = false;
};

	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_ComCenter_Complete", "A3E_Task_ComCenter setTaskState ""Succeeded"";", ""];
		
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_ComCenter_Failed", "A3E_Task_ComCenter setTaskState ""Failed"";", ""];



// Task Exfiltrate
A3E_Task_Exfil = player createSimpleTask ["Exfiltrate"];
A3E_Task_Exfil setSimpleTaskDescription [
   "After you managed to contact NATO HQ reach the position marked on the map, wait for the helicopters to arrive and escape the enemy territory.",
   "Exfiltrate",
   "Exfiltrate"
];
A3E_Task_Exfil setTaskState "CREATED";

if(isNil("A3E_Task_Exfil_Complete")) then {
	A3E_Task_Exfil_Complete = false;
};
if(isNil("A3E_Task_Exfil_Failed")) then {
	A3E_Task_Exfil_Failed = false;
};

	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_Exfil_Complete", "A3E_Task_Exfil setTaskState ""Succeeded"";", ""];
		
	_trigger = createTrigger["EmptyDetector", [0,0,0]];
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [1, 1, 1, false];
	_trigger setTriggerStatements["A3E_Task_Exfil_Failed", "A3E_Task_Exfil setTaskState ""Failed"";", ""];


A3E_FNC_FailTasks = {
	if(!A3E_Task_Prison_Complete) then {
		A3E_Task_Prison_Failed = true;
	};
	if(!A3E_Task_Map_Complete) then {
		A3E_Task_Map_Failed = true;
	};
	if(!A3E_Task_ComCenter_Complete) then {
		A3E_Task_ComCenter_Failed = true;
	};
	if(!A3E_Task_Exfil_Complete) then {
		A3E_Task_Exfil_Failed = true;
	};

};

if(isNil("A3E_WorldName")) then {
	A3E_WorldName = worldName;
};

player createDiaryRecord ["Diary", ["Credits", "Original Mission (Arma2) by Engima.<br />Mission ported to Arma3 by Vormulac and HyperZ.<br />Continue devlopment by NeoArmageddon.<br />Island ports and unit configs by Scruffy.<br /><br />The official co10 Escape mission for Arma3 is currently developed and maintained by NeoArmageddon and Scruffy."]]; 
player createDiaryRecord ["Diary", ["Hints (with spoilers)", "A local Nato-sympathiser has hidden a bag of pistols in the temporary prison just before your arrival.<br /><br />
The guards will be alarmed, if you gear up. Prepare for a fight!<br /><br />
The start is difficulty! Even experienced squads often fail the initial escape. Just restart and try again. I believe in you!<br /><br />
The prison is placed randomly. Search for the nearest settlement and have a look at the place-name sign.<br /><br />
Ambush enemy patrols to gear up and receive a map with the enemy POIs like ammodepots and comcenters.<br /><br />
Ambush an ammodepot to get heavy weapons like sniperrifles and launchers.<br /><br />
Ambush a comcenter and hack the antenna (small metal box). Stay near the box while hacking. An engineer hacks faster!<br /><br />
After making contact with HQ, two choppers and a gunship are dispatched to pick you up at a marked position on your map.<br /><br />
Don't try to escape by boat or a captured chopper. The next island is to far away and the enemy AA is deadly for non-stealth choppers.<br /><br />
The mission is (intentionally) not easy. You probably won't make it to the choppers in the first try. Don't be upset. Try again. The mission will feel completly different.<br /><br />
A lot of stuff is dynamic/random. Also there are plenty of customization parameters for different gameplay. You should definitly try this mission several times!<br /><br />"]];
player createDiaryRecord ["Diary", ["Mission *important*", "The guards took everything you had, weapons, maps, compasses, everything.<br /><br />If you manage to escape from the temporary prison, be sure the AAF will send what they have along with more experienced OPFOR troops to try to find you.<br /><br />All enemy units have heard about your activities and capture. If you are detected by an enemy unit, the unit will contact its headquarter within seconds (so if you take action quickly, the information may never reach the headquarter).<br /><br />If your position is reported to headquarter, the AAF search leader will focus the search in an area close to the reported position. If they lose track of you, they will assume you are still in the vicinity, and widen the search area after some amount of time.<br /><br />Altis is full of innocent civilians that are already oppressed by the AAF who are backed by OPFOR member states and currently not interested regarding your presence. However, if they feel threatened (that is if you kill one) they will turn against you and help the OPFOR forces by reporting in your position whenever they see you. You will also get a minus five points punishment.<br /><br />To find your way home you will need to establish radio contact with your own HQ. The enemy communication centers can be hijacked! (Communication centers are marked on map as OPFOR flag).<br /><br />The enemy communication centers are heavily guarded and take some time to hijack. You are lucky to have a tech savvy engineer in your group, who can handle such tasks quicker. To get near a communication center you will need heavy weapons.<br /><br />OPFOR guards AAF heavy weapons and ammunition depots (marked on map as depot marker).<br /><br />To find the ammunition depots and communication centers you must first find map.<br /><br />You never die, you can only go unconscious, and your skillful teammates can fix you no matter your injuries. Some wounds can only be healed by the medic.<br /><br />The brotherhood among you is a strength that increases to your chances, so beware of killing each other (which will result in a minus ten points punishment)."]];
player createDiaryRecord ["Diary", ["Situation", "You are held prisoner in an outdoor temporary prison. Armed AAF guards are watching your every move while waiting for OPFOR soldiers to arrive for your questioning. Since the guards that captured you by now know too much of your intentions, you are already treated as a high priority target. At best you will be treated as a prisoner of war, but having heard of the OPFOR's interrogation methods, you suspect that the questioning will not follow conventional methods. Add the value of the intelligence you have, which will be of enormous importance for the upcoming invasion, and you surely want to keep your eyes open for a good occasion to escape. Maybe you will have your window of opportunity. Is that a bag burried under some moss?"]];
player createDiaryRecord ["Diary", ["Intelligence Revealed", "OPFOR and the local military seem to know about the upcoming invasion, and are working hard on defensive preparations. They have stationed ammunition depots all over Altis, as well as advanced communication centers guarded by heavy armor."]];
player createDiaryRecord ["Diary", ["Background", format["Before the invasion of %1 a group of highly skilled army specialists were sent into the heart of the enemy's territory. The goal of their mission was to gather intelligence, classified as top priority information, of OPFOR defensive structures. While the mission in itself was very successful and revealed even more useful information than hoped for, the withdrawal from %1 was not. On the small and snaky roads of %1 they made one single mistake and suddenly found themselves lost. If even just for a minute, it was enough to shortly thereafter run straight into a heavily guarded road block. Without a chance to fight they were caught and taken prisoners to a temporary outdoor prison already holding an engineer thought to be killed in a helicopter crash.",A3E_WorldName]]];
player createDiaryRecord ["Diary", ["Global Background", "NATO has secretly and for some time been planning the invasion and liberation of Altis beginning in a couple of weeks."]];
        

