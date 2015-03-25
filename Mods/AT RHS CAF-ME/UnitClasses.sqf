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
drn_arr_Escape_StartPositionGuardTypes = ["CAF_AG_ME_T_AK74", "CAF_AG_ME_T_GL", "at_CAF_AG_ME_T_AKS74", "at_CAF_AG_ME_T_AK74_dirty"];

// Inner fence guard's secondary weapon (and corresponding magazine type).
drn_var_Escape_InnerFenceGuardSecondaryWeapon = [];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_deagle","RH_7Rnd_50_AE"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_bullb","RH_6Rnd_454_Mag"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_cz75","RH_16Rnd_9x19_cz"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_p226","RH_15Rnd_9x19_SIG"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_kimber","RH_7Rnd_45cal_m1911"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_m9","RH_15Rnd_9x19_M9"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_g18","RH_33Rnd_9x19_g18"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_fn57_g","RH_20Rnd_57x28_FN"]];
drn_var_Escape_InnerFenceGuardSecondaryWeapon set [count(drn_var_Escape_InnerFenceGuardSecondaryWeapon),["RH_vz61","RH_20Rnd_32cal_vz61"]];

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_typhoon_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_zsu234_aa","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4_msv","rhs_bmd4m_msv","rhs_bmp1_msv","rhs_bmp1p_msv","rhs_bmp1k_msv","rhs_bmp1d_msv","rhs_bmp2_msv","rhs_bmp2d_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72ba_tv","rhs_t80","rhs_t80a","rhs_sprut_msv","rhs_2s3_tv","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K"];
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_van_01"];
    };
    case 2: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_typhoon_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_zsu234_aa","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4_msv","rhs_bmd4m_msv","rhs_bmd4ma_msv","rhs_bmp1_msv","rhs_bmp1p_msv","rhs_bmp1k_msv","rhs_bmp1d_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2k_msv","rhs_bmp2d_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u","rhs_sprut_msv","rhs_2s3_tv","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K"];
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_van_01"];
    };
    default {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_typhoon_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_zsu234_aa","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4_msv","rhs_bmd4m_msv","rhs_bmd4ma_msv","rhs_bmp1_msv","rhs_bmp1p_msv","rhs_bmp1k_msv","rhs_bmp1d_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2k_msv","rhs_bmp2d_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u","rhs_sprut_msv","rhs_2s3_tv","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K"];
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_van_01"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
drn_arr_Escape_InfantryTypes =      ["rhs_msv_officer_armored","rhs_msv_officer","rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_engineer", "rhs_msv_medic","rhs_msv_rifleman","rhs_msv_efreitor","rhs_msv_grenadier","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_marksman","rhs_msv_aa","rhs_msv_LAT","rhs_msv_engineer", "rhs_msv_medic"];
drn_arr_Escape_InfantryTypes_Ind =  ["at_CAF_AG_ME_T_AKS74_PSO1","at_CAF_AG_ME_T_Medic","at_CAF_AG_ME_T_Engineer","CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPG","CAF_AG_ME_T_GL","at_CAF_AG_ME_T_AKS74","at_CAF_AG_ME_T_AK74_dirty","at_CAF_AG_ME_T_AKS74U","at_CAF_AG_ME_T_AKM","at_CAF_AG_ME_T_saiga","at_CAF_AG_ME_T_FAL","at_CAF_AG_ME_T_G3","at_CAF_AG_ME_T_G3SG1","at_CAF_AG_ME_T_Enfield"];
a3n_arr_recon_InfantryTypes = ["rhs_msv_recon_sergeant","rhs_msv_recon_engineer","rhs_msv_recon_marksman","rhs_msv_recon_machinegunner","rhs_msv_recon_medic","rhs_msv_recon_at","rhs_msv_recon_rifleman"];

a3n_arr_recon_I_InfantryTypes = ["rhs_msv_recon_sergeant","rhs_msv_recon_engineer","rhs_msv_recon_marksman","rhs_msv_recon_machinegunner","rhs_msv_recon_medic","rhs_msv_recon_at","rhs_msv_recon_rifleman"];


// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
drn_arr_Escape_RoadBlock_MannedVehicleTypes = ["rhs_btr60_msv", "RHS_NSV_TriPod_VDV", "O_static_AT_F"];
drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = ["CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01", "I_HMG_01_hight_f", "I_static_AT_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
drn_arr_Escape_ReinforcementTruck_vehicleClasses = ["rhs_gaz66o_msv","rhs_ural_MSV_01", "rhs_ural_open_MSV_01","rhs_typhoon_msv","rhs_gaz66_msv"];
drn_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = ["CAF_AG_ME_T_van_01"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_ReinforcementTruck_vehicleClasses above.
drn_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [14, 14, 16, 13, 13];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01", "rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [6, 6, 8, 8, 8, 8, 8, 8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_lightArmorClasses = ["rhs_bmp1_msv","rhs_bmp2_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80a_msv","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01"];
// Random array. Heavy armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_heavyArmorClasses = ["rhs_t72bc_tv", "rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
drn_arr_ComCenStaticWeapons = ["O_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
drn_arr_ComCenParkedVehicles = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_typhoon_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv", "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_van_01"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
drn_arr_Escape_EnemyCivilianCarTypes = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
drn_arr_Escape_AmmoDepot_StaticWeaponClasses = ["RHS_NSV_TriPod_VDV", "O_GMG_01_high_F", "RHS_NSV_TriPod_VDV", "O_static_AT_F", "O_static_AA_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_typhoon_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv", "CAF_AG_ME_T_Offroad", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_Offroad_armed_01", "CAF_AG_ME_T_van_01"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = ["RHS_Mi24V_msv","RHS_Mi24V_FAB_vdv","RHS_Mi24P_CAS_vdv","RHS_Mi24V_UPK23_vvsc","RHS_Ka52_vvs","RHS_Ka52_vvsc"];
a3e_arr_O_transport_heli = ["rhs_ka60_grey","rhs_ka60_c","RHS_Mi8AMT_msv","RHS_Mi8AMT_vvsc","RHS_Mi8AMTSh_vvsc","RHS_Mi8mt_Cargo_vv"];
a3e_arr_O_pilots = ["rhs_pilot","rhs_pilot_transport_heli"];
a3e_arr_I_transport_heli = ["rhs_ka60_grey","rhs_ka60_c","RHS_Mi8AMT_msv","RHS_Mi8AMT_vvsc","RHS_Mi8AMTSh_vvsc"];
a3e_arr_I_pilots = ["rhs_pilot","rhs_pilot_transport_heli"];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

a3n_arr_CSAT_Launchers set [0, ["rhs_weap_rpg7", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"]]];
a3n_arr_CSAT_Launchers set [1, ["rhs_weap_rpg26", ["rhs_rpg26_mag"]]];
a3n_arr_CSAT_Launchers set [2, ["rhs_weap_rshg2", ["rhs_rshg2_mag"]]];
a3n_arr_CSAT_Launchers set [3, ["rhs_weap_igla", ["rhs_mag_9k38_rocket"]]];

// Weapons and ammo in the basic weapons box
drn_arr_AmmoDepotBasicWeapons = [];
// CSAT weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_pya", 100, 4, 8, ["rhs_mag_9x19_17"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["SMG_02_F", 100, 4, 8, ["30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_ak74m_desert", 100, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_ak74m_2mag", 100, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_ak74m_gp25", 100, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green", "rhs_VOG25"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_FAL5061", 100, 2, 4, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_50rnd_762x51_M_FAL", "hlc_20Rnd_762x51_S_fal"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_g3a3", 100, 2, 4, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3", "hlc_20rnd_762x51_b_G3", "hlc_50rnd_762x51_M_G3"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_g3sg1", 100, 2, 4, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3", "hlc_20rnd_762x51_b_G3", "hlc_50rnd_762x51_M_G3"], 6]];
// non-CSAT weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["RH_tt33", 100, 4, 8, ["RH_8Rnd_762_tt33"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["RH_tec9", 100, 4, 8, ["RH_32Rnd_9x19_tec"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["RH_mak", 100, 4, 8, ["RH_8Rnd_9x18_Mak"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["RH_vz61", 100, 4, 8, ["RH_20Rnd_32cal_vz61"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_m14ebrri_leu", 100, 4, 8, ["rhsusf_20Rnd_762x51_m118_special_Mag","rhsusf_20Rnd_762x51_m993_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_m4", 100, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_m4a1_m320", 100, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_m4_grip", 100, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_m4a1", 100, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hlc_rifle_SAMR", 100, 2, 4, ["hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_EPR"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["rhs_weap_m16a4", 100, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["g36a", 100, 2, 4, ["G36_mag"], 6]];


// Weapons and ammo in the special weapons box
drn_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["rhs_weap_svdp_wd", 100, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["rhs_weap_svds", 100, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_GM6_F", 100, 2, 4, ["5Rnd_127x108_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["rhs_weap_pkp", 100, 2, 4, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], 6]];
// non-CAST weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["Trixie_CZ550", 100, 2, 4, ["Trixie_CZ550_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["rhs_weap_m249_pip", 100, 2, 4, ["rhsusf_100Rnd_556x45_soft_pouch"], 6]];


// Weapons and ammo in the launchers box
drn_arr_AmmoDepotLaunchers = [];
// CSAT weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["rhs_weap_rpg7", 100, 3, 5, ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["rhs_weap_rpg26", 100, 1, 1, ["rhs_rpg26_mag"], 3]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["rhs_weap_rshg2", 100, 1, 1, ["rhs_rshg2_mag"], 3]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["rhs_weap_igla", 100, 1, 1, ["rhs_mag_9k38_rocket"], 3]];
// non-CSAT weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_NLAW_F", 100, 3, 5, ["NLAW_F"], 6]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
//drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];


// Weapons and ammo in the ordnance box
drn_arr_AmmoDepotOrdnance = [];
// General weapons
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, [objNull, 100, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "ATMine_Range_Mag", "APERSTripMine_Wire_Mag", "SLAMDirectionalMine_Wire_Mag", "Laserbatteries"], 20]];


// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
drn_arr_AmmoDepotVehicle = [];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["rhs_VOG25"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["rhs_mag_zarya2"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["ToolKit", 100, 10, 10, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Medikit", 100, 10, 10, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["FirstAidKit", 100, 50, 50, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Binocular", 100, 25, 25, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Binocular", 100, 25, 25, [], 0]];
a3e_arr_AmmoDepotVehicleBackpacks = ["O_UAV_01_backpack_F"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

drn_arr_AmmoDepotItems = [];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["Laserdesignator", 100, 10, 10]];
if(!a3e_var_noNV) then {
	drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["NVGoggles", 100, 10, 10]];
};
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["Rangefinder", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemCompass", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemGPS", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemMap", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemRadio", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemWatch", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["acc_flashlight", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["acc_pointer_IR", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["hlc_muzzle_snds_fal", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["hlc_muzzle_snds_g3", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["RH_pmsd", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["RH_pmir", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["RH_tecsd", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Aco", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_pgo7v", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_pkas", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_ekp1", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_ekp1b", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_ekp1c", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_ekp1d", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_pso1m2", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_1p29", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhsusf_acc_EOTECH", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["hlc_optic_suit", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["HLC_Optic_ZFSG1", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["hlc_optic_accupoint_g3", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["hlc_muzzle_556NATO_KAC", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhsusf_acc_HAMR", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhsusf_acc_LEUPOLDMK4", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhsusf_acc_ELCAN", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhsusf_acc_ACOG", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhsusf_acc_ACOG2", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["SMA_Silencer_556", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["SMA_AIMPOINT", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["iansky_deltapoint", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["iansky_t1", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["iansky_rx01", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["iansky_rds", 100, 10, 10]];
if(!a3e_var_noNV) then {
	drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["rhs_acc_1pn93_1", 100, 10, 10]];
	drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["hlc_optic_PVS4FAL", 100, 10, 10]];
	drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Nightstalker", 100, 10, 10]];
};
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["O_UavTerminal", 100, 5, 5]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_DMS", 100, 5, 5]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Yorris", 100, 5, 5]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_LRPS", 100, 5, 5]];

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.


drn_arr_CivilianCarWeapons = [];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["RH_Deagleg", "RH_7Rnd_50_AE", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["AG_MP9_sidearm", "30Rnd_45ACP_Mag_SMG_01", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["sgun_AA12_F", "20Rnd_B_AA12_Pellets", 11]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["sgun_AA12_F", "20Rnd_B_AA12_HE", 9]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["RHARD_MK18AFG_F", "30Rnd_556x45_Stanag", 9]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hlc_rifle_RU5562", "30Rnd_556x45_Stanag", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hlc_rifle_Bushmaster300", "29rnd_300BLK_STANAG", 6]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hlc_smg_mp5k_PDW", "hlc_30Rnd_9x19_GD_MP5", 7]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hlc_smg_mp510", "hlc_30Rnd_10mm_JHP_MP5", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hlc_rifle_aks74u", "rhs_30Rnd_545x39_7N10_AK", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hlc_rifle_saiga12k", "hlc_10rnd_12g_buck_S12", 10]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Trixie_M24_Clean", "Trixie_5x762_Mag", 12]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["rhs_weap_rshg2","rhs_rshg2_mag", 2]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["MineDetector", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Medikit", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Toolkit", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Binocular", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "SatchelCharge_Remote_Mag", 2]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "HandGrenade", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "SmokeShell", 5]];


// Here is a list of scopes:
a3n_arr_Scopes = ["optic_Aco","optic_ACO_grn","optic_Arco","optic_Hamr","optic_MRCO","optic_Holosight","rhs_acc_pkas","rhs_acc_pso1m2","rhs_acc_1p29","iansky_deltapoint","iansky_t1","iansky_rx01","iansky_rds","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d"];
a3n_arr_Scopes_SMG = ["optic_Aco_smg","optic_Holosight_smg","iansky_deltapoint"];
a3n_arr_NightScopes = ["optic_NVS","rhs_acc_1pn93_1","hlc_optic_PVS4FAL"];
a3n_arr_TWSScopes = ["optic_Nightstalker","optic_tws","optic_tws_mg"];


//format ["name", [ammunition], [suppressors], [optics]]
//[optics] doesn't contain everything that be attatched to the weapon, just the one's I thought sort of made sense given who might carry them.
//weapon arrays
a3n_arr_CSAT_Primary_Weapons = [];
a3n_arr_CSAT_Primary_Weapons set [0, ["rhs_weap_ak74m_desert", ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_acc_1p29", "rhs_acc_ekp1"]]];
a3n_arr_CSAT_Primary_Weapons set [1, ["rhs_weap_ak74m_2mag", ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_acc_1p29", "rhs_acc_ekp1"]]];
a3n_arr_CSAT_Primary_Weapons set [2, ["rhs_weap_ak74m_gp25", ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_acc_1p29", "rhs_acc_ekp1"]]];
a3n_arr_CSAT_Primary_Weapons set [3, ["rhs_weap_pkp", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ["rhs_acc_pkas"]]];
a3n_arr_CSAT_Primary_Weapons set [4, ["SMG_01_F", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_tracer_green"], ["muzzle_snds_acp"], ["optic_Aco_smg"]]];
a3n_arr_CSAT_Primary_Weapons set [5, ["rhs_weap_svdp", ["rhs_10Rnd_762x54mmR_7N1"], ["rhs_acc_pso1m2"]]];
a3n_arr_CSAT_Primary_Weapons set [6, ["srifle_GM6_F", ["5Rnd_127x108_Mag"], [], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_CSAT_Secondary_Weapons = [];
a3n_arr_CSAT_Secondary_Weapons set [0, ["rhs_weap_pya", ["rhs_mag_9x19_17"], ["rhs_acc_tgpa"], []]];
a3n_arr_CSAT_Launchers = [];
a3n_arr_CSAT_Launchers set [0, ["rhs_weap_rpg7", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"]]];
a3n_arr_CSAT_Launchers set [1, ["rhs_weap_rpg26", ["rhs_rpg26_mag"]]];
a3n_arr_CSAT_Launchers set [2, ["rhs_weap_rshg2", ["rhs_rshg2_mag"]]];
a3n_arr_CSAT_Launchers set [3, ["rhs_weap_igla", ["rhs_mag_9k38_rocket"]]];

a3n_arr_AAF_Primary_Weapons = [];
a3n_arr_AAF_Primary_Weapons set [0, ["arifle_Mk20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [1, ["arifle_Mk20C_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [2, ["arifle_Mk20_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [3, ["arifle_SDAR_F", ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_AAF_Primary_Weapons set [4, ["LMG_Mk200_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], ["muzzle_snds_H_MG"], ["optic_Arco"]]];
a3n_arr_AAF_Primary_Weapons set [5, ["srifle_EBR_F", ["20Rnd_762x51_Mag"], ["muzzle_snds_B"], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_AAF_Secondary_Weapons = [];
a3n_arr_AAF_Secondary_Weapons set [0, ["hgun_ACPC2_F", ["9Rnd_45ACP_Mag"], ["muzzle_snds_acp"], []]];
a3n_arr_AAF_Secondary_Weapons set [1, ["hgun_PDW2000_F", ["30Rnd_9x21_Mag", "16Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3n_arr_AAF_Launchers = [];
a3n_arr_AAF_Launchers set [0, ["launch_I_Titan_F", ["Titan_AA"]]];
a3n_arr_AAF_Launchers set [1, ["launch_I_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3n_arr_AAF_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];
a3n_arr_NATO_Primary_Weapons = [];
a3n_arr_NATO_Primary_Weapons set [0, ["arifle_MX_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3n_arr_NATO_Primary_Weapons set [1, ["arifle_MX_GL_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3n_arr_NATO_Primary_Weapons set [2, ["arifle_MX_SW_F", ["100Rnd_65x39_caseless_mag_Tracer", "100Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Arco"]]];
a3n_arr_NATO_Primary_Weapons set [3, ["arifle_MXC_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3n_arr_NATO_Primary_Weapons set [4, ["SMG_01_F", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_tracer_green"], ["muzzle_snds_acp"],["optic_Holosight_smg"]]];
a3n_arr_NATO_Primary_Weapons set [5, ["arifle_MXM_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_NATO_Primary_Weapons set [6, ["srifle_LRR_F", ["7Rnd_408_Mag"], [], ["optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3n_arr_NATO_Secondary_Weapons = [];
a3n_arr_NATO_Secondary_Weapons set [0, ["hgun_P07_F", ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3n_arr_NATO_Launchers = [];
a3n_arr_NATO_Launchers set [0, ["launch_B_Titan_F", ["Titan_AA"]]];
a3n_arr_NATO_Launchers set [1, ["launch_B_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3n_arr_NATO_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];
a3n_arr_FIA_Primary_Weapons = [];
a3n_arr_FIA_Primary_Weapons set [0, ["arifle_TRG20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [1, ["arifle_Mk20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn"], "optic_Holosight"]];
a3n_arr_FIA_Primary_Weapons set [2, ["arifle_TRG21_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [3, ["arifle_SDAR_F", ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [4, ["arifle_TRG21_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [5, ["arifle_Mk20_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3n_arr_FIA_Primary_Weapons set [6, ["LMG_Mk200_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], ["muzzle_snds_H_MG", "optic_Hamr", "optic_Arco"]]];
a3n_arr_FIA_Secondary_Weapons = [];
a3n_arr_FIA_Secondary_Weapons set [0, ["hgun_ACPC2_F", ["9Rnd_45ACP_Mag"], ["muzzle_snds_acp"], []]];
a3n_arr_FIA_Launchers = [];
a3n_arr_FIA_Launchers set [0, ["launch_B_Titan_F", ["Titan_AA"]]];
a3n_arr_FIA_Launchers set [1, ["launch_B_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3n_arr_FIA_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = ["rhs_uh60m","rhs_ch_47f"];
a3e_arr_extraction_chopper_escort = ["rhs_ah64d_wd"];

//(a3e_arr_extraction_chopper select floor (random count a3e_arr_extraction_chopper))

//////////////////////////////////////////////////////////////////
// Functions.sqf
//////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = ["rhs_pchela1t_vvs"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// only chopper used right now
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopper = ["RHS_Mi8AMTSh_vvsc","RHS_Mi8AMTSh_vdv","RHS_Mi8AMTSh_vvs","RHS_Mi8mt_vdv","RHS_Mi8MTV3_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_vvs","RHS_Mi8MTV3_vvs","RHS_Mi8mt_vvsc","RHS_Mi8MTV3_vvsc"];
a3e_arr_searchChopper_pilot = ["rhs_pilot"];
a3e_arr_searchChopper_crew = ["rhs_pilot_transport_heli"];

//////////////////////////////////////////////////////////////////
// fn_AmbientInfantry
// only INS is used
//is this even used?
//////////////////////////////////////////////////////////////////
a3e_arr_AmbientInfantry_Inf_USMC = ["USMC_Soldier_AA", "USMC_Soldier_HAT", "USMC_Soldier_AT", "USMC_Soldier_AR", "USMC_Soldier_Medic", "USMC_SoldierM_Marksman", "USMC_SoldierS_Engineer", "USMC_Soldier_TL", "USMC_Soldier_GL", "USMC_Soldier_MG", "USMC_Soldier_Officer", "USMC_Soldier", "USMC_Soldier2", "USMC_Soldier_LAT", "USMC_SoldierS_Sniper", "USMC_SoldierS_SniperH"];
a3e_arr_AmbientInfantry_Inf_CDF = ["CDF_Soldier_Strela", "CDF_Soldier_RPG", "CDF_Soldier_AR", "CDF_Soldier_GL", "CDF_Soldier_MG", "CDF_Soldier_Marksman", "CDF_Soldier_Medic", "CDF_Soldier_Militia", "CDF_Soldier_Officer", "CDF_Soldier", "CDF_Soldier_Sniper"];
a3e_arr_AmbientInfantry_Inf_RU = ["RU_Soldier_AA", "RU_Soldier_HAT", "RU_Soldier_AR", "RU_Soldier_GL", "RU_Soldier_MG", "RU_Soldier_Marksman", "RU_Soldier_Medic", "RU_Soldier", "RU_Soldier_LAT", "RU_Soldier_AT", "RU_Soldier2", "RU_Soldier_Sniper", "RU_Soldier_SniperH"];
a3e_arr_AmbientInfantry_Inf_INS = drn_arr_Escape_InfantryTypes;
a3e_arr_AmbientInfantry_Inf_GUE = drn_arr_Escape_InfantryTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_InitGuardedLocations
// Units spawned to guard ammo camps and com centers
// Only INS used
//////////////////////////////////////////////////////////////////
a3e_arr_InitGuardedLocations_Inf_USMC = ["O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_Soldier_lite_F", "O_soldier_exp_F", "O_soldier_M_F"];
a3e_arr_InitGuardedLocations_Inf_CDF = ["CDF_Soldier_Strela", "CDF_Soldier_RPG", "CDF_Soldier_AR", "CDF_Soldier_GL", "CDF_Soldier_MG", "CDF_Soldier_Marksman", "CDF_Soldier_Medic", "CDF_Soldier_Militia", "CDF_Soldier_Officer", "CDF_Soldier", "CDF_Soldier_Sniper"];
a3e_arr_InitGuardedLocations_Inf_RU = ["RU_Soldier_AA", "RU_Soldier_HAT", "RU_Soldier_AR", "RU_Soldier_GL", "RU_Soldier_MG", "RU_Soldier_Marksman", "RU_Soldier_Medic", "RU_Soldier", "RU_Soldier_LAT", "RU_Soldier_AT", "RU_Soldier2", "RU_Soldier_Sniper", "RU_Soldier_SniperH"];
a3e_arr_InitGuardedLocations_Inf_INS = drn_arr_Escape_InfantryTypes;
a3e_arr_InitGuardedLocations_Inf_GUE = drn_arr_Escape_InfantryTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_roadblocks
// units spawned on roadblocks
// Only INS used
// vehicle arrays not used, uses drn_arr_Escape_RoadBlock_MannedVehicleTypes and drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind instead
//////////////////////////////////////////////////////////////////
a3e_arr_roadblocks_Inf_USMC = ["USMC_Soldier_HAT", "USMC_Soldier_AT", "USMC_Soldier_AR", "USMC_Soldier_Medic", "USMC_SoldierM_Marksman", "USMC_SoldierS_Engineer", "USMC_Soldier_TL", "USMC_Soldier_GL", "USMC_Soldier_MG", "USMC_Soldier_Officer", "USMC_Soldier", "USMC_Soldier2", "USMC_Soldier_LAT"];
a3e_arr_roadblocks_Inf_CDF = ["CDF_Soldier_RPG", "CDF_Soldier_AR", "CDF_Soldier_GL", "CDF_Soldier_MG", "CDF_Soldier_Marksman", "CDF_Soldier_Medic", "CDF_Soldier_Militia", "CDF_Soldier_Officer", "CDF_Soldier"];
a3e_arr_roadblocks_Inf_RU = ["RU_Soldier_HAT", "RU_Soldier_AR", "RU_Soldier_GL", "RU_Soldier_MG", "RU_Soldier_Marksman", "RU_Soldier_Medic", "RU_Soldier", "RU_Soldier_LAT", "RU_Soldier_AT", "RU_Soldier2"];
a3e_arr_roadblocks_Inf_INS = drn_arr_Escape_InfantryTypes;
a3e_arr_roadblocks_Inf_GUE = drn_arr_Escape_InfantryTypes_Ind;

a3e_arr_roadblocks_Veh_USMC = ["HMMWV", "HMMWV_M2", "HMMWV_Armored", "HMMWV_MK19", "HMMWV_TOW", "HMMWV_Avenger", "MTVR", "AAV", "LAV25", "LAV25_HQ", "M1A1", "M1A2_TUSK_MG", "M119", "M2StaticMG", "M252", "M2HD_mini_TriPod", "MK19_TriPod", "TOW_TriPod"];
a3e_arr_roadblocks_Veh_CDF = ["UAZ_CDF", "UAZ_AGS30_CDF", "UAZ_MG_CDF", "BMP2_CDF", "BMP2_HQ_CDF", "BRDM2_CDF", "BRDM2_ATGM_CDF", "T72_CDF", "ZSU_CDF", "AGS_CDF", "DSHKM_CDF", "DSHkM_Mini_TriPod_CDF", "SPG9_CDF"];
a3e_arr_roadblocks_Veh_RU = ["UAZ_RU", "UAZ_AGS30_RU", "2S6M_Tunguska", "BMP3", "BTR90", "BTR90_HQ", "T72_RU", "T90", "GAZ_Vodnik", "GAZ_Vodnik_HMG", "AGS_RU", "KORD_high", "KORD", "Metis"];
a3e_arr_roadblocks_Veh_INS = drn_arr_Escape_RoadBlock_MannedVehicleTypes;
a3e_arr_roadblocks_Veh_GUE = drn_arr_Escape_RoadBlock_MannedVehicleTypes_Ind;

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
a3e_additional_weapon_box_1 = "AT_Waffelbox_INS";
a3e_additional_weapon_box_2 = "RHpistammobox";