/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;
A3E_VAR_Side_Opfor = east;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_red_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_green_CO.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"CAF_AG_EEUR_R_AK74"
	,"CAF_AG_EEUR_R_GL"
	,"at_CAF_AG_EEUR_R_AKS74"
	,"at_CAF_AG_EEUR_R_AK74_dirty"
	,"at_CAF_AG_EEUR_R_AKS74U"
	,"at_CAF_AG_EEUR_R_AKM"
	,"at_CAF_AG_EEUR_R_saiga"
	,"at_CAF_AG_EEUR_R_M1903"
	,"at_CAF_AG_EEUR_R_STGW57"
	,"at_CAF_AG_EEUR_R_STGW57C"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pya","rhs_mag_9x19_17"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_makarov_pmm","rhs_mag_9x18_12_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_deagle","RH_7Rnd_50_AE"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_bullb","RH_6Rnd_454_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_cz75","RH_16Rnd_9x19_cz"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_p226","RH_15Rnd_9x19_SIG"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_usp","RH_12Rnd_45cal_usp"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_g18","RH_33Rnd_9x19_g18"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_fn57_g","RH_20Rnd_57x28_FN"];
a3e_arr_PrisonBackpackWeapons pushback ["RH_vz61","RH_20Rnd_32cal_vz61"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_JHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_FMJ"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_box_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_kitty_Civ"
	,"beetle_red"
	,"beetle_white"
	,"SIG_SuperBeeB"
	,"SIG_SuperBeeM"
	,"SIG_Magnums"
	,"SIG_Hcode"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_zsu234_aa"
		,"rhs_zsu234_aa"
		,"rhs_bmd1"
		,"rhs_bmd1p"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmp1_msv"
		,"rhs_bmp1k_msv"
		,"rhs_bmp2_msv"
		,"rhs_bmp2k_msv"
		,"rhs_bmp3_msv"
		,"rhs_bmp3m_msv"
		,"rhs_btr60_msv"
		,"rhs_btr70_msv"
		,"rhs_btr80_msv"
		,"rhs_t72ba_tv"
		,"rhs_t72bc_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t90_tv"
		,"rhs_sprut_vdv"
		,"rhs_2s3_tv"
		,"RHS_BM21_msv_01"
		,"rhs_9k79"
		,"rhs_9k79_B"
		,"rhs_9k79_K"
		,"rhs_pts_vmf"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"CAF_AG_eeur_r_Offroad"
		,"CAF_AG_eeur_r_Offroad"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_van_01"
		,"CAF_AG_eeur_r_van_01"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_zsu234_aa"
		,"rhs_zsu234_aa"
		,"rhs_bmd1"
		,"rhs_bmd1k"
		,"rhs_bmd1p"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmd4_vdv"
		,"rhs_bmp1_msv"
		,"rhs_bmp1k_msv"
		,"rhs_bmp1d_msv"
		,"rhs_bmp2_msv"
		,"rhs_bmp2k_msv"
		,"rhs_bmp2d_msv"
		,"rhs_bmp3_msv"
		,"rhs_bmp3_late_msv"
		,"rhs_bmp3m_msv"
		,"rhs_btr60_msv"
		,"rhs_btr70_msv"
		,"rhs_btr80_msv"
		,"rhs_btr80a_msv"
		,"rhs_t72ba_tv"
		,"rhs_t72bc_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80b"
		,"rhs_t80u"
		,"rhs_t90_tv"
		,"rhs_t90a_tv"
		,"rhs_sprut_vdv"
		,"rhs_2s3_tv"
		,"RHS_BM21_msv_01"
		,"rhs_9k79"
		,"rhs_9k79_B"
		,"rhs_9k79_K"
		,"rhs_pts_vmf"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"CAF_AG_eeur_r_Offroad"
		,"CAF_AG_eeur_r_Offroad"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_van_01"
		,"CAF_AG_eeur_r_van_01"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_uaz_open_MSV_01"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_3camo_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_tigr_ffv_msv"
		,"rhs_zsu234_aa"
		,"rhs_zsu234_aa"
		,"rhs_bmd1"
		,"rhs_bmd1k"
		,"rhs_bmd1p"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmd4_vdv"
		,"rhs_bmp1_msv"
		,"rhs_bmp1k_msv"
		,"rhs_bmp1d_msv"
		,"rhs_bmp2_msv"
		,"rhs_bmp2k_msv"
		,"rhs_bmp2d_msv"
		,"rhs_bmp3_msv"
		,"rhs_bmp3_late_msv"
		,"rhs_bmp3m_msv"
		,"rhs_bmp3mera_msv"
		,"rhs_btr60_msv"
		,"rhs_btr70_msv"
		,"rhs_btr80_msv"
		,"rhs_btr80a_msv"
		,"rhs_t72ba_tv"
		,"rhs_t72bc_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80b"
		,"rhs_t80u"
		,"rhs_t90_tv"
		,"rhs_t90a_tv"
		,"rhs_sprut_vdv"
		,"rhs_2s3_tv"
		,"RHS_BM21_msv_01"
		,"rhs_9k79"
		,"rhs_9k79_B"
		,"rhs_9k79_K"
		,"rhs_pts_vmf"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"CAF_AG_eeur_r_Offroad"
		,"CAF_AG_eeur_r_Offroad"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_Offroad_armed_01"
		,"CAF_AG_eeur_r_van_01"
		,"CAF_AG_eeur_r_van_01"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"rhs_msv_officer_armored"
	,"rhs_msv_officer"
	,"rhs_msv_sergeant"
	,"rhs_msv_junior_sergeant"
	,"rhs_msv_engineer"
	,"rhs_msv_engineer"
	,"rhs_msv_medic"
	,"rhs_msv_medic"
	,"rhs_msv_rifleman"
	,"rhs_msv_efreitor"
	,"rhs_msv_grenadier"
	,"rhs_msv_grenadier_rpg"
	,"rhs_msv_machinegunner"
	,"rhs_msv_machinegunner_assistant"
	,"rhs_msv_at"
	,"rhs_msv_strelok_rpg_assist"
	,"rhs_msv_marksman"
	,"rhs_msv_aa"
	,"rhs_msv_LAT"
	,"rhs_msv_RShG2"
	,"rhs_msv_arifleman"];
