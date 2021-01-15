/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west; //CUP GER KSK
A3E_VAR_Side_Opfor = east; //CUP Takistani Army
A3E_VAR_Side_Ind = resistance; //CUP Takistani Locals

A3E_VAR_Flag_Opfor = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_tka_co";
A3E_VAR_Flag_Ind = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_tkg_co";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"CUP_I_TK_GUE_Soldier"
	,"CUP_I_TK_GUE_Soldier"
	,"CUP_I_TK_GUE_Soldier_GL"
	,"CUP_I_TK_GUE_Guerilla_Enfield" 
	,"CUP_I_TK_GUE_Soldier_AK_47S"
	,"CUP_I_TK_GUE_Soldier_AR"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_smg_SA61","CUP_20Rnd_B_765x17_Ball_M"];


// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_camo_Civ"
	,"CUP_C_Golf4_camodark_Civ"
	,"CUP_C_Golf4_camodigital_Civ"
	,"CUP_C_Golf4_crowe_Civ"
	,"CUP_C_Golf4_kitty_Civ"
	,"CUP_C_Golf4_reptile_Civ"
	,"CUP_C_Golf4_whiteblood_Civ"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_Tractor_CIV"
	,"CUP_C_Tractor_CIV"
	,"CUP_C_Tractor_Old_CIV"
	,"CUP_C_Tractor_Old_CIV"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
    ,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_TT650_TK_CIV"
	,"CUP_C_TT650_TK_CIV"
	,"CUP_C_TT650_TK_CIV"
	,"CUP_C_TT650_TK_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars  3 sets
		"CUP_O_TT650_TKA"  //1
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		,"CUP_O_TT650_TKA"  //2
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		,"CUP_O_TT650_TKA"  //3
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		//Easter Egg Unarmed Car  1 set
		,"CUP_O_Tractor_Old_TKA"
		//Supply Trucks  1 set
		,"CUP_O_V3S_Rearm_TKA"
		,"CUP_O_V3S_Refuel_TKA"
		,"CUP_O_V3S_Repair_TKA"
		,"CUP_O_Ural_Reammo_TKA"
		,"CUP_O_Ural_Refuel_TKA"
		,"CUP_O_Ural_Repair_TKA"
		//Unarmed MRAPS  1 set
		,"CUP_O_BTR40_TKA"
		,"CUP_O_BTR40_TKA"
		,"CUP_O_BTR40_TKA"
		//Unarmed APCS  1 set
		,"CUP_O_BMP2_AMB_TKA"
		,"CUP_O_BMP2_AMB_TKA"
		,"CUP_O_BMP2_AMB_TKA"
		//Armed Cars  2 sets
		,"CUP_O_LR_MG_TKA"  //1
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		,"CUP_O_LR_MG_TKA"  //2
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		//Light Armed APCs  2 sets
		,"CUP_O_BMP_HQ_TKA"  //1
		,"CUP_O_M113_Med_TKA"
		,"CUP_O_BMP_HQ_TKA"  //2
		,"CUP_O_M113_Med_TKA"
		//MRAPs  2 sets
		,"CUP_O_BRDM2_TKA"  //1
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		,"CUP_O_BRDM2_TKA"  //2
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		//Light AA  1 set
		,"CUP_O_Ural_ZU23_TKA"
		,"CUP_O_Ural_ZU23_TKA"
		,"CUP_O_LR_AA_TKA"
		,"CUP_O_UAZ_AA_TKA"
		//Medium AA  1 set
		,"CUP_O_BMP2_ZU_TKA"
		,"CUP_O_BMP2_ZU_TKA"
		//Heavily Armed APCs or AA 1 set
		,"CUP_O_BMP1_TKA"
		,"CUP_O_BMP1P_TKA"
		,"CUP_O_BMP2_TKA"
		,"CUP_O_BTR60_TK"
		,"CUP_O_BTR80_TK"
	    ,"CUP_O_BTR80A_TK"
		,"CUP_O_M113_TKA"
		,"CUP_O_MTLB_pk_TKA"
		,"CUP_O_ZSU23_TK"
		//Artillery
		,"CUP_O_BM21_TKA"
		//Tanks 1 set
		,"CUP_O_T34_TKA"
		,"CUP_O_T55_TK"
		,"CUP_O_T72_TKA"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  5 sets
		"CUP_I_Datsun_4seat_TK"		//1
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //2
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //3
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //4
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //5
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		//Supply Trucks  3 sets
		,"CUP_I_V3S_Rearm_TKG"  //1
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		,"CUP_I_V3S_Rearm_TKG"  //2
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		,"CUP_I_V3S_Rearm_TKG"  //3
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		//Armed Cars Light 3 sets
		,"CUP_I_BTR40_MG_TKG"  //1
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		,"CUP_I_BTR40_MG_TKG"  //2
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		,"CUP_I_BTR40_MG_TKG"  //3
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		//Armed Cars Heavy  1 set
		,"CUP_I_Hilux_armored_AGS30_TK"
		,"CUP_I_Hilux_armored_DSHKM_TK"
		,"CUP_I_Hilux_armored_M2_TK"
		,"CUP_I_Hilux_armored_metis_TK"
		,"CUP_I_Hilux_armored_SPG9_TK"
		,"CUP_I_Hilux_BMP1_TK"
		,"CUP_I_Hilux_btr60_TK"
		//MRAPs  1 set
		,"CUP_I_BRDM2_TK_Gue" 
		,"CUP_I_BRDM2_ATGM_TK_Gue"
		,"CUP_I_BRDM2_HQ_TK_Gue"
		,"CUP_I_Hilux_armored_BMP1_TK"
		,"CUP_I_Hilux_armored_btr60_TK"
		// Light AA  1 set
		,"CUP_I_Ural_ZU23_TK_Gue"
		,"CUP_I_Hilux_igla_TK"
		,"CUP_I_Hilux_armored_igla_TK"
		,"CUP_I_Hilux_zu23_TK"
	    ,"CUP_I_Hilux_armored_zu23_TK"
        ,"CUP_I_Datsun_AA_TK_Random"		
		//Heavily Armed APCs  1 set
		,"CUP_I_BMP1_TK_GUE"
        ,"CUP_I_BMP1_TK_GUE"
		//Artillery
		,"CUP_I_Hilux_MLRS_TK"
		,"CUP_I_Hilux_podnos_TK"
		,"CUP_I_Hilux_UB32_TK"
		,"CUP_I_Hilux_armored_MLRS_TK"
		,"CUP_I_Hilux_armored_podnos_TK"
		,"CUP_I_Hilux_armored_UB32_TK"
        //Tanks 1 set
		,"CUP_I_T34_TK_GUE"
		,"CUP_I_T55_TK_GUE"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars  3 sets
		"CUP_O_TT650_TKA"  //1
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		,"CUP_O_TT650_TKA"  //2
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		,"CUP_O_TT650_TKA"  //3
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		//Easter Egg Unarmed Car  1 set
		,"CUP_O_Tractor_Old_TKA"
		//Supply Trucks  1 set
		,"CUP_O_V3S_Rearm_TKA"
		,"CUP_O_V3S_Refuel_TKA"
		,"CUP_O_V3S_Repair_TKA"
		,"CUP_O_Ural_Reammo_TKA"
		,"CUP_O_Ural_Refuel_TKA"
		,"CUP_O_Ural_Repair_TKA"
		//Unarmed MRAPS  1 set
		,"CUP_O_BTR40_TKA"
		,"CUP_O_BTR40_TKA"
		,"CUP_O_BTR40_TKA"
		//Unarmed APCS  1 set
		,"CUP_O_BMP2_AMB_TKA"
		,"CUP_O_BMP2_AMB_TKA"
		,"CUP_O_BMP2_AMB_TKA"
		//Armed Cars  3 sets
		,"CUP_O_LR_MG_TKA"  //1
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		,"CUP_O_LR_MG_TKA"  //2
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		,"CUP_O_LR_MG_TKA"  //3
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		//Light Armed APCs  2 sets
		,"CUP_O_BMP_HQ_TKA"  //1
		,"CUP_O_M113_Med_TKA"
		,"CUP_O_BMP_HQ_TKA"  //2
		,"CUP_O_M113_Med_TKA"
		//MRAPs  3 sets
		,"CUP_O_BRDM2_TKA"  //1
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		,"CUP_O_BRDM2_TKA"  //2
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		,"CUP_O_BRDM2_TKA"  //3
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		//Light AA  1 set
		,"CUP_O_Ural_ZU23_TKA"
		,"CUP_O_Ural_ZU23_TKA"
		,"CUP_O_LR_AA_TKA"
		,"CUP_O_UAZ_AA_TKA"
		//Medium AA  1 set
		,"CUP_O_BMP2_ZU_TKA"
		,"CUP_O_BMP2_ZU_TKA"
		//Heavily Armed APCs or AA 1 set
		,"CUP_O_BMP1_TKA"
		,"CUP_O_BMP1P_TKA"
		,"CUP_O_BMP2_TKA"
		,"CUP_O_BTR60_TK"
		,"CUP_O_BTR80_TK"
	    ,"CUP_O_BTR80A_TK"
		,"CUP_O_M113_TKA"
		,"CUP_O_MTLB_pk_TKA"
		,"CUP_O_ZSU23_TK"
		//Artillery
		,"CUP_O_BM21_TKA"
		//Tanks 1 set
		,"CUP_O_T34_TKA"
		,"CUP_O_T55_TK"
		,"CUP_O_T72_TKA"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  5 sets
		"CUP_I_Datsun_4seat_TK"		//1
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //2
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //3
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //4
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //5
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		//Supply Trucks  3 sets
		,"CUP_I_V3S_Rearm_TKG"  //1
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		,"CUP_I_V3S_Rearm_TKG"  //2
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		,"CUP_I_V3S_Rearm_TKG"  //3
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		//Armed Cars Light 3 sets
		,"CUP_I_BTR40_MG_TKG"  //1
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		,"CUP_I_BTR40_MG_TKG"  //2
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		,"CUP_I_BTR40_MG_TKG"  //3
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		//Armed Cars Heavy  2 sets
		,"CUP_I_Hilux_armored_AGS30_TK"  //1
		,"CUP_I_Hilux_armored_DSHKM_TK"
		,"CUP_I_Hilux_armored_M2_TK"
		,"CUP_I_Hilux_armored_metis_TK"
		,"CUP_I_Hilux_armored_SPG9_TK"
		,"CUP_I_Hilux_BMP1_TK"
		,"CUP_I_Hilux_btr60_TK"
		,"CUP_I_Hilux_armored_AGS30_TK"  //2
		,"CUP_I_Hilux_armored_DSHKM_TK"
		,"CUP_I_Hilux_armored_M2_TK"
		,"CUP_I_Hilux_armored_metis_TK"
		,"CUP_I_Hilux_armored_SPG9_TK"
		,"CUP_I_Hilux_BMP1_TK"
		,"CUP_I_Hilux_btr60_TK"
		//MRAPs  2 sets
		,"CUP_I_BRDM2_TK_Gue"  //1
		,"CUP_I_BRDM2_ATGM_TK_Gue"
		,"CUP_I_BRDM2_HQ_TK_Gue"
		,"CUP_I_Hilux_armored_BMP1_TK"
		,"CUP_I_Hilux_armored_btr60_TK"
		,"CUP_I_BRDM2_TK_Gue"  //2
		,"CUP_I_BRDM2_ATGM_TK_Gue"
		,"CUP_I_BRDM2_HQ_TK_Gue"
		,"CUP_I_Hilux_armored_BMP1_TK"
		,"CUP_I_Hilux_armored_btr60_TK"
		// Light AA  2 sets
		,"CUP_I_Ural_ZU23_TK_Gue"  //1
		,"CUP_I_Hilux_igla_TK"
		,"CUP_I_Hilux_armored_igla_TK"
		,"CUP_I_Hilux_zu23_TK"
	    ,"CUP_I_Hilux_armored_zu23_TK" 
		,"CUP_I_Datsun_AA_TK_Random"
		,"CUP_I_Ural_ZU23_TK_Gue"  //2
		,"CUP_I_Hilux_igla_TK"
		,"CUP_I_Hilux_armored_igla_TK"
		,"CUP_I_Hilux_zu23_TK"
	    ,"CUP_I_Hilux_armored_zu23_TK"
		,"CUP_I_Datsun_AA_TK_Random"
		//Heavily Armed APCs  1 set
		,"CUP_I_BMP1_TK_GUE"
        ,"CUP_I_BMP1_TK_GUE"
		//Artillery
		,"CUP_I_Hilux_MLRS_TK"
		,"CUP_I_Hilux_podnos_TK"
		,"CUP_I_Hilux_UB32_TK"
		,"CUP_I_Hilux_armored_MLRS_TK"
		,"CUP_I_Hilux_armored_podnos_TK"
		,"CUP_I_Hilux_armored_UB32_TK"
        //Tanks 1 set
		,"CUP_I_T34_TK_GUE"
		,"CUP_I_T55_TK_GUE"];
    };
    default {//A lot (7-8)
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars  3 sets
		"CUP_O_TT650_TKA"  //1
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		,"CUP_O_TT650_TKA"  //2
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		,"CUP_O_TT650_TKA"  //3
		,"CUP_O_LR_Ambulance_TKA"
		,"CUP_O_LR_Transport_TKA"
		,"CUP_O_V3S_Open_TKA"
		,"CUP_O_V3S_Covered_TKA"
		,"CUP_O_UAZ_Unarmed_TKA"
		,"CUP_O_UAZ_Open_TKA"
		,"CUP_O_Ural_TKA"
		,"CUP_O_Ural_Empty_TKA"
		,"CUP_O_Ural_Open_TKA"
		//Easter Egg Unarmed Car  1 set
		,"CUP_O_Tractor_Old_TKA"
		//Supply Trucks  1 set
		,"CUP_O_V3S_Rearm_TKA"
		,"CUP_O_V3S_Refuel_TKA"
		,"CUP_O_V3S_Repair_TKA"
		,"CUP_O_Ural_Reammo_TKA"
		,"CUP_O_Ural_Refuel_TKA"
		,"CUP_O_Ural_Repair_TKA"
		//Unarmed MRAPS  1 set
		,"CUP_O_BTR40_TKA"
		,"CUP_O_BTR40_TKA"
		,"CUP_O_BTR40_TKA"
		//Unarmed APCS  1 set
		,"CUP_O_BMP2_AMB_TKA"
		,"CUP_O_BMP2_AMB_TKA"
		,"CUP_O_BMP2_AMB_TKA"
		//Armed Cars  3 sets
		,"CUP_O_LR_MG_TKA"  //1
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		,"CUP_O_LR_MG_TKA"  //2
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		,"CUP_O_LR_MG_TKA"  //3
		,"CUP_O_LR_SPG9_TKA"
		,"CUP_O_UAZ_AGS30_TKA"
		,"CUP_O_UAZ_MG_TKA"
		,"CUP_O_UAZ_METIS_TKA"
		,"CUP_O_UAZ_SPG9_TKA"
		,"CUP_O_BTR40_MG_TKA"
		//Light Armed APCs  2 sets
		,"CUP_O_BMP_HQ_TKA"  //1
		,"CUP_O_M113_Med_TKA"
		,"CUP_O_BMP_HQ_TKA"  //2
		,"CUP_O_M113_Med_TKA"
		//MRAPs  3 sets
		,"CUP_O_BRDM2_TKA"  //1
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		,"CUP_O_BRDM2_TKA"  //2
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		,"CUP_O_BRDM2_TKA"  //3
		,"CUP_O_BRDM2_ATGM_TKA"
		,"CUP_O_BRDM2_HQ_TKA"
		//Light AA  1 set
		,"CUP_O_Ural_ZU23_TKA"
		,"CUP_O_Ural_ZU23_TKA"
		,"CUP_O_LR_AA_TKA"
		,"CUP_O_UAZ_AA_TKA"
		//Medium AA  1 set
		,"CUP_O_BMP2_ZU_TKA"
		,"CUP_O_BMP2_ZU_TKA"
		//Heavily Armed APCs or AA 2 sets
		,"CUP_O_BMP1_TKA"  //1
		,"CUP_O_BMP1P_TKA"
		,"CUP_O_BMP2_TKA"
		,"CUP_O_BTR60_TK"
		,"CUP_O_BTR80_TK"
	    ,"CUP_O_BTR80A_TK"
		,"CUP_O_M113_TKA"
		,"CUP_O_MTLB_pk_TKA"
		,"CUP_O_ZSU23_TK"
		,"CUP_O_BMP1_TKA"  //2
		,"CUP_O_BMP1P_TKA"
		,"CUP_O_BMP2_TKA"
		,"CUP_O_BTR60_TK"
		,"CUP_O_BTR80_TK"
	    ,"CUP_O_BTR80A_TK"
		,"CUP_O_M113_TKA"
		,"CUP_O_MTLB_pk_TKA"
		,"CUP_O_ZSU23_TK"
		//Artillery
		,"CUP_O_BM21_TKA"
		//Tanks 1 set with extra T72s
		,"CUP_O_T34_TKA"
		,"CUP_O_T55_TK"
		,"CUP_O_T72_TKA"
		,"CUP_O_T72_TKA"
		,"CUP_O_T72_TKA"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  5 sets
		"CUP_I_Datsun_4seat_TK"		//1
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //2
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //3
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //4
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		,"CUP_I_Datsun_4seat_TK"  //5
		,"CUP_I_Hilux_unarmed_TK"
		,"CUP_I_Hilux_armored_unarmed_TK"
		,"CUP_I_V3S_Open_TKG"
		,"CUP_I_V3S_Covered_TKG"
		,"CUP_I_BTR40_TKG"
		//Supply Trucks  3 sets
		,"CUP_I_V3S_Rearm_TKG"  //1
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		,"CUP_I_V3S_Rearm_TKG"  //2
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		,"CUP_I_V3S_Rearm_TKG"  //3
		,"CUP_I_V3S_Refuel_TKG"
		,"CUP_I_V3S_Repair_TKG"
		//Armed Cars Light 3 sets
		,"CUP_I_BTR40_MG_TKG"  //1
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		,"CUP_I_BTR40_MG_TKG"  //2
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		,"CUP_I_BTR40_MG_TKG"  //3
		,"CUP_I_Datsun_PK_TK_Random"
		,"CUP_I_Hilux_AGS30_TK"
		,"CUP_I_Hilux_DSHKM_TK"
		,"CUP_I_Hilux_M2_TK"
		,"CUP_I_Hilux_metis_TK"
		,"CUP_I_Hilux_SPG9_TK"
		//Armed Cars Heavy  2 sets
		,"CUP_I_Hilux_armored_AGS30_TK"  //1
		,"CUP_I_Hilux_armored_DSHKM_TK"
		,"CUP_I_Hilux_armored_M2_TK"
		,"CUP_I_Hilux_armored_metis_TK"
		,"CUP_I_Hilux_armored_SPG9_TK"
		,"CUP_I_Hilux_BMP1_TK"
		,"CUP_I_Hilux_btr60_TK"
		,"CUP_I_Hilux_armored_AGS30_TK"  //2
		,"CUP_I_Hilux_armored_DSHKM_TK"
		,"CUP_I_Hilux_armored_M2_TK"
		,"CUP_I_Hilux_armored_metis_TK"
		,"CUP_I_Hilux_armored_SPG9_TK"
		,"CUP_I_Hilux_BMP1_TK"
		,"CUP_I_Hilux_btr60_TK"
		//MRAPs  2 sets
		,"CUP_I_BRDM2_TK_Gue"  //1
		,"CUP_I_BRDM2_ATGM_TK_Gue"
		,"CUP_I_BRDM2_HQ_TK_Gue"
		,"CUP_I_Hilux_armored_BMP1_TK"
		,"CUP_I_Hilux_armored_btr60_TK"
		,"CUP_I_BRDM2_TK_Gue"  //2
		,"CUP_I_BRDM2_ATGM_TK_Gue"
		,"CUP_I_BRDM2_HQ_TK_Gue"
		,"CUP_I_Hilux_armored_BMP1_TK"
		,"CUP_I_Hilux_armored_btr60_TK"
		// Light AA  2 sets
		,"CUP_I_Ural_ZU23_TK_Gue"  //1
		,"CUP_I_Hilux_igla_TK"
		,"CUP_I_Hilux_armored_igla_TK"
		,"CUP_I_Hilux_zu23_TK"
		,"CUP_I_Hilux_armored_zu23_TK" 
		,"CUP_I_Datsun_AA_TK_Random"
		,"CUP_I_Ural_ZU23_TK_Gue"  //2
		,"CUP_I_Hilux_igla_TK"
		,"CUP_I_Hilux_armored_igla_TK"
		,"CUP_I_Hilux_zu23_TK"
	    ,"CUP_I_Hilux_armored_zu23_TK" 
		,"CUP_I_Datsun_AA_TK_Random"
		//Heavily Armed APCs  2 sets
		,"CUP_I_BMP1_TK_GUE"  //1
        ,"CUP_I_BMP1_TK_GUE"
		,"CUP_I_BMP1_TK_GUE"  //2
        ,"CUP_I_BMP1_TK_GUE"
		//Artillery
		,"CUP_I_Hilux_MLRS_TK"
		,"CUP_I_Hilux_podnos_TK"
		,"CUP_I_Hilux_UB32_TK"
		,"CUP_I_Hilux_armored_MLRS_TK"
		,"CUP_I_Hilux_armored_podnos_TK"
		,"CUP_I_Hilux_armored_UB32_TK"
        //Tanks 2 sets
		,"CUP_I_T34_TK_GUE"  //1
		,"CUP_I_T55_TK_GUE"
		,"CUP_I_T34_TK_GUE"  //2
		,"CUP_I_T55_TK_GUE"];
    };
};	

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"CUP_O_TK_Soldier"
	,"CUP_O_TK_Soldier"
	,"CUP_O_TK_Soldier"
	,"CUP_O_TK_Soldier"
	,"CUP_O_TK_Soldier"
	,"CUP_O_TK_Soldier"
	,"CUP_O_TK_Soldier_Backpack"
	,"CUP_O_TK_Soldier_Backpack"
	,"CUP_O_TK_Soldier_Backpack"
	,"CUP_O_TK_Soldier_Backpack"
	,"CUP_O_TK_Soldier_AAT"
	,"CUP_O_TK_Soldier_AAT"
	,"CUP_O_TK_Soldier_AAT"
	,"CUP_O_TK_Soldier_AMG"
	,"CUP_O_TK_Soldier_AMG"
	,"CUP_O_TK_Soldier_AMG"
	,"CUP_O_TK_Soldier_GL"
	,"CUP_O_TK_Soldier_GL"
	,"CUP_O_TK_Soldier_LAT"
	,"CUP_O_TK_Soldier_LAT"
	,"CUP_O_TK_Soldier_LAT"
	,"CUP_O_TK_Soldier_AT"
	,"CUP_O_TK_Soldier_AT"
	,"CUP_O_TK_Soldier_HAT"
	,"CUP_O_TK_Soldier_AA"
	,"CUP_O_TK_Engineer"
	,"CUP_O_TK_Engineer"
	,"CUP_O_TK_Soldier_MG"
	,"CUP_O_TK_Soldier_MG"
	,"CUP_O_TK_Soldier_AR"
	,"CUP_O_TK_Soldier_AR"
	,"CUP_O_TK_Medic"
	,"CUP_O_TK_Medic"
	,"CUP_O_TK_Soldier_SL"
	,"CUP_O_TK_Soldier_SL"
	,"CUP_O_TK_Officer"
	,"CUP_O_TK_Spotter"
	,"CUP_O_TK_Commander"
	,"CUP_O_TK_Soldier_M"
	,"CUP_O_TK_Soldier_M"
	,"CUP_O_TK_Soldier_M"];
