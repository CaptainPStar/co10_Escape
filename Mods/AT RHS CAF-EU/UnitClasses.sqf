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
a3e_arr_Escape_StartPositionGuardTypes = ["CAF_AG_EEUR_R_AK74", "CAF_AG_EEUR_R_GL", "at_CAF_AG_EEUR_R_AKS74", "at_CAF_AG_EEUR_R_AK74_dirty"];

// Inner fence guard's secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["rhs_weap_pya","rhs_mag_9x19_17"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["rhs_weap_makarov_pmm","rhs_mag_9x18_12_57N181S"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_deagle","RH_7Rnd_50_AE"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_bullb","RH_6Rnd_454_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_cz75","RH_16Rnd_9x19_cz"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_p226","RH_15Rnd_9x19_SIG"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_usp","RH_12Rnd_45cal_usp"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_m9","RH_15Rnd_9x19_M9"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_g18","RH_33Rnd_9x19_g18"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_fn57_g","RH_20Rnd_57x28_FN"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["RH_vz61","RH_20Rnd_32cal_vz61"]];

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_zsu234_aa","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4_msv","rhs_bmd4m_msv","rhs_bmp1_msv","rhs_bmp1p_msv","rhs_bmp1k_msv","rhs_bmp1d_msv","rhs_bmp2_msv","rhs_bmp2d_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72ba_tv","rhs_t80","rhs_t80a","rhs_sprut_msv","rhs_2s3_tv","RHS_BM21_msv_01","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["CAF_AG_eeur_r_Offroad", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_van_01"];
    };
    case 2: {
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_zsu234_aa","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4_msv","rhs_bmd4m_msv","rhs_bmd4ma_msv","rhs_bmp1_msv","rhs_bmp1p_msv","rhs_bmp1k_msv","rhs_bmp1d_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2k_msv","rhs_bmp2d_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u","rhs_sprut_msv","rhs_2s3_tv","RHS_BM21_msv_01","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["CAF_AG_eeur_r_Offroad", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_van_01"];
    };
    default {
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_zsu234_aa","rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd1r","rhs_bmd2","rhs_bmd2k","rhs_bmd2m","rhs_bmd4_msv","rhs_bmd4m_msv","rhs_bmd4ma_msv","rhs_bmp1_msv","rhs_bmp1p_msv","rhs_bmp1k_msv","rhs_bmp1d_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2k_msv","rhs_bmp2d_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u","rhs_sprut_msv","rhs_2s3_tv","RHS_BM21_msv_01","RHS_BM21_msv_01","rhs_9k79","rhs_9k79_B","rhs_9k79_K"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["CAF_AG_eeur_r_Offroad", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_van_01"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes =      ["rhs_msv_officer_armored","rhs_msv_officer","rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_engineer", "rhs_msv_medic","rhs_msv_rifleman","rhs_msv_efreitor","rhs_msv_grenadier","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_marksman","rhs_msv_aa","rhs_msv_LAT","rhs_msv_engineer", "rhs_msv_medic"];
a3e_arr_Escape_InfantryTypes_Ind =  ["at_CAF_AG_EEUR_R_AKS74_PSO1","at_CAF_AG_EEUR_R_Medic","at_CAF_AG_EEUR_R_Engineer","CAF_AG_EEUR_R_AK47","CAF_AG_EEUR_R_AK74","CAF_AG_EEUR_R_RPK74","CAF_AG_EEUR_R_PKM","CAF_AG_EEUR_R_RPG","CAF_AG_EEUR_R_GL","at_CAF_AG_EEUR_R_AKS74","at_CAF_AG_EEUR_R_AK74_dirty","at_CAF_AG_EEUR_R_AKS74U","at_CAF_AG_EEUR_R_AKM","at_CAF_AG_EEUR_R_saiga","at_CAF_AG_EEUR_R_FAL","at_CAF_AG_EEUR_R_G3","at_CAF_AG_EEUR_R_G3SG1","at_CAF_AG_EEUR_R_CZ550"];
a3e_arr_recon_InfantryTypes = ["rhs_msv_recon_sergeant","rhs_msv_recon_engineer","rhs_msv_recon_marksman","rhs_msv_recon_machinegunner","rhs_msv_recon_medic","rhs_msv_recon_at","rhs_msv_recon_rifleman"];

a3e_arr_recon_I_InfantryTypes = ["rhs_msv_recon_sergeant","rhs_msv_recon_engineer","rhs_msv_recon_marksman","rhs_msv_recon_machinegunner","rhs_msv_recon_medic","rhs_msv_recon_at","rhs_msv_recon_rifleman"];


// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = ["rhs_btr60_msv", "RHS_NSV_TriPod_VDV", "O_static_AT_F"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = ["CAF_AG_eeur_r_Offroad", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_Offroad_armed_01", "I_HMG_01_high_f", "I_static_AT_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = ["rhs_gaz66o_msv","rhs_ural_MSV_01","rhs_ural_open_MSV_01","rhs_gaz66_msv"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = ["CAF_AG_eeur_r_van_01"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_ReinforcementTruck_vehicleClasses above.
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [14, 14, 13];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["rhs_uaz_MSV_01","rhs_uaz_open_MSV_01", "rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [6, 6, 8, 8, 8, 8, 8, 8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = ["rhs_bmp1_msv","rhs_bmp2_msv","rhs_brm1k_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80a_msv","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = ["rhs_t72bc_tv", "rhs_t80","rhs_t80a","rhs_t80b","rhs_t80bk","rhs_t80bv","rhs_t80bvk","rhs_t80u"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = ["O_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = ["I_G_Offroad_01_repair_F","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv", "CAF_AG_eeur_r_Offroad", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_van_01"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = ["RHS_NSV_TriPod_VDV", "O_GMG_01_high_F", "RHS_NSV_TriPod_VDV", "O_static_AT_F", "O_static_AA_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["I_G_Offroad_01_repair_F","rhs_uaz_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","rhs_ural_MSV_01","rhs_ural_fuel_MSV_01","rhs_ural_open_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv", "CAF_AG_eeur_r_Offroad", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_Offroad_armed_01", "CAF_AG_eeur_r_van_01"];

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

// Weapons and ammo in the basic weapons box
a3e_arr_AmmoDepotBasicWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_pya", 50, 2, 5, ["rhs_mag_9x19_17"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["SMG_02_F", 10, 1, 2, ["30Rnd_9x21_Mag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_ak74m", 100, 3, 5, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_ak74m_2mag", 50, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_ak74m_gp25", 75, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green", "rhs_VOG25"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hlc_rifle_FAL5061", 10, 1, 2, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_50rnd_762x51_M_FAL", "hlc_20Rnd_762x51_S_fal"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hlc_rifle_g3a3", 10, 1, 2, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hlc_rifle_g3sg1", 10, 1, 2, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3"], 6]];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["RH_tt33", 50, 2, 5, ["RH_8Rnd_762_tt33"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["RH_tec9", 10, 1, 2, ["RH_32Rnd_9x19_tec"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_makarov_pmm", 50, 2, 5, ["rhs_mag_9x18_12_57N181S"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["RH_vz61", 50, 2, 5, ["RH_20Rnd_32cal_vz61"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_m14ebrri_leu", 10, 1, 2, ["rhsusf_20Rnd_762x51_m118_special_Mag","rhsusf_20Rnd_762x51_m993_Mag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_m4", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_m4a1_m320", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_m4_grip", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_m4a1", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hlc_rifle_SAMR", 10, 1, 2, ["hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_EPR"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["rhs_weap_m16a4", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["g36a", 10, 1, 2, ["G36_mag"], 6]];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["rhs_weap_svdp_wd", 50, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["rhs_weap_svds", 50, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["srifle_GM6_F", 10, 1, 2, ["5Rnd_127x108_Mag"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["rhs_weap_pkp", 50, 1, 4, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], 6]];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["Trixie_CZ550", 20, 1, 2, ["Trixie_CZ550_Mag"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["rhs_weap_m249_pip", 10, 1, 2, ["rhsusf_100Rnd_556x45_soft_pouch"], 6]];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["rhs_weap_rpg7", 50, 1, 2, ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], 6]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["rhs_weap_rpg26", 50, 1, 3, ["rhs_rpg26_mag"], 3]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["rhs_weap_rshg2", 50, 1, 3, ["rhs_rshg2_mag"], 3]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["rhs_weap_igla", 50, 1, 2, ["rhs_mag_9k38_rocket"], 3]];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_NLAW_F", 10, 1, 2, ["NLAW_F"], 2]];
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
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 10, 1, 1, ["rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 5]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["rhs_VOG25"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["rhs_mag_zarya2"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25]];
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
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["lerca_1200_black", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["Binocular", 50, 2, 3, [], 0]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemCompass", 50, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemGPS", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemMap", 50, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemRadio", 50, 1, 10]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemWatch", 50, 1, 10]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["acc_flashlight", 50, 1, 5]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["acc_pointer_IR", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["hlc_muzzle_snds_fal", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["hlc_muzzle_snds_g3", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_1p63", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_1p78", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["RH_tecsd", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Aco", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_pgo7v", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_pkas", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_ekp1", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_ekp1b", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_ekp1c", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_ekp1d", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_pso1m2", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_1p29", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhsusf_acc_EOTECH", 1, 10, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["hlc_optic_suit", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["HLC_Optic_ZFSG1", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["hlc_optic_accupoint_g3", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhsusf_acc_HAMR", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhsusf_acc_LEUPOLDMK4", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhsusf_acc_ELCAN", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhsusf_acc_ACOG", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhsusf_acc_ACOG2", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["SMA_Silencer_556", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["SMA_AIMPOINT", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["iansky_deltapoint", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["iansky_t1", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["iansky_rx01", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["iansky_rds", 10, 1, 3]];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_1pn93_1", 10, 1, 3]];
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_acc_1pn93_2", 10, 1, 3]];
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["hlc_optic_PVS4FAL", 10, 1, 3]];
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Nightstalker", 10, 1, 3]];
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
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhsusf_acc_harris_bipod", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["rhs_bipod", 30, 1, 2]];
// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.


a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["RH_Deagleg", "RH_7Rnd_50_AE", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["AG_MP9_sidearm", "30Rnd_45ACP_Mag_SMG_01", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["sgun_AA12_F", "20Rnd_B_AA12_Pellets", 11]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["sgun_AA12_F", "20Rnd_B_AA12_HE", 9]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["RHARD_MK18AFG_F", "30Rnd_556x45_Stanag", 9]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hlc_rifle_RU5562", "30Rnd_556x45_Stanag", 8]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hlc_rifle_Bushmaster300", "29rnd_300BLK_STANAG", 6]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hlc_smg_mp5k_PDW", "hlc_30Rnd_9x19_GD_MP5", 7]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hlc_smg_mp510", "hlc_30Rnd_10mm_JHP_MP5", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hlc_rifle_aks74u", "rhs_30Rnd_545x39_7N10_AK", 8]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hlc_rifle_saiga12k", "hlc_10rnd_12g_buck_S12", 10]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Trixie_M24_Clean", "Trixie_5x762_Mag", 12]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["rhs_weap_rshg2","rhs_rshg2_mag", 1]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["MineDetector", objNull, 0]];
//a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Medikit", objNull, 0]];
//a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Toolkit", objNull, 0]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Binocular", objNull, 0]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "SatchelCharge_Remote_Mag", 2]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "HandGrenade", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "SmokeShell", 5]];


// Here is a list of scopes:
a3e_arr_Scopes = ["optic_Aco","optic_ACO_grn","optic_Arco","optic_Hamr","optic_MRCO","optic_Holosight","rhs_acc_pkas","rhs_acc_pso1m2","rhs_acc_1p29","iansky_deltapoint","iansky_t1","iansky_rx01","iansky_rds","rhs_acc_ekp1","rhs_acc_ekp1b","rhs_acc_ekp1c","rhs_acc_ekp1d","rhs_acc_1p63","rhs_acc_1p78"];
a3e_arr_Scopes_SMG = ["optic_Aco_smg","optic_Holosight_smg","iansky_deltapoint"];
a3e_arr_Scopes_Sniper = ["rhs_acc_pso1m2","rhs_acc_1p78","HLC_Optic_ZFSG1","hlc_optic_accupoint_g3","hlc_optic_suit"];
a3e_arr_NightScopes = ["optic_NVS","rhs_acc_1pn93_1","hlc_optic_PVS4FAL"];
a3e_arr_TWSScopes = ["optic_Nightstalker","optic_tws","optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = ["rhs_bipod","rhsusf_acc_harris_bipod","bipod_01_F_snd","bipod_01_F_blk","bipod_01_F_mtp","bipod_02_F_blk","bipod_02_F_tan","bipod_02_F_hex","bipod_03_F_blk","bipod_03_F_oli"];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = ["rhs_uh60m","rhs_ch_47f"];
a3e_arr_extraction_chopper_escort = ["rhs_ah64d_wd"];

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
a3e_arr_searchChopper = ["RHS_Mi8AMTSh_vvsc","RHS_Mi8MTV3_FAB_vvs","RHS_Mi8AMTSh_vvs","RHS_Mi8mt_vdv","RHS_Mi8MTV3_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_vvs","RHS_Mi8MTV3_vvs","RHS_Mi8mt_vvsc","RHS_Mi8MTV3_vvsc"];
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
a3e_additional_weapon_box_1 = "AT_Waffelbox_INS";
a3e_additional_weapon_box_2 = "RHpistammobox";


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
a3e_arr_CrashSiteWrecks = ["C130J_wreck_EP1","Land_UWreck_MV22_F","Land_Wreck_Plane_Transport_01_F","Land_Wreck_Heli_Attack_01_F"];
a3e_arr_CrashSiteCrew = ["rhsusf_airforce_pilot"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["SMA_AUG_A3_F", 50, 2, 5, ["SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1_Tracer"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["SMA_SKS_F", 10, 1, 2, ["SMA_30Rnd_762x39_SKS","SMA_30Rnd_762x39_SKS_Red"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["hlc_lmg_M60E4", 100, 3, 5, ["hlc_100Rnd_762x51_M_M60E4"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["STI_M32", 50, 2, 4, ["STI_6Rnd_HE_Grenade_shell"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["SMA_HK417_16in_afg", 75, 2, 4, ["20Rnd_762x51_Mag", "SMA_20Rnd_762x51mm_M80A1_EPR_Tracer"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["Trixie_M107_Green", 10, 1, 2, ["Trixie_10x127_Mag", "Trixie_10x127_HE_Mag", "Trixie_10x127_HEIAP_Mag"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["hlc_rifle_vendimus", 10, 1, 2, ["29rnd_300BLK_STANAG","29rnd_300BLK_STANAG_T"], 8]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["hlc_rifle_g3ka4", 10, 1, 2, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3"], 6]];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["RKSL_optic_PMII_312_sunshade", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["FHQ_optic_HWS_G33", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["iansky_deltapoint", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["iansky_t1", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["hlc_muzzle_snds_g3", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["SMA_ELCAN_SPECTER", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["rhsusf_acc_harris_bipod", 10, 1, 3]];