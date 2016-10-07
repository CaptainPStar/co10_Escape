/*
 * Description: This is a faction config including all the classnames for units, vehicles and weapons
 * Blah
 * More explanation stuff
 */

/////////////////////////////////////////////////////////////////////
// Header
// Don't change this!
private _returnNames = [];
private _returnValues = [];
/////////////////////////////////////////////////////////////////////

// Name of the faction
_returnNames append ["FactionName"];
_returnValues append ["BIS_Syndikat"];

// For which side can this file be used?
// Can only be one or more of: "Player", "Enemy", "Indep", "Civilian"
_returnNames append ["UsableSides"];
_returnValues append [["Indep"]];

// Texture for flags used on camps of this faction
_returnNames append ["FlagTexture"];
_returnValues append ["\A3\Data_F\Flags\flag_fd_green_CO.paa"];


/////////////////////////////////////////////////////////////////////
// Infantry units
// Random array
// Probability depends on number of entries
// A number can be added to duplicate a classname, so _"Blah",3_ equals _"Blah","Blah","Blah"_
// Arrays are supported, ["Blah","Doom","Test"] is counted as one entry, and when chosen with a possibility of 1/3 for each
// Combination ["Blah",2,"Doom"],3 is possible
/////////////////////////////////////////////////////////////////////

// classnames used as a leader of a group
_returnNames append ["InfantryLeaderTypes"];
_returnValues append [
	[
	"I_C_Soldier_Bandit_6_F"
	] call a3e_fnc_expandProbabilities
];
// normal Infantry units for squads, patrols, guards
_returnNames append ["InfantryTypes"];
_returnValues append [
	[
	"I_C_Soldier_Bandit_1_F",3//Medic
	,"I_C_Soldier_Bandit_2_F",3//RPG
	,"I_C_Soldier_Bandit_3_F",3//MG
	,"I_C_Soldier_Bandit_4_F",2//Mines
	,"I_C_Soldier_Bandit_5_F",3//Scout (Rifle)
	,"I_C_Soldier_Bandit_6_F",2//UGL
	,"I_C_Soldier_Bandit_7_F",2//Dealer (Rifle)
	,"I_C_Soldier_Bandit_8_F",3//Watcher (Rifle)
	] call a3e_fnc_expandProbabilities
];
// Special Forces for paradrops
_returnNames append ["InfantrySFTypes"];
_returnValues append [
	[
	"I_C_Soldier_Para_1_F"//Soldier (Rifle)
	,"I_C_Soldier_Para_2_F"//Enforcer (Rifle)
	,"I_C_Soldier_Para_3_F"//Medic
	,"I_C_Soldier_Para_4_F"//MG
	,"I_C_Soldier_Para_5_F"//RPG
	,"I_C_Soldier_Para_6_F"//UGL
	,"I_C_Soldier_Para_7_F"//Deserter (Rifle)
	,"I_C_Soldier_Para_8_F"//Saboteur
	] call a3e_fnc_expandProbabilities
];
// Pilot types for helicopters
_returnNames append ["PilotTypes"];
_returnValues append [
	[
	"I_C_Helipilot_F"//Paramilitary
	,"I_C_Pilot_F"//Bandits
	] call a3e_fnc_expandProbabilities
];
// Units put into normal vehicles: cars, trucks, etc.
_returnNames append ["DriverTypes"];
_returnValues append [
	[
	"I_C_Soldier_Bandit_5_F"
	] call a3e_fnc_expandProbabilities
];
// crews for APCs or tanks
_returnNames append ["CrewTypes"];
_returnValues append [
	[
	"I_C_Helipilot_F"
	] call a3e_fnc_expandProbabilities
];

// Guards for the prison at mission start, only basic types, no launchers or medic/engineer
_returnNames append ["PrisonGuardTypes"];
_returnValues append [
	[
	"I_C_Soldier_Bandit_8_F",2
	,"I_C_Soldier_Bandit_7_F"
	,"I_C_Soldier_Para_4_F"
	,"I_C_Soldier_Bandit_5_F"
	] call a3e_fnc_expandProbabilities
];


/////////////////////////////////////////////////////////////////////
// Vehicles
// Random array
// Probability depends on number of entries
// A number can be added to duplicate a classname, so _"Blah",3_ equals _"Blah","Blah","Blah"_
// Arrays are supported, ["Blah","Doom","Test"] is counted as one entry, and when chosen with a possibility of 1/3 for each
// Combination ["Blah",2,"Doom"],3 is possible
/////////////////////////////////////////////////////////////////////