a3e_arr_Escape_InfantryTypes_Ind =  [
	"CUP_I_TK_GUE_Soldier_AA"
	,"CUP_I_TK_GUE_Soldier_AR"
	,"CUP_I_TK_GUE_Soldier_AR"
	,"CUP_I_TK_GUE_Guerilla_Medic"
	,"CUP_I_TK_GUE_Guerilla_Medic"
	,"CUP_I_TK_GUE_Demo"
	,"CUP_I_TK_GUE_Demo"
	,"CUP_I_TK_GUE_Soldier"
	,"CUP_I_TK_GUE_Soldier"
	,"CUP_I_TK_GUE_Soldier"
	,"CUP_I_TK_GUE_Soldier"
	,"CUP_I_TK_GUE_Soldier"
	,"CUP_I_TK_GUE_Soldier_AK_47S"
	,"CUP_I_TK_GUE_Soldier_AK_47S"
	,"CUP_I_TK_GUE_Soldier_AK_47S"
	,"CUP_I_TK_GUE_Soldier_HAT"
	,"CUP_I_TK_GUE_Guerilla_Enfield"
	,"CUP_I_TK_GUE_Guerilla_Enfield"
	,"CUP_I_TK_GUE_Guerilla_Enfield"
	,"CUP_I_TK_GUE_Soldier_GL"
	,"CUP_I_TK_GUE_Soldier_GL"
	,"CUP_I_TK_GUE_Soldier_M16A2"
	,"CUP_I_TK_GUE_Soldier_AAT"
	,"CUP_I_TK_GUE_Soldier_AAT"
	,"CUP_I_TK_GUE_Soldier_LAT"
	,"CUP_I_TK_GUE_Soldier_LAT"
	,"CUP_I_TK_GUE_Soldier_AT"
	,"CUP_I_TK_GUE_Soldier_AT"
	,"CUP_I_TK_GUE_Sniper"
	,"CUP_I_TK_GUE_Mechanic"
	,"CUP_I_TK_GUE_Mechanic"
	,"CUP_I_TK_GUE_Soldier_MG"
	,"CUP_I_TK_GUE_Soldier_MG"
	,"CUP_I_TK_GUE_Soldier_TL"
	,"CUP_I_TK_GUE_Soldier_TL"
	,"CUP_I_TK_GUE_Commander"];