a3e_arr_Escape_InfantryTypes_Ind =  [
	"at_CAF_AG_EEUR_R_AKS74_PSO1"
	,"at_CAF_AG_EEUR_R_Medic"
	,"at_CAF_AG_EEUR_R_Engineer"
	,"CAF_AG_EEUR_R_AK47"
	,"CAF_AG_EEUR_R_AK74"
	,"CAF_AG_EEUR_R_RPK74"
	,"CAF_AG_EEUR_R_PKM"
	,"CAF_AG_EEUR_R_RPG"
	,"CAF_AG_EEUR_R_GL"
	,"at_CAF_AG_EEUR_R_AKS74"
	,"at_CAF_AG_EEUR_R_AK74_dirty"
	,"at_CAF_AG_EEUR_R_AKS74U"
	,"at_CAF_AG_EEUR_R_AKM"
	,"at_CAF_AG_EEUR_R_saiga"
	,"at_CAF_AG_EEUR_R_FAL"
	,"at_CAF_AG_EEUR_R_G3"
	,"at_CAF_AG_EEUR_R_G3SG1"
	,"at_CAF_AG_EEUR_R_CZ550"
	,"at_CAF_AG_EEUR_R_M1903"
	,"at_CAF_AG_EEUR_R_M1903_Sniper"
	,"at_CAF_AG_EEUR_R_STGW57"
	,"at_CAF_AG_EEUR_R_STGW57C"
	,"at_CAF_AG_EEUR_R_G36E1"];
