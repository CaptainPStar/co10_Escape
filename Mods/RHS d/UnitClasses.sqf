/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;//Player side, RHS USMC-D
A3E_VAR_Side_Opfor = east;//RHS AFRF, VDV desert
A3E_VAR_Side_Ind = resistance;//RHS SAF, UN Peacekeepers desert

A3E_VAR_Flag_Opfor = "\rhsafrf\addons\rhs_main\data\Flag_rus_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_uno_CO.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"rhssaf_un_m10_digital_desert_rifleman_m21"
	,"rhssaf_un_m10_digital_desert_rifleman_m70"
	,"rhssaf_un_m10_digital_desert_gl"
	,"rhssaf_un_m10_digital_desert_crew"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"rhsusf_falconii_coy"
	,"rhsusf_falconii_coy"
	,"rhsusf_assault_eagleaiii_coy"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_JHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_glock17g4","rhsusf_mag_17Rnd_9x19_JHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_glock17g4","rhsusf_mag_17Rnd_9x19_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_MP7A2","rhsusf_mag_40Rnd_46x30_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_M320","rhs_mag_m576"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_M590_5RD","rhsusf_5Rnd_00Buck"];

/* russian pistols
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pb_6p9","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pb_6p9","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pya","rhs_mag_9x19_17"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pya","rhs_mag_9x19_17"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pp2000_folded","rhs_mag_9x19mm_7n21_20"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pp2000_folded","rhs_mag_9x19mm_7n31_44"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_savz61_folded","rhsgref_20rnd_765x17_vz61"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_savz61_folded","rhsgref_10rnd_765x17_vz61"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_tt33","rhs_mag_762x25_8"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_tt33","rhs_mag_762x25_8"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_6p53","rhs_18rnd_9x21mm_7N28"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_6p53","rhs_18rnd_9x21mm_7N29"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_type94_new","rhs_mag_6x8mm_mhp"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_Izh18","rhsgref_1Rnd_00Buck"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_cz99","rhssaf_mag_15Rnd_9x19_FMJ"];
*/

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
	,"C_Truck_02_covered_F"
	,"C_Offroad_01_repair_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"
	,"C_Truck_02_transport_F"];
	if(A3E_Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_service_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_transport_F";
	};

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_gaz66_vdv"
		,"rhs_gaz66o_vdv"
		,"rhs_gaz66_r142_vdv"
		,"rhs_gaz66_vdv"
		,"rhs_gaz66o_vdv"
		,"rhs_gaz66_r142_vdv"
		,"rhs_gaz66_repair_vdv"
		,"rhs_gaz66_repair_vdv"
		,"rhs_gaz66_ap2_vdv"
		,"rhs_gaz66_ap2_vdv"
		,"rhs_gaz66_ammo_vdv"
		,"rhs_gaz66_ammo_vdv"
		,"RHS_Ural_VDV_01"
		,"RHS_Ural_Open_VDV_01"
		,"RHS_Ural_Fuel_VDV_01"
		,"RHS_Ural_Repair_VDV_01"
		,"RHS_Ural_Zu23_VDV_01"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_zil131_vdv"
		,"rhs_zil131_open_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhsgref_BRDM2_vdv"
		,"rhsgref_BRDM2_ATGM_vdv"
		,"rhsgref_BRDM2UM_vdv"
		,"rhsgref_BRDM2_HQ_vdv"
		,"RHS_ZU23_VDV"
		,"RHS_ZU23_VDV"
		,"rhs_bmd1"
		,"rhs_bmd1k"
		,"rhs_bmd1p"
		,"rhs_bmd1r"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmd4_vdv"
		,"rhs_bmd4ma_vdv"
		,"rhs_bmp1_vdv"
		,"rhs_bmp1d_vdv"
		,"rhs_bmp2_vdv"
		,"rhs_bmp2d_vdv"
		,"rhs_brm1k_vdv"
		,"rhs_prp3_vdv"
		,"rhs_btr60_vdv"
		,"rhs_btr70_vdv"
		,"rhs_btr80_vdv"
		,"rhs_btr80a_vdv"
		,"rhs_t72ba_tv"
		,"rhs_t72bb_tv"
		,"rhs_t72bc_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80uk"
		,"rhs_t90_tv"
		,"rhs_t90sab_tv"
		,"rhs_t90sm_tv"
		,"rhs_sprut_vdv"
		,"rhs_sprut_vdv"
		,"rhs_2s3_tv"
		,"RHS_BM21_VDV_01"
		,"rhs_9k79"
		,"rhs_9k79_B"
		,"rhs_9k79_K"
		,"rhs_pts_vmf"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhssaf_un_uaz"
		,"rhssaf_un_uaz_open"
		,"rhssaf_un_ural"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_gaz66_vdv"
		,"rhs_gaz66o_vdv"
		,"rhs_gaz66_r142_vdv"
		,"rhs_gaz66_vdv"
		,"rhs_gaz66o_vdv"
		,"rhs_gaz66_r142_vdv"
		,"rhs_gaz66_repair_vdv"
		,"rhs_gaz66_repair_vdv"
		,"rhs_gaz66_ap2_vdv"
		,"rhs_gaz66_ap2_vdv"
		,"rhs_gaz66_ammo_vdv"
		,"rhs_gaz66_ammo_vdv"
		,"RHS_Ural_VDV_01"
		,"RHS_Ural_Open_VDV_01"
		,"RHS_Ural_Fuel_VDV_01"
		,"RHS_Ural_Repair_VDV_01"
		,"RHS_Ural_Zu23_VDV_01"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_zil131_vdv"
		,"rhs_zil131_open_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhsgref_BRDM2_vdv"
		,"rhsgref_BRDM2_ATGM_vdv"
		,"rhsgref_BRDM2UM_vdv"
		,"rhsgref_BRDM2_HQ_vdv"
		,"RHS_ZU23_VDV"
		,"RHS_ZU23_VDV"
		,"rhs_bmd1"
		,"rhs_bmd1k"
		,"rhs_bmd1p"
		,"rhs_bmd1r"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmd4_vdv"
		,"rhs_bmd4ma_vdv"
		,"rhs_bmp1_vdv"
		,"rhs_bmp1d_vdv"
		,"rhs_bmp2_vdv"
		,"rhs_bmp2d_vdv"
		,"rhs_brm1k_vdv"
		,"rhs_prp3_vdv"
		,"rhs_btr60_vdv"
		,"rhs_btr70_vdv"
		,"rhs_btr80_vdv"
		,"rhs_btr80a_vdv"
		,"rhs_t72ba_tv"
		,"rhs_t72bb_tv"
		,"rhs_t72bc_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80uk"
		,"rhs_t90_tv"
		,"rhs_t90sab_tv"
		,"rhs_t90sm_tv"
		,"rhs_sprut_vdv"
		,"rhs_sprut_vdv"
		,"rhs_2s3_tv"
		,"RHS_BM21_VDV_01"
		,"rhs_9k79"
		,"rhs_9k79_B"
		,"rhs_9k79_K"
		,"rhs_pts_vmf"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhssaf_un_uaz"
		,"rhssaf_un_uaz_open"
		,"rhssaf_un_ural"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_uaz_open_vdv"
		,"rhs_gaz66_vdv"
		,"rhs_gaz66o_vdv"
		,"rhs_gaz66_r142_vdv"
		,"rhs_gaz66_vdv"
		,"rhs_gaz66o_vdv"
		,"rhs_gaz66_r142_vdv"
		,"rhs_gaz66_repair_vdv"
		,"rhs_gaz66_repair_vdv"
		,"rhs_gaz66_ap2_vdv"
		,"rhs_gaz66_ap2_vdv"
		,"rhs_gaz66_ammo_vdv"
		,"rhs_gaz66_ammo_vdv"
		,"RHS_Ural_VDV_01"
		,"RHS_Ural_Open_VDV_01"
		,"RHS_Ural_Fuel_VDV_01"
		,"RHS_Ural_Repair_VDV_01"
		,"RHS_Ural_Zu23_VDV_01"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_cargo_open_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_kraz255b1_fuel_vdv"
		,"rhs_zil131_vdv"
		,"rhs_zil131_open_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_sts_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhs_tigr_m_3camo_vdv"
		,"rhsgref_BRDM2_vdv"
		,"rhsgref_BRDM2_ATGM_vdv"
		,"rhsgref_BRDM2UM_vdv"
		,"rhsgref_BRDM2_HQ_vdv"
		,"RHS_ZU23_VDV"
		,"RHS_ZU23_VDV"
		,"rhs_bmd1"
		,"rhs_bmd1k"
		,"rhs_bmd1p"
		,"rhs_bmd1r"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmd4_vdv"
		,"rhs_bmd4ma_vdv"
		,"rhs_bmp1_vdv"
		,"rhs_bmp1d_vdv"
		,"rhs_bmp2_vdv"
		,"rhs_bmp2d_vdv"
		,"rhs_brm1k_vdv"
		,"rhs_prp3_vdv"
		,"rhs_btr60_vdv"
		,"rhs_btr70_vdv"
		,"rhs_btr80_vdv"
		,"rhs_btr80a_vdv"
		,"rhs_t72ba_tv"
		,"rhs_t72bb_tv"
		,"rhs_t72bc_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80uk"
		,"rhs_t90_tv"
		,"rhs_t90sab_tv"
		,"rhs_t90sm_tv"
		,"rhs_sprut_vdv"
		,"rhs_sprut_vdv"
		,"rhs_2s3_tv"
		,"RHS_BM21_VDV_01"
		,"rhs_9k79"
		,"rhs_9k79_B"
		,"rhs_9k79_K"
		,"rhs_pts_vmf"];
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhssaf_un_uaz"
		,"rhssaf_un_uaz_open"
		,"rhssaf_un_ural"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"rhs_vdv_des_sergeant"
	,"rhs_vdv_des_junior_sergeant"
	,"rhs_vdv_des_officer_armored"
	,"rhs_vdv_des_officer"
	,"rhs_vdv_des_grenadier_rpg"
	,"rhs_vdv_des_efreitor"
	,"rhs_vdv_des_rifleman"
	,"rhs_vdv_des_grenadier"
	,"rhs_vdv_des_rifleman_asval"
	,"rhs_vdv_des_arifleman"
	,"rhs_vdv_des_machinegunner"
	,"rhs_vdv_des_machinegunner_assistant"
	,"rhs_vdv_des_marksman"
	,"rhs_vdv_des_marksman_asval"
	,"rhs_vdv_des_RShG2"
	,"rhs_vdv_des_LAT"
	,"rhs_vdv_des_grenadier_rpg"
	,"rhs_vdv_des_at"
	,"rhs_vdv_des_aa"
	,"rhs_vdv_des_strelok_rpg_assist"
	,"rhs_vdv_des_medic"
	,"rhs_vdv_des_medic"
	,"rhs_vdv_des_engineer"
	,"rhs_vdv_des_engineer"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"rhssaf_un_m10_digital_desert_officer"
	,"rhssaf_un_m10_digital_desert_sq_lead"
	,"rhssaf_un_m10_digital_desert_ft_lead"
	,"rhssaf_un_m10_digital_desert_rifleman_m21"
	,"rhssaf_un_m10_digital_desert_rifleman_m70"
	,"rhssaf_un_m10_digital_desert_rifleman_ammo"
	,"rhssaf_un_m10_digital_desert_rifleman_at"
	,"rhssaf_un_m10_digital_desert_spec_at"
	,"rhssaf_un_m10_digital_desert_asst_spec_at"
	,"rhssaf_un_m10_digital_desert_spec_aa"
	,"rhssaf_un_m10_digital_desert_asst_spec_aa"
	,"rhssaf_un_m10_digital_desert_gl"
	,"rhssaf_un_m10_digital_desert_exp"
	,"rhssaf_un_m10_digital_desert_engineer"
	,"rhssaf_un_m10_digital_desert_repair"
	,"rhssaf_un_m10_digital_desert_medic"
	,"rhssaf_un_m10_digital_desert_mgun_m84"
	,"rhssaf_un_m10_digital_desert_asst_mgun"
	,"rhssaf_un_m10_digital_desert_sniper_m76"
	,"rhssaf_un_m10_digital_desert_spotter"];
