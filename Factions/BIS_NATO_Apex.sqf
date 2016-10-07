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
_returnValues append ["BIS_NATO_Apex"];

// For which side can this file be used?
// Can only be one or more of: "Player", "Enemy", "Indep", "Civilian"
_returnNames append ["UsableSides"];
_returnValues append [["Player"]];

// Texture for flags used on camps of this faction
_returnNames append ["FlagTexture"];
_returnValues append ["\A3\Data_F\Flags\Flag_nato_CO.paa"];


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
	"B_T_Officer_F"
	,"B_T_Soldier_SL_F"
	,"B_T_Soldier_TL_F"
	] call a3e_fnc_expandProbabilities
];
// normal Infantry units for squads, patrols, guards
_returnNames append ["InfantryTypes"];
_returnValues append [
	[
	"B_T_Engineer_F",3
	,"B_T_Medic_F",3
	,"B_T_Soldier_A_F",2
	,"B_T_Soldier_AA_F",2
	,"B_T_Soldier_AR_F",3
	,"B_T_Soldier_AT_F",2
	,"B_T_Soldier_Exp_F",2
	,"B_T_Soldier_F",3
	,"B_T_Soldier_GL_F",3
	,"B_T_Soldier_LAT_F",2
	,"B_T_Soldier_Repair_F",2
	,"B_T_Soldier_UAV_F",2
	,"B_T_Soldier_AAR_F"
	,"B_T_Support_AMG_F"
	,"B_T_Support_AMort_F"
	,"B_T_Soldier_AAA_F"
	,"B_T_Soldier_AAT_F"
	,"B_T_Support_GMG_F"
	,"B_T_Support_MG_F"
	,"B_T_Support_Mort_F"
	,"B_T_soldier_M_F",2
	] call a3e_fnc_expandProbabilities
];
// Special Forces for paradrops
_returnNames append ["InfantrySFTypes"];
_returnValues append [
	[
	"B_CTRG_Soldier_AR_tna_F"
	,"B_CTRG_Soldier_Exp_tna_F"
	,"B_CTRG_Soldier_JTAC_tna_F"
	,"B_CTRG_Soldier_M_tna_F"
	,"B_CTRG_Soldier_Medic_tna_F"
	,"B_CTRG_Soldier_tna_F"
	,"B_CTRG_Soldier_LAT_tna_F"
	,"B_CTRG_Soldier_TL_tna_F"
	] call a3e_fnc_expandProbabilities
];
// Pilot types for helicopters
_returnNames append ["PilotTypes"];
_returnValues append [
	[
	"B_T_Helipilot_F"
	,"B_T_Helicrew_F"
	] call a3e_fnc_expandProbabilities
];
// Units put into normal vehicles: cars, trucks, etc.
_returnNames append ["DriverTypes"];
_returnValues append [
	[
	"B_T_Soldier_F"
	] call a3e_fnc_expandProbabilities
];
// crews for APCs or tanks
_returnNames append ["CrewTypes"];
_returnValues append [
	[
	"B_T_Crew_F"
	] call a3e_fnc_expandProbabilities
];

// Guards for the prison at mission start, only basic types, no launchers or medic/engineer
_returnNames append ["PrisonGuardTypes"];
_returnValues append [
	[
	"B_T_Soldier_F",3
	,"B_T_Soldier_GL_F"
	,"B_T_Soldier_AR_F"
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
	"B_T_Quadbike_01_F"
	,"B_T_LSV_01_unarmed_F"
	,"B_T_LSV_01_armed_F"
	,"B_T_MRAP_01_F"
	,"B_T_MRAP_01_hmg_F"
	,"B_T_MRAP_01_gmg_F"
	,"B_T_Truck_01_mover_F"
	,"B_T_Truck_01_box_F"
	,"B_T_Truck_01_transport_F"
	,"B_T_Truck_01_covered_F"
	] call a3e_fnc_expandProbabilities
];

// Military vehicles that are lightly to medium armed/armoured
_returnNames append ["MilitaryVehiclesMedium"];
_returnValues append [
	[
	"B_T_MRAP_01_gmg_F"
	,"B_T_APC_Wheeled_01_cannon_F"
	,"B_T_APC_Tracked_01_CRV_F"
	,"B_T_APC_Tracked_01_rcws_F"
	] call a3e_fnc_expandProbabilities
];