a3e_arr_recon_InfantryTypes = [
	"rhs_vdv_recon_rifleman"
	,"rhs_vdv_recon_rifleman_l"
	,"rhs_vdv_recon_rifleman_akms"
	,"rhs_vdv_recon_rifleman_ak103"
	,"rhs_vdv_recon_rifleman_lat"
	,"rhs_vdv_recon_grenadier"
	,"rhs_vdv_recon_rifleman_asval"
	,"rhs_vdv_recon_arifleman"
	,"rhs_vdv_recon_machinegunner_assistant"
	,"rhs_vdv_recon_efreitor"
	,"rhs_vdv_recon_sergeant"
	,"rhs_vdv_recon_officer_armored"
	,"rhs_vdv_recon_officer"
	,"rhs_vdv_recon_marksman"
	,"rhs_vdv_recon_marksman_asval"
	,"rhs_vdv_recon_medic"
	,"rhs_vdv_recon_rifleman_scout"
	,"rhs_vdv_recon_rifleman_scout_akm"
	,"rhs_vdv_recon_grenadier_scout"
	,"rhs_vdv_recon_arifleman_scout"];
a3e_arr_recon_I_InfantryTypes = [
	"rhs_vdv_recon_rifleman"
	,"rhs_vdv_recon_rifleman_l"
	,"rhs_vdv_recon_rifleman_akms"
	,"rhs_vdv_recon_rifleman_ak103"
	,"rhs_vdv_recon_rifleman_lat"
	,"rhs_vdv_recon_grenadier"
	,"rhs_vdv_recon_rifleman_asval"
	,"rhs_vdv_recon_arifleman"
	,"rhs_vdv_recon_machinegunner_assistant"
	,"rhs_vdv_recon_efreitor"
	,"rhs_vdv_recon_sergeant"
	,"rhs_vdv_recon_officer_armored"
	,"rhs_vdv_recon_officer"
	,"rhs_vdv_recon_marksman"
	,"rhs_vdv_recon_marksman_asval"
	,"rhs_vdv_recon_medic"
	,"rhs_vdv_recon_rifleman_scout"
	,"rhs_vdv_recon_rifleman_scout_akm"
	,"rhs_vdv_recon_grenadier_scout"
	,"rhs_vdv_recon_arifleman_scout"];


// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"rhs_btr60_msv"
	,"RHS_NSV_TriPod_VDV"
	,"rhs_KORD_MSV"
	,"RHS_AGS30_TriPod_MSV"
	,"rhs_Metis_9k115_2_msv"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"CAF_AG_eeur_r_Offroad"
	,"CAF_AG_eeur_r_Offroad_armed_01"
	,"CAF_AG_eeur_r_Offroad_armed_01"
	,"rhs_KORD_high_INS"
	,"rhs_Metis_9k115_2_ins"
	,"rhs_SPG9_INS"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"rhs_gaz66o_msv"
	,"rhs_ural_MSV_01"
	,"rhs_ural_open_MSV_01"
	,"rhs_gaz66_msv"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CAF_AG_eeur_r_van_01"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"rhs_uaz_MSV_01"
	,"rhs_uaz_open_MSV_01"
	,"rhs_tigr_ffv_3camo_msv"
	,"rhs_tigr_ffv_msv"
	,"rhs_btr60_msv"
	,"rhs_btr70_msv"
	,"rhs_btr80_msv"
	,"rhs_btr80a_msv"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"rhs_bmp1_msv"
	,"rhs_bmp2_msv"
	,"rhs_brm1k_msv"
	,"rhs_btr60_msv"
	,"rhs_btr70_msv"
	,"rhs_btr80a_msv"
	,"rhs_gaz66_msv"
	,"rhs_gaz66o_msv"
	,"rhs_gaz66_r142_msv"
	,"rhs_gaz66_ap2_msv"
	,"rhs_gaz66_repair_msv"
	,"rhs_ural_MSV_01"
	,"rhs_ural_fuel_MSV_01"
	,"rhs_ural_open_MSV_01"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"rhs_t72bc_tv"
	,"rhs_t80"
	,"rhs_t80a"
	,"rhs_t80b"
	,"rhs_t80bk"
	,"rhs_t80bv"
	,"rhs_t80bvk"
	,"rhs_t80u"
	,"rhs_t90_tv"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"rhs_KORD_high_MSV"
	,"rhs_DSHKM_ins"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"I_G_Offroad_01_repair_F"
	,"rhs_uaz_MSV_01"
	,"rhs_uaz_open_MSV_01"
	,"rhs_gaz66_msv"
	,"rhs_gaz66o_msv"
	,"rhs_gaz66_r142_msv"
	,"rhs_gaz66_ap2_msv"
	,"rhs_gaz66_repair_msv"
	,"rhs_ural_MSV_01"
	,"rhs_ural_fuel_MSV_01"
	,"rhs_ural_open_MSV_01"
	,"rhs_tigr_ffv_3camo_msv"
	,"rhs_tigr_ffv_msv"
	,"CAF_AG_eeur_r_Offroad"
	,"CAF_AG_eeur_r_Offroad_armed_01"
	,"CAF_AG_eeur_r_Offroad_armed_01"
	,"CAF_AG_eeur_r_van_01"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_box_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"beetle_red"
	,"beetle_white"
	,"SIG_SuperBeeB"
	,"SIG_SuperBeeM"
	,"SIG_Magnums"
	,"SIG_Hcode"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"RHS_NSV_TriPod_VDV"
	,"RHS_AGS30_TriPod_MSV"
	,"rhs_KORD_MSV"
	,"rhs_KORD_high_MSV"
	,"rhs_Metis_9k115_2_msv"
	,"rhs_Igla_AA_pod_msv"
	,"rhs_SPG9_INS"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"I_G_Offroad_01_repair_F"
	,"rhs_uaz_MSV_01"
	,"rhs_uaz_open_MSV_01"
	,"rhs_gaz66_msv"
	,"rhs_gaz66o_msv"
	,"rhs_gaz66_r142_msv"
	,"rhs_gaz66_ap2_msv"
	,"rhs_gaz66_repair_msv"
	,"rhs_ural_MSV_01"
	,"rhs_ural_fuel_MSV_01"
	,"rhs_ural_open_MSV_01"
	,"rhs_tigr_ffv_3camo_msv"
	,"rhs_tigr_ffv_msv"
	,"CAF_AG_eeur_r_Offroad"
	,"CAF_AG_eeur_r_Offroad_armed_01"
	,"CAF_AG_eeur_r_Offroad_armed_01"
	,"CAF_AG_eeur_r_van_01"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"RHS_Mi24V_vvsc"
	,"RHS_Mi24V_AT_vvsc"
	,"RHS_Mi24P_CAS_vvsc"
	,"RHS_Mi24P_AT_vvsc"
	,"RHS_Mi24V_UPK23_vvsc"
	,"RHS_Ka52_vvs"
	,"RHS_Ka52_vvsc"
	,"RHS_Mi8AMTSh_vvsc"
	,"RHS_Mi8AMTSh_UPK23_vvsc"
	,"RHS_Mi8MTV3_vvsc"
	,"RHS_Mi8MTV3_UPK23_vvsc"];
a3e_arr_O_transport_heli = [
	"rhs_ka60_grey"
	,"rhs_ka60_c"
	,"RHS_Mi8amt_chdkz"
	,"RHS_Mi8AMT_vvsc"
	,"RHS_Mi8mt_Cargo_vv"];
a3e_arr_O_pilots = [
	"rhs_pilot"
	,"rhs_pilot_transport_heli"];
a3e_arr_I_transport_heli = [
	"RHS_Mi8amt_chdkz"];