a3e_arr_recon_InfantryTypes = [
	"CUP_O_TK_SpecOps"
	,"CUP_O_TK_SpecOps"
	,"CUP_O_TK_SpecOps"
	,"CUP_O_TK_SpecOps"
	,"CUP_O_TK_SpecOps_TL"
	,"CUP_O_TK_SpecOps_MG"];
a3e_arr_recon_I_InfantryTypes = [
	"CUP_I_TK_GUE_Soldier_M16A2"
	,"CUP_I_TK_GUE_Soldier_M16A2"
	,"CUP_I_TK_GUE_Soldier_M16A2"
	,"CUP_I_TK_GUE_Soldier_GL"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"CUP_O_LR_MG_TKA"
	,"CUP_O_UAZ_MG_TKA"
	,"CUP_O_UAZ_AGS30_TKA"
	,"CUP_O_UAZ_MG_TKA"
	,"CUP_O_UAZ_METIS_TKA"
	,"CUP_O_UAZ_SPG9_TKA"
	,"CUP_O_BTR60_TK"
	,"CUP_O_BTR80_TK"
	,"CUP_O_BTR80A_TK"
	,"CUP_O_BRDM2_TKA"
	,"CUP_O_BRDM2_ATGM_TKA"
	,"CUP_O_M113_TKA"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
    "CUP_I_Hilux_AGS30_TK"
	,"CUP_I_Hilux_DSHKM_TK"
	,"CUP_I_Hilux_M2_TK"
	,"CUP_I_Hilux_metis_TK"
	,"CUP_I_Hilux_SPG9_TK"
	,"CUP_I_Hilux_zu23_TK"
	,"CUP_I_Hilux_armored_AGS30_TK"
	,"CUP_I_Hilux_armored_DSHKM_TK"
	,"CUP_I_Hilux_armored_M2_TK"
	,"CUP_I_Hilux_armored_metis_TK"
	,"CUP_I_Hilux_armored_SPG9_TK"
	,"CUP_I_Hilux_armored_zu23_TK"
    ,"CUP_I_Hilux_armored_BMP1_TK"
    ,"CUP_I_Hilux_armored_btr60_TK"	
	,"CUP_I_BRDM2_TK_Gue"
	,"CUP_I_BRDM2_ATGM_TK_Gue"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
    "CUP_O_V3S_Open_TKA"
	,"CUP_O_V3S_Covered_TKA"
	,"CUP_O_Ural_TKA"
	,"CUP_O_Ural_Open_TKA"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CUP_I_V3S_Open_TKG"
	,"CUP_I_V3S_Covered_TKG"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
    "CUP_O_BMP1_TKA"
	,"CUP_O_BMP1P_TKA"
	,"CUP_O_BMP2_TKA"
	,"CUP_O_BMP2_ZU_TKA"
	,"CUP_O_BTR60_TK"
	,"CUP_O_BTR80_TK"
	,"CUP_O_BTR80A_TK"
	,"CUP_O_M113_TKA"
	,"CUP_O_MTLB_pk_TKA"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"CUP_O_M113_TKA"
	,"CUP_O_BRDM2_TKA"
	,"CUP_O_BRDM2_ATGM_TKA"
	,"CUP_O_BTR60_TK"
	,"CUP_O_BTR80_TK"
	,"CUP_O_BTR80A_TK"
	,"CUP_O_BMP2_ZU_TKA"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"CUP_O_ZSU23_TK"
	,"CUP_O_T72_TKA"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"CUP_O_KORD_high_TK"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
    "CUP_O_LR_AA_TKA"
	,"CUP_O_UAZ_AA_TKA"
	,"CUP_O_Ural_ZU23_TKA"
    ,"CUP_O_LR_Ambulance_TKA"
    ,"CUP_O_LR_MG_TKA"
	,"CUP_O_LR_SPG9_TKA"
	,"CUP_O_LR_Transport_TKA"
	,"CUP_O_UAZ_Unarmed_TKA"
	,"CUP_O_V3S_Open_TKA"
	,"CUP_O_V3S_Covered_TKA"
	,"CUP_O_V3S_Rearm_TKA"
	,"CUP_O_V3S_Refuel_TKA"
	,"CUP_O_V3S_Repair_TKA"
	,"CUP_O_UAZ_Unarmed_TKA"
	,"CUP_O_UAZ_AGS30_TKA"
	,"CUP_O_UAZ_MG_TKA"
	,"CUP_O_UAZ_METIS_TKA"
	,"CUP_O_UAZ_Open_TKA"
	,"CUP_O_UAZ_SPG9_TKA"
	,"CUP_O_Ural_TKA"
	,"CUP_O_Ural_Reammo_TKA"
	,"CUP_O_Ural_Open_TKA"
	,"CUP_O_Ural_Refuel_TKA"
	,"CUP_O_Ural_Repair_TKA"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_camo_Civ"
	,"CUP_C_Golf4_camodark_Civ"
	,"CUP_C_Golf4_camodigital_Civ"
	,"CUP_C_Golf4_crowe_Civ"
	,"CUP_C_Golf4_kitty_Civ"
	,"CUP_C_Golf4_reptile_Civ"
	,"CUP_C_Golf4_whiteblood_Civ"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_Lada_Red_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
    ,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"CUP_O_KORD_high_TK"
	,"CUP_O_KORD_high_TK"
	,"CUP_O_Igla_AA_pod_TK"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"CUP_O_Mi24_D_TK"];
