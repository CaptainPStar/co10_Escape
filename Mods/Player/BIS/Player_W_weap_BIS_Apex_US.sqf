/*
 * Description: This file contains the weapons and magazines found in ammo boxes/cars for the players side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons append [
	["hgun_P07_F","16Rnd_9x21_Mag"]
	,["hgun_P07_snds_F","30Rnd_9x21_Mag"]
	];

// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons append [
	["arifle_SPAR_01_khk_F", 20, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["arifle_SPAR_01_GL_khk_F", 20, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["arifle_SPAR_02_khk_F", 20, 2, 4, ["150Rnd_556x45_Drum_Mag_F"], 4]
	,["arifle_SPAR_03_khk_F", 20, 2, 4, ["20Rnd_762x51_Mag"], 5]
	];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons append [
	["hgun_P07_khk_F", "16Rnd_9x21_Mag", 5]
	,["hgun_P07_khk_F", "30Rnd_9x21_Mag", 5]
	,["SMG_05_F", "30Rnd_9x21_Mag_SMG_02", 6]
	,["MineDetector", objNull, 0]
	,["Binocular", objNull, 0]
	,[objNull, "HandGrenade", 5]
	,[objNull, "SmokeShell", 5]
	];

// Here is a list of scopes, might get randomly added to enemy patrols:


// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods append [
	"bipod_01_F_khk"
	,"bipod_01_F_blk"
	,"bipod_01_F_mtp"
	];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "Box_NATO_Wps_F";
a3e_additional_weapon_box_2 = "Box_NATO_WpsSpecial_F";


//////////////////////////////////////////////////////////////////
// fn_CrashSite
// Random crashsite of west heli with west weapons
//////////////////////////////////////////////////////////////////
// The following arrays define weapons and ammo contained at crash sites
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons append [
	["launch_NLAW_F", 10, 1, 2, ["NLAW_F"], 3]
	,["srifle_DMR_03_khaki_F", 10, 1, 2, ["20Rnd_762x51_Mag"], 8]
	,["srifle_LRR_tna_F", 10, 1, 2, ["7Rnd_408_Mag"], 8]
	,["arifle_MX_khk_F", 75, 2, 4, ["30Rnd_65x39_caseless_mag"], 6]
	,["arifle_MX_GL_khk_F", 50, 2, 4, ["30Rnd_65x39_caseless_mag", "1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], 6]
	,["arifle_MX_SW_khk_F", 20, 1, 2, ["100Rnd_65x39_caseless_mag_Tracer"], 6]
	,["arifle_MXM_khk_F", 10, 1, 2, ["30Rnd_65x39_caseless_mag"], 8]
	,["SMG_01_F", 10, 1, 2, ["30Rnd_45ACP_Mag_SMG_01"], 8]
	];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems append [
	["optic_ERCO_khk_F", 10, 1, 3]
	,["optic_Aco", 10, 1, 3]
	,["optic_Aco_smg", 10, 1, 3]
	,["optic_Holosight_khk_F", 10, 1, 3]
	,["optic_SOS_khk_F", 10, 1, 3]
	,["muzzle_snds_H_khk_F", 10, 1, 3]
	,["muzzle_snds_acp", 10, 1, 3]
	];