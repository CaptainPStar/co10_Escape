/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;//Player side, RHS USMC-W
A3E_VAR_Side_Opfor = east;//RHS AFRF, MSV
A3E_VAR_Side_Ind = resistance;//RHS GREF, CDF 

A3E_VAR_Flag_Opfor = "\rhsafrf\addons\rhs_main\data\Flag_rus_CO.paa";
A3E_VAR_Flag_Ind = "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"rhsgref_cdf_reg_rifleman"
	,"rhsgref_cdf_reg_rifleman_akm"
	,"rhsgref_cdf_reg_rifleman_aks74"
	,"rhsgref_cdf_reg_grenadier"
	,"rhsgref_cdf_reg_rifleman_lite"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"rhsusf_falconii"
	,"rhsusf_falconii"
	,"rhsusf_assault_eagleaiii_ocp"];
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
		,"rhs_gaz66o_flat_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_zu23_msv"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66o_flat_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_zu23_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"RHS_Ural_Flat_MSV_01"
		,"RHS_Ural_Flat_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"RHS_Ural_Open_Flat_MSV_01"
		,"RHS_Ural_Open_Flat_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"RHS_Ural_Repair_MSV_01"
		,"RHS_Ural_Repair_MSV_01"
		,"RHS_Ural_Zu23_MSV_01"
		,"RHS_Ural_Zu23_MSV_01"
		,"rhs_zil131_msv"
		,"rhs_zil131_open_msv"
		,"rhs_tigr_m_msv"
		,"rhs_tigr_m_msv"
		,"rhs_tigr_sts_msv"
		,"rhs_tigr_sts_msv"
		,"rhs_tigr_msv"
		,"rhs_tigr_msv"
		,"rhs_zsu234_aa"
		,"rhs_zsu234_aa"
		,"rhsgref_BRDM2_msv"
		,"rhsgref_BRDM2_ATGM_msv"
		,"rhsgref_BRDM2UM_msv"
		,"rhsgref_BRDM2_HQ_msv"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmp1_msv"
		,"rhs_bmp1d_msv"
		,"rhs_bmp1k_msv"
		,"rhs_bmp1p_msv"
		,"rhs_bmp2_msv"
		,"rhs_bmp2d_msv"
		,"rhs_bmp2e_msv"
		,"rhs_bmp2k_msv"
		,"rhs_bmp3_msv"
		,"rhs_bmp3_late_msv"
		,"rhs_bmp3m_msv"
		,"rhs_bmp3mera_msv"
		,"rhs_brm1k_msv"
		,"rhs_Ob_681_2"
		,"rhs_prp3_msv"
		,"rhs_btr60_msv"
		,"rhs_btr70_msv"
		,"rhs_btr80_msv"
		,"rhs_btr80a_msv"
		,"rhs_t72ba_tv"
		,"rhs_t72bb_tv"
		,"rhs_t72bc_tv"
		,"rhs_t72bd_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80b"
		,"rhs_t80bk"
		,"rhs_t80bv"
		,"rhs_t80bvk"
		,"rhs_t80u"
		,"rhs_t80u45m"
		,"rhs_t80ue1"
		,"rhs_t80uk"
		,"rhs_t80um"
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
		"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_ags"
		,"rhsgref_cdf_reg_uaz_ags"
		,"rhsgref_cdf_reg_uaz_dshkm"
		,"rhsgref_cdf_reg_uaz_dshkm"
		,"rhsgref_cdf_reg_uaz_spg9"
		,"rhsgref_cdf_reg_uaz_spg9"
		,"rhsgref_cdf_gaz66"
		,"rhsgref_cdf_gaz66_ammo"
		,"rhsgref_cdf_gaz66_flat"
		,"rhsgref_cdf_gaz66o"
		,"rhsgref_cdf_gaz66o_flat"
		,"rhsgref_cdf_gaz66_r142"
		,"rhsgref_cdf_gaz66_zu23"
		,"rhsgref_cdf_gaz66_ap2"
		,"rhsgref_cdf_gaz66_repair"
		,"rhsgref_cdf_ural"
		,"rhsgref_cdf_ural_fuel"
		,"rhsgref_cdf_ural_open"
		,"rhsgref_cdf_ural_repair"
		,"rhsgref_cdf_ural_Zu23"
		,"rhsgref_cdf_reg_BM21"
		,"rhsgref_BRDM2"
		,"rhsgref_BRDM2_ATGM"
		,"rhsgref_BRDM2UM"
		,"rhsgref_BRDM2_HQ"
		,"rhsgref_cdf_btr60"
		,"rhsgref_cdf_btr70"
		,"rhsgref_cdf_bmd1"
		,"rhsgref_cdf_bmd1k"
		,"rhsgref_cdf_bmd1p"
		,"rhsgref_cdf_bmd1pk"
		,"rhsgref_cdf_bmd2"
		,"rhsgref_cdf_bmd2k"
		,"rhsgref_cdf_bmp1"
		,"rhsgref_cdf_bmp1d"
		,"rhsgref_cdf_bmp1k"
		,"rhsgref_cdf_bmp1p"
		,"rhsgref_cdf_bmp2e"
		,"rhsgref_cdf_bmp2"
		,"rhsgref_cdf_bmp2d"
		,"rhsgref_cdf_bmp2k"
		,"rhsgref_cdf_zsu234"
		,"rhsgref_cdf_t72ba_tv"
		,"rhsgref_cdf_t72bb_tv"
		,"rhsgref_cdf_t80b_tv"
		,"rhsgref_cdf_t80bv_tv"];
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
		,"rhs_gaz66o_flat_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_zu23_msv"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66o_flat_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_zu23_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"RHS_Ural_Flat_MSV_01"
		,"RHS_Ural_Flat_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"RHS_Ural_Open_Flat_MSV_01"
		,"RHS_Ural_Open_Flat_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"RHS_Ural_Repair_MSV_01"
		,"RHS_Ural_Repair_MSV_01"
		,"RHS_Ural_Zu23_MSV_01"
		,"RHS_Ural_Zu23_MSV_01"
		,"rhs_zil131_msv"
		,"rhs_zil131_open_msv"
		,"rhs_tigr_m_msv"
		,"rhs_tigr_m_msv"
		,"rhs_tigr_sts_msv"
		,"rhs_tigr_sts_msv"
		,"rhs_tigr_msv"
		,"rhs_tigr_msv"
		,"rhs_zsu234_aa"
		,"rhs_zsu234_aa"
		,"rhsgref_BRDM2_msv"
		,"rhsgref_BRDM2_ATGM_msv"
		,"rhsgref_BRDM2UM_msv"
		,"rhsgref_BRDM2_HQ_msv"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmp1_msv"
		,"rhs_bmp1d_msv"
		,"rhs_bmp1k_msv"
		,"rhs_bmp1p_msv"
		,"rhs_bmp2_msv"
		,"rhs_bmp2d_msv"
		,"rhs_bmp2e_msv"
		,"rhs_bmp2k_msv"
		,"rhs_bmp3_msv"
		,"rhs_bmp3_late_msv"
		,"rhs_bmp3m_msv"
		,"rhs_bmp3mera_msv"
		,"rhs_brm1k_msv"
		,"rhs_Ob_681_2"
		,"rhs_prp3_msv"
		,"rhs_btr60_msv"
		,"rhs_btr70_msv"
		,"rhs_btr80_msv"
		,"rhs_btr80a_msv"
		,"rhs_t72ba_tv"
		,"rhs_t72bb_tv"
		,"rhs_t72bc_tv"
		,"rhs_t72bd_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80b"
		,"rhs_t80bk"
		,"rhs_t80bv"
		,"rhs_t80bvk"
		,"rhs_t80u"
		,"rhs_t80u45m"
		,"rhs_t80ue1"
		,"rhs_t80uk"
		,"rhs_t80um"
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
		"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_ags"
		,"rhsgref_cdf_reg_uaz_ags"
		,"rhsgref_cdf_reg_uaz_dshkm"
		,"rhsgref_cdf_reg_uaz_dshkm"
		,"rhsgref_cdf_reg_uaz_spg9"
		,"rhsgref_cdf_reg_uaz_spg9"
		,"rhsgref_cdf_gaz66"
		,"rhsgref_cdf_gaz66_ammo"
		,"rhsgref_cdf_gaz66_flat"
		,"rhsgref_cdf_gaz66o"
		,"rhsgref_cdf_gaz66o_flat"
		,"rhsgref_cdf_gaz66_r142"
		,"rhsgref_cdf_gaz66_zu23"
		,"rhsgref_cdf_gaz66_ap2"
		,"rhsgref_cdf_gaz66_repair"
		,"rhsgref_cdf_ural"
		,"rhsgref_cdf_ural_fuel"
		,"rhsgref_cdf_ural_open"
		,"rhsgref_cdf_ural_repair"
		,"rhsgref_cdf_ural_Zu23"
		,"rhsgref_cdf_reg_BM21"
		,"rhsgref_BRDM2"
		,"rhsgref_BRDM2_ATGM"
		,"rhsgref_BRDM2UM"
		,"rhsgref_BRDM2_HQ"
		,"rhsgref_cdf_btr60"
		,"rhsgref_cdf_btr70"
		,"rhsgref_cdf_bmd1"
		,"rhsgref_cdf_bmd1k"
		,"rhsgref_cdf_bmd1p"
		,"rhsgref_cdf_bmd1pk"
		,"rhsgref_cdf_bmd2"
		,"rhsgref_cdf_bmd2k"
		,"rhsgref_cdf_bmp1"
		,"rhsgref_cdf_bmp1d"
		,"rhsgref_cdf_bmp1k"
		,"rhsgref_cdf_bmp1p"
		,"rhsgref_cdf_bmp2e"
		,"rhsgref_cdf_bmp2"
		,"rhsgref_cdf_bmp2d"
		,"rhsgref_cdf_bmp2k"
		,"rhsgref_cdf_zsu234"
		,"rhsgref_cdf_t72ba_tv"
		,"rhsgref_cdf_t72bb_tv"
		,"rhsgref_cdf_t80b_tv"
		,"rhsgref_cdf_t80bv_tv"];
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
		,"rhs_gaz66o_flat_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_zu23_msv"
		,"rhs_gaz66_msv"
		,"rhs_gaz66o_msv"
		,"rhs_gaz66o_flat_msv"
		,"rhs_gaz66_r142_msv"
		,"rhs_gaz66_zu23_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_repair_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ap2_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_gaz66_ammo_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_kamaz5350_msv"
		,"rhs_kamaz5350_flatbed_cover_msv"
		,"rhs_kamaz5350_open_msv"
		,"rhs_kamaz5350_flatbed_msv"
		,"rhs_ural_MSV_01"
		,"rhs_ural_MSV_01"
		,"RHS_Ural_Flat_MSV_01"
		,"RHS_Ural_Flat_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"rhs_ural_open_MSV_01"
		,"RHS_Ural_Open_Flat_MSV_01"
		,"RHS_Ural_Open_Flat_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"rhs_ural_fuel_MSV_01"
		,"RHS_Ural_Repair_MSV_01"
		,"RHS_Ural_Repair_MSV_01"
		,"RHS_Ural_Zu23_MSV_01"
		,"RHS_Ural_Zu23_MSV_01"
		,"rhs_zil131_msv"
		,"rhs_zil131_open_msv"
		,"rhs_tigr_m_msv"
		,"rhs_tigr_m_msv"
		,"rhs_tigr_sts_msv"
		,"rhs_tigr_sts_msv"
		,"rhs_tigr_msv"
		,"rhs_tigr_msv"
		,"rhs_zsu234_aa"
		,"rhs_zsu234_aa"
		,"rhsgref_BRDM2_msv"
		,"rhsgref_BRDM2_ATGM_msv"
		,"rhsgref_BRDM2UM_msv"
		,"rhsgref_BRDM2_HQ_msv"
		,"rhs_bmd2"
		,"rhs_bmd2k"
		,"rhs_bmp1_msv"
		,"rhs_bmp1d_msv"
		,"rhs_bmp1k_msv"
		,"rhs_bmp1p_msv"
		,"rhs_bmp2_msv"
		,"rhs_bmp2d_msv"
		,"rhs_bmp2e_msv"
		,"rhs_bmp2k_msv"
		,"rhs_bmp3_msv"
		,"rhs_bmp3_late_msv"
		,"rhs_bmp3m_msv"
		,"rhs_bmp3mera_msv"
		,"rhs_brm1k_msv"
		,"rhs_Ob_681_2"
		,"rhs_prp3_msv"
		,"rhs_btr60_msv"
		,"rhs_btr70_msv"
		,"rhs_btr80_msv"
		,"rhs_btr80a_msv"
		,"rhs_t72ba_tv"
		,"rhs_t72bb_tv"
		,"rhs_t72bc_tv"
		,"rhs_t72bd_tv"
		,"rhs_t80"
		,"rhs_t80a"
		,"rhs_t80b"
		,"rhs_t80bk"
		,"rhs_t80bv"
		,"rhs_t80bvk"
		,"rhs_t80u"
		,"rhs_t80u45m"
		,"rhs_t80ue1"
		,"rhs_t80uk"
		,"rhs_t80um"
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
        "rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_open"
		,"rhsgref_cdf_reg_uaz_ags"
		,"rhsgref_cdf_reg_uaz_ags"
		,"rhsgref_cdf_reg_uaz_dshkm"
		,"rhsgref_cdf_reg_uaz_dshkm"
		,"rhsgref_cdf_reg_uaz_spg9"
		,"rhsgref_cdf_reg_uaz_spg9"
		,"rhsgref_cdf_gaz66"
		,"rhsgref_cdf_gaz66_ammo"
		,"rhsgref_cdf_gaz66_flat"
		,"rhsgref_cdf_gaz66o"
		,"rhsgref_cdf_gaz66o_flat"
		,"rhsgref_cdf_gaz66_r142"
		,"rhsgref_cdf_gaz66_zu23"
		,"rhsgref_cdf_gaz66_ap2"
		,"rhsgref_cdf_gaz66_repair"
		,"rhsgref_cdf_ural"
		,"rhsgref_cdf_ural_fuel"
		,"rhsgref_cdf_ural_open"
		,"rhsgref_cdf_ural_repair"
		,"rhsgref_cdf_ural_Zu23"
		,"rhsgref_cdf_reg_BM21"
		,"rhsgref_BRDM2"
		,"rhsgref_BRDM2_ATGM"
		,"rhsgref_BRDM2UM"
		,"rhsgref_BRDM2_HQ"
		,"rhsgref_cdf_btr60"
		,"rhsgref_cdf_btr70"
		,"rhsgref_cdf_bmd1"
		,"rhsgref_cdf_bmd1k"
		,"rhsgref_cdf_bmd1p"
		,"rhsgref_cdf_bmd1pk"
		,"rhsgref_cdf_bmd2"
		,"rhsgref_cdf_bmd2k"
		,"rhsgref_cdf_bmp1"
		,"rhsgref_cdf_bmp1d"
		,"rhsgref_cdf_bmp1k"
		,"rhsgref_cdf_bmp1p"
		,"rhsgref_cdf_bmp2e"
		,"rhsgref_cdf_bmp2"
		,"rhsgref_cdf_bmp2d"
		,"rhsgref_cdf_bmp2k"
		,"rhsgref_cdf_zsu234"
		,"rhsgref_cdf_t72ba_tv"
		,"rhsgref_cdf_t72bb_tv"
		,"rhsgref_cdf_t80b_tv"
		,"rhsgref_cdf_t80bv_tv"];
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
a3e_arr_Escape_InfantryTypes_Ind = [
	"rhsgref_cdf_reg_specialist_aa"
	,"rhsgref_cdf_reg_grenadier_rpg"
	,"rhsgref_cdf_reg_engineer"
	,"rhsgref_cdf_reg_machinegunner"
	,"rhsgref_cdf_reg_marksman"
	,"rhsgref_cdf_reg_medic"
	,"rhsgref_cdf_reg_rifleman"
	,"rhsgref_cdf_reg_rifleman"
	,"rhsgref_cdf_reg_rifleman_akm"
	,"rhsgref_cdf_reg_rifleman_aks74"
	,"rhsgref_cdf_reg_grenadier"
	,"rhsgref_cdf_reg_rifleman_lite"
	,"rhsgref_cdf_reg_rifleman_rpg75"
	,"rhsgref_cdf_reg_squadleader"];
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
	,"rhs_vdv_recon_marksman"
	,"rhs_vdv_recon_marksman_asval"
	,"rhs_vdv_recon_medic"
	,"rhs_vdv_recon_rifleman_scout"
	,"rhs_vdv_recon_rifleman_scout_akm"
	,"rhs_vdv_recon_grenadier_scout"
	,"rhs_vdv_recon_arifleman_scout"];
