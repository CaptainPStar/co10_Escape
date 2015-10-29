/*
 * Description: This file contains vheicle types and unit types for most units spawned in the mission.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 *
 * Except for the classes specified in this file, classes are specified in the following files: CreateSearchChopper.sqf, EscapeSurprises (RUSSIANSEARCHCHOPPER) 
 * and RunExtraction.sqf, all in folder Scripts\Escape\.
 */


private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

// Random array. Start position guard types.
a3e_arr_Escape_StartPositionGuardTypes = ["rhs_g_Soldier_F", "rhs_g_Soldier_GL_F", "rhs_g_Soldier_F2", "rhs_g_Soldier_F3"];

// Inner fence guard's secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Compact","CUP_10Rnd_9x19_Compact"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Duty","16Rnd_9x21_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Duty_M3X","16Rnd_9x21_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_glock17_flashlight","CUP_17Rnd_9x19_glock17"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_glock17_snds","CUP_17Rnd_9x19_glock17"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_glock17_flashlight_snds","CUP_17Rnd_9x19_glock17"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_M9","CUP_15Rnd_9x19_M9"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Phantom_Flashlight","CUP_18Rnd_9x19_Phantom"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_Phantom_Flashlight_snds","CUP_18Rnd_9x19_Phantom"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M"]];

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
		"CUP_C_UAZ_Unarmed_TK_CIV","CUP_C_UAZ_Open_TK_CIV",
		"CUP_C_Ural_Civ_01","CUP_C_Ural_Civ_02","CUP_C_Ural_Civ_03","CUP_C_Ural_Open_Civ_01","CUP_C_Ural_Open_Civ_02","CUP_C_Ural_Open_Civ_03",
		"CUP_C_Datsun","CUP_C_Datsun_4seat","CUP_C_Datsun_Plain","CUP_C_Datsun_Covered","CUP_C_Datsun_Tubeframe",
		"C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"CUP_O_LR_Transport_TKA","CUP_O_LR_MG_TKA","CUP_O_LR_Ambulance_TKA","CUP_O_LR_SPG9_TKA",
		"CUP_O_UAZ_Unarmed_TKA","CUP_O_UAZ_Open_TKA","CUP_O_UAZ_MG_TKA","CUP_O_UAZ_AGS30_TKA","CUP_O_UAZ_SPG9_TKA",
		"CUP_O_Ural_TKA","CUP_O_Ural_Open_TKA","CUP_O_Ural_Empty_TKA",
		"CUP_O_Ural_ZU23_TKA","CUP_O_BM21_TKA","CUP_O_Ural_Refuel_TKA",
		"CUP_O_Ural_Repair_TKA","CUP_O_Ural_Reammo_TKA",
		"CUP_O_BTR60_TK",
		"CUP_O_BRDM2_TKA","CUP_O_BRDM2_ATGM_TKA","CUP_O_BRDM2_HQ_TKA",
		"CUP_O_ZSU23_TK",
		"CUP_O_M113_TKA","CUP_O_M113_Med_TKA",
		"CUP_O_T55_TK",
		"CUP_O_T72_TKA",
		"",
		""];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"CUP_O_LR_Transport_TKM","CUP_O_LR_MG_TKM","CUP_O_LR_SPG9_TKM",
		"CUP_O_Ural_ZU23_TKM",
		"CUP_I_Datsun_PK_TK",
		"CUP_I_BRDM2_TK_Gue","CUP_I_BRDM2_ATGM_TK_Gue","CUP_I_BRDM2_HQ_TK_Gue",
		"CUP_I_T55_TK_GUE",
		"",
		
		""];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01",
		"rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv",
		"rhs_gaz66_repair_msv","rhs_gaz66_ap2_msv","rhs_gaz66_ammo_msv","rhs_gaz66_repair_msv","rhs_gaz66_ap2_msv","rhs_gaz66_ammo_msv",
		"rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_ural_MSV_01","rhs_ural_open_MSV_01",
		"rhs_ural_fuel_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_fuel_MSV_01",
		"rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv",
		"rhs_zsu234_aa","rhs_zsu234_aa","rhs_zsu234_aa","rhs_zsu234_aa",
		"rhs_bmd1","rhs_bmd1k","rhs_bmd1p",
		"rhs_bmd2","rhs_bmd2k","rhs_bmd4_vdv",
		"rhs_bmp1_msv","rhs_bmp1k_msv","rhs_bmp1d_msv",
		"rhs_bmp2_msv","rhs_bmp2k_msv","rhs_bmp2d_msv",
		"rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv",
		"rhs_t72ba_tv","rhs_t72bc_tv",
		"rhs_t80","rhs_t80a","rhs_t80b","rhs_t80u",
		"rhs_t90_tv",
		"rhs_sprut_vdv","rhs_2s3_tv","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K","rhs_pts_vmf"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_repair_F","I_G_Offroad_01_F",
		"I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F",
		"RHS_UAZ_chdkz","rhs_uaz_open_chdkz","RHS_UAZ_chdkz","rhs_uaz_open_chdkz","RHS_UAZ_chdkz","rhs_uaz_open_chdkz",
		"rhs_ural_chdkz","rhs_ural_open_chdkz","rhs_ural_work_chdkz","rhs_ural_work_open_chdkz",
		"RHS_BM21_chdkz",
		"rhs_zsu234_chdkz",
		"rhs_bmd2_chdkz","rhs_btr70_chdkz",
		"rhs_t72bb_chdkz"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_repair_msv","rhs_gaz66_ap2_msv","rhs_gaz66_ammo_msv","rhs_gaz66_repair_msv","rhs_gaz66_ap2_msv","rhs_gaz66_ammo_msv","rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_fuel_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_zsu234_aa","rhs_zsu234_aa","rhs_zsu234_aa","rhs_zsu234_aa","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd2","rhs_bmd2k","rhs_bmd4_vdv","rhs_bmp1_msv","rhs_bmp1k_msv","rhs_bmp1d_msv","rhs_bmp2_msv","rhs_bmp2k_msv","rhs_bmp2d_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72ba_tv","rhs_t72bc_tv","rhs_t80","rhs_t80a","rhs_t80b","rhs_t80u","rhs_t90_tv","rhs_sprut_vdv","rhs_2s3_tv","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K","rhs_pts_vmf"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_armed_F","RHS_UAZ_chdkz","rhs_uaz_open_chdkz","RHS_UAZ_chdkz","rhs_uaz_open_chdkz","RHS_UAZ_chdkz","rhs_uaz_open_chdkz","rhs_ural_chdkz","rhs_ural_open_chdkz","rhs_ural_work_chdkz","rhs_ural_work_open_chdkz","RHS_BM21_chdkz","rhs_zsu234_chdkz","rhs_bmd2_chdkz","rhs_btr70_chdkz","rhs_t72bb_chdkz"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = ["CUP_O_TK_Soldier_01","CUP_O_TK_Soldier_02","CUP_O_TK_Soldier_03","CUP_O_TK_Soldier_04","CUP_O_TK_Soldier_05","CUP_O_TK_Soldier","CUP_O_TK_Soldier_GL","CUP_O_TK_Soldier_Backpack","CUP_O_TK_Soldier_AAT","CUP_O_TK_Soldier_AMG","CUP_O_TK_Soldier_LAT","CUP_O_TK_Soldier_AT","CUP_O_TK_Soldier_HAT","CUP_O_TK_Soldier_AA","CUP_O_TK_Engineer","CUP_O_TK_Soldier_MG","CUP_O_TK_Soldier_AR","CUP_O_TK_Medic","CUP_O_TK_Soldier_SL","CUP_O_TK_Officer","CUP_O_TK_Spotter","CUP_O_TK_Sniper","CUP_O_TK_Sniper_KSVK","CUP_O_TK_Sniper_SVD_Night","CUP_O_TK_Soldier_AKS_Night","CUP_O_TK_Soldier_FNFAL_Night","CUP_O_TK_Soldier_AKS_74_GOSHAWK"];
