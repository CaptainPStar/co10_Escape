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
	,["SMG_05_F", "30Rnd_9x21_Mag_SMG_02"]//Protector MP5
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
	["arifle_AK12_F", 50, 2, 4, ["30Rnd_762x39_Mag_F"], 6]
	,["arifle_AK12_GL_F", 50, 2, 4, ["30Rnd_762x39_Mag_F", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4]
	,["SMG_05_F", 20, 4, 8, ["30Rnd_9x21_Mag_SMG_02"], 6]
	,["hgun_ACPC2_F", 20, 4, 8, ["9Rnd_45ACP_Mag"], 6]
	,["hgun_Pistol_01_F", 20, 4, 8, ["16Rnd_9x21_Mag"], 6]
	,["arifle_AKM_F", 10, 2, 4, ["30Rnd_762x39_Mag_F"], 6]
	,["arifle_AKS_F", 10, 2, 4, ["30Rnd_545x39_Mag_F"], 6]
	];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons append [
	["LMG_03_F", 20, 2, 4, ["200Rnd_556x45_Box_Tracer_Red_F"], 6]
	,["srifle_DMR_06_olive_F", 20, 2, 4, ["20Rnd_762x51_Mag"], 5]
	];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers append [
	["launch_RPG7_F", 100, 2, 3, ["RPG7_F"], 6]
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
	];
a3e_arr_AmmoDepotVehicleItems append [
	["ToolKit", 20, 1, 1, [], 0]
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
	,["arifle_AKM_F", "30Rnd_762x39_Mag_F", 6]
	,["arifle_AKS_F", "30Rnd_545x39_Mag_F", 6]
	,["arifle_AK12_F", "30Rnd_762x39_Mag_F", 6]
	];

// Here is a list of scopes, might get randomly added to enemy patrols:


// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods append [
	"bipod_03_F_blk"
	,"bipod_03_F_oli"
	];