// Military vehicles that are unarmed/unarmoured or both
_returnNames append ["MilitaryVehiclesLight"];
_returnValues append [
	[
	"I_C_Offroad_02_unarmed_F",4
	,"I_C_Van_01_transport_F",4
	,"I_G_Offroad_01_F",4
	,"I_G_Offroad_01_armed_F",2
	,"I_G_Quadbike_01_F"
	] call a3e_fnc_expandProbabilities
];

// Military vehicles that are lightly to medium armed/armoured
_returnNames append ["MilitaryVehiclesMedium"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];

// Military vehicles that are heavily armed and/or armoured
_returnNames append ["MilitaryVehiclesHeavy"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];

// Military support vehicles: ammo, repair, fuel and medical
_returnNames append ["MilitaryVehiclesSupport"];
_returnValues append [
	[
	"I_G_Van_01_fuel_F"
	,"I_G_Offroad_01_repair_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Static Weapons
/////////////////////////////////////////////////////////////////////
// Static weapons on a low tripod
_returnNames append ["StaticsLow"];
_returnValues append [
	[
	"O_HMG_01_F"
	,"O_GMG_01_F"
	] call a3e_fnc_expandProbabilities
];

// Static weapons on a high tripod, can shoot over small walls
_returnNames append ["StaticsHigh"];
_returnValues append [
	[
	"O_HMG_01_high_F"
	,"O_GMG_01_high_F"
	,"O_static_AT_F"
	,"O_static_AA_F"
	] call a3e_fnc_expandProbabilities
];

// Big static weapons that need a lot of space
_returnNames append ["StaticsBig"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];

// Big static weapons that need a lot of space
_returnNames append ["Mortars"];
_returnValues append [
	[
	"I_G_Mortar_01_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Air
/////////////////////////////////////////////////////////////////////
// Unarmed or lightly armed helicopters
_returnNames append ["HelicopterLight"];
_returnValues append [
	[
	"I_C_Heli_Light_01_civil_F"
	] call a3e_fnc_expandProbabilities
];
// heavily armed helicopters (miniguns and/or rocket pods, but no gunships)
_returnNames append ["HelicopterMedium"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];
// Gunships
_returnNames append ["HelicopterHeavy"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];

// Drones
_returnNames append ["SearchDrone"];
_returnValues append [
	[
	"I_C_Plane_Civil_01_F"
	] call a3e_fnc_expandProbabilities
];
// Planes for CAS module strikes
_returnNames append ["PlanesCAS"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Sea
/////////////////////////////////////////////////////////////////////
// unarmed boats
_returnNames append ["BoatsUnarmed"];
_returnValues append [
	[
	"I_C_Boat_Transport_01_F"
	,"I_C_Boat_Transport_02_F"
	] call a3e_fnc_expandProbabilities
];
// armed boats
_returnNames append ["BoatsArmed"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Wrecks
/////////////////////////////////////////////////////////////////////
// wrecks on random crash sites
_returnNames append ["CrashSiteWrecks"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Weapons
// The following arrays define weapons and ammo in crates or vehicles
// Probability works differently than on units and vehicles!!!
// 
// Index 0: Type, can be: "pistol","smg","rifle","lmg","mg","dmr","sniper","launcher","grenade","explosive","item","scope","muzzle","pointer","bipod","backpack"
// Index 1: Weapon classname.
// Index 2: Weapon's Probabilities of presence (in percent, 0-100).
// Index 3: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 4: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 5: Optional array of magazine classnames. Magazines of these types are present if weapon exists. If left empty [] will read first from config
// Index 6: Number of magazines per weapon that exists.
/////////////////////////////////////////////////////////////////////

// Prison backpack secondary weapons (and corresponding magazine type).
_returnNames append ["PrisonBackpackWeapons"];
_returnValues append [
	[
	["hgun_ACPC2_F","9Rnd_45ACP_Mag"]
	,["hgun_PDW2000_F","30Rnd_9x21_Mag"]
	,["SMG_05_F", "30Rnd_9x21_Mag_SMG_02"]//Protector MP5
	]
];

// Weapons and ammo in the basic weapons box
_returnNames append ["BasicWeapons"];
_returnValues append [
	[
	["rifle", "arifle_AK12_F", 80, 2, 4, ["30Rnd_762x39_Mag_F"], 6]
	,["rifle", "arifle_AK12_GL_F", 50, 2, 4, ["30Rnd_762x39_Mag_F", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4]
	,["smg", "SMG_05_F", 20, 4, 8, ["30Rnd_9x21_Mag_SMG_02"], 6]
	,["pistol", "hgun_ACPC2_F", 20, 4, 8, ["9Rnd_45ACP_Mag"], 6]
	,["pistol", "hgun_Pistol_01_F", 20, 4, 8, ["16Rnd_9x21_Mag"], 6]
	,["rifle", "arifle_AKM_F", 80, 2, 4, ["30Rnd_762x39_Mag_F"], 6]
	,["rifle", "arifle_AKS_F", 50, 2, 4, ["30Rnd_545x39_Mag_F"], 6]
	]
];

// Weapons and ammo in the special weapons box
_returnNames append ["SpecialWeapons"];
_returnValues append [
	[
	["lmg", "LMG_03_F", 60, 2, 4, ["200Rnd_556x45_Box_Tracer_Red_F"], 6]
	,["dmr", "srifle_DMR_06_olive_F", 40, 2, 4, ["20Rnd_762x51_Mag"], 5]
	]
];

// Weapons and ammo in the launchers box
_returnNames append ["Launchers"];
_returnValues append [
	[
	["launcher", "launch_RPG7_F", 85, 1, 3, ["RPG7_F"], 3]
	]
];

// Weapons and ammo in the ordnance box
_returnNames append ["Explosives"];
_returnValues append [
	[
	["explosive", objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5]
	,["explosive", objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5]
	,["explosive", objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5]
	]
];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
_returnNames append ["Grenades"];
_returnValues append [
	[
	["grenade", objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]
	,["grenade", objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]
	,["grenade", objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]
	,["grenade", objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 5]
	,["grenade", objNull, 10, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 5]
	,["grenade", objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]
	,["grenade", objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 5]
	,["grenade", objNull, 10, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 5]
	,["grenade", objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5]
	]
];
// Backpacks
_returnNames append ["Backpacks"];
_returnValues append [
	[
	["backpack", "O_UAV_01_backpack_F"]
	]
];
// Items
_returnNames append ["Items"];
_returnValues append [
	[
	["item", "Laserdesignator_03", 10, 1, 2, ["Laserbatteries"], 1]
	,["item", "Binocular", 50, 2, 3, ]
	,["item", "Rangefinder", 10, 1, 2]
	,["item", "ItemCompass", 50, 1, 3]
	,["item", "ItemGPS", 10, 1, 2]
	,["item", "ItemMap", 50, 1, 3]
	,["item", "ItemRadio", 50, 1, 10]
	,["item", "ItemWatch", 50, 1, 10]
	,["pointer", "acc_flashlight", 50, 1, 5]
	,["pointer", "acc_pointer_IR", 10, 1, 3]
	,["item", "ToolKit", 20, 1, 1, [], 0]
	,["item", "Medikit", 20, 1, 1, [], 0]
	,["item", "FirstAidKit", 100, 10, 50, [], 0]
	,["item", "O_UavTerminal", 10, 1, 2]
	]
];
// Nightvision Goggles
_returnNames append ["NVGs"];
_returnValues append [
	[
	["item", "NVGoggles_INDEP", 10, 1, 3]
	]
];
// Suppressors
_returnNames append ["Suppressors"];
_returnValues append [
	[
	
	]	
];

// Here is a list of scopes, might also get randomly added to enemy patrols:
_returnNames append ["ScopesBasic"];
_returnValues append [
	[
	["scope", "optic_ACO_grn", 20, 1, 3]//CSAT, AAF, FIA
	]
];
// SMG scopes
_returnNames append ["ScopesSMG"];
_returnValues append [
	[
	
	]
];
// Sniper rifle scopes
_returnNames append ["ScopesSniper"];
_returnValues append [
	[
	
	]
];
// Nightvision scopes
_returnNames append ["ScopesNV"];
_returnValues append [
	[
	
	]
];
// TWS scopes
_returnNames append ["ScopesTWS"];
_returnValues append [
	[
	
	]
];

// Here is a list of bipods, might also get randomly added to enemy patrols:
_returnNames append ["Bipods"];
_returnValues append [
	[
	
	]
];


// Classnames of uniforms for the players
_returnNames append ["Uniforms"];
_returnValues append [
	[
	"U_I_C_Soldier_Para_2_F"//Paramilitary Garb (Jacket)
	,"U_I_C_Soldier_Para_3_F"//Paramilitary Garb (Shirt)
	,"U_I_C_Soldier_Para_5_F"//Paramilitary Garb (Shorts)
	,"U_I_C_Soldier_Para_4_F"//Paramilitary Garb (Tank Top)
	,"U_I_C_Soldier_Para_1_F"//Paramilitary Garb (Tee)
	]
];

/////////////////////////////////////////////////////////////////////
// Footer
// Don't change this!
private _return;
_return = [_returnNames,_returnValues];
_return;
/////////////////////////////////////////////////////////////////////