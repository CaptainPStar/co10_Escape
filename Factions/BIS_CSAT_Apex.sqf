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
_returnValues append ["BIS_CSAT_Apex"];

// For which side can this file be used?
// Can only be one or more of: "Player", "Enemy", "Indep", "Civilian"
_returnNames append ["UsableSides"];
_returnValues append [["Player","Enemy"]];

// Texture for flags used on camps of this faction
_returnNames append ["FlagTexture"];
_returnValues append ["\A3\Data_F\Flags\Flag_CSAT_CO.paa"];


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
	"O_T_Officer_F"
	] call a3e_fnc_expandProbabilities
];
// normal Infantry units for squads, patrols, guards
_returnNames append ["InfantryTypes"];
_returnValues append [
	[
	"O_T_Engineer_F",3
	,"O_T_Medic_F",3
	,"O_T_Soldier_A_F",3
	,"O_T_Soldier_AA_F",2
	,"O_T_Soldier_AR_F",3
	,"O_T_Soldier_AT_F",2
	,"O_T_Soldier_exp_F",2
	,"O_T_Soldier_F",3
	,"O_T_Soldier_GL_F",3
	,"O_T_Soldier_LAT_F",2
	,"O_T_Soldier_M_F",3
	,"O_T_Soldier_Repair_F",2
	,"O_T_Officer_F",2
	,"O_T_Soldier_UAV_F",2
	,"O_T_Soldier_AAR_F"
	,"O_T_Support_AMG_F"
	,"O_T_Support_AMort_F"
	,"O_T_Soldier_AAA_F"
	,"O_T_Soldier_AAT_F"
	,"O_T_Support_GMG_F"
	,"O_T_Support_MG_F"
	,"O_T_Support_Mort_F"
	,"O_T_Soldier_M_F",2
	,"O_T_Recon_F"
	] call a3e_fnc_expandProbabilities
];
// Special Forces for paradrops
_returnNames append ["InfantrySFTypes"];
_returnValues append [
	[
	"O_V_Soldier_Exp_ghex_F"
	,"O_V_Soldier_JTAC_ghex_F"
	,"O_V_Soldier_M_ghex_F"
	,"O_V_Soldier_ghex_F"
	,"O_V_Soldier_Medic_ghex_F"
	,"O_V_Soldier_LAT_ghex_F"
	,"O_V_Soldier_TL_ghex_F"
	] call a3e_fnc_expandProbabilities
];
// Pilot types for helicopters
_returnNames append ["PilotTypes"];
_returnValues append [
	[
	"O_T_Helipilot_F"
	,"O_T_Helicrew_F"
	] call a3e_fnc_expandProbabilities
];
// Units put into normal vehicles: cars, trucks, etc.
_returnNames append ["DriverTypes"];
_returnValues append [
	[
	"O_T_Soldier_F"
	] call a3e_fnc_expandProbabilities
];
// crews for APCs or tanks
_returnNames append ["CrewTypes"];
_returnValues append [
	[
	"O_T_Crew_F"
	] call a3e_fnc_expandProbabilities
];