// Military vehicles that are heavily armed and/or armoured
_returnNames append ["MilitaryVehiclesHeavy"];
_returnValues append [
	[
	"B_T_APC_Tracked_01_AA_F"
	,"B_T_MBT_01_arty_F"
	,"B_T_MBT_01_mlrs_F"
	,"B_T_MBT_01_cannon_F"
	,"B_T_MBT_01_TUSK_F"
	] call a3e_fnc_expandProbabilities
];

// Military support vehicles: ammo, repair, fuel and medical
_returnNames append ["MilitaryVehiclesSupport"];
_returnValues append [
	[
	"B_T_Truck_01_ammo_F"
	,"B_T_Truck_01_fuel_F"
	,"B_T_Truck_01_Repair_F"
	,"B_T_Truck_01_medical_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Static Weapons
/////////////////////////////////////////////////////////////////////
// Static weapons on a low tripod
_returnNames append ["StaticsLow"];
_returnValues append [
	[
	"B_T_HMG_01_F"
	,"B_T_GMG_01_F"
	] call a3e_fnc_expandProbabilities
];

// Static weapons on a high tripod, can shoot over small walls
_returnNames append ["StaticsHigh"];
_returnValues append [
	[
	"B_HMG_01_high_F"
	,"B_GMG_01_high_F"
	,"B_T_Static_AA_F"
	,"B_T_Static_AT_F"
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
	"B_T_Mortar_01_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Air
/////////////////////////////////////////////////////////////////////
// Unarmed or lightly armed helicopters
_returnNames append ["HelicopterLight"];
_returnValues append [
	[
	"B_Heli_Light_01_F"//Littlebird
	,"B_Heli_Transport_03_unarmed_F"//Huron
	] call a3e_fnc_expandProbabilities
];
// heavily armed helicopters (miniguns and/or rocket pods, but no gunships)
_returnNames append ["HelicopterMedium"];
_returnValues append [
	[
	"B_CTRG_Heli_Transport_01_tropic_F"//Blackhawk
	,"B_Heli_Light_01_armed_F"//Littlebird
	,"B_Heli_Transport_03_F"//Huron
	] call a3e_fnc_expandProbabilities
];
// Gunships
_returnNames append ["HelicopterHeavy"];
_returnValues append [
	[
	"B_Heli_Attack_01_F"//Comanche
	] call a3e_fnc_expandProbabilities
];

// Drones
_returnNames append ["SearchDrone"];
_returnValues append [
	[
	"B_T_UAV_03_F"
	] call a3e_fnc_expandProbabilities
];
// Planes for CAS module strikes
_returnNames append ["PlanesCAS"];
_returnValues append [
	[
	"B_T_VTOL_01_armed_F"
	,"B_Plane_CAS_01_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Sea
/////////////////////////////////////////////////////////////////////
// unarmed boats
_returnNames append ["BoatsUnarmed"];
_returnValues append [
	[
	"B_T_Boat_Transport_01_F"
	] call a3e_fnc_expandProbabilities
];
// armed boats
_returnNames append ["BoatsArmed"];
_returnValues append [
	[
	"B_T_Boat_Armed_01_minigun_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Wrecks
/////////////////////////////////////////////////////////////////////
// wrecks on random crash sites
_returnNames append ["CrashSiteWrecks"];
_returnValues append [
	[
	"Land_UWreck_MV22_F"
	,"Land_Wreck_Plane_Transport_01_F"
	,"Land_Wreck_Heli_Attack_01_F"
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
	["hgun_P07_F","16Rnd_9x21_Mag"]
	,["hgun_P07_snds_F","30Rnd_9x21_Mag"]
	]
];

// Weapons and ammo in the basic weapons box
_returnNames append ["BasicWeapons"];
_returnValues append [
	[
	["pistol", "hgun_P07_khk_F", 50, 4, 8, ["16Rnd_9x21_Mag"], 6]
	]
];

// Weapons and ammo in the special weapons box
_returnNames append ["SpecialWeapons"];
_returnValues append [
	[
	["rifle", "arifle_SPAR_01_khk_F", 20, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["rifle", "arifle_SPAR_01_GL_khk_F", 20, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["lmg", "arifle_SPAR_02_khk_F", 20, 2, 4, ["150Rnd_556x45_Drum_Mag_F"], 4]
	,["dmr", "arifle_SPAR_03_khk_F", 20, 2, 4, ["20Rnd_762x51_Mag"], 5]
	]
];

// Weapons and ammo in the launchers box
_returnNames append ["Launchers"];
_returnValues append [
	[
	["launcher", "launch_RPG32_ghex_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6]
	,["launcher", "launch_O_Titan_ghex_F", 50, 1, 2, ["Titan_AA"], 3]
	,["launcher", "launch_B_Titan_short_tna_F", 50, 1, 2, ["Titan_AP", "Titan_AT"], 3]
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
	["backpack", "B_UAV_01_backpack_F"]
	]
];
// Items
_returnNames append ["Items"];
_returnValues append [
	[
	["item", "Laserdesignator_01_khk_F", 10, 1, 2, ["Laserbatteries"], 1]
	,["item", "Binocular", 50, 2, 3]
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
	,["item", "B_UavTerminal", 10, 1, 2]
	]
];
// Nightvision Goggles
_returnNames append ["NVGs"];
_returnValues append [
	[
	["item", "NVGoggles_tna_F", 10, 1, 3]
	]
];
// Suppressors
_returnNames append ["Suppressors"];
_returnValues append [
	[
	["muzzle", "muzzle_snds_B_khk_F", 10, 1, 3]//7.62, SPAR
	,["muzzle", "muzzle_snds_H_khk_F", 10, 1, 3]//6.5, CSAT Katiba, NATO MX
	,["muzzle", "muzzle_snds_L", 10, 1, 3]//9mm, P07, Rook, PDW2000
	,["muzzle", "muzzle_snds_m_khk_F", 10, 1, 3]//5.56, SPAR
	]
];

// Here is a list of scopes, might also get randomly added to enemy patrols:
_returnNames append ["ScopesBasic"];
_returnValues append [
	[]
	["scope", "optic_Aco", 20, 1, 3]
	,["scope", "optic_Holosight_khk_F", 10, 1, 2]
	,["scope", "optic_ERCO_khk_F", 10, 1, 2]
	]
];
// SMG scopes
_returnNames append ["ScopesSMG"];
_returnValues append [
	[
	["scope", "optic_Aco_smg", 20, 1, 3]//CSAT
	]
];
// Sniper rifle scopes
_returnNames append ["ScopesSniper"];
_returnValues append [
	[
	["scope", "optic_SOS_khk_F", 10, 1, 2]//All
	]
];
// Nightvision scopes
_returnNames append ["ScopesNV"];
_returnValues append [
	[
	["scope", "optic_nvs", 10, 1, 1]//
	]
];
// TWS scopes
_returnNames append ["ScopesTWS"];
_returnValues append [
	[
	["scope", "optic_tws", 10, 1, 1]//
	,["scope", "optic_tws_mg", 10, 1, 1]//
	]
];

// Here is a list of bipods, might also get randomly added to enemy patrols:
_returnNames append ["Bipods"];
_returnValues append [
	[
	["bipod", "bipod_01_F_khk", 10, 1, 2]
	,["bipod", "bipod_01_F_blk", 10, 1, 2]
	,["bipod", "bipod_01_F_mtp", 10, 1, 2]
	]
];


// Classnames of uniforms for the players
_returnNames append ["Uniforms"];
_returnValues append [
	[
	"U_B_T_Soldier_F"//Combat Fatigues (Tropic)
	,"U_B_T_Soldier_AR_F"//Combat Fatigues (Tropic, Tee)
	,"U_B_T_Soldier_SL_F"//Recon Fatigues (Tropic)
	]
];

/////////////////////////////////////////////////////////////////////
// Footer
// Don't change this!
private _return;
_return = [_returnNames,_returnValues];
_return;
/////////////////////////////////////////////////////////////////////