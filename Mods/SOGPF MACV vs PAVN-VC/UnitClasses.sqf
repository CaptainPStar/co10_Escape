// SOGPF
// MACV vs PAVN and VC


/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;	//player side SOGPF MACV
A3E_VAR_Side_Opfor = east;	//SOGPF PAVN
A3E_VAR_Side_Ind = resistance;	//SOGPF VC

A3E_VAR_Flag_Opfor = "\vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa";
A3E_VAR_Flag_Ind = "\vn\objects_f_vietnam\flags\data\vn_flag_01_vc_dmg_ca.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"vn_o_men_vc_local_18"	//Rifleman K-50M
	,"vn_o_men_vc_local_04"	//Rifleman K-50M
	,"vn_o_men_vc_local_16"	//Rifleman M1 Carbine
	,"vn_o_men_vc_local_03"	//Rifleman M38 Bayo
	,"vn_o_men_vc_local_17"	//Rifleman M38 Bayo
	,"vn_o_men_vc_local_02"	//Rifleman M38
	,"vn_o_men_vc_local_20"	//Rifleman M3A1
	,"vn_o_men_vc_local_06"	//Rifleman MP40
	,"vn_o_men_vc_local_05"	//Rifleman PPSh-41
	,"vn_o_men_vc_local_19"];	//Rifleman PPSh-41

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"vn_o_pack_01"
	,"vn_o_pack_02"
	,"vn_o_pack_06"
	,"vn_c_pack_01"
	,"vn_b_pack_01"
	,"vn_b_pack_01_02"
	,"vn_b_pack_trp_02_02"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["vn_p38s","vn_m10_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_hd","vn_hd_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_hp","vn_hp_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_izh54_p","vn_izh54_so_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_izh54_p","vn_izh54_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1895","vn_m1895_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1895_sd","vn_m1895_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1911", "vn_m1911_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1911_sd", "vn_m1911_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_mx991_m1911", "vn_m1911_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m712","vn_m712_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m79_p","vn_40mm_m576_buck_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_mk22","vn_mk22_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_mk22_sd","vn_mk22_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m10","vn_m10_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m10_sd","vn_m10_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_pm","vn_pm_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_pm_sd","vn_pm_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_fkb1_pm","vn_pm_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_tt33","vn_tt33_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_welrod","vn_welrod_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_vz61_p","vn_vz61_mag"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"vn_c_bicycle_01"
	,"vn_c_bicycle_02"
	,"vn_c_wheeled_m151_02"
	,"vn_c_wheeled_m151_01"
	,"vn_c_car_01_01"
	,"vn_c_car_02_01"
	,"vn_c_car_03_01"
	,"vn_c_car_04_01"];
	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"vn_o_bicycle_01"
		,"vn_o_bicycle_01"
		,"vn_o_bicycle_02"
		,"vn_o_wheeled_btr40_01"
		,"vn_o_wheeled_btr40_01"
		,"vn_o_wheeled_btr40_mg_02"
		,"vn_o_wheeled_btr40_mg_02"
		,"vn_o_wheeled_btr40_mg_01"
		,"vn_o_wheeled_btr40_mg_01"
		,"vn_o_wheeled_btr40_mg_03"
		,"vn_o_wheeled_btr40_02"
		,"vn_o_wheeled_z157_ammo"
		,"vn_o_wheeled_z157_fuel"
		,"vn_o_wheeled_z157_03"
		,"vn_o_wheeled_z157_repair"
		,"vn_o_wheeled_z157_04"
		,"vn_o_wheeled_z157_01"
		,"vn_o_wheeled_z157_01"
		,"vn_o_wheeled_z157_02"
		,"vn_o_wheeled_z157_02"
		,"vn_o_wheeled_z157_mg_01"
		,"vn_o_wheeled_z157_mg_01"
		,"vn_o_armor_m113_acav_03"
		,"vn_o_armor_m113_01"
		,"vn_o_armor_m113_acav_01"
		,"vn_o_armor_pt76a_01"
		,"vn_o_armor_pt76b_01"
		,"vn_o_armor_type63_01"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"vn_o_bicycle_01_vcmf"
		,"vn_o_bicycle_01_vcmf"
		,"vn_o_bicycle_02_vcmf"
		,"vn_o_car_01_01"
		,"vn_o_car_02_01"
		,"vn_o_car_03_01"
		,"vn_o_car_04_01"
		,"vn_o_car_04_mg_01"
		,"vn_o_car_04_mg_01"
		,"vn_o_wheeled_btr40_01_vcmf"
		,"vn_o_wheeled_btr40_01_vcmf"
		,"vn_o_wheeled_btr40_02_vcmf"
		,"vn_o_wheeled_z157_01_vcmf"
		,"vn_o_wheeled_z157_02_vcmf"
		,"vn_o_wheeled_z157_ammo_vcmf"
		,"vn_o_wheeled_z157_fuel_vcmf"
		,"vn_o_wheeled_z157_repair_vcmf"
		,"vn_o_wheeled_z157_03_vcmf"
		,"vn_o_wheeled_z157_04_vcmf"
		,"vn_o_wheeled_btr40_mg_01_vcmf"
		,"vn_o_wheeled_btr40_mg_01_vcmf"
		,"vn_o_wheeled_btr40_mg_02_vcmf"
		,"vn_o_wheeled_btr40_mg_02_vcmf"
		,"vn_o_wheeled_btr40_mg_03_vcmf"
		,"vn_o_wheeled_z157_mg_01_vcmf"
		,"vn_o_wheeled_z157_mg_02_vcmf"
		,"vn_o_armor_m41_02_vcmf"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"vn_o_bicycle_01"
		,"vn_o_bicycle_01"
		,"vn_o_bicycle_02"
		,"vn_o_wheeled_btr40_01"
		,"vn_o_wheeled_btr40_01"
		,"vn_o_wheeled_btr40_mg_02"
		,"vn_o_wheeled_btr40_mg_02"
		,"vn_o_wheeled_btr40_mg_01"
		,"vn_o_wheeled_btr40_mg_01"
		,"vn_o_wheeled_btr40_mg_03"
		,"vn_o_wheeled_btr40_mg_03"
		,"vn_o_wheeled_btr40_02"
		,"vn_o_wheeled_z157_ammo"
		,"vn_o_wheeled_z157_fuel"
		,"vn_o_wheeled_z157_03"
		,"vn_o_wheeled_z157_repair"
		,"vn_o_wheeled_z157_04"
		,"vn_o_wheeled_z157_01"
		,"vn_o_wheeled_z157_01"
		,"vn_o_wheeled_z157_02"
		,"vn_o_wheeled_z157_02"
		,"vn_o_wheeled_z157_mg_01"
		,"vn_o_wheeled_z157_mg_01"
		,"vn_o_armor_m113_acav_03"
		,"vn_o_armor_m113_01"
		,"vn_o_armor_m113_acav_01"
		,"vn_o_armor_pt76a_01"
		,"vn_o_armor_pt76b_01"
		,"vn_o_armor_type63_01"
		,"vn_o_armor_type63_01"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"vn_o_bicycle_01_vcmf"
		,"vn_o_bicycle_01_vcmf"
		,"vn_o_bicycle_02_vcmf"
		,"vn_o_car_01_01"
		,"vn_o_car_02_01"
		,"vn_o_car_03_01"
		,"vn_o_car_04_01"
		,"vn_o_car_04_mg_01"
		,"vn_o_car_04_mg_01"
		,"vn_o_wheeled_btr40_01_vcmf"
		,"vn_o_wheeled_btr40_01_vcmf"
		,"vn_o_wheeled_btr40_02_vcmf"
		,"vn_o_wheeled_z157_01_vcmf"
		,"vn_o_wheeled_z157_02_vcmf"
		,"vn_o_wheeled_z157_ammo_vcmf"
		,"vn_o_wheeled_z157_fuel_vcmf"
		,"vn_o_wheeled_z157_repair_vcmf"
		,"vn_o_wheeled_z157_03_vcmf"
		,"vn_o_wheeled_z157_04_vcmf"
		,"vn_o_wheeled_btr40_mg_01_vcmf"
		,"vn_o_wheeled_btr40_mg_01_vcmf"
		,"vn_o_wheeled_btr40_mg_02_vcmf"
		,"vn_o_wheeled_btr40_mg_02_vcmf"
		,"vn_o_wheeled_btr40_mg_03_vcmf"
		,"vn_o_wheeled_btr40_mg_03_vcmf"
		,"vn_o_wheeled_z157_mg_01_vcmf"
		,"vn_o_wheeled_z157_mg_02_vcmf"
		,"vn_o_armor_m41_02_vcmf"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"vn_o_bicycle_01"
		,"vn_o_bicycle_01"
		,"vn_o_bicycle_02"
		,"vn_o_wheeled_btr40_01"
		,"vn_o_wheeled_btr40_01"
		,"vn_o_wheeled_btr40_mg_02"
		,"vn_o_wheeled_btr40_mg_02"
		,"vn_o_wheeled_btr40_mg_01"
		,"vn_o_wheeled_btr40_mg_01"
		,"vn_o_wheeled_btr40_mg_03"
		,"vn_o_wheeled_btr40_mg_03"
		,"vn_o_wheeled_btr40_mg_03"
		,"vn_o_wheeled_btr40_02"
		,"vn_o_wheeled_z157_ammo"
		,"vn_o_wheeled_z157_fuel"
		,"vn_o_wheeled_z157_03"
		,"vn_o_wheeled_z157_repair"
		,"vn_o_wheeled_z157_04"
		,"vn_o_wheeled_z157_01"
		,"vn_o_wheeled_z157_01"
		,"vn_o_wheeled_z157_02"
		,"vn_o_wheeled_z157_02"
		,"vn_o_wheeled_z157_mg_01"
		,"vn_o_wheeled_z157_mg_01"
		,"vn_o_armor_m113_acav_03"
		,"vn_o_armor_m113_acav_03"
		,"vn_o_armor_m113_01"
		,"vn_o_armor_m113_01"
		,"vn_o_armor_m113_acav_01"
		,"vn_o_armor_m113_acav_01"
		,"vn_o_armor_pt76a_01"
		,"vn_o_armor_pt76a_01"
		,"vn_o_armor_pt76b_01"
		,"vn_o_armor_pt76b_01"
		,"vn_o_armor_type63_01"
		,"vn_o_armor_type63_01"
		,"vn_o_armor_type63_01"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"vn_o_bicycle_01_vcmf"
		,"vn_o_bicycle_01_vcmf"
		,"vn_o_bicycle_02_vcmf"
		,"vn_o_car_01_01"
		,"vn_o_car_02_01"
		,"vn_o_car_03_01"
		,"vn_o_car_04_01"
		,"vn_o_car_04_mg_01"
		,"vn_o_car_04_mg_01"
		,"vn_o_wheeled_btr40_01_vcmf"
		,"vn_o_wheeled_btr40_01_vcmf"
		,"vn_o_wheeled_btr40_02_vcmf"
		,"vn_o_wheeled_z157_01_vcmf"
		,"vn_o_wheeled_z157_02_vcmf"
		,"vn_o_wheeled_z157_ammo_vcmf"
		,"vn_o_wheeled_z157_fuel_vcmf"
		,"vn_o_wheeled_z157_repair_vcmf"
		,"vn_o_wheeled_z157_03_vcmf"
		,"vn_o_wheeled_z157_04_vcmf"
		,"vn_o_wheeled_btr40_mg_01_vcmf"
		,"vn_o_wheeled_btr40_mg_01_vcmf"
		,"vn_o_wheeled_btr40_mg_02_vcmf"
		,"vn_o_wheeled_btr40_mg_02_vcmf"
		,"vn_o_wheeled_btr40_mg_03_vcmf"
		,"vn_o_wheeled_btr40_mg_03_vcmf"
		,"vn_o_wheeled_z157_mg_01_vcmf"
		,"vn_o_wheeled_z157_mg_01_vcmf"
		,"vn_o_wheeled_z157_mg_02_vcmf"
		,"vn_o_wheeled_z157_mg_02_vcmf"
		,"vn_o_armor_m41_02_vcmf"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"vn_o_men_nva_09"	//Sapper PPSh-41
	,"vn_o_men_nva_09"	//Sapper PPSh-41
	,"vn_o_men_nva_09"	//Sapper PPSh-41
	,"vn_o_men_nva_08"	//Medic PPS-43
	,"vn_o_men_nva_08"	//Medic PPS-43
	,"vn_o_men_nva_08"	//Medic PPS-43
	,"vn_o_men_nva_30"	//Mortar Ammo PPS52
	,"vn_o_men_nva_30"	//Mortar Ammo PPS52
	,"vn_o_men_nva_29"	//Mortar Gunner PPS-43
	,"vn_o_men_nva_31"	//Mortar tripod PPS-52
	,"vn_o_men_nva_11"	//Machinegunner RPD
	,"vn_o_men_nva_11"	//Machinegunner RPD
	,"vn_o_men_nva_11"	//Machinegunner RPD
	,"vn_o_men_nva_14"	//AT SKS/ B41
	,"vn_o_men_nva_14"	//AT SKS/ B41
	,"vn_o_men_nva_32"	//AT-3 Gunner PPS-43
	,"vn_o_men_nva_32"	//AT-3 Gunner PPS-43
	,"vn_o_men_nva_12"	//Sentry SKS Bayo
	,"vn_o_men_nva_12"	//Sentry SKS Bayo
	,"vn_o_men_nva_06"	//Rifleman PPSh-41
	,"vn_o_men_nva_03"	//Rifleman SKS bayo
	,"vn_o_men_nva_02"	//Rifleman SKS
	,"vn_o_men_nva_05"	//Rifleman Type 56 Bayo
	,"vn_o_men_nva_04"	//Rifleman Type 56
	,"vn_o_men_nva_07" //Grenadier SKS
	,"vn_o_men_nva_07" //Grenadier SKS
	,"vn_o_men_nva_13"	//RTO PPSh-41
	,"vn_o_men_nva_13"	//RTO PPSh-41
	,"vn_o_men_nva_10"	//Marksman SKS
	,"vn_o_men_nva_10"	//Marksman SKS
	,"vn_o_men_nva_45"	//Marksman VZ54
	,"vn_o_men_nva_45"	//Marksman VZ54
	,"vn_o_men_nva_01"	//Officer PPSH-41
	,"vn_o_men_nva_01"];	//Officer PPSH-41