a3e_arr_O_transport_heli = [
	"CUP_O_Mi17_TK"
	,"CUP_O_MI6T_TKA"];
a3e_arr_O_pilots = [
	"CUP_O_TK_Pilot"];
a3e_arr_I_transport_heli = [
	"CUP_I_UH1H_TK_GUE"];
a3e_arr_I_pilots = [
	"CUP_I_TK_GUE_Soldier"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_FNFAL", 100, 3, 5, ["CUP_20Rnd_762x51_FNFAL_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS74U", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2_GL", 75, 2, 4, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];

// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKM", 100, 3, 5, ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_TK_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_LeeEnfield", 100, 3, 5, ["CUP_10x_303_M"], 15];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK74", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKM_GL", 75, 2, 4, ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_TK_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_1Rnd_HE_GP25_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2_GL", 75, 2, 4, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS", 75, 2, 4, ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M"], 6];





// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_RPK74", 50, 2, 4, ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M","CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_PKM", 30, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_SVD_pso", 25, 1, 4, ["CUP_10Rnd_762x54_SVD_M"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_ksvk", 10, 1, 2, ["CUP_5Rnd_127x108_KSVK_M"], 9];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_RPK74_45", 50, 2, 4, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_PKM", 30, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_SVD_pso", 25, 1, 4, ["CUP_10Rnd_762x54_SVD_M"], 9];



// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 50, 1, 2, ["CUP_PG7V_M", "CUP_PG7VM_M", "CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M", "CUP_TBG7V_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG18", 50, 3, 6, ["CUP_RPG18_M"], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Metis", 50, 1, 2, ["CUP_AT13_M", "Vorona_HEAT", "Vorona_HE"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Igla", 50, 1, 2, ["CUP_Igla_M"], 0];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG18", 50, 3, 6, ["CUP_RPG18_M"], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 50, 1, 3, ["CUP_PG7VL_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M47", 50, 1, 2, ["CUP_Dragon_EP1_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_Stinger_M"], 0];


//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_TimeBomb_M", "CUP_PipeBomb_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_IED_V4_M", "CUP_IED_V3_M", "CUP_IED_V2_M", "CUP_IED_V1_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["IEDLandSmall_Remote_Mag", "IEDUrbanSmall_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_MineE_M"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_RGD5", "CUP_HandGrenade_RGO"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_Smoke_M203","CUP_1Rnd_SmokeRed_M203","CUP_1Rnd_SmokeGreen_M203","CUP_1Rnd_SmokeYellow_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["CUP_1Rnd_StarCluster_White_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_1Rnd_StarCluster_Green_M203","CUP_1Rnd_StarFlare_White_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarFlare_Green_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M","CUP_1Rnd_SMOKERED_GP25_M","CUP_1Rnd_SMOKEGREEN_GP25_M","CUP_1Rnd_SMOKEYELLOW_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["CUP_IlumFlareWhite_GP25_M","CUP_IlumFlareRed_GP25_M","CUP_IlumFlareGreen_GP25_M"], 25];