// Guards for the prison at mission start, only basic types, no launchers or medic/engineer
_returnNames append ["PrisonGuardTypes"];
_returnValues append [
	[
	"O_T_Soldier_F",3
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_GL_F"
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
	"O_T_MRAP_02_ghex_F",4
	,"O_T_Quadbike_01_ghex_F",4
	,"O_T_LSV_02_unarmed_F",4
	,"O_T_LSV_02_armed_F",2
	,"O_T_Truck_03_device_ghex_F"
	,"O_T_Truck_03_transport_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	] call a3e_fnc_expandProbabilities
];

// Military vehicles that are lightly to medium armed/armoured
_returnNames append ["MilitaryVehiclesMedium"];
_returnValues append [
	[
	"O_T_MRAP_02_hmg_ghex_F",2
	,"O_T_APC_Wheeled_02_rcws_ghex_F"
	] call a3e_fnc_expandProbabilities
];

// Military vehicles that are heavily armed and/or armoured
_returnNames append ["MilitaryVehiclesHeavy"];
_returnValues append [
	[
	[
		"O_T_APC_Tracked_02_AA_ghex_F"
		,"O_T_APC_Tracked_02_cannon_ghex_F",2
	],2
	,"O_T_MBT_02_arty_ghex_F"
	,"O_T_MBT_02_cannon_ghex_F"
	] call a3e_fnc_expandProbabilities
];

// Military support vehicles: ammo, repair, fuel and medical
_returnNames append ["MilitaryVehiclesSupport"];
_returnValues append [
	[
	"O_T_Truck_03_ammo_ghex_F"
	,"O_T_Truck_03_fuel_ghex_F"
	,"O_T_Truck_03_medical_ghex_F"
	,"O_T_Truck_03_repair_ghex_F"
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
	"O_Mortar_01_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Air
/////////////////////////////////////////////////////////////////////
// Unarmed or lightly armed helicopters
_returnNames append ["HelicopterLight"];
_returnValues append [
	[
	"O_Heli_Light_02_unarmed_F"
	,"O_Heli_Transport_04_bench_black_F"
	,"O_Heli_Transport_04_covered_black_F"
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
	"O_Heli_Attack_02_black_F"
	,"O_Heli_Light_02_F"
	,"O_T_VTOL_02_infantry_F"
	] call a3e_fnc_expandProbabilities
];

// Drones
_returnNames append ["SearchDrone"];
_returnValues append [
	[
	"O_UAV_01_F"
	,"O_T_UAV_04_CAS_F"
	] call a3e_fnc_expandProbabilities
];
// Planes for CAS module strikes
_returnNames append ["PlanesCAS"];
_returnValues append [
	[
	"O_T_VTOL_02_infantry_F"
	,"O_T_VTOL_02_infantry_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Sea
/////////////////////////////////////////////////////////////////////
// unarmed boats
_returnNames append ["BoatsUnarmed"];
_returnValues append [
	[
	
	] call a3e_fnc_expandProbabilities
];
// armed boats
_returnNames append ["BoatsArmed"];
_returnValues append [
	[
	"O_T_Boat_Armed_01_hmg_F"
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
	["hgun_Rook40_F","16Rnd_9x21_Mag"]
	,["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"]
	,["hgun_Rook40_snds_F","30Rnd_9x21_Mag"]
];

// Weapons and ammo in the basic weapons box
_returnNames append ["BasicWeapons"];
_returnValues append [
	["pistol", "hgun_Rook40_F", 50, 4, 8, ["16Rnd_9x21_Mag"], 6]
	,["smg", "SMG_02_F", 50, 4, 8, ["30Rnd_9x21_Mag"], 6]
	,["rifle", "arifle_CTAR_blk_F", 100, 2, 4, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], 6]
	,["rifle", "arifle_CTAR_GL_blk_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4]
	,["rifle", "arifle_CTARS_blk_F", 50, 2, 4, ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], 3]
];

// Weapons and ammo in the special weapons box
_returnNames append ["SpecialWeapons"];
_returnValues append [
	["dmr", "srifle_DMR_07_blk_F", 50, 2, 4, ["20Rnd_650x39_Cased_Mag_F"], 5]
	,["dmr", "srifle_DMR_04_F", 50, 2, 4, ["10Rnd_127x54_Mag"], 5]
	,["rifle", "arifle_ARX_ghex_F", 50, 2, 4, ["30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"], 5]
	,["sniper", "srifle_GM6_ghex_F", 50, 2, 4, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], 5]
	,["mg", "LMG_Zafir_F", 50, 2, 4, ["150Rnd_762x54_Box_Tracer"], 3]
	,["mg", "MMG_01_tan_F", 50, 2, 4, ["150Rnd_93x64_Mag"], 3]
	,["smg", "arifle_SDAR_F", 10, 2, 4, ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag"], 6]
];

// Weapons and ammo in the launchers box
_returnNames append ["Launchers"];
_returnValues append [
	["launcher", "launch_RPG32_ghex_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6]
	,["launcher", "launch_O_Titan_ghex_F", 50, 1, 2, ["Titan_AA"], 3]
	,["launcher", "launch_B_Titan_short_tna_F", 50, 1, 2, ["Titan_AP", "Titan_AT"], 3]
];

// Weapons and ammo in the ordnance box
_returnNames append ["Explosives"];
_returnValues append [
	["explosive", objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5]
	,["explosive", objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5]
	,["explosive", objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5]
];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
_returnNames append ["Grenades"];
_returnValues append [
	["grenade", objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]
	,["grenade", objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]
	,["grenade", objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]
	,["grenade", objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 5]
	,["grenade", objNull, 10, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 5]
	,["grenade", objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]
	,["grenade", objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 5]
	,["grenade", objNull, 10, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 5]
	,["grenade", objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5]
];
// Backpacks
_returnNames append ["Backpacks"];
_returnValues append [
	["backpack", "O_UAV_01_backpack_F"]
];
// Items
_returnNames append ["Items"];
_returnValues append [
	["item", "Laserdesignator_02_ghex_F", 10, 1, 2, ["Laserbatteries"], 1]
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
	,["item", "O_UavTerminal", 10, 1, 2]
	,["scope", "optic_Yorris", 10, 1, 2]//Zubr, CSAT
	];
// Nightvision Goggles
_returnNames append ["NVGs"];
_returnValues append [
	["item", "O_NVGoggles_ghex_F", 10, 1, 3]
];
// Suppressors
_returnNames append ["Suppressors"];
_returnValues append [
	["muzzle", "muzzle_snds_B", 10, 1, 3]//7.62, CSAT Rahim, AAF Mk18
	,["muzzle", "muzzle_snds_H", 10, 1, 3]//6.5, CSAT Katiba, NATO MX
	,["muzzle", "muzzle_snds_L", 10, 1, 3]//9mm, P07, Rook, PDW2000
	,["muzzle", "muzzle_snds_58_blk_F", 10, 1, 3]//5.8, CSAT CTAR
	,["muzzle", "muzzle_snds_58_wdm_F", 10, 1, 3]//5.8, CSAT CTAR
	,["muzzle", "muzzle_snds_65_TI_blk_F", 10, 1, 3]//6.5, DMR_07 and ARX
	,["muzzle", "muzzle_snds_65_TI_hex_F", 10, 1, 3]//6.5, DMR_07 and ARX
	,["muzzle", "muzzle_snds_65_TI_ghex_F", 10, 1, 3]//6.5, DMR_07 and ARX
];

// Here is a list of scopes, might also get randomly added to enemy patrols:
_returnNames append ["ScopesBasic"];
_returnValues append [
	["scope", "optic_ACO_grn", 20, 1, 3]//CSAT, AAF, FIA
	,["scope", "optic_Arco_ghex_F", 10, 1, 2]//CSAT
];
// SMG scopes
_returnNames append ["ScopesSMG"];
_returnValues append [
	["scope", "optic_ACO_grn_smg", 20, 1, 3]//CSAT
	];
// Sniper rifle scopes
_returnNames append ["ScopesSniper"];
_returnValues append [
	["scope", "optic_SOS", 10, 1, 2]//All
	,["scope", "optic_DMS", 10, 1, 2]//
	,["scope", "optic_LRPS_ghex_F", 10, 1, 2]//All
	,["scope", "optic_KHS_blk", 10, 1, 2]//CSAT, FIA
	,["scope", "optic_KHS_hex", 10, 1, 2]//CSAT, FIA
	,["scope", "optic_KHS_tan", 10, 1, 2]//CSAT, FIA
];
// Nightvision scopes
_returnNames append ["ScopesNV"];
_returnValues append [
	["scope", "optic_nvs", 10, 1, 1]//
	];
// TWS scopes
_returnNames append ["ScopesTWS"];
_returnValues append [
	["scope", "optic_tws", 10, 1, 1]//
	,["scope", "optic_tws_mg", 10, 1, 1]//
	,["scope", "optic_Nightstalker", 10, 1, 1]//CSAT
];

// Here is a list of bipods, might also get randomly added to enemy patrols:
_returnNames append ["Bipods"];
_returnValues append [
	["bipod", "bipod_02_F_tan", 10, 1, 2]//CSAT
	,["bipod", "bipod_02_F_blk", 10, 1, 2]//CSAT
	,["bipod", "bipod_02_F_hex", 10, 1, 2]//CSAT
];


// Classnames of uniforms for the players
_returnNames append ["Uniforms"];
_returnValues append [
	"U_O_T_Soldier_F"//Fatigues Green Hex (CSAT)
	,"U_O_V_Soldier_Viper_F"//Special Purpose Suit (Green)
];

/////////////////////////////////////////////////////////////////////
// Footer
// Don't change this!
private _return;
_return = [_returnNames,_returnValues];
_return;
/////////////////////////////////////////////////////////////////////