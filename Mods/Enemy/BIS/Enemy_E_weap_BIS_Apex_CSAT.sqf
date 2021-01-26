/*
 * Description: This file contains the weapons and magazines found in ammo boxes/cars for the enemy side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons append [
	["hgun_Rook40_F","16Rnd_9x21_Mag"]
	,["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"]
	,["hgun_Rook40_snds_F","30Rnd_9x21_Mag"]
	];

// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
// CSAT weapons
a3e_arr_AmmoDepotBasicWeapons append [
	["hgun_Rook40_F", 50, 4, 8, ["16Rnd_9x21_Mag"], 6]
	,["SMG_02_F", 50, 4, 8, ["30Rnd_9x21_Mag"], 6]
	,["arifle_CTAR_blk_F", 100, 2, 4, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], 6]
	,["arifle_CTAR_GL_blk_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4]
	,["arifle_CTARS_blk_F", 50, 2, 4, ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], 3]
	];

// Weapons and ammo in the special weapons box
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons append [
	["srifle_DMR_07_blk_F", 50, 2, 4, ["20Rnd_650x39_Cased_Mag_F"], 5]
	,["srifle_DMR_04_F", 50, 2, 4, ["10Rnd_127x54_Mag"], 5]
	,["arifle_ARX_ghex_F", 50, 2, 4, ["30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"], 5]
	,["srifle_GM6_ghex_F", 50, 2, 4, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], 5]
	,["LMG_Zafir_F", 50, 2, 4, ["150Rnd_762x54_Box_Tracer"], 3]
	,["MMG_01_tan_F", 50, 2, 4, ["150Rnd_93x64_Mag"], 3]
	,["arifle_SDAR_F", 10, 2, 4, ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag"], 6]
	];


// Weapons and ammo in the launchers box
// CSAT weapons
a3e_arr_AmmoDepotLaunchers append [
	["launch_RPG32_ghex_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6]
	,["launch_O_Titan_ghex_F", 50, 1, 2, ["Titan_AA"], 3]
	,["launch_B_Titan_short_tna_F", 50, 1, 2, ["Titan_AP", "Titan_AT"], 3]
	];

// Weapons and ammo in the ordnance box
// General weapons
a3e_arr_AmmoDepotOrdnance append [
	[objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5]
	,[objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5]
	,[objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5]
	,[objNull, 30, 1, 1, ["Laserbatteries"], 5]
	];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle append [
	[objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]
	,[objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]
	,[objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]
	,[objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 5]
	,[objNull, 10, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 5]
	,[objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]
	,[objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 5]
	,[objNull, 10, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 5]
	,[objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5]
	,["ToolKit", 20, 1, 1, [], 0]
	,["Medikit", 20, 1, 1, [], 0]
	,["FirstAidKit", 100, 10, 50, [], 0]
	];
a3e_arr_AmmoDepotVehicleBackpacks append [
	["O_UAV_01_backpack_F"]
	];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems append [
	["Laserdesignator_02_ghex_F", 10, 1, 2]
	,["Binocular", 50, 2, 3, [], 0]
	,["Rangefinder", 10, 1, 2]
	,["ItemCompass", 50, 1, 3]
	,["ItemGPS", 10, 1, 2]
	,["ItemMap", 50, 1, 3]
	,["ItemRadio", 50, 1, 10]
	,["ItemWatch", 50, 1, 10]
	,["acc_flashlight", 50, 1, 5]
	,["acc_pointer_IR", 10, 1, 3]
	,["muzzle_snds_B", 10, 1, 3]//7.62, CSAT Rahim, AAF Mk18
	,["muzzle_snds_H", 10, 1, 3]//6.5, CSAT Katiba, NATO MX
	,["muzzle_snds_L", 10, 1, 3]//9mm, P07, Rook, PDW2000
	,["muzzle_snds_58_blk_F", 10, 1, 3]//5.8, CSAT CTAR
	,["muzzle_snds_58_wdm_F", 10, 1, 3]//5.8, CSAT CTAR
	,["muzzle_snds_65_TI_blk_F", 10, 1, 3]//6.5, DMR_07 and ARX
	,["muzzle_snds_65_TI_hex_F", 10, 1, 3]//6.5, DMR_07 and ARX
	,["muzzle_snds_65_TI_ghex_F", 10, 1, 3]//6.5, DMR_07 and ARX
	,["optic_ACO_grn", 20, 1, 3]//CSAT, AAF, FIA
	,["optic_ACO_grn_smg", 20, 1, 3]//CSAT
	,["optic_Arco", 10, 1, 2]//CSAT,
	,["optic_NVS", 10, 1, 2]//
	,["optic_SOS", 10, 1, 2]//All
	,["O_UavTerminal", 10, 1, 2]
	,["optic_DMS", 10, 1, 2]//
	,["optic_Yorris", 10, 1, 2]//Zubr, CSAT
	,["optic_LRPS", 10, 1, 2]//All
	,["optic_KHS_blk", 10, 1, 2]//CSAT, FIA
	,["bipod_02_F_blk", 10, 1, 2]//CSAT
	,["bipod_02_F_hex", 10, 1, 2]//CSAT
	];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems append [
		["O_NVGoggles_ghex_F", 10, 1, 3]
		];
};
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems append [
		["optic_tws", 10, 1, 1]//
		,["optic_tws_mg", 10, 1, 1]//
		,["optic_Nightstalker", 10, 1, 1]//CSAT
		];
};



// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons append [
	["hgun_Rook40_snds_F", "30Rnd_9x21_Mag", 5]
	];

// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes append [
	"optic_ACO_grn"//CSAT, AAF, FIA
	,"optic_Arco_ghex_F"//CSAT
	];
	
a3e_arr_Scopes_SMG append [
	"optic_ACO_grn_smg"//CSAT
	];
	
a3e_arr_Scopes_Sniper append [
	"optic_SOS"
	,"optic_DMS"
	,"optic_LRPS_ghex_F"
	,"optic_KHS_blk"//CSAT
	,"optic_KHS_hex"//CSAT
	,"optic_KHS_tan"//CSAT
	];
	
a3e_arr_NightScopes append [
	"optic_NVS"
	];

a3e_arr_TWSScopes append [
	"optic_Nightstalker"//CSAT
	,"optic_tws"
	,"optic_tws_mg"
	];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods append [
	"bipod_02_F_blk"
	,"bipod_02_F_tan"
	,"bipod_02_F_hex"
	];