a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["CUP_B_TK_CivPack_WDL_Ammo"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Kobra", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_open", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_AK", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_AK_open", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_3", 10, 1, 1];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_3_open", 10, 1, 1];
if(Param_NoNightvision==0) then {
    a3e_arr_AmmoDepotItems pushback ["CUP_NVG_PVS7", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_NSPU", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_GOSHAWK", 10, 1, 3];
};



// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AKS_Gold", "CUP_30Rnd_762x39_AK47_TK_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_FNFAL", "CUP_20Rnd_762x51_FNFAL_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_FNFAL", "CUP_20Rnd_762x51_FNFAL_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_FNFAL", "CUP_20Rnd_762x51_FNFAL_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_CZ550", "CUP_5x_22_LR_17_HMR_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_CZ550", "CUP_5x_22_LR_17_HMR_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_launch_RPG18","CUP_RPG18_M", 0];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M", 7];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_PipeBomb_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_IED_V4_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_IED_V3_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_IED_V2_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_IED_V1_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_HandGrenade_RGD5", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_HandGrenade_RGO", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes:
a3e_arr_Scopes = [
	"CUP_optic_Kobra"
	,"CUP_optic_PSO_1_AK"
	,"CUP_optic_PSO_1_AK_open"];
a3e_arr_Scopes_SMG = [
	"CUP_optic_Kobra"];