a3e_arr_Escape_InfantryTypes_Ind = [
	"vn_o_men_vc_local_22"	//Medic Ish-54
	,"vn_o_men_vc_local_29"	//Medic Ish-54
	,"vn_o_men_vc_local_08"	//Medic Ish-54
	,"vn_o_men_vc_local_11"	//MG 1 DP27
	,"vn_o_men_vc_local_25"	//MG 2 DP27
	,"vn_o_men_vc_local_32"	//MG 3 DP27
	,"vn_o_men_vc_local_09"	//Sapper M3A1
	,"vn_o_men_vc_local_30"	//Sapper M3A1
	,"vn_o_men_vc_local_23"	//Sapper M3A1
	,"vn_o_men_vc_local_18"	//Rifleman K-50M
	,"vn_o_men_vc_local_04"	//Rifleman K-50M
	,"vn_o_men_vc_local_16"	//Rifleman M1 Carbine
	,"vn_o_men_vc_local_03"	//Rifleman M38 bayo
	,"vn_o_men_vc_local_17"	//Rifleman M38 bayo
	,"vn_o_men_vc_local_02"	//Rifleman M38
	,"vn_o_men_vc_local_20"	//Rifleman M3A1
	,"vn_o_men_vc_local_06"	//Rifleman MP40
	,"vn_o_men_vc_local_05"	//Rifleman PPSh-41
	,"vn_o_men_vc_local_19"	//Rifleman PPSh-41
	,"vn_o_men_vc_local_07"	//Grenadier M1
	,"vn_o_men_vc_local_07"	//Grenadier M1
	,"vn_o_men_vc_local_21"	//Grenadier M49/56
	,"vn_o_men_vc_local_21"	//Grenadier M49/56
	,"vn_o_men_vc_local_14"	//AT (Ish-54/ B40)
	,"vn_o_men_vc_local_14"	//AT (Ish-54/ B40)
	,"vn_o_men_vc_local_28"	//AT (M49/56 / B40)
	,"vn_o_men_vc_local_28"	//AT (M49/56 / B40)
	,"vn_o_men_vc_local_28"	//AT (M49/56 / B40)
	,"vn_o_men_vc_local_12"	//Sentry M1891 bayo
	,"vn_o_men_vc_local_26"	//Sentry M1891 bayo
	,"vn_o_men_vc_local_31"	//Marksman M91/30
	,"vn_o_men_vc_local_10"	//Marksman M91/30
	,"vn_o_men_vc_local_24"	//Marksman M91/30
	,"vn_o_men_vc_local_27"	//RTO M1 Carbine bayo
	,"vn_o_men_vc_local_13"	//RTO M1891
	,"vn_o_men_vc_local_01"	//Officer MAT-49
	,"vn_o_men_vc_local_15"	//Officer MAT-49
	,"vn_o_men_vc_regional_14"	//AT Ish-54/ B40
	,"vn_o_men_vc_regional_11"	//Machinegunner DP27
	,"vn_o_men_vc_regional_08"	//Medic Ish-54
	,"vn_o_men_vc_regional_03"	//Rifleman M38 Bayo
	,"vn_o_men_vc_regional_02"	//Rifleman M38
	,"vn_o_men_vc_regional_06"	//Rifleman M3A1
	,"vn_o_men_vc_regional_05"	//Rifleman PPSh-41
	,"vn_o_men_vc_regional_09"	//Sapper M3A1
	,"vn_o_men_vc_regional_12"];	//Sentry M49/56 Bayo
