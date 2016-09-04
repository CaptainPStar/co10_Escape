/*
 * Description: This file contains the the weapons and magazines found in ammo boxes/cars for the enemy side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_snds_F","30Rnd_9x21_Mag"];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
// CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Rook40_F", 50, 4, 8, ["16Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_02_F", 50, 4, 8, ["30Rnd_9x21_Mag"], 6];//Sting, CSAT
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Katiba_F", 100, 2, 4, ["30Rnd_65x39_caseless_green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Katiba_C_F", 50, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Katiba_GL_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Pistol_heavy_02_F", 10, 4, 8, ["6Rnd_45ACP_Cylinder"], 6];//Zubr, CSAT


// Weapons and ammo in the special weapons box
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_01_F", 10, 2, 4, ["10Rnd_762x54_Mag"], 9];//Rahim, CSAT
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_GM6_F", 10, 2, 4, ["5Rnd_127x108_Mag"], 9];//Lynx, CSAT
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_Zafir_F", 50, 2, 4, ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], 6];//CSAT
a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_01_hex_F", 10, 2, 4, ["150Rnd_93x64_Mag"], 6];//Navid, CSAT
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_06_olive_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 10];//Mk14, FIA
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_05_blk_F", 10, 2, 4, ["10Rnd_93x64_DMR_05_Mag"], 12];//Cyrus, CSAT
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_04_F", 10, 2, 4, ["10Rnd_127x54_Mag"], 12];//ASP-1 Kir, CSAT

// non-CAST weapons
//a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_LRR_F", 100, 2, 4, ["7Rnd_408_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_Mk200_F", 20, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6];//AAF


// Weapons and ammo in the launchers box
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_RPG32_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Titan_F", 50, 1, 1, ["Titan_AA"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Titan_short_F", 50, 1, 1, ["Titan_AP", "Titan_AT"], 3];


// Weapons and ammo in the ordnance box
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5];

a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks pushback ["O_UAV_01_backpack_F"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02", 10, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles_OPFOR", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 3];//7.62, CSAT Rahim, AAF Mk18
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_H", 10, 1, 3];//6.5, CSAT Katiba, NATO MX
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_L", 10, 1, 3];//9mm, P07, Rook, PDW2000
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn", 20, 1, 3];//CSAT, AAF, FIA
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn_smg", 20, 1, 3];//CSAT
a3e_arr_AmmoDepotItems pushback ["optic_Arco", 10, 1, 2];//CSAT,
a3e_arr_AmmoDepotItems pushback ["optic_NVS", 10, 1, 2];//
a3e_arr_AmmoDepotItems pushback ["optic_SOS", 10, 1, 2];//All
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];//
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];//
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];//CSAT
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 10, 1, 2];//
a3e_arr_AmmoDepotItems pushback ["optic_Yorris", 10, 1, 2];//Zubr, CSAT
a3e_arr_AmmoDepotItems pushback ["optic_LRPS", 10, 1, 2];//All
a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 10, 1, 2];//CSAT, FIA
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];//CSAT
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 10, 1, 2];//CSAT


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_snds_F", "30Rnd_9x21_Mag", 9];
a3e_arr_CivilianCarWeapons pushback ["arifle_Katiba_C_F", "30Rnd_65x39_caseless_green", 5];
a3e_arr_CivilianCarWeapons pushback ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12];//Sting, CSAT
a3e_arr_CivilianCarWeapons pushback ["launch_RPG32_F", "RPG32_F", 2];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes pushback "optic_ACO_grn"; //CSAT, AAF, FIA
	a3e_arr_Scopes pushback "optic_Arco";//CSAT
	
a3e_arr_Scopes_SMG pushback "optic_ACO_grn_smg";//CSAT
	
a3e_arr_Scopes_Sniper pushback "optic_SOS";
	a3e_arr_Scopes_Sniper pushback "optic_DMS";
	a3e_arr_Scopes_Sniper pushback "optic_LRPS";
	a3e_arr_Scopes_Sniper pushback "optic_KHS_blk";//CSAT
	a3e_arr_Scopes_Sniper pushback "optic_KHS_hex";//CSAT
	a3e_arr_Scopes_Sniper pushback "optic_KHS_tan";//CSAT
	
a3e_arr_NightScopes pushback "optic_NVS";

a3e_arr_TWSScopes pushback "optic_Nightstalker";//CSAT
	a3e_arr_TWSScopes pushback "optic_tws";
	a3e_arr_TWSScopes pushback "optic_tws_mg";

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods pushback "bipod_02_F_blk";
a3e_arr_Bipods pushback "bipod_02_F_tan";
a3e_arr_Bipods pushback "bipod_02_F_hex";