a3e_arr_Escape_InfantryTypes_Ind = ["rhs_g_Soldier_TL_F","rhs_g_Soldier_SL_F","rhs_g_Soldier_F","rhs_g_Soldier_F2","rhs_g_Soldier_F3","rhs_g_Soldier_lite_F","rhs_g_Soldier_AR_F","rhs_g_medic_F","rhs_g_engineer_F","rhs_g_Soldier_exp_F","rhs_g_Soldier_GL_F","rhs_g_Soldier_M_F","rhs_g_Soldier_LAT_F","rhs_g_Soldier_AT_F","rhs_g_Soldier_AA_F","rhs_g_Soldier_AAR_F","rhs_g_Soldier_AAT_F"];
a3e_arr_recon_InfantryTypes = ["CUP_O_TK_SpecOps","CUP_O_TK_SpecOps_TL","CUP_O_TK_SpecOps_MG"];
a3e_arr_recon_I_InfantryTypes = ["CUP_O_TK_Crew","CUP_O_TK_Pilot","CUP_O_TK_Commander"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = ["rhs_btr60_msv", "RHS_NSV_TriPod_VDV", "O_static_AT_F"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = ["I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "rhs_btr70_chdkz", "I_static_AT_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = ["rhs_gaz66o_msv","rhs_ural_MSV_01", "rhs_ural_open_MSV_01","rhs_gaz66_msv"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = ["rhs_ural_work_open_chdkz","rhs_ural_chdkz","rhs_ural_open_chdkz","rhs_ural_work_chdkz"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_ReinforcementTruck_vehicleClasses above.
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [14, 14, 16, 13, 13];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01", "rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [6, 6, 8, 8, 8, 8, 8, 8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = ["rhs_bmp1_msv","rhs_bmp2_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80a_msv","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = ["rhs_t72bc_tv", "rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u","rhs_t90_tv"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = ["CUP_I_KORD_high_AAF","CUP_I_DSHKM_AAF"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = ["I_G_Offroad_01_repair_F","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv", "I_G_Offroad_01_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "rhs_ural_open_vdv_01"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = ["CUP_I_DSHKM_AAF","CUP_I_DSHkM_Mini_TriPod","CUP_I_KORD_AAF","CUP_I_KORD_high_AAF","CUP_I_AGS_AAF","CUP_I_Metis_AAF","CUP_I_SPG9_AAF","CUP_I_Igla_AA_pod_AAF"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["I_G_Offroad_01_repair_F","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv", "I_G_Offroad_01_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "rhs_ural_open_vdv_01"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = ["CUP_O_Mi24_D_TK","CUP_O_Mi17_TK"];
a3e_arr_O_transport_heli = ["CUP_O_Mi17_TK"];
a3e_arr_O_pilots = ["CUP_O_TK_Pilot"];
a3e_arr_I_transport_heli = ["RHS_Mi8amt_chdkz"];
a3e_arr_I_pilots = ["rhs_g_Crew_F","rhs_g_Crew_F"];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
a3e_arr_AmmoDepotBasicWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_hgun_Makarov", 50, 2, 5, ["CUP_8Rnd_9x18_Makarov_M"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_Sa58P_des", 10, 1, 2, ["CUP_30Rnd_Sa58_M_TracerG"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_AK74", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_AK74M", 50, 2, 4, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_AK74M_GL", 75, 2, 4, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "CUP_1Rnd_HE_GP25_M"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_lmg_PKM", 20, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_srifle_SVD_des", 10, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_srifle_SVD_des_ghillie_pso", 10, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 6]];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_sgun_Saiga12K", 50, 2, 4, ["CUP_8Rnd_B_Saiga12_74Slug_M","CUP_8Rnd_B_Saiga12_74Pellets_M"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_AKM", 50, 1, 3, ["CUP_30Rnd_762x39_AK47_M"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_AK74M_GL", 50, 1, 3, ["CUP_30Rnd_545x39_AK_M","CUP_1Rnd_HE_GP25_M"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_RPK74", 30, 1, 2, ["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_FNFAL5062", 10, 1, 2, ["CUP_20Rnd_762x51_FNFAL_M"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_FNFAL", 10, 1, 2, ["CUP_20Rnd_762x51_FNFAL_M"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_AK107_GL_kobra", 10, 1, 2, ["CUP_30Rnd_545x39_AK_M", "CUP_1Rnd_HE_GP25_M", "rhs_mag_M714_white","rhs_mag_M661_green"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_G36A_camo", 10, 1, 2, ["CUP_30Rnd_556x45_G36"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_G36C_camo", 10, 1, 2, ["CUP_30Rnd_556x45_G36"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_srifle_M14", 10, 1, 2, ["CUP_20Rnd_762x51_DMR"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_arifle_MG36_camo", 10, 1, 2, ["CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["CUP_smg_MP5A5", 10, 1, 2, ["CUP_30Rnd_9x19_MP5"], 8]];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["CUP_srifle_SVD_des", 50, 2, 4, ["CUP_10Rnd_762x54_SVD_M"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["CUP_srifle_ksvk", 50, 2, 4, ["CUP_5Rnd_127x108_KSVK_M"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["CUP_srifle_VSSVintorez_pso", 10, 2, 4, ["CUP_20Rnd_9x39_SP5_VSS_M"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["CUP_lmg_Pecheneg", 50, 1, 3, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 4]];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["CUP_arifle_RPK74_45", 50, 2, 4, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 6]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["CUP_lmg_UK59", 10, 1, 2, ["CUP_50Rnd_UK59_762x54R_Tracer"], 6]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["CUP_smg_bizon_snds", 50, 1, 2, ["CUP_64Rnd_9x19_Bizon_M"], 7]];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["CUP_launch_RPG7V", 50, 1, 2, ["CUP_PG7V_M", "CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M"], 1]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["CUP_launch_RPG18", 50, 1, 3, ["CUP_RPG18_M"], 1]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["CUP_launch_RPG7V", 50, 1, 3, ["CUP_PG7V_M"], 3]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["CUP_launch_Metis", 50, 1, 3, ["CUP_AT13_M"], 2]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["CUP_launch_Igla", 50, 1, 2, ["CUP_Igla_M"], 3]];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["CUP_launch_MAAWS_Scope", 10, 1, 2, ["CUP_MAAWS_HEAT_M"], 2]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance set [count a3e_arr_AmmoDepotOrdnance, [objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5]];
a3e_arr_AmmoDepotOrdnance set [count a3e_arr_AmmoDepotOrdnance, [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5]];
a3e_arr_AmmoDepotOrdnance set [count a3e_arr_AmmoDepotOrdnance, [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5]];
a3e_arr_AmmoDepotOrdnance set [count a3e_arr_AmmoDepotOrdnance, [objNull, 30, 1, 1, ["Laserbatteries"], 5]];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["CUP_GrenadeHand_RGO", "CUP_GrenadeHand_RGD5"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 10, 1, 1, ["rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 5]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["CUP_1Rnd_HE_GP25_M"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["CUP_IlumFlareWhite_GP25_M","CUP_IlumFlareRed_GP25_M","CUP_IlumFlareGreen_GP25_M","CUP_FlareWhite_GP25_M","CUP_FlareGreen_GP25_M","CUP_FlareRed_GP25_M","CUP_FlareYellow_GP25_M"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["rhs_mag_zarya2"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["CUP_1Rnd_SMOKE_GP25_M","CUP_1Rnd_SMOKERED_GP25_M","CUP_1Rnd_SMOKEGREEN_GP25_M","CUP_1Rnd_SMOKEYELLOW_GP25_M"], 25]];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems set [count a3e_arr_AmmoDepotVehicleItems, ["ToolKit", 20, 1, 1, [], 0]];
a3e_arr_AmmoDepotVehicleItems set [count a3e_arr_AmmoDepotVehicleItems, ["Medikit", 20, 1, 1, [], 0]];
a3e_arr_AmmoDepotVehicleItems set [count a3e_arr_AmmoDepotVehicleItems, ["FirstAidKit", 100, 10, 50, [], 0]];
a3e_arr_AmmoDepotVehicleBackpacks = ["O_UAV_01_backpack_F"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["Laserdesignator", 10, 1, 2]];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["NVGoggles", 10, 1, 3]];
};
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["Rangefinder", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["Binocular", 50, 2, 3, [], 0]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemCompass", 50, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemGPS", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemMap", 50, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemRadio", 50, 1, 10]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemWatch", 50, 1, 10]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_acc_Flashlight_desert", 50, 1, 5]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_acc_ANPEQ_2_desert", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_muzzle_Bizon", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_muzzle_PBS4", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_muzzle_PB6P9", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_Kobra", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_PSO_1", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_PSO_3", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_PechenegScope", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_HoloDesert", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_muzzle_snds_G36_desert", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_LeupoldMk4_CQ_T", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_LeupoldMk4_10x40_LRT_Desert", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_ZDDot", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_ACOG", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_TrijiconRx01_desert", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_AN_PAS_13c2", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_SB_3_12x50_PMII", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_CompM4", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_Eotech533", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_CompM2_Desert", 10, 1, 3]];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_AN_PVS_4", 10, 1, 3]];
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_NSPU", 10, 1, 3]];
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_optic_GOSHAWK", 10, 1, 3]];
};
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["O_UavTerminal", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_DMS", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Yorris", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_LRPS", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_AMS", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_KHS_blk", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["bipod_01_F_blk", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["bipod_02_F_blk", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["bipod_03_F_blk", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["bipod_01_F_mtp", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["bipod_02_F_hex", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["bipod_03_F_oli", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_bipod_VLTOR_Modpod", 20, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["CUP_bipod_Harris_1A2_L", 10, 1, 2]];
// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.


a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["rhs_weap_makarov_pmm", "rhs_mag_9x18_12_57N181S", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_arifle_AKS_Gold", "CUP_30Rnd_545x39_AK_M", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_Pellets", 9]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_74Slug", 9]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_HE", 9]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_arifle_AKS74UN_kobra_snds", "CUP_30Rnd_545x39_AK_M", 9]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_glaunch_6G30", "CUP_1Rnd_HE_GP25_M", 8]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["rhs_weap_M320", "rhs_mag_M433_HEDP", 10]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["rhs_weap_ak74m_plummag_npz", "rhs_30Rnd_545x39_AK", 7]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["rhs_weap_m240b_usmc", "rhsusf_100Rnd_762x51", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 8]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["CUP_srifle_CZ550", "CUP_5x_22_LR_17_HMR_M", 10]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["rhs_weap_sr25_sup_marsoc", "rhsusf_20Rnd_762x51_m118_special_Mag", 12]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["rhs_weap_rshg2","rhs_rshg2_mag", 2]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["MineDetector", objNull, 0]];
//a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Medikit", objNull, 0]];
//a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Toolkit", objNull, 0]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Binocular", objNull, 0]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "SatchelCharge_Remote_Mag", 2]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "HandGrenade", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "SmokeShell", 5]];


// Here is a list of scopes:
a3e_arr_Scopes = ["rhs_acc_1p29","rhs_acc_1p63","rhs_acc_pkas","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_1p78","rhs_acc_pso1m2","rhs_acc_pgo7v","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_LEUPOLDMK4_2","rhsusf_acc_EOTECH","rhsusf_acc_eotech_552","rhsusf_acc_compm4","rhsusf_acc_ELCAN","rhsusf_acc_ACOG","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3"];
a3e_arr_Scopes_SMG = ["rhsusf_acc_EOTECH","rhsusf_acc_eotech_552","rhs_acc_ekp1"];
a3e_arr_Scopes_Sniper = ["rhs_acc_pso1m2","rhs_acc_1p78"];
a3e_arr_NightScopes = ["optic_NVS","rhs_acc_1pn93_1","rhs_acc_1pn93_2"];
a3e_arr_TWSScopes = ["optic_Nightstalker","optic_tws","optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = ["rhs_bipod","rhsusf_acc_harris_bipod","bipod_01_F_snd","bipod_01_F_blk","bipod_01_F_mtp","bipod_02_F_blk","bipod_02_F_tan","bipod_02_F_hex","bipod_03_F_blk","bipod_03_F_oli"];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = ["CUP_B_UH60M_FFV_US","CUP_B_MH60S_FFV_USMC","CUP_B_UH60M_Unarmed_FFV_MEV_US","CUP_B_UH1Y_UNA_F","CUP_B_MV22_USMC","CUP_B_CH53E_USMC","CUP_B_CH47F_USA","CUP_Merlin_HC3_Ramp_Gun"];
a3e_arr_extraction_chopper_escort = ["CUP_B_AH64D_ES_USA","CUP_B_AH1Z_Escort"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = ["CUP_O_Su25_TKA"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// only chopper used right now
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopper = ["RHS_Mi8MTV3_FAB_vvs","RHS_Mi8AMTSh_vvs","RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_vvs","RHS_Mi8MTV3_vvs","RHS_Mi8mt_vvsc","RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_vvs","RHS_Mi8mt_vvsc"];
a3e_arr_searchChopper_pilot = ["rhs_pilot"];
a3e_arr_searchChopper_crew = ["rhs_pilot_transport_heli"];

//////////////////////////////////////////////////////////////////
// fn_AmbientInfantry
// only INS is used
//is this even used?
//////////////////////////////////////////////////////////////////
a3e_arr_AmbientInfantry_Inf_INS = a3e_arr_Escape_InfantryTypes;
a3e_arr_AmbientInfantry_Inf_GUE = a3e_arr_Escape_InfantryTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_InitGuardedLocations
// Units spawned to guard ammo camps and com centers
// Only INS used
//////////////////////////////////////////////////////////////////
a3e_arr_InitGuardedLocations_Inf_INS = a3e_arr_Escape_InfantryTypes;
a3e_arr_InitGuardedLocations_Inf_GUE = a3e_arr_Escape_InfantryTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_roadblocks
// units spawned on roadblocks
// Only INS used
// vehicle arrays not used, uses a3e_arr_Escape_RoadBlock_MannedVehicleTypes and a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind instead
//////////////////////////////////////////////////////////////////
a3e_arr_roadblocks_Inf_INS = a3e_arr_Escape_InfantryTypes;
a3e_arr_roadblocks_Inf_GUE = a3e_arr_Escape_InfantryTypes_Ind;

a3e_arr_roadblocks_Veh_INS = a3e_arr_Escape_RoadBlock_MannedVehicleTypes;
a3e_arr_roadblocks_Veh_GUE = a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_PopulateAquaticPatrol
// boats that are spawned
//////////////////////////////////////////////////////////////////
a3e_arr_AquaticPatrols = ["O_Boat_Armed_01_hmg_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "CUP_RUBasicWeaponsBox";
a3e_additional_weapon_box_2 = "CUP_RUSpecialWeaponsBox";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = ["CUP_I_2b14_82mm_AAF"]; //O_Mortar_01_F

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
a3e_arr_CrashSiteWrecks = ["CUP_B_UH1Y_Wreck","CUP_B_UH1Y_Wreck_Gunship","Land_UWreck_MV22_F","Land_Wreck_Plane_Transport_01_F","Land_Wreck_Heli_Attack_01_F"];
a3e_arr_CrashSiteCrew = ["rhsusf_airforce_pilot"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["CUP_sgun_M1014", 50, 2, 5, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["CUP_launch_M136", 10, 1, 2, ["CUP_M136_M"], 1]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["rhs_weap_m16a4_grip", 100, 3, 5, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["CUP_glaunch_M32", 10, 1, 2, ["CUP_6Rnd_HE_M203"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["rhs_weap_m4_grip2", 75, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["rhs_weap_m14ebrri", 20, 1, 2, ["rhsusf_20Rnd_762x51_m118_special_Mag"], 8]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["rhs_weap_XM2010_wd", 10, 1, 2, ["rhsusf_5Rnd_300winmag_xm2010"], 8]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["rhs_weap_m240B", 10, 1, 2, ["rhsusf_100Rnd_762x51"], 6]];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_M2010S", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_rotex5_grey", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_anpeq15_light", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_eotech_552", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_LEUPOLDMK4_2", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_ACOG2", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_harris_bipod", 10, 1, 3]];