a3e_arr_recon_InfantryTypes = [
	"rhs_vdv_des_sergeant"
	,"rhs_vdv_des_junior_sergeant"
	,"rhs_vdv_des_officer_armored"
	,"rhs_vdv_des_officer"
	,"rhs_vdv_des_grenadier_rpg"
	,"rhs_vdv_des_efreitor"
	,"rhs_vdv_des_rifleman"
	,"rhs_vdv_des_grenadier"
	,"rhs_vdv_des_rifleman_asval"
	,"rhs_vdv_des_arifleman"
	,"rhs_vdv_des_machinegunner"
	,"rhs_vdv_des_machinegunner_assistant"
	,"rhs_vdv_des_marksman"
	,"rhs_vdv_des_marksman_asval"
	,"rhs_vdv_des_RShG2"
	,"rhs_vdv_des_LAT"
	,"rhs_vdv_des_grenadier_rpg"
	,"rhs_vdv_des_at"
	,"rhs_vdv_des_aa"
	,"rhs_vdv_des_strelok_rpg_assist"
	,"rhs_vdv_des_medic"
	,"rhs_vdv_des_medic"
	,"rhs_vdv_des_engineer"
	,"rhs_vdv_des_engineer"];
a3e_arr_recon_I_InfantryTypes = [
	"rhssaf_un_m10_digital_desert_officer"
	,"rhssaf_un_m10_digital_desert_sq_lead"
	,"rhssaf_un_m10_digital_desert_ft_lead"
	,"rhssaf_un_m10_digital_desert_rifleman_m21"
	,"rhssaf_un_m10_digital_desert_rifleman_m70"
	,"rhssaf_un_m10_digital_desert_rifleman_ammo"
	,"rhssaf_un_m10_digital_desert_rifleman_at"
	,"rhssaf_un_m10_digital_desert_spec_at"
	,"rhssaf_un_m10_digital_desert_asst_spec_at"
	,"rhssaf_un_m10_digital_desert_spec_aa"
	,"rhssaf_un_m10_digital_desert_asst_spec_aa"
	,"rhssaf_un_m10_digital_desert_gl"
	,"rhssaf_un_m10_digital_desert_exp"
	,"rhssaf_un_m10_digital_desert_engineer"
	,"rhssaf_un_m10_digital_desert_repair"
	,"rhssaf_un_m10_digital_desert_medic"
	,"rhssaf_un_m10_digital_desert_mgun_m84"
	,"rhssaf_un_m10_digital_desert_asst_mgun"
	,"rhssaf_un_m10_digital_desert_sniper_m76"
	,"rhssaf_un_m10_digital_desert_spotter"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"rhs_tigr_sts_3camo_vdv"
	,"rhsgref_BRDM2_HQ_vdv"
	,"rhsgref_BRDM2_vdv"
	,"rhsgref_BRDM2_ATGM_vdv"
	,"rhs_btr60_vdv"
	,"rhs_bmd1k"
	,"RHS_NSV_TriPod_VDV"
	,"rhs_KORD_VDV"
	,"RHS_AGS30_TriPod_VDV"
	,"rhs_Metis_9k115_2_vdv"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"rhssaf_un_uaz"
	,"rhsgref_un_m1117"
	,"rhsgref_un_btr70"
	,"rhs_KORD_high_VDV"
	,"rhs_Metis_9k115_2_ins"
	,"rhs_SPG9M_VDV"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"rhs_gaz66o_vdv"
	,"RHS_Ural_VDV_01"
	,"rhs_kraz255b1_cargo_open_vdv"
	,"rhs_gaz66_vdv"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"rhssaf_un_uaz"
	,"rhssaf_un_uaz_open"
	,"rhssaf_un_ural"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"rhssaf_un_uaz"
	,"rhssaf_un_uaz_open"
	,"rhs_tigr_sts_3camo_vdv"
	,"rhs_tigr_m_3camo_vdv"
	,"rhsgref_un_btr70"
	,"rhsgref_un_btr70"
	,"rhsgref_un_m1117"
	,"rhsgref_un_m1117"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"rhs_bmp1_vdv"
	,"rhs_bmp2_vdv"
	,"rhs_brm1k_vdv"
	,"rhs_btr60_vdv"
	,"rhs_btr70_vdv"
	,"rhs_btr80a_vdv"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"rhs_sprut_vdv"
	,"rhs_sprut_vdv"
	,"rhs_sprut_vdv"
	,"rhs_t72ba_tv"
	,"rhs_t72bb_tv"
	,"rhs_t72bc_tv"
	,"rhs_t80"
	,"rhs_t80a"
	,"rhs_t80uk"
	,"rhs_t90_tv"
	,"rhs_t90sab_tv"
	,"rhs_t90sm_tv"
	,"rhs_t14_tv"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers. Should have a higher tripod to shoot over sandbags
a3e_arr_ComCenStaticWeapons = [
	"rhs_KORD_high_VDV"
	,"rhsgref_nat_DSHKM"
	,"rhs_Kornet_9M133_2_vdv"];
// A communication center has two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"rhssaf_un_uaz"
	,"rhssaf_un_uaz"
	,"rhssaf_un_uaz_open"
	,"rhssaf_un_uaz_open"
	,"rhs_gaz66_vdv"
	,"rhs_gaz66o_vdv"
	,"rhs_gaz66_r142_vdv"
	,"rhs_gaz66_ap2_vdv"
	,"rhs_gaz66_repair_vdv"
	,"rhssaf_un_ural"
	,"rhssaf_un_ural"
	,"rhs_kraz255b1_fuel_vdv"
	,"rhsgref_un_zil131"
	,"rhsgref_un_zil131_open"
	,"rhs_tigr_sts_3camo_vdv"
	,"rhs_tigr_m_3camo_vdv"
	,"rhsgref_un_btr70"
	,"rhsgref_un_m1117"
	,"rhsgref_un_m1117"];

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
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"
	,"C_Truck_02_transport_F"
	,"C_Truck_02_covered_F"];
	if(A3E_Param_UseDLCApex==1) then {
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_service_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"RHS_NSV_TriPod_VDV"
	,"RHS_AGS30_TriPod_VDV"
	,"rhs_KORD_VDV"
	,"rhs_KORD_high_VDV"
	,"rhs_Metis_9k115_2_vdv"
	,"rhs_Kornet_9M133_2_vdv"
	,"rhs_Igla_AA_pod_vdv"
	,"rhs_SPG9M_VDV"
	,"RHS_ZU23_VDV"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"I_G_Offroad_01_repair_F"
	,"rhssaf_un_uaz"
	,"rhssaf_un_uaz_open"
	,"rhs_gaz66_vdv"
	,"rhs_gaz66o_vdv"
	,"rhs_gaz66_r142_vdv"
	,"rhs_gaz66_ap2_vdv"
	,"rhs_gaz66_repair_vdv"
	,"rhssaf_un_ural"
	,"rhs_kraz255b1_fuel_vdv"
	,"rhsgref_un_zil131"
	,"rhsgref_un_zil131_open"
	,"rhs_tigr_sts_3camo_vdv"
	,"rhs_tigr_m_3camo_vdv"
	,"I_G_Offroad_01_F"
	,"I_G_Offroad_01_armed_F"
	,"I_G_Offroad_01_armed_F"
	,"rhs_ural_open_vdv_01"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"rhsgref_un_Mi24V"
	,"rhsgref_un_Mi24V"
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
	"rhs_ka60_c"
	,"RHS_Mi8T_vvsc"
	,"RHS_Mi8T_vvsc"];