a3e_arr_I_pilots = [
	"rhs_g_Crew_F"];

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
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_pya", 50, 2, 5, ["rhs_mag_9x19_17"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_02_F", 10, 1, 2, ["30Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m", 100, 3, 5, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_2mag", 50, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_gp25", 75, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green", "rhs_VOG25"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["hlc_rifle_FAL5061", 10, 1, 2, ["hlc_20Rnd_762x51_B_fal", "hlc_20Rnd_762x51_t_fal", "hlc_50rnd_762x51_M_FAL", "hlc_20Rnd_762x51_S_fal"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hlc_rifle_g3a3", 10, 1, 2, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hlc_rifle_g3sg1", 10, 1, 2, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_bizon", 75, 1, 2, ["CUP_64Rnd_9x19_Bizon_M", "CUP_64Rnd_Red_Tracer_9x19_Bizon_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_bizon_snds", 50, 1, 2,["CUP_64Rnd_9x19_Bizon_M", "CUP_64Rnd_Red_Tracer_9x19_Bizon_M"], 6];

// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["RH_tt33", 50, 2, 5, ["RH_8Rnd_762_tt33"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["RH_tec9", 10, 1, 2, ["RH_32Rnd_9x19_tec"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_makarov_pmm", 50, 2, 5, ["rhs_mag_9x18_12_57N181S"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["RH_vz61", 50, 2, 5, ["RH_20Rnd_32cal_vz61"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m14ebrri_leu", 10, 1, 2, ["rhsusf_20Rnd_762x51_m118_special_Mag","rhsusf_20Rnd_762x51_m993_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_m4a1_m320", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4_grip", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4a1", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hlc_rifle_SAMR", 10, 1, 2, ["hlc_30rnd_556x45_SOST", "hlc_30rnd_556x45_EPR"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m16a4", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hlc_rifle_G36E1", 10, 1, 2, ["hlc_30rnd_556x45_EPR_G36"], 6];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_svdp_wd", 50, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_svds", 50, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_asval", 50, 2, 4, ["rhs_20rnd_9x39mm_SP5"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_GM6_F", 10, 1, 2, ["5Rnd_127x108_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_pkp", 50, 1, 4, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], 6];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_CZ550", 20, 1, 2, ["CUP_5x_22_LR_17_HMR_M"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m249_pip", 10, 1, 2, ["rhsusf_100Rnd_556x45_soft_pouch"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_tr8", 50, 1, 2, ["HandGrenade"], 4];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg7", 50, 1, 2, ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg26", 50, 1, 3, ["rhs_rpg26_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rshg2", 50, 1, 3, ["rhs_rshg2_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_igla", 50, 1, 2, ["rhs_mag_9k38_rocket"], 3];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_NLAW_F", 10, 1, 2, ["NLAW_F"], 2];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_VOG25"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_mag_zarya2"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["O_UAV_01_backpack_F"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["lerca_1200_black", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Leupold_Mk4", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_2dpZenit", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["hlc_muzzle_snds_fal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["hlc_muzzle_snds_g3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p63", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p78", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["RH_tecsd", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Aco", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pgo7v", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pkas", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1b", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1c", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1d", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pso1m2", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p29", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_EOTECH", 1, 10, 3];
a3e_arr_AmmoDepotItems pushback ["hlc_optic_suit", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["HLC_Optic_ZFSG1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["hlc_optic_accupoint_g3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_HAMR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ELCAN", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["iansky_deltapoint", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["iansky_t1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["iansky_rx01", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["iansky_rds", 10, 1, 3];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_2", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["hlc_optic_PVS4FAL", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Yorris", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_LRPS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_AMS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_mtp", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_oli", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_harris_bipod", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhs_bipod", 30, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["RH_Deagleg", "RH_7Rnd_50_AE", 5];
a3e_arr_CivilianCarWeapons pushback ["AG_MP9_sidearm", "30Rnd_45ACP_Mag_SMG_01", 5];
a3e_arr_CivilianCarWeapons pushback ["sgun_AA12_F", "20Rnd_B_AA12_Pellets", 11];
a3e_arr_CivilianCarWeapons pushback ["sgun_AA12_F", "20Rnd_B_AA12_HE", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_mk18_KAC_bk", "30Rnd_556x45_Stanag", 9];
a3e_arr_CivilianCarWeapons pushback ["hlc_rifle_RU5562", "30Rnd_556x45_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["hlc_rifle_Bushmaster300", "29rnd_300BLK_STANAG", 6];
a3e_arr_CivilianCarWeapons pushback ["hlc_smg_mp5k_PDW", "hlc_30Rnd_9x19_GD_MP5", 7];
a3e_arr_CivilianCarWeapons pushback ["hlc_smg_mp510", "hlc_30Rnd_10mm_JHP_MP5", 5];
a3e_arr_CivilianCarWeapons pushback ["hlc_rifle_aks74u", "rhs_30Rnd_545x39_7N10_AK", 8];
a3e_arr_CivilianCarWeapons pushback ["hlc_rifle_saiga12k", "hlc_10rnd_12g_buck_S12", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m24sws", "rhsusf_5Rnd_762x51_m118_special_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_rshg2","rhs_rshg2_mag", 1];
a3e_arr_CivilianCarWeapons pushback ["CUP_smg_bizon","CUP_64Rnd_9x19_Bizon_M", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_smg_bizon_snds","CUP_64Rnd_9x19_Bizon_M", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_M134_F","200Rnd_762x51_Belt", 6];
a3e_arr_CivilianCarWeapons pushback ["Sawed_Off_Shotgun","2Rnd_Sawed_Off_Shotgun_Pellets", 8];
a3e_arr_CivilianCarWeapons pushback ["HLC_Rifle_G36KSKAG36","hlc_30rnd_556x45_EPR_G36", 8];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes:
a3e_arr_Scopes = [
	"optic_Aco"
	,"optic_ACO_grn"
	,"optic_Arco"
	,"optic_Hamr"
	,"optic_MRCO"
	,"optic_Holosight"
	,"rhs_acc_pkas"
	,"rhs_acc_pso1m2"
	,"rhs_acc_1p29"
	,"iansky_deltapoint"
	,"iansky_t1"
	,"iansky_rx01"
	,"iansky_rds"
	,"rhs_acc_ekp1"
	,"rhs_acc_ekp1b"
	,"rhs_acc_ekp1c"
	,"rhs_acc_ekp1d"
	,"rhs_acc_1p63"
	,"rhs_acc_1p78"];
a3e_arr_Scopes_SMG = [
	"optic_Aco_smg"
	,"optic_Holosight_smg"
	,"iansky_deltapoint"];
a3e_arr_Scopes_Sniper = [
	"rhs_acc_pso1m2"
	,"rhs_acc_1p78"
	,"HLC_Optic_ZFSG1"
	,"hlc_optic_accupoint_g3"
	,"hlc_optic_suit"];
a3e_arr_NightScopes = [
	"optic_NVS"
	,"rhs_acc_1pn93_1"
	,"hlc_optic_PVS4FAL"];
a3e_arr_TWSScopes = [
	"optic_Nightstalker"
	,"optic_tws","optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"rhs_bipod"
	,"rhsusf_acc_harris_bipod"
	,"bipod_01_F_snd"
	,"bipod_01_F_blk"
	,"bipod_01_F_mtp"
	,"bipod_02_F_blk"
	,"bipod_02_F_tan"
	,"bipod_02_F_hex"
	,"bipod_03_F_blk"
	,"bipod_03_F_oli"];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"rhs_uh60m"
	,"rhs_ch_47f"
	,"rhsusf_CH53E_USMC"];
a3e_arr_extraction_chopper_escort = [
	"rhs_ah64d_wd"
	,"RHS_AH1Z"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"rhs_pchela1t_vvs"
	,"RHS_Su25SM_vvs"
	,"RHS_T50_vvs_generic"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"RHS_Mi8AMT_vvsc"
	,"RHS_Mi8mt_Cargo_vvsc"];
a3e_arr_searchChopperHard = [
	"RHS_Mi8AMTSh_vvsc"
	,"RHS_Mi8AMTSh_FAB_vvsc"
	,"RHS_Mi8AMTSh_UPK23_vvsc"
	,"RHS_Mi8mt_vvsc"
	,"RHS_Mi8MTV3_vvsc"
	,"RHS_Mi8mtv3_Cargo_vvsc"
	,"RHS_Mi8MTV3_FAB_vvsc"
	,"RHS_Mi8MTV3_UPK23_vvsc"];
a3e_arr_searchChopper_pilot = [
	"rhs_pilot"];
a3e_arr_searchChopper_crew = [
	"rhs_pilot_transport_heli"];

if(A3E_Param_SearchChopper==0) then {
	a3e_arr_searchChopper = a3e_arr_searchChopperEasy + a3e_arr_searchChopperHard;
};
if(A3E_Param_SearchChopper==1) then {
	a3e_arr_searchChopper = a3e_arr_searchChopperEasy;
};
if(A3E_Param_SearchChopper==2) then {
	a3e_arr_searchChopper = a3e_arr_searchChopperHard;
};

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
a3e_arr_AquaticPatrols = [
	"O_Boat_Armed_01_hmg_F"
	,"feint_shark"
	,"feint_shark2"];

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
a3e_arr_MortarSite = [
	"rhs_2b14_82mm_ins"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"O_Plane_CAS_02_Cluster_F"
	,"O_Plane_Fighter_02_Cluster_F"
	,"I_Plane_Fighter_03_Cluster_F"
	,"I_Plane_Fighter_04_Cluster_F"];

	//"RHS_Su25SM_vvs"
	//,"RHS_T50_vvs_generic"];

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
a3e_arr_CrashSiteWrecks = [
	"C130J_wreck_EP1"
	,"Land_UWreck_MV22_F"
	,"Land_Wreck_Plane_Transport_01_F"
	,"Land_Wreck_Heli_Attack_01_F"];
a3e_arr_CrashSiteCrew = [
	"rhsusf_airforce_pilot"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_HMMWV_F"
	,"Land_Wreck_Hunter_F"
	,"Land_Wreck_Slammer_F"
	,"M113Wreck"];
a3e_arr_CrashSiteCrewCar = [
	"rhsusf_usmc_marpat_wd_driver"
	,"rhsusf_usmc_marpat_wd_crewman"
	,"rhsusf_usmc_marpat_wd_combatcrewman"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["hlc_rifle_auga3", 50, 2, 5, ["hlc_30Rnd_556x45_B_AUG"], 12];
a3e_arr_CrashSiteWeapons pushback ["hlc_rifle_ACR_Carb_black", 10, 1, 2, ["30Rnd_556x45_Stanag"], 10];
a3e_arr_CrashSiteWeapons pushback ["hlc_lmg_M60E4", 100, 3, 5, ["hlc_100Rnd_762x51_M_M60E4"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m32", 50, 2, 4, ["rhsusf_mag_6Rnd_M441_HE"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_hk416d10_LMT_wd", 75, 2, 4, ["30Rnd_556x45_Stanag"], 10];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_M107_d", 10, 1, 2, ["rhsusf_mag_10Rnd_STD_50BMG_M33", "rhsusf_mag_10Rnd_STD_50BMG_mk211", "rhsusf_mag_10Rnd_STD_50BMG_M33"], 6];
a3e_arr_CrashSiteWeapons pushback ["hlc_rifle_vendimus", 10, 1, 2, ["29rnd_300BLK_STANAG","29rnd_300BLK_STANAG_T"], 8];
a3e_arr_CrashSiteWeapons pushback ["hlc_rifle_g3ka4", 10, 1, 2, ["hlc_20rnd_762x51_T_G3", "hlc_20rnd_762x51_b_G3"], 6];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["RKSL_optic_PMII_312_sunshade", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["FHQ_optic_HWS_G33", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["iansky_deltapoint", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["iansky_t1", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["hlc_muzzle_snds_g3", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["iansky_specterdrkf", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_harris_bipod", 10, 1, 3];