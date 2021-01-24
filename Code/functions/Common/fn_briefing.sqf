//General mission flow triggerActivated
private "_trigger";

//waituntil{sleep 0.1;!isNil("A3E_PrisonLoudspeakerObject")};
_trigger = createTrigger["EmptyDetector", [0,0,0]];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[25, 25, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", true];
_trigger setTriggerStatements["A3E_SoundPrisonAlarm", "thisTrigger setposASL ((getposASL A3E_PrisonLoudspeakerObject) vectorAdd [0,0,4]);", ""];
_trigger setSoundEffect ["$NONE$", "", "", "AlarmSfx"];
	
	//All players are unconscious

//Exit HSC cam because missions is ending
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["!isDedicated && a3e_var_Escape_AllPlayersDead || a3e_var_Escape_MissionComplete", "[] spawn ATHSC_fnc_exit;", ""];

	//Skip date so the played hours match		
	//expCond="a3e_var_Escape_AllPlayersDead || a3e_var_Escape_MissionComplete;";
	//expActiv="setDate [date select 0, date select 1, date select 2, (date select 3) - a3e_var_Escape_hoursSkipped, date select 4];";


// Task escape the prison
A3E_Task_Prison = player createSimpleTask ["Escape the prison"];
A3E_Task_Prison setSimpleTaskDescription [
   "Your squad is being held in an improvised prison waiting for enemy special forces to pick you up for questioning. Local resistance has hidden a backpack  with pistols somewhere in the prison. Arm yourself and escape the prison!",
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
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_Prison_Complete", "A3E_Task_Prison setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_Prison_Failed", "A3E_Task_Prison setTaskState ""Failed"";", ""];


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

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_Map_Complete", "A3E_Task_Map setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_Map_Failed", "A3E_Task_Map setTaskState ""Failed"";", ""];


// Locate  comcenter
private _text =  "Locate an enemy communication center. You may need to gather information from enemy patrols or check points of interest on the map to reveal the location of a comcenter.";

A3E_Task_LocateComcenter= player createSimpleTask ["Locate enemy communication center"];
A3E_Task_LocateComcenter setSimpleTaskDescription [
   _text,
   "Locate enemy communication center",
   "Locate enemy communication center"
];
A3E_Task_LocateComcenter setTaskState "CREATED";


if(isNil("A3E_Task_LocateComcenter_Complete")) then {
	A3E_Task_LocateComcenter_Complete = false;
};
if(isNil("A3E_Task_LocateComcenter_Failed")) then {
	A3E_Task_LocateComcenter_Failed = false;
};

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_LocateComcenter_Complete", "A3E_Task_LocateComcenter setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_LocateComcenter_Failed", "A3E_Task_LocateComcenter setTaskState ""Failed"";", ""];

// Task Hack Commcenter
A3E_Task_ComCenter = player createSimpleTask ["Hack Communication Center"];
A3E_Task_ComCenter setSimpleTaskDescription [
   "Infiltrate an enemy communication center, hack the com-terminal (box in the middle of the comcenter) and request extraction from our HQ.",
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

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_ComCenter_Complete", "A3E_Task_ComCenter setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_ComCenter_Failed", "A3E_Task_ComCenter setTaskState ""Failed"";", ""];



// Task Exfiltrate
A3E_Task_Exfil = player createSimpleTask ["Exfiltrate"];
A3E_Task_Exfil setSimpleTaskDescription [
   "After you managed to contact our HQ reach the position marked on the map. When you have secured the landing zone, throw a smoke grenade or shoot a flare and wait for the helicopters to arrive. Board the choppers when landed and escape the enemy territory.",
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

_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
_trigger setTriggerArea[0, 0, 0, false];
_trigger setTriggerActivation["NONE", "PRESENT", false];
_trigger setTriggerTimeout [1, 1, 1, false];
_trigger setTriggerStatements["A3E_Task_Exfil_Complete", "A3E_Task_Exfil setTaskState ""Succeeded"";", ""];
	
_trigger = createTrigger["EmptyDetector", [0,0,0], false];
_trigger setTriggerInterval 2;
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

player createDiaryRecord ["Diary", ["Help and Feedback", "Help us improve this mission by reporting bugs. Visit our Github bugtracker at https://github.com/NeoArmageddon/co10_Escape. There you can also download the latest, unreleased development versions of co10 Escape.<br /><br /> For discussion, direct feedback, sharing of your favorite Escape moments or just for looking for players you can join our Discord Server at https://discord.gg/0kV3JvVEhmnMfmq1"]]; 
player createDiaryRecord ["Diary", ["Credits", "Original Mission (Arma2) by Engima.<br />Mission ported to Arma3 by Vormulac and HyperZ.<br />Continue development and redesign by Captain P. Star alias NeoArmageddon.<br />Island ports and unit configs by Scruffy.<br />Additional coding and bugfixing by abelian, FrozenLiquidity, Dystopian, Phantom, DPM, Cyprus, aussie-battler, Kuroneko, Belkon, jaj22 and invrecon.<br />Mag repack script by outlawed.<br /><br />The official co10 Escape mission for Arma3 is developed and maintained by NeoArmageddon and Scruffy."]]; 
player createDiaryRecord ["Diary", ["Hints (with spoilers)", "A local resistance member has hidden a bag of pistols in the temporary prison just before your arrival.<br /><br />
The guards will be alarmed, if you gear up or escape. Prepare for a fight!<br /><br />
The start is difficult! Even experienced squads often fail the initial escape. Just restart and try again. I believe in you!<br /><br />
The prison is placed randomly. Search for the nearest settlement and have a look at the place-name sign.<br /><br />
Ambush enemy patrols to gear up and receive a map with the enemy POIs like ammodepots and comcenters.<br /><br />
Ambush an ammodepot to get heavy weapons like sniperrifles and launchers.<br /><br />
Ambush a comcenter and hack the com-terminal (box with green lamps). Stay near the box while hacking. An engineer hacks faster!<br /><br />
After making contact with HQ, two choppers and a gunship are dispatched to pick you up at a marked position on your map. You need to throw smoke or flare to signal the choppers you are ready for extraction.<br /><br />
Don't try to escape by boat or a captured chopper. The next island is to far away and the enemy AA is deadly for non-stealth choppers.<br /><br />
The mission is (intentionally) not easy. You probably won't make it to the choppers in the first try. Don't be upset. Try again. The mission will feel completly different every time and I garantuee you will have lots of fun even when you fail.<br /><br />
A lot of stuff is dynamic/random. Also there are plenty of customization parameters for different gameplay. You should definitly try this mission several times!<br /><br />"]];
player createDiaryRecord ["Diary", ["Mission *important*", "The guards took everything you had, weapons, maps, compasses, everything.<br /><br />If you manage to escape from the temporary prison, be sure the enemy will send what they have to try to find you.<br /><br />All enemy units have heard about your activities and capture. If you are detected by an enemy unit, the unit will contact their headquarter within seconds (so if you take action quickly, the information may never reach the headquarter).<br /><br />If your position is reported to headquarter, the search leader will focus the search in an area close to the reported position. If they lose track of you, they will assume you are still in the vicinity, and widen the search area after some amount of time.<br /><br />{* ISLANDNAME *} is full of innocent civilians that are already oppressed by the occupation troops and currently not interested regarding your presence. However, if they feel threatened (that is if you kill civilians) they will turn against you and help the enemy forces by reporting in your position whenever they see you.<br /><br />To find your way home you will need to establish radio contact with your own HQ but unfortunately the enemy is jamming all communications. Only the enemies communication centers are able to establish long-range radio connections! You need to find and secure an enemy com-center and use the terminal to contact your own HQ, so they give you the coordinates of an extraction position. (Communication centers are marked on map as OPFOR flag).<br /><br />The enemy communication centers are heavily guarded. To get near a communication center you will need heavy weapons.<br /><br />The enemy has camps with heavy weapons and ammunition all over the island (marked on map as depot marker).<br /><br />To find both,the ammunition depots and communication centers, you must first find map (ambush enemy patrols and search them for their maps. Not all enemy units have a map.).<br /><br />You never die, you can only go unconscious, and your skillful teammates can fix you no matter your injuries. Some wounds can only be healed by the medic. When all of your squad are unconscious, the mission will fail.<br /><br />"]];
player createDiaryRecord ["Diary", ["Situation", "You are held prisoner in an outdoor temporary prison. Armed guards of the local milita are watching your every move while waiting for OPFOR soldiers to arrive for your questioning. Since the guards that captured you by now know too much of your intentions, you are already treated as a high priority target. At best you will be treated as a prisoner of war, but having heard of the OPFOR's interrogation methods, you suspect that the questioning will not follow conventional methods. Add the value of the intelligence you have, which will be of enormous importance for the upcoming invasion, and you surely want to keep your eyes open for a good occasion to escape. Maybe you will have your window of opportunity. Is that a backpack hidden under some moss?"]];
player createDiaryRecord ["Diary", ["Intelligence Revealed", "OPFOR and the local military seem to know about the upcoming invasion, and are working hard on defensive preparations. They have stationed ammunition depots all over {* ISLANDNAME *}, as well as advanced communication centers guarded by heavy armor."]];
player createDiaryRecord ["Diary", ["Background", "Before the invasion of {* ISLANDNAME *} a group of highly skilled army specialists were sent into the heart of the enemy's territory. The goal of their mission was to gather intelligence, classified as top priority information, of OPFOR defensive structures. While the mission in itself was very successful and revealed even more useful information than hoped for, the withdrawal from {* ISLANDNAME *} was not. On the small and snaky roads of {* ISLANDNAME *} they made one single mistake and suddenly found themselves lost. If even just for a minute, it was enough to shortly thereafter run straight into a heavily guarded road block. Without a chance to fight they were caught and taken prisoners to a temporary outdoor prison already holding an engineer thought to be killed in a helicopter crash."]];
player createDiaryRecord ["Diary", ["Global Background", "BLUFOR has secretly and for some time been planning the invasion and liberation of {* ISLANDNAME *} beginning in a couple of weeks."]];
        