a3e_arr_Scopes_Sniper = [
	"CUP_optic_PSO_1"
	,"CUP_optic_PSO_3"];
a3e_arr_NightScopes = [
	"CUP_optic_NSPU"];
a3e_arr_TWSScopes = [
	"CUP_optic_GOSHAWK"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"CUP_bipod_FNFAL"];

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
	 "CUP_B_UH1D_GER_KSK_Des"
	,"CUP_B_UH1D_armed_GER_KSK_Des"
	,"CUP_B_UH1D_gunship_GER_KSK_Des"
	,"CUP_B_UH1D_slick_GER_KSK_Des"];
a3e_arr_extraction_chopper_escort = [
	"CUP_B_AH1Z_USMC"
	,"CUP_B_AH64D_MR_USA"];
	
//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"CUP_B_RHIB_USMC"
	,"CUP_B_RHIB2Turret_USMC"];
a3e_arr_extraction_boat_escort = [
	"CUP_B_RHIB_USMC"
	,"CUP_B_RHIB2Turret_USMC"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"CUP_B_Boxer_GMG_GER_DES"	//6
	,"CUP_B_Boxer_HMG_GER_DES"];	//6
a3e_arr_extraction_car_escort = [
	"CUP_B_Dingo_GL_GER_Des"		//4
	,"CUP_B_Dingo_GER_Des"		//4
	,"CUP_B_Leopard2A6DST_GER"
	,"CUP_B_Leopard2A6DST_GER"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"CUP_O_Pchela1T_RU"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"CUP_O_Mi17_VIV_TK"];