a3e_arr_O_pilots = [
	"rhs_pilot_transport_heli"
	,"rhs_pilot_transport_heli"];
a3e_arr_I_transport_heli = [
	"rhsgref_un_Mi8amt"
	,"rhs_uh1h_un"];
a3e_arr_I_pilots = [
	"rhssaf_airforce_pilot_transport_heli"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_pya", 50, 1, 2, ["rhs_mag_9x19_17"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_makarov_pm", 50, 1, 2, ["rhs_mag_9x18_8_57N181S"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_aks74u", 50, 1, 2, ["rhs_30Rnd_545x39_7N10_AK"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_desert", 100, 3, 5, ["rhs_30Rnd_545x39_7N10_desert_AK", "rhs_30Rnd_545x39_7N10_2mag_desert_AK"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_desert_npz", 20, 1, 3, ["rhs_30Rnd_545x39_7N10_2mag_desert_AK"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_gp25", 75, 2, 4, ["rhs_30Rnd_545x39_7N10_desert_AK", "rhs_30Rnd_545x39_7N22_desert_AK", "rhs_VOG25"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_pkm", 20, 1, 2, ["rhs_100Rnd_762x54mmR"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_svds_npz", 5, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_svds_pso1", 10, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_cz99", 40, 2, 4, ["rhssaf_mag_15Rnd_9x19_FMJ"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_scorpion", 40, 2, 4, ["rhsgref_20rnd_765x17_vz61"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m70ab2", 75, 1, 3, ["rhssaf_30Rnd_762x39mm_M67"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m70b1", 50, 1, 3, ["rhssaf_30Rnd_762x39mm_M67"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m76", 30, 1, 2, ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m21a", 50, 1, 2, ["rhsgref_30rnd_556x45_m21"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m21a_pbg40", 75, 1, 3, ["rhsgref_30rnd_556x45_m21_t", "rhs_VOG25", "rhs_GRD40_White", "rhs_VG40OP_white"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m70b3n_pbg40", 20, 1, 2, ["rhssaf_30Rnd_762x39mm_M67", "rhs_VOG25"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_desert", 20, 1, 2, ["rhs_45Rnd_545X39_7N10_AK"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_desert", 20, 1, 2, ["rhs_45Rnd_545X39_AK_Green"], 10];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_svds_npz", 20, 1, 1, ["rhs_10Rnd_762x54mmR_7N1"], 7];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_svds", 50, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_asval", 50, 2, 4, ["rhs_20rnd_9x39mm_SP5"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_t5000", 20, 2, 4, ["rhs_5Rnd_338lapua_t5000"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_pkp", 50, 1, 3, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], 2];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_pkp_pkas", 20, 1, 2, ["rhs_100Rnd_762x54mmR"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_tr8", 50, 1, 2, ["HandGrenade"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m84", 50, 2, 4, ["rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green"], 3];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m76_pso", 30, 1, 2, ["rhsgref_10Rnd_792x57_m76", "rhssaf_10Rnd_792x57_m76_tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_g36c", 10, 1, 2, ["rhssaf_30rnd_556x45_EPR_G36"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_g36kv", 10, 1, 2, ["rhssaf_30rnd_556x45_EPR_G36"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_g36kv", 10, 1, 2, ["rhssaf_30rnd_556x45_MDIM_G36","rhssaf_100rnd_556x45_EPR_G36"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhsusf_weap_MP7A2_aor1", 10, 1, 2, ["rhsusf_mag_40Rnd_46x30_FMJ"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhsusf_weap_MP7A2_desert", 10, 1, 2, ["rhsusf_mag_40Rnd_46x30_AP"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_hk416d10", 10, 1, 2, ["rhs_mag_30Rnd_556x45_Mk318_Stanag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_g36kv_ag36", 10, 1, 2, ["rhssaf_30rnd_556x45_EPR_G36", "rhs_mag_M433_HEDP"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_hk416d10_m320", 10, 1, 2, ["rhs_mag_30Rnd_556x45_Mk318_Stanag", "rhs_mag_M433_HEDP"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_minimi_para_railed", 10, 1, 2, ["rhsusf_200rnd_556x45_mixed_box"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_SCARH_FDE_STD", 10, 1, 2, ["rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m82a1", 10, 1, 2, ["rhsusf_mag_10Rnd_STD_50BMG_M33","rhsusf_mag_10Rnd_STD_50BMG_mk211"], 10];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg7", 50, 1, 2, ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg26", 50, 1, 3, ["rhs_rpg26_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rshg2", 50, 1, 3, ["rhs_rshg2_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_igla", 50, 1, 2, ["rhs_mag_9k38_rocket"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_m80", 50, 1, 2, ["rhs_m80_mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_igla", 50, 1, 1, ["rhs_mag_9k38_rocket"],2];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_smaw_green", 50, 1, 2, ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP", "rhs_mag_smaw_SR"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_fgm148", 10, 1, 2, ["rhs_fgm148_magazine_AT"], 2];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["rhs_ec200_mag", "rhs_ec400_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["rhs_mine_tm62m_mag", "rhs_ec400_mag"], 2];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["rhs_mine_ozm72_a_mag", "rhs_mag_mine_pfm1", "rhs_mine_pmn2_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["rhssaf_mine_pma3_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_mag_rgn"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhssaf_mag_br_m75", "rhssaf_mag_br_m84"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhssaf_mag_brd_m83_white", "rhssaf_mag_brd_m83_yellow", "rhssaf_mag_brd_m83_red", "rhssaf_mag_brd_m83_green", "rhssaf_mag_brd_m83_blue", "rhssaf_mag_brd_m83_orange"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_VOG25"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_GRD40_White", "rhs_GRD40_Green", "rhs_GRD40_Red"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_VG40OP_white", "rhs_VG40OP_green", "rhs_VG40OP_red"], 25];
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
a3e_arr_AmmoDepotItems pushback ["lerca_1200_tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Leupold_Mk4", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ak5", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk1", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk2", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk3", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk4long", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk4screws", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pbs1", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pgs64", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_tgpa", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_uuk", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk4short", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk1983", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["hlc_muzzle_545SUP_AK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtkakm", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk1l", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["hlc_muzzle_762SUP_AK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_tgpv", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_tgpv2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsgref_acc_zendl", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_2dpZenit_ris", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_perst1ik_ris", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_perst3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_2dpZenit", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_perst1ik", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_perst3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_perst3_top", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_perst3_2dp_h", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_rakursPM", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p87", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dh520x56", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp8_18", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn29", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn63", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn78", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1", 70, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp8_02", 60, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_okp7_dovetail", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_nita", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pkas", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pso1m2", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pso1m21", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_eotech_552_d", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_M952V", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_su230a_c", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4_2", 20, 1, 2];

if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_2", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn34", 20, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_grip_ffg2", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_grip_rk2", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_harris_swivel", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_saw_bipod", 20, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_makarov_pm", "rhs_mag_9x18_8_57N181S", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak74m_desert_npz", "rhs_30Rnd_545x39_AK", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_5RD", "rhsusf_5Rnd_00Buck", 11];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_8RD", "rhsusf_8Rnd_00Buck", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_akm_gp25", "rhs_30Rnd_762x39mm_tracer", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak105_zenitco01_grip1", "rhs_30Rnd_545x39_7N10_AK", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak103_zenitco01_b33_grip1", "rhs_30Rnd_762x39mm_tracer", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak74m_plummag_npz", "rhs_30Rnd_545x39_AK", 7];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_aks74u", "rhs_30Rnd_545x39_AK", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m16a4_grip_acog_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_XM2010_d_leu", "rhsusf_5Rnd_300winmag_xm2010", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_sr25_sup_marsoc", "rhsusf_20Rnd_762x51_m118_special_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m38", "rhsgref_5Rnd_762x54_m38", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_kar98k", "rhsgref_5Rnd_792x57_kar98k", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m1garand_sa43", "rhsgref_8Rnd_762x63_M2B_M1rifle", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_rshg2","rhs_rshg2_mag", 2];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_Izh18", "rhsgref_1Rnd_00Buck", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_Izh18", "rhsgref_1Rnd_Slug", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_MP44", "rhsgref_30Rnd_792x33_SmE_StG", 12];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes:
a3e_arr_Scopes = [
	"rhs_acc_1pn29"
	,"rhs_acc_1pn63"
	,"rhs_acc_1pn78"
	,"rhs_acc_1pn93_1"
	,"rhs_acc_ekp1"
	,"rhs_acc_ekp8_02"
	,"rhs_acc_nita"
	,"rhs_acc_pkas"
	,"rhs_acc_pso1m2"
	,"rhs_acc_pso1m21"
	,"rhs_acc_rakursPM"
	,"rhs_acc_1p87"
	,"rhs_acc_dh520x56"
	,"rhs_acc_ekp8_18"
	,"rhs_acc_ekp1"
	,"rhs_acc_ekp1"
	,"rhs_acc_ekp1"
	,"rhs_acc_okp7_dovetail"
	,"rhs_acc_ekp8_02"
	,"rhs_acc_ekp8_02"];
a3e_arr_Scopes_SMG = [
	"rhs_acc_ekp1"
	,"rhs_acc_ekp8_02"];
a3e_arr_Scopes_Sniper = [
	"rhs_acc_pso1m2"
	,"rhs_acc_pso1m21"
	,"rhs_acc_dh520x56"];
a3e_arr_NightScopes = [
	"rhs_acc_1pn93_1"
	,"rhs_acc_1pn34"];
a3e_arr_TWSScopes = [
	"optic_Nightstalker"
	,"optic_tws"
	,"optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"rhs_acc_grip_ffg2"
	,"rhs_acc_harris_swivel"
	,"rhs_acc_grip_rk2"];


//////////////////////////////////////////////////////////////////
// SelectExtractionZone.sqf
// Which type of extractions are supported/preferred by this unitclasses version?
// Only if supported by terrain, so if corresponding markers are placed
// Basic fallback is always Heli extraction
// Available types: a3e_arr_extractiontypes = ["air","land","sea"];
//////////////////////////////////////////////////////////////////
a3e_arr_extractiontypes = [
	"air"
	,"land"
	,"sea"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"rhs_uh60m"
	,"RHS_CH_47F_light"
	,"rhsusf_CH53E_USMC"];
a3e_arr_extraction_chopper_escort = [
	"RHS_AH64DGrey"
	,"RHS_AH1Z"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"rhsusf_mkvsoc"];
a3e_arr_extraction_boat_escort = [
	"rhsusf_mkvsoc"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"rhsusf_m998_d_s_2dr_halftop"	//7
	,"rhsusf_M1232_MC_M2_usmc_d"	//9
	,"rhsusf_M1232_MC_M2_usmc_d"	//9
	,"rhsusf_M1232_MC_MK19_usmc_d"];	//9
a3e_arr_extraction_car_escort = [
	"rhsusf_CGRCAT1A2_M2_usmc_d"		//5
	,"rhsusf_CGRCAT1A2_Mk19_usmc_d"	//5
	,"rhsusf_m1a1fep_d"
	,"rhsusf_m1a1fep_d"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"rhs_pchela1t_vvs"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"rhsgref_un_Mi8amt"
	,"rhs_uh1h_un"];
a3e_arr_searchChopperHard = [
	"RHS_Mi8mt_vdv"
	,"RHS_Mi8MTV3_vdv"
	,"RHS_Mi8MTV3_FAB_vdv"
	,"RHS_Mi8MTV3_UPK23_vdv"
	,"RHS_Mi8MTV3_FAB_vvs"
	,"RHS_Mi8MTV3_vvsc"];
a3e_arr_searchChopper_pilot = [
	"rhssaf_airforce_pilot_transport_heli"];
a3e_arr_searchChopper_crew = [
	"rhssaf_airforce_pilot_transport_heli"];

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
	"O_Boat_Armed_01_hmg_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "rhs_weapon_crate";
a3e_additional_weapon_box_2 = "rhs_mags_crate";

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
	"rhssaf_airforce_o_l_18"
	,"rhssaf_airforce_o_l_18"
	,"rhs_mig29s_vvsc"
	,"rhs_mig29sm_vvsc"
	,"RHS_Su25SM_vvsc"
	,"rhs_mig29s_vvs"
	,"rhs_mig29sm_vvs"
	,"RHS_Su25SM_vvs"
	,"RHS_T50_vvs_generic"
	,"RHS_T50_vvs_generic_ext"
	,"RHS_T50_vvs_blueonblue"];

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
	"Land_UWreck_MV22_F"
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
	"rhsusf_usmc_marpat_d_driver"
	,"rhsusf_usmc_marpat_d_crewman"
	,"rhsusf_usmc_marpat_d_combatcrewman"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["rhs_m4a1_m320", 50, 2, 5, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_M433_HEDP"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_M136_hp", 10, 1, 2, ["rhs_m136_hp_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m72a7", 10, 1, 2, ["rhs_m72a7_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m16a4_grip", 100, 3, 5, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_M320", 10, 1, 2, ["rhs_mag_M433_HEDP","rhs_mag_m576","rhs_mag_M661_green"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m4_grip2", 75, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m14ebrri", 20, 1, 2, ["rhsusf_20Rnd_762x51_m118_special_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_XM2010_d_leu", 10, 1, 2, ["rhsusf_5Rnd_300winmag_xm2010"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m240B", 10, 1, 2, ["rhsusf_100Rnd_762x51"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m249_pip", 10, 1, 2, ["rhsusf_100Rnd_556x45_soft_pouch"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_g36kv", 10, 1, 2, ["rhssaf_30rnd_556x45_Tracers_G36"], 6];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_eotech_552_d", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_M8541_low_d", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_SpecterDR_D", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_ACOG_wd", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_g33_xps3_tan", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_T1_high", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_anpeq15", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_nt4_tan", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_grip2_tan", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_harris_bipod", 10, 1, 3];