a3e_arr_recon_InfantryTypes = [
	"vn_o_men_nva_dc_07"	//Grenadier M79
	,"vn_o_men_nva_dc_14"	//AT Type 56/ B41
	,"vn_o_men_nva_dc_12"	//Sentry SKS Bayo
	,"vn_o_men_nva_dc_09"	//Sapper PPS-43
	,"vn_o_men_nva_dc_11"	//Machinegunner RPD
	,"vn_o_men_nva_dc_10"	//Marksman SKS
	,"vn_o_men_nva_dc_08"	//Medic PPS-43
	,"vn_o_men_nva_dc_16"	//Mortar Ammo PPS-52
	,"vn_o_men_nva_dc_15"	//Mortar Gunner PPS-43
	,"vn_o_men_nva_dc_17"	//Mortar tripod PPS-43
	,"vn_o_men_nva_dc_06"	//Rifleman PPS-43
	,"vn_o_men_nva_dc_03"	//Rifleman SKS Bayo
	,"vn_o_men_nva_dc_04"	//Rifleman Type 56
	,"vn_o_men_nva_dc_02"	//Rifleman 1 Type 56 Bayo
	,"vn_o_men_nva_dc_05"	//Rifleman 2 Type 56 Bayo
	,"vn_o_men_nva_dc_13"	//RTO Ish-54
	,"vn_o_men_nva_dc_01"];	//Officer Type 56
