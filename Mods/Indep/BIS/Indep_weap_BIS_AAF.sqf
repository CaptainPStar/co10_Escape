/*
 * Description: This file contains the weapons and magazines found in ammo boxes/cars for the independent side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons append [
	["hgun_ACPC2_F","9Rnd_45ACP_Mag"]
	,["hgun_PDW2000_F","30Rnd_9x21_Mag"]
	];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
a3e_arr_AmmoDepotBasicWeapons append [
	["arifle_Mk20_F", 50, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["arifle_Mk20_GL_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4]
	,["arifle_Mk20C_F", 50, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["hgun_PDW2000_F", 20, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]//AAF
	,["hgun_ACPC2_F", 20, 4, 8, ["9Rnd_45ACP_Mag"], 6]
	,["arifle_TRG20_F", 10, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["arifle_TRG21_F", 10, 2, 4, ["30Rnd_556x45_Stanag"], 6]
	,["arifle_TRG21_GL_F", 10, 2, 4, ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]
	];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons append [
	["srifle_EBR_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 9]
	,["srifle_DMR_06_olive_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 10]//Mk14, FIA
	,["LMG_Mk200_F", 20, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6]
	];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers append [
	["launch_NLAW_F", 25, 1, 2, ["NLAW_F"], 2]
	,["launch_I_Titan_F", 20, 1, 1, ["Titan_AA"], 2]
	,["launch_I_Titan_short_F", 25, 1, 1, ["Titan_AP", "Titan_AT"], 2]
	];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance append [
	[objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5]
	,[objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5]
	,[objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5]
	,[objNull, 30, 1, 1, ["Laserbatteries"], 5]
	];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems append [
	["Laserdesignator_03", 10, 1, 2]
	,["muzzle_snds_acp", 10, 1, 3]//.45, AAF ACP-C2, NATO Vermin
	,["muzzle_snds_B", 10, 1, 3]//7.62, CSAT Rahim, AAF Mk18
	,["muzzle_snds_L", 10, 1, 3]//9mm, P07, Rook, PDW2000
	,["muzzle_snds_M", 10, 1, 3]//5.56
	,["optic_ACO_grn", 20, 1, 3]//CSAT, AAF, FIA
	,["optic_Holosight", 10, 1, 2]//NATO, AAF, FIA
	,["optic_MRCO", 10, 1, 2]//AAF, FIA
	,["bipod_03_F_blk", 10, 1, 2]//AAF
	,["bipod_03_F_oli", 10, 1, 2]//AAF
	];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems append [
	["NVGoggles_INDEP", 10, 1, 3]
	];
};

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons append [
	["hgun_ACPC2_F", "9Rnd_45ACP_Mag", 12]
	,["arifle_Mk20_GL_ACO_F", "UGL_FlareWhite_F", 8]
	,["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8]//Mk14, FIA
	];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes append [
	"optic_ACO_grn"//CSAT, AAF, FIA
	,"optic_MRCO"//AAF, FIA
	];
	
a3e_arr_Scopes_SMG append [
	"optic_Holosight_smg"//NATO, FIA
	];
	
a3e_arr_Scopes_Sniper append [
	"optic_KHS_old"//FIA
	];


// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods append [
	"bipod_03_F_blk"
	,"bipod_03_F_oli"
	];