a3e_arr_recon_I_InfantryTypes = [
	"rhsgref_cdf_para_specialist_aa"
	,"rhsgref_cdf_para_grenadier_rpg"
	,"rhsgref_cdf_para_autorifleman"
	,"rhsgref_cdf_para_engineer"
	,"rhsgref_cdf_para_grenadier"
	,"rhsgref_cdf_para_machinegunner"
	,"rhsgref_cdf_para_marksman"
	,"rhsgref_cdf_para_medic"
	,"rhsgref_cdf_para_rifleman"
	,"rhsgref_cdf_para_rifleman"
	,"rhsgref_cdf_para_rifleman_lite"
	,"rhsgref_cdf_para_rifleman_lite"
	,"rhsgref_cdf_para_squadleader"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"rhs_btr60_msv"
	,"RHS_NSV_TriPod_VDV"
	,"rhs_KORD_MSV"
	,"RHS_AGS30_TriPod_MSV"
	,"rhs_Metis_9k115_2_msv"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"rhsgref_cdf_reg_uaz_ags"
	,"rhsgref_cdf_reg_uaz_dshkm"
	,"rhsgref_cdf_reg_uaz_dshkm"
	,"rhsgref_cdf_reg_uaz_spg9"
	,"rhsgref_BRDM2"
	,"rhsgref_BRDM2_ATGM"
	,"rhsgref_cdf_bmd1"
	,"rhsgref_cdf_btr60"
	,"rhsgref_cdf_btr70"
	,"rhsgref_cdf_DSHKM"
	,"rhsgref_cdf_SPG9M"
	,"RHSgref_cdf_ZU23"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"rhs_gaz66o_msv"
	,"rhs_kamaz5350_msv"
	,"rhs_kamaz5350_msv"
	,"rhs_kamaz5350_open_msv"
	,"rhs_kamaz5350_open_msv"
	,"rhs_zil131_msv"
	,"rhs_zil131_open_msv"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"rhsgref_cdf_gaz66"
	,"rhsgref_cdf_ural"
	,"rhsgref_cdf_ural_open"
	,"rhsgref_cdf_ural_open"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"rhs_uaz_MSV_01"
	,"rhs_uaz_open_MSV_01"
	,"rhs_tigr_msv"
	,"rhs_tigr_sts_msv"
	,"rhs_bmp3_msv"
	,"rhs_btr70_msv"
	,"rhs_btr80_msv"
	,"rhs_btr80a_msv"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"rhs_bmp1k_msv"
	,"rhs_bmp2_msv"
	,"rhs_bmp2d_msv"
	,"rhs_brm1k_msv"
	,"rhs_btr60_msv"
	,"rhs_btr70_msv"
	,"rhs_btr80_msv"
	,"rhs_btr80a_msv"
	,"rhs_gaz66_zu23_msv"
	,"RHS_Ural_Zu23_MSV_01"
	,"rhs_tigr_sts_msv"
	,"rhsgref_BRDM2_msv"
	,"rhsgref_BRDM2_ATGM_msv"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"rhs_t72ba_tv"
	,"rhs_t72bb_tv"
	,"rhs_t72bc_tv"
	,"rhs_t72bd_tv"
	,"rhs_t80"
	,"rhs_t80a"
	,"rhs_t80b"
	,"rhs_t80bk"
	,"rhs_t80bv"
	,"rhs_t80bvk"
	,"rhs_t80u"
	,"rhs_t80u45m"
	,"rhs_t80ue1"
	,"rhs_t80uk"
	,"rhs_t80um"
	,"rhs_t90_tv"
	,"rhs_t90a_tv"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"rhs_KORD_high_MSV"
	,"rhsgref_cdf_DSHKM"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"RHS_UAZ_MSV_01"
	,"rhs_uaz_open_MSV_01"
	,"rhs_gaz66_msv"
	,"rhs_gaz66_ammo_msv"
	,"rhs_gaz66o_msv"
	,"rhs_gaz66_r142_msv"
	,"rhs_gaz66_zu23_msv"
	,"rhs_gaz66_ap2_msv"
	,"rhs_gaz66_repair_msv"
	,"rhs_kamaz5350_msv"
	,"rhs_kamaz5350_msv"
	,"rhs_kamaz5350_open_msv"
	,"rhs_kamaz5350_open_msv"
	,"rhs_ural_MSV_01"
	,"rhs_ural_fuel_MSV_01"
	,"rhs_ural_open_MSV_01"
	,"RHS_Ural_Repair_MSV_01"
	,"RHS_Ural_Zu23_MSV_01"
	,"rhs_zil131_msv"
	,"rhs_zil131_open_msv"
	,"rhs_tigr_msv"
	,"rhs_tigr_sts_msv"
	,"rhs_brm1k_msv"
	,"rhsgref_BRDM2_HQ_msv"];

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

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"rhsgref_cdf_Igla_AA_pod"
	,"rhsgref_cdf_AGS30_TriPod"
	,"rhsgref_cdf_DSHKM"
	,"rhsgref_cdf_DSHKM_Mini_TriPod"
	,"rhsgref_cdf_NSV_TriPod"
	,"rhsgref_cdf_SPG9"
	,"rhsgref_cdf_SPG9M"
	,"RHSgref_cdf_ZU23"
	,"rhs_Metis_9k115_2_msv"
	,"rhs_Kornet_9M133_2_msv"
	,"rhs_Igla_AA_pod_msv"
	,"RHS_AGS30_TriPod_MSV"
	,"rhs_KORD_MSV"
	,"rhs_KORD_high_MSV"
	,"RHS_NSV_TriPod_MSV"
	,"rhs_SPG9M_MSV"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"RHS_UAZ_MSV_01"
	,"rhs_uaz_open_MSV_01"
	,"rhs_gaz66_msv"
	,"rhs_gaz66_ammo_msv"
	,"rhs_gaz66o_msv"
	,"rhs_gaz66_r142_msv"
	,"rhs_gaz66_zu23_msv"
	,"rhs_gaz66_ap2_msv"
	,"rhs_gaz66_repair_msv"
	,"rhs_kamaz5350_msv"
	,"rhs_kamaz5350_msv"
	,"rhs_kamaz5350_open_msv"
	,"rhs_kamaz5350_open_msv"
	,"rhs_ural_MSV_01"
	,"rhs_ural_fuel_MSV_01"
	,"rhs_ural_open_MSV_01"
	,"RHS_Ural_Repair_MSV_01"
	,"RHS_Ural_Zu23_MSV_01"
	,"rhs_zil131_msv"
	,"rhs_zil131_open_msv"
	,"rhs_tigr_msv"
	,"rhs_tigr_sts_msv"
	,"rhs_brm1k_msv"
	,"rhsgref_BRDM2_HQ_msv"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"RHS_Ka52_vvsc"
	,"RHS_Ka52_vvsc"
	,"RHS_Mi24P_vvsc"
	,"RHS_Mi24V_vvsc"
	,"RHS_Mi24Vt_vvsc"
	,"rhs_mi28n_vvsc"
	,"rhs_mi28n_vvsc"
	,"RHS_Mi8AMTSh_vvsc"
	,"rhsgref_mi24g_CAS"
	,"rhsgref_cdf_Mi35"];