a3e_arr_recon_I_InfantryTypes = [
	"vn_o_men_vc_08"	//Medic Ish-54
	,"vn_o_men_vc_14"	//AT Type 56/ B41
	,"vn_o_men_vc_16"	//Mortar Ammo PPS-52
	,"vn_o_men_vc_15"	//Mortar gunner PPS-43
	,"vn_o_men_vc_17"	//Mortar tripod K-50m
	,"vn_o_men_vc_11"	//Machinegunner RPD
	,"vn_o_men_vc_10"	//Marksman M91/30
	,"vn_o_men_vc_09"	//Sapper K-50M
	,"vn_o_men_vc_04"	//Rifleman MAT-49	
	,"vn_o_men_vc_05"	//Rifleman PPSh-41
	,"vn_o_men_vc_03"	//Rifleman SKS bayo
	,"vn_o_men_vc_02"	//Rifleman SKS
	,"vn_o_men_vc_06"	//Rifleman Type 56
	,"vn_o_men_vc_13"	//RTO PPSh-41
	,"vn_o_men_vc_07"	//Grenadier SKS
	,"vn_o_men_vc_12"	//Sentry M91/30 bayo
	,"vn_o_men_vc_01"	//Officer K-50M
	,"vn_o_men_vc_regional_07"	//Grenadier M49/56
	,"vn_o_men_vc_regional_10"	//Marksman M49/56
	,"vn_o_men_vc_regional_04"	//Rifleman K-50M
	,"vn_o_men_vc_regional_13"];	//RTO M1891

a3e_units_civilian_InfantryTypes = [
	"vn_c_men_13"		//Men
	,"vn_c_men_14"
	,"vn_c_men_15"
	,"vn_c_men_16"
	,"vn_c_men_17"
	,"vn_c_men_18"
	,"vn_c_men_19"
	,"vn_c_men_20"
	,"vn_c_men_21"
	,"vn_c_men_22"
	,"vn_c_men_23"
	,"vn_c_men_24"
	,"vn_c_men_25"
	,"vn_c_men_26"
	,"vn_c_men_27"
	,"vn_c_men_28"
	,"vn_c_men_29"
	,"vn_c_men_30"
	,"vn_c_men_31"
	,"vn_c_men_32"
	,"vn_c_men_01"	//Elders
	,"vn_c_men_02"
	,"vn_c_men_03"
	,"vn_c_men_04"
	,"vn_c_men_05"	//Doctors
	,"vn_c_men_06"
	,"vn_c_men_07"
	,"vn_c_men_08"
	,"vn_c_men_09"	//Engineers
	,"vn_c_men_10"
	,"vn_c_men_11"
	,"vn_c_men_12"];

//////////////////////////////////////////////////////////////////
// fn_RoadBlocks.sqf
// Array of templates to use for roadblocks
//////////////////////////////////////////////////////////////////
A3E_RoadblockTemplates = [
	"A3E_fnc_Roadblock_vn1"
	,"A3E_fnc_Roadblock_vn2"
	,"A3E_fnc_Roadblock2"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"vn_o_wheeled_btr40_mg_01"
	,"vn_o_wheeled_btr40_mg_01"
	,"vn_o_wheeled_btr40_mg_02"
	,"vn_o_wheeled_btr40_mg_02"
	,"vn_o_wheeled_btr40_mg_03"
	,"vn_o_wheeled_z157_mg_01"
	,"vn_o_wheeled_z157_mg_02"
	,"vn_o_armor_m113_01"
	,"vn_o_armor_m113_01"];	//ToDo
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"vn_o_wheeled_btr40_mg_01_vcmf"
	,"vn_o_wheeled_btr40_mg_01_vcmf"
	,"vn_o_wheeled_btr40_mg_02_vcmf"
	,"vn_o_wheeled_btr40_mg_02_vcmf"
	,"vn_o_wheeled_btr40_mg_03_vcmf"
	,"vn_o_wheeled_z157_mg_01_vcmf"
	,"vn_o_wheeled_z157_mg_02_vcmf"];	//ToDo

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"vn_o_wheeled_btr40_01"
	,"vn_o_wheeled_z157_01"
	,"vn_o_wheeled_z157_02"
	,"vn_o_wheeled_btr40_mg_01"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"vn_o_wheeled_btr40_01_vcmf"
	,"vn_o_wheeled_z157_01_vcmf"
	,"vn_o_wheeled_z157_02_vcmf"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"vn_o_wheeled_btr40_mg_01"
	,"vn_o_wheeled_btr40_mg_02"
	,"vn_o_armor_m113_01"
	,"vn_o_wheeled_z157_mg_01"];