a3e_arr_searchChopperHard = [
	"CUP_O_UH1H_TKA"
	,"CUP_O_UH1H_slick_TKA"
	,"CUP_O_Mi17_TK"];
a3e_arr_searchChopper_pilot = [
	"CUP_O_TK_Pilot"];
a3e_arr_searchChopper_crew = [
	"CUP_O_TK_Pilot"];

if(Param_SearchChopper==0) then {
	a3e_arr_searchChopper = a3e_arr_searchChopperEasy + a3e_arr_searchChopperHard;
};
if(Param_SearchChopper==1) then {
	a3e_arr_searchChopper = a3e_arr_searchChopperEasy;
};
if(Param_SearchChopper==2) then {
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
a3e_additional_weapon_box_1 = "CUP_TKBasicWeapons_EP1";
a3e_additional_weapon_box_2 = "CUP_TKSpecialWeapons_EP1";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"CUP_O_2b14_82mm_TK"]; //O_Mortar_01_F

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
    "CUP_O_L39_TK"
	,"CUP_O_Su25_TKA"];

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
	"CUP_B_GER_HPilot"];
a3e_arr_CrashSiteWrecksCar = [
     "Land_Wreck_HMMWV_F"
	,"Land_Wreck_Hunter_F"
	,"Land_Wreck_Slammer_F"];
a3e_arr_CrashSiteCrewCar = [
     "CUP_B_GER_BW_Soldier"];
	 
	 
	 
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_G36A", 100, 3, 5, ["CUP_30Rnd_556x45_G36"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_smg_MP7_zeiss", 100, 3, 5, ["CUP_40Rnd_46x30_MP7"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_hgun_MP7", 100, 3, 5, ["CUP_20Rnd_46x30_MP7"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_G36K", 75, 3, 5, ["CUP_30Rnd_556x45_G36"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AG36", 75, 2, 4, ["CUP_30Rnd_556x45_G36", "CUP_1Rnd_HEDP_M203"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_G36A", 50, 1, 2, ["CUP_100Rnd_556x45_BetaCMag"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_HK417_20_Scope", 50, 1, 2, ["CUP_20Rnd_762x51_HK417"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_MG3", 25, 1, 2, ["CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_MAAWS_Scope", 15, 1, 1, ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], 3];
a3e_arr_CrashSiteWeapons pushback ["CUP_glaunch_M32", 15, 1, 1, ["CUP_6Rnd_HE_M203"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_G22_des_SBPMII", 15, 1, 1, ["CUP_5Rnd_762x67_G22"], 10];

// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_G36_black", 15, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_AWM", 10, 1, 1];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_MP7", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_SCAR_h", 10, 1, 2];
a3e_arr_CrashSiteItems pushback ["CUP_acc_ANPEQ_2_grey", 10, 1, 5];