a3e_arr_O_transport_heli = [
	"rhs_ka60_c"
	,"RHS_Mi8AMT_vvsc"
	,"RHS_Mi8mt_vvsc"
	,"RHS_Mi8MTV3_vvsc"];
a3e_arr_O_pilots = [
	"rhs_pilot_combat_heli"
	,"rhs_pilot_transport_heli"];
a3e_arr_I_transport_heli = [
	"rhsgref_cdf_reg_Mi8amt"
	,"rhsgref_cdf_reg_Mi17Sh"];
a3e_arr_I_pilots = [
	"rhsgref_cdf_air_pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_type94_new", 50, 2, 5, ["rhs_mag_6x8mm_mhp"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_pp2000_folded", 10, 1, 2, ["rhs_mag_9x19mm_7n21_20"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_camo", 100, 3, 5, ["rhs_30Rnd_545x39_7N10_camo_AK", "rhs_30Rnd_545x39_AK_green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_2mag", 50, 2, 4, ["rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_30Rnd_545x39_AK_green"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_gp25", 75, 2, 4, ["rhs_30Rnd_545x39_AK", "rhs_30Rnd_545x39_AK_green", "rhs_VOG25"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_pkp_pkas", 20, 1, 2, ["rhs_100Rnd_762x54mmR"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_svdp_npz", 10, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_svd_pso1", 10, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_makarov_pmm", 50, 2, 4, ["rhs_mag_9x18_12_57N181S"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_akm", 50, 1, 3, ["rhs_30Rnd_762x39mm_bakelite"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74", 70, 3, 5, ["rhs_30Rnd_545x39_7N6M_AK"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_aks74_2", 70, 3, 5, ["rhs_30Rnd_545x39_7N6M_AK"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74_gp25", 75, 2, 4, ["rhs_30Rnd_545x39_7N6M_AK", "rhs_VOG25"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_akm_gp25", 50, 1, 3, ["rhs_30Rnd_762x39mm_bakelite","rhs_VOG25"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak103_dtk", 30, 1, 2, ["rhs_30Rnd_762x39mm_tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak105_zenitco01_afg", 10, 1, 2, ["rhs_30Rnd_545x39_AK","rhs_45Rnd_545X39_7N10_AK"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak103_gp25_npz", 10, 1, 2, ["rhs_30Rnd_762x39mm_tracer","rhs_45Rnd_545X39_AK_Green","rhs_VOG25","rhs_vg40op_white","rhs_vg40op_green"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_akm_zenitco01_b33_grip1", 10, 1, 2, ["rhs_30Rnd_762x39mm","rhs_75Rnd_762x39mm_tracer"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak104_npz_pgs64", 10, 1, 2, ["rhs_30Rnd_762x39mm","rhs_75Rnd_762x39mm"], 4];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_vhsd2", 50, 2, 4, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_vhsd2_bg", 35, 2, 4, ["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t", "rhs_mag_M433_HEDP"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_vhsk2", 50, 1, 3, ["rhsgref_30rnd_556x45_vhs2_t"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_vhsd2_bg_ct15x", 10, 1, 2, ["rhsgref_30rnd_556x45_vhs2","rhs_mag_M441_HE"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_svdp_wd_npz", 50, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_svds", 50, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_asval", 50, 2, 4, ["rhs_20rnd_9x39mm_SP5"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_vss", 50, 2, 4, ["rhs_10rnd_9x39mm_SP6"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_t5000", 10, 2, 4, ["rhs_5Rnd_338lapua_t5000"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_pkp", 50, 1, 3, ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], 2];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_pkm", 50, 2, 4, ["rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green"], 3];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m240G", 50, 2, 4, ["rhsusf_100Rnd_762x51","rhsusf_50Rnd_762x51_m61_ap"], 3];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m249_pip_L_para", 50, 2, 4, ["rhsusf_100Rnd_556x45_soft_pouch","rhsusf_100Rnd_556x45_mixed_soft_pouch"], 3];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_pkp_1p63", 10, 1, 2, ["rhs_100Rnd_762x54mmR_green"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_tr8", 50, 1, 2, ["HandGrenade"], 4];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg7", 50, 1, 2, ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg26", 50, 1, 3, ["rhs_rpg26_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rshg2", 50, 1, 3, ["rhs_rshg2_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_igla", 50, 1, 2, ["rhs_mag_9k38_rocket"], 3];
// non-CSAT weapons
//a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_fgm148", 10, 1, 2, ["rhs_fgm148_magazine_AT"], 2];
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
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_VOG25","rhs_VOG25p","rhs_vg40tb","rhs_vg40sz","rhs_vg40op_white","rhs_vg40op_green","rhs_vg40op_red","rhs_GRD40_white","rhs_GRD40_green","rhs_GRD40_red","rhs_VG40MD_White","rhs_VG40MD_Green","rhs_VG40MD_Red","rhs_GDM40"], 25];
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
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn63", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn78", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1", 70, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp8_02", 60, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_nita", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pkas", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pso1m2", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pso1m21", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_eotech_552", 40, 1, 3];

if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_2", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_grip_ffg2", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_grip_rk2", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_harris_swivel", 20, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_makarov_pm", "rhs_mag_9x18_8_57N181S", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weapon_ak74m_2mag_camo_npz", "rhs_30Rnd_545x39_7N10_2mag_camo_AK", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_5RD", "rhsusf_5Rnd_00Buck", 11];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_8RD", "rhsusf_8Rnd_00Buck", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_akm_gp25", "rhs_30Rnd_762x39mm_tracer", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak105_zenitco01_grip1", "rhs_30Rnd_545x39_7N10_AK", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak103_zenitco01_b33_grip1", "rhs_30Rnd_762x39mm_tracer", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak74m_plummag_npz", "rhs_30Rnd_545x39_7N6M_plum_AK", 7];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_aks74u", "rhs_30Rnd_545x39_7N6_AK", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m16a4_grip_acog_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_XM2010_wd_leu", "rhsusf_5Rnd_300winmag_xm2010", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_sr25_sup_marsoc", "rhsusf_20Rnd_762x51_m118_special_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m38", "rhsgref_5Rnd_762x54_m38", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_mosin_sbr", "rhsgref_5Rnd_762x54_m38", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_kar98k", "rhsgref_5Rnd_792x57_kar98k", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m1garand_sa43", "rhsgref_8Rnd_762x63_M2B_M1rifle", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_rshg2","rhs_rshg2_mag", 2];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_Izh18", "rhsgref_1Rnd_00Buck", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_Izh18", "rhsgref_1Rnd_Slug", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_MP44", "rhsgref_30Rnd_792x33_SmE_StG", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_panzerfaust60", objNull, 0];
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
	"rhs_acc_1pn93_1"];
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
	"RHS_UH1Y"
	,"RHS_UH1Y_FFAR"
	,"rhsusf_CH53E_USMC"];
a3e_arr_extraction_chopper_escort = [
	"RHS_AH1Z_wd"];

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
	"rhsusf_M1078A1P2_B_WD_fmtv_usarmy"	//14
	,"rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy"	//13
	,"rhsusf_M1083A1P2_B_WD_fmtv_usarmy"	//14
	,"rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy"	//13
	,"rhsusf_m998_w_s_2dr_fulltop"	//7
	,"rhsusf_M1232_MC_M2_usmc_wd"	//10
	,"rhsusf_M1232_MC_M2_usmc_wd"];	//10
a3e_arr_extraction_car_escort = [
	"rhsusf_M1117_W"	//6
	,"rhsusf_M1220_M153_M2_usarmy_wd"	//8
	,"rhsusf_stryker_m1126_m2_wd"	//9
	,"rhsusf_stryker_m1126_mk19_wd"
	,"rhsusf_stryker_m1132_m2_np_wd"
	,"rhsusf_stryker_m1132_m2_wd"
	,"rhsusf_m1a1fep_wd"
	,"rhsusf_m1a1fep_od"
	,"rhsusf_m1a1hc_wd"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"rhs_pchela1t_vvs"
	,"rhs_pchela1t_vvsc"
	,"RHS_AN2"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"rhsgref_cdf_reg_Mi8amt"];
a3e_arr_searchChopperHard = [
	"rhsgref_cdf_reg_Mi17Sh"];
a3e_arr_searchChopper_pilot = [
	"rhsgref_cdf_air_pilot"];
a3e_arr_searchChopper_crew = [
	"rhsgref_cdf_air_pilot"];

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
	"rhs_2b14_82mm_msv"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"rhs_l159_CDF"
	,"rhs_l39_cdf"
	,"rhsgref_cdf_mig29s"
	,"rhsgref_cdf_su25"
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
	"rhsusf_usmc_marpat_wd_driver"
	,"rhsusf_usmc_marpat_wd_crewman"
	,"rhsusf_usmc_marpat_wd_combatcrewman"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["rhs_m4a1_m320", 50, 2, 5, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_M433_HEDP"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_M136_hp", 10, 1, 2, ["rhs_m136_hp_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m72a7", 10, 1, 2, ["rhs_m72a7_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m16a4_grip", 100, 3, 5, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_M320", 10, 1, 2, ["rhs_mag_M433_HEDP","rhs_mag_m576","rhs_mag_M661_green"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m4_grip2", 75, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m14ebrri", 20, 1, 2, ["rhsusf_20Rnd_762x51_m118_special_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_XM2010_wd_leu", 10, 1, 2, ["rhsusf_5Rnd_300winmag_xm2010"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m240B", 10, 1, 2, ["rhsusf_100Rnd_762x51"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_m249_pip", 10, 1, 2, ["rhsusf_100Rnd_556x45_soft_pouch"], 6];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_g36kv", 10, 1, 2, ["rhssaf_30rnd_556x45_Tracers_G36"], 6];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_eotech_552_wd", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_M8541_low_wd", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_SpecterDR_OD", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_ACOG_wd", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_g33_xps3", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_T1_high", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_anpeq15_bk", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_nt4_black", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_grip2_wd", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhsusf_acc_harris_bipod", 10, 1, 3];