//////////////////////////////////////////////////////////////////
// fn_createMotorPools.sqf
// Array of templates to use for motor pool
//////////////////////////////////////////////////////////////////
A3E_MotorPoolTemplates = [
	"A3E_fnc_BuildMotorPool_VN"
	];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

//////////////////////////////////////////////////////////////////
// fn_createComCenters.sqf
// Array of templates to use for com centers
//////////////////////////////////////////////////////////////////
A3E_ComCenterTemplates = [
	"a3e_fnc_BuildComCenter3"
	,"a3e_fnc_BuildComCenter_VN_nva1"
	,"a3e_fnc_BuildComCenter_VN_nva2"
	];

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"vn_o_wheeled_btr40_mg_03"
	,"vn_o_wheeled_btr40_mg_03"
	,"vn_o_armor_m113_01"
	,"vn_o_armor_m113_acav_01"
	,"vn_o_armor_m113_acav_03"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"vn_o_armor_pt76a_01"
	,"vn_o_armor_pt76b_01"
	,"vn_o_armor_type63_01"
	,"vn_o_armor_type63_01"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"vn_o_nva_static_dshkm_high_01"
	,"vn_o_nva_static_pk_high"
	,"vn_o_nva_static_rpd_high"
	,"vn_o_nva_static_sgm_high_01"
	,"vn_o_vc_static_mg42_high"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"vn_o_bicycle_01"
	,"vn_o_bicycle_02"
	,"vn_o_wheeled_btr40_01"
	,"vn_o_wheeled_btr40_02"
	,"vn_o_wheeled_btr40_mg_01"
	,"vn_o_wheeled_btr40_mg_02"
	,"vn_o_wheeled_btr40_mg_03"
	,"vn_o_wheeled_z157_01"
	,"vn_o_wheeled_z157_02"
	,"vn_o_wheeled_z157_03"
	,"vn_o_wheeled_z157_ammo"
	,"vn_o_wheeled_z157_fuel"
	,"vn_o_wheeled_z157_repair"
	,"vn_o_wheeled_z157_mg_01"
	,"vn_o_wheeled_z157_mg_02"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"vn_c_bicycle_01"
	,"vn_c_wheeled_m151_02"
	,"vn_c_wheeled_m151_01"
	,"vn_c_car_01_01"
	,"vn_c_car_02_01"
	,"vn_c_car_03_01"
	,"vn_c_car_04_01"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"vn_o_nva_static_at3"
	,"vn_o_nva_static_type56rr"
	,"vn_o_nva_static_dshkm_high_01"
	,"vn_o_nva_static_dshkm_low_02"
	,"vn_o_nva_static_dshkm_low_01"
	,"vn_o_nva_static_pk_high"
	,"vn_o_nva_static_pk_low"
	,"vn_o_nva_static_rpd_high"
	,"vn_o_nva_static_sgm_low_02"
	,"vn_o_nva_static_sgm_low_01"
	,"vn_o_vc_static_mg42_high"
	,"vn_o_vc_static_mg42_low"
	,"vn_o_nva_spiderhole_02"
	,"vn_o_nva_spiderhole_01"
	,"vn_o_nva_spiderhole_03"
	,"vn_o_nva_static_dshkm_high_02"
	,"vn_o_nva_static_sgm_high_01"
	,"vn_o_nva_static_zpu4"
	];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"vn_o_bicycle_01"
	,"vn_o_bicycle_02"
	,"vn_o_wheeled_btr40_01"
	,"vn_o_wheeled_btr40_02"
	,"vn_o_wheeled_btr40_mg_01"
	,"vn_o_wheeled_btr40_mg_02"
	,"vn_o_wheeled_btr40_mg_03"
	,"vn_o_wheeled_z157_01"
	,"vn_o_wheeled_z157_02"
	,"vn_o_wheeled_z157_03"
	,"vn_o_wheeled_z157_ammo"
	,"vn_o_wheeled_z157_fuel"
	,"vn_o_wheeled_z157_repair"
	,"vn_o_wheeled_z157_mg_01"
	,"vn_o_wheeled_z157_mg_02"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"vn_o_air_mi2_04_05"
	,"vn_o_air_mi2_04_06"
	,"vn_o_air_mi2_04_01"
	,"vn_o_air_mi2_04_02"
	,"vn_o_air_mi2_04_03"
	,"vn_o_air_mi2_04_04"
	,"vn_o_air_mi2_05_05"
	,"vn_o_air_mi2_05_06"
	,"vn_o_air_mi2_05_01"
	,"vn_o_air_mi2_05_02"
	,"vn_o_air_mi2_05_03"
	,"vn_o_air_mi2_05_04"
	,"vn_o_air_mi2_03_05"
	,"vn_o_air_mi2_03_06"
	,"vn_o_air_mi2_03_01"
	,"vn_o_air_mi2_03_02"
	,"vn_o_air_mi2_03_03"
	,"vn_o_air_mi2_03_04"];
a3e_arr_O_transport_heli = [
	"vn_o_air_mi2_02_01"
	,"vn_o_air_mi2_01_01"
	,"vn_o_air_mi2_01_03"];
a3e_arr_O_pilots = [
	"vn_o_men_aircrew_01"];
a3e_arr_I_transport_heli = [
	"vn_o_air_mi2_02_02"
	,"vn_o_air_mi2_01_02"];
a3e_arr_I_pilots = [
	"vn_o_men_aircrew_02"];

//////////////////////////////////////////////////////////////////
// fn_createAmmoDepots.sqf
// Array of templates to usefor ammo depots
//////////////////////////////////////////////////////////////////
A3E_AmmoDepotTemplates = [
	"A3E_fnc_AmmoDepot_VN_nva1"
	];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_pm", 50, 4, 8, ["vn_pm_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_vz61_p", 50, 4, 8, ["vn_vz61_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_sks", 100, 4, 8, ["vn_sks_t_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_sks_gl", 50, 2, 4, ["vn_sks_mag","vn_22mm_m60_frag_mag","vn_22mm_m22_smoke_mag","vn_22mm_lume_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_rpd", 30, 2, 4, ["vn_rpd_100_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_ppsh41", 30, 2, 4, ["vn_ppsh41_35_t_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_type56", 25, 2, 4, ["vn_type56_t_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_pps43", 25, 2, 4, ["vn_pps_t_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_pps52", 25, 2, 4, ["vn_pps_t_mag"], 8];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m712", 50, 4, 8, ["vn_m712_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_izh54", 50, 1, 3, ["vn_izh54_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m9130", 40, 1, 3, ["vn_m38_t_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m1891", 40, 1, 3, ["vn_m38_t_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m38", 40, 1, 3, ["vn_m38_t_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_k50m", 30, 1, 3, ["vn_ppsh41_35_t_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_mp40", 30, 2, 4, ["vn_mp40_t_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m4956", 40, 2, 4, ["vn_m4956_10_t_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_mat49_vc", 30, 1, 3, ["vn_mat49_vc_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_ppsh41", 30, 1, 3, ["vn_ppsh41_71_t_mag"], 8];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_fkb1_pm", 50, 1, 2, ["vn_pm_mag"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_sks_sniper", 40, 2, 4, ["vn_sks_t_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_vz54", 40, 2, 4, ["vn_m38_t_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_pk", 25, 1, 2, ["vn_pk_100_mag"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m1carbine_gl", 30, 2, 4, ["vn_carbine_15_t_mag", "vn_22mm_m1a2_frag_mag","vn_22mm_lume_mag","vn_22mm_m22_smoke_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m1895_sd", 25, 1, 2, ["vn_m1895_mag"], 5];
// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m3a1", 40, 2, 4, ["vn_m3a1_t_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_izh54_shorty", 40, 2, 4, ["vn_izh54_mag"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m4956_sniper", 30, 2, 4, ["vn_m4956_10_t_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m4956_gl", 40, 2, 4, ["vn_m4956_10_mag","vn_22mm_he_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_k50m", 30, 2, 4, ["vn_ppsh41_71_t_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_dp28", 40, 2, 4, ["vn_dp28_mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m79", 25, 2, 4, ["vn_40mm_m381_he_mag","vn_40mm_m576_buck_mag","vn_40mm_m661_flare_g_mag"], 8];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["vn_rpg2", 70, 1, 2, ["vn_rpg2_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["vn_rpg7", 50, 1, 2, ["vn_rpg7_mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["vn_sa7", 50, 1, 2, ["vn_sa7_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["vn_sa7b", 40, 1, 2, ["vn_sa7b_mag"], 1];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["vn_m72", 10, 3, 5, ["vn_m72_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["vn_m127", 50, 1, 2, ["vn_m127_mag", "vn_m128_mag", "vn_m129_mag"], 3];

// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["vn_mine_satchel_remote_02_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["vn_mine_tm57_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["vn_mine_punji_01_mag"], 5]; //Todo
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["vn_mine_tripwire_f1_02_mag","vn_mine_tripwire_f1_04_mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_f1_grenade_mag","vn_chicom_grenade_mag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_t67_grenade_mag","vn_rkg3_grenade_mag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_rg42_grenade_mag","vn_rgd33_grenade_mag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_molotov_grenade_mag"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_rdg2_mag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_22mm_lume_mag"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 25, 1, 1, ["vn_22mm_cs_mag"], 10];
a3e_arr_AmmoDepotVehicle pushback [objNull, 25, 1, 1, ["vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag"], 15];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_22mm_m60_frag_mag","vn_22mm_m60_heat_mag"], 20];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_b_item_toolkit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_b_item_medikit_01", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_o_item_firstaidkit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_b_item_trapkit", 30, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["vn_o_pack_02"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
//a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02_ghex_F", 10, 1, 2];
/*if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["O_NVGoggles_ghex_F", 10, 1, 3];
};*/
a3e_arr_AmmoDepotItems pushback ["vn_m19_binocs_grn", 50, 2, 3, [], 0];
//a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["vn_b_item_compass", 50, 1, 3];
//a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["vn_o_item_map", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["vn_o_item_radio_m252", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["vn_b_item_watch", 50, 1, 10];
//a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
//a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["vn_b_type56", 20, 1, 2]; //AK bayonet
a3e_arr_AmmoDepotItems pushback ["vn_b_sks", 20, 1, 2]; //SKS bayonet
a3e_arr_AmmoDepotItems pushback ["vn_o_3x_m9130", 20, 1, 2]; //SKS scope
a3e_arr_AmmoDepotItems pushback ["vn_o_3x_vz54", 20, 1, 2]; //VZ54 scope
a3e_arr_AmmoDepotItems pushback ["vn_b_m38", 20, 1, 2]; //M38 bayonet
a3e_arr_AmmoDepotItems pushback ["vn_b_camo_m9130", 40, 1, 3]; //
a3e_arr_AmmoDepotItems pushback ["vn_b_camo_vz54", 40, 1, 3]; //
a3e_arr_AmmoDepotItems pushback ["vn_b_m4956", 20, 1, 5]; //
a3e_arr_AmmoDepotItems pushback ["vn_o_4x_m4956", 20, 1, 5]; //
/*if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_NVS", 10, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
};*/


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["vn_izh54_p", "vn_izh54_so_mag", 5];
a3e_arr_CivilianCarWeapons pushback ["vn_m10", "vn_m10_mag", 5];
a3e_arr_CivilianCarWeapons pushback ["vn_m9130", "vn_m38_mag", 6];
a3e_arr_CivilianCarWeapons pushback ["vn_m60_shorty_camo", "vn_m60_100_mag", 6];
a3e_arr_CivilianCarWeapons pushback ["vn_fkb1", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["vn_fkb1_red", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["vn_mc10", "vn_mc10_mag", 6];
a3e_arr_CivilianCarWeapons pushback ["vn_m45_fold", "vn_m45_mag", 6];
a3e_arr_CivilianCarWeapons pushback ["vn_m72", "vn_m72_mag", 2];
a3e_arr_CivilianCarWeapons pushback ["vn_m3a1", "vn_m3a1_t_mag", 6];
a3e_arr_CivilianCarWeapons pushback ["vn_m1928_tommy", "vn_m1a1_30_t_mag", 4];
a3e_arr_CivilianCarWeapons pushback ["vn_f1_smg", "vn_f1_smg_mag", 8];
a3e_arr_CivilianCarWeapons pushback ["vn_m63a_cdo", "vn_m63a_150_mag", 4];
a3e_arr_CivilianCarWeapons pushback ["vn_b_item_trapkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["vn_b_item_medikit_01", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["vn_b_item_toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["vn_m19_binocs_grn", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_m112_remote_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_molotov_grenade_mag", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_m18_yellow_mag", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"vn_o_3x_m9130"
	,"vn_o_4x_m4956"];
//	"optic_Aco"
//	"optic_ACO_grn"
//	,"optic_Arco"
//	,"optic_Hamr"
//	,"optic_MRCO"
//	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"vn_o_3x_m9130"
	,"vn_o_3x_vz54"
	,"vn_o_4x_m4956"];
a3e_arr_NightScopes = [];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [];

//////////////////////////////////////////////////////////////////
// revive/functions/revive/fn_Check_Revive_FAK.sqf and fn_HandleRevive
// additional types of FAKs or Medkits that should work for revives
// arrays have to be global, because check is performed on client
//////////////////////////////////////////////////////////////////
private _faks = [
	"FirstAidKit"
	,"vn_b_item_firstaidkit"
	,"vn_o_item_firstaidkit"];
missionNamespace setvariable ["a3e_arr_faks",_faks,true];
_medkits = [
	"Medikit"
	,"vn_b_item_medikit_01"];
missionNamespace setvariable ["a3e_arr_medkits",_medkits,true];

//////////////////////////////////////////////////////////////////
// ToDo
// fn_addIntel.sqf
// types of intel items you can find on enemies
//////////////////////////////////////////////////////////////////
A3E_IntelItems = [
	"Files"
	,"FileTopSecret"
	,"FilesSecret"
	//,"FlashDisk"
	,"DocumentsSecret"
	,"Wallet_ID"
	,"FileNetworkStructure"
	//,"MobilePhone"
	//,"SmartPhone"
	];

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
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"vn_b_air_ch34_01_01"
	,"vn_b_air_uh1d_02_04"];
a3e_arr_extraction_chopper_escort = [
	"vn_b_air_ah1g_02_usmc"
	,"vn_b_air_ah1g_03_usmc"
	,"vn_b_air_ah1g_04_usmc"
	,"vn_b_air_ah1g_05_usmc"
	,"vn_b_air_ah1g_01_usmc"
	,"vn_b_air_ah1g_07_usmc"
	,"vn_b_air_ah1g_08_usmc"
	,"vn_b_air_ah1g_09_usmc"
	,"vn_b_air_ah1g_10_usmc"
	,"vn_b_air_ah1g_06_usmc"
	,"vn_b_air_uh1c_04_04"
	,"vn_b_air_uh1c_02_04"
	,"vn_b_air_uh1c_05_04"
	,"vn_b_air_uh1e_01_04"
	,"vn_b_air_uh1e_02_04"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"vn_b_boat_12_02"		//PBR	4cargo seats
	,"vn_b_boat_06_02"		//Nasty
	,"vn_b_boat_06_01"
	,"vn_b_boat_05_02"
	,"vn_b_boat_05_01"
	,"vn_b_boat_09_01"];	//STAB M60 6 cargo seats
a3e_arr_extraction_boat_escort = [
	"vn_b_boat_12_03"	//PBR
	,"vn_b_boat_12_04"
	,"vn_b_boat_12_01"
	,"vn_b_boat_12_03"
	,"vn_b_boat_13_02"
	,"vn_b_boat_13_04"
	,"vn_b_boat_13_01"
	,"vn_b_boat_13_03"
	,"vn_b_boat_10_01"	//STAB
	,"vn_b_boat_11_01"
	,"vn_b_boat_06_02"		//Nasty
	,"vn_b_boat_06_01"
	,"vn_b_boat_05_02"
	,"vn_b_boat_05_01"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Cars/APCs that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"vn_b_wheeled_m54_01"	//ToDo
	,"vn_b_wheeled_m54_02"	//
	,"vn_b_wheeled_m54_01_sog"	//
	,"vn_b_wheeled_m54_02_sog"
	,"vn_b_armor_m113_01"];	//
a3e_arr_extraction_car_escort = [
	"vn_b_armor_m113_acav_04"
	,"vn_b_armor_m113_acav_05"
	,"vn_b_armor_m41_01_02"
	,"vn_b_armor_m41_01_02"
	,"vn_b_armor_m41_01_02"
	,"vn_b_armor_m41_01_02"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"vn_o_air_mi2_02_01"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"vn_o_air_mi2_02_01"
	,"vn_o_air_mi2_02_02"];
a3e_arr_searchChopperHard = [
	"vn_o_air_mi2_01_01"
	,"vn_o_air_mi2_01_03"
	,"vn_o_air_mi2_01_02"
	,"vn_o_air_mi2_03_03"
	,"vn_o_air_mi2_03_04"];
a3e_arr_searchChopper_pilot = [
	"vn_o_men_aircrew_01"
	,"vn_o_men_aircrew_02"];
a3e_arr_searchChopper_crew = [
	"vn_o_men_aircrew_03"
	,"vn_o_men_aircrew_04"];

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
	"vn_o_boat_01_00"
	,"vn_o_boat_01_00"
	,"vn_o_boat_01_mg_00"
	,"vn_o_boat_01_mg_00"
	,"vn_o_boat_01_mg_00"
	,"vn_o_boat_02_mg_00"
	,"vn_o_boat_02_mg_00"
	,"vn_o_boat_02_mg_00"
	,"vn_o_boat_02_00"
	,"vn_o_boat_01_01"
	,"vn_o_boat_01_02"
	,"vn_o_boat_08_02"
	,"vn_o_boat_08_01"
	,"vn_o_boat_07_02"
	,"vn_o_boat_07_01"
	,"vn_o_boat_03_02"
	,"vn_o_boat_03_01"
	,"vn_o_boat_04_02"
	,"vn_o_boat_04_01"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "vn_o_ammobox_full_06";
a3e_additional_weapon_box_2 = "vn_o_ammobox_full_05";

//////////////////////////////////////////////////////////////////
// fn_createMortarSites.sqf
// Array of templates to usefor mortar sites
//////////////////////////////////////////////////////////////////
A3E_MortarSiteTemplates = [
	"A3E_fnc_MortarSite_vn_nva1"
	];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"vn_o_nva_static_mortar_type53"
	,"vn_o_nva_static_mortar_type63"
	,"vn_o_nva_static_h12"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"vn_o_air_mig19_mr"];	//ToDo

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
	"vn_air_ah1g_01_wreck"
	,"vn_air_ch34_01_wreck"
	,"vn_air_oh6a_01_wreck"
	,"vn_air_uh1c_01_wreck"
	,"vn_air_uh1d_med_wreck"
	,"vn_air_uh1d_01_wreck"
	,"vn_air_f4b_wreck"
	,"vn_air_f100d_01_wreck"];
a3e_arr_CrashSiteCrew = [
	"vn_b_men_aircrew_09"
	,"vn_b_men_aircrew_10"
	,"vn_b_men_aircrew_11"
	,"vn_b_men_aircrew_12"];
a3e_arr_CrashSiteWrecksCar = [
	"vn_wheeled_m151_01_wreck"
	,"vn_wheeled_m151_01_wreck"
	,"vn_wheeled_m151_01_wreck"
	,"vn_wheeled_m54_fuel_wreck"
	,"vn_wheeled_m54_mg_01_wreck"
	,"vn_wheeled_m54_mg_02_wreck"
	,"vn_wheeled_m54_repair_wreck"
	,"vn_wheeled_m54_01_wreck"
	,"vn_armor_m113_01_wreck"
	,"vn_armor_m113_01_wreck"
	,"vn_armor_m113_acav_01_wreck"
	,"vn_armor_m113_acav_01_wreck"
	,"vn_armor_m41_01_wreck"
	,"vn_armor_m41_01_wreck"
	,"vn_armor_m41_01_wreck"];
a3e_arr_CrashSiteCrewCar = [
	"vn_b_men_army_23"
	,"vn_b_men_army_24"
	,"vn_b_men_army_25"
	,"vn_b_men_army_14"
	,"vn_b_men_army_13"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["vn_m72", 40, 1, 2, ["vn_m72_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["vn_m127", 50, 1, 2, ["vn_m127_mag","vn_m128_mag","vn_m129_mag"], 2];
a3e_arr_CrashSiteWeapons pushback ["vn_xm177_camo", 50, 1, 2, ["vn_m16_20_t_mag"], 10];
a3e_arr_CrashSiteWeapons pushback ["vn_gau5a", 50, 1, 2, ["vn_m16_20_mag"], 10];
a3e_arr_CrashSiteWeapons pushback ["vn_m1a1_tommy", 50, 1, 2, ["vn_m1a1_30_t_mag"], 10];
a3e_arr_CrashSiteWeapons pushback ["vn_m1carbine_gl", 40, 1, 2, ["vn_carbine_15_mag","vn_22mm_m1a2_frag_mag","vn_22mm_lume_mag"], 12];
a3e_arr_CrashSiteWeapons pushback ["vn_m14", 50, 2, 4, ["vn_m14_mag"], 12];
a3e_arr_CrashSiteWeapons pushback ["vn_m14a1", 40, 2, 4, ["vn_m14_mag"], 12];
a3e_arr_CrashSiteWeapons pushback ["vn_m79_p", 50, 2, 4, ["vn_40mm_m381_he_mag", "vn_40mm_m576_buck_mag", "vn_40mm_m661_flare_g_mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["vn_mk22_sd", 30, 1, 2, ["vn_mk22_mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["vn_m63a", 30, 1, 2, ["vn_m63a_30_mag"], 10];
a3e_arr_CrashSiteWeapons pushback ["vn_m63a_lmg", 20, 1, 2, ["vn_m63a_100_mag"], 5];
a3e_arr_CrashSiteWeapons pushback ["vn_m63a_cdo", 20, 1, 2, ["vn_m63a_150_t_mag"], 5];
a3e_arr_CrashSiteWeapons pushback ["vn_mx991_m1911", 50, 1, 2, ["vn_m1911_mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["vn_m60", 30, 1, 2, ["vn_m60_100_mag"], 4];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["vn_mk21_binocs", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["vn_o_4x_m16", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["vn_o_9x_m14", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["vn_bipod_m16", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["vn_b_acc_towel_02", 20, 1, 3];



//New stuff for VN

A3E_Trap_Classes = [["random","vn_mine_punji_03"],["random","vn_mine_punji_01"],["random","vn_mine_punji_02"],["random","vn_mine_m14"]];//,["roadcenter","vn_mine_tripwire_m16_04"],["roadcenter","vn_mine_tripwire_arty"],["roadside","vn_mine_tripwire_f1_02"]]; Classnames ofd traps and mines. String or array in form [classname, trigger range, scriptcode]
A3E_Trap_Pathes = ["TRACK", "TRAIL"]; //Classnames of roads and pathes for the traps to spawn

A3E_Var_AllowVanillaNightVision = false;

A3E_MapItemsUsedInMission = ["vn_b_item_map","vn_o_item_map"];
A3E_ItemsToBeRemoved = ["vn_b_item_watch","vn_b_item_compass_sog","vn_b_item_compass"];