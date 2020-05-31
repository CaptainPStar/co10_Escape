/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = east;//Player side CUP RU
A3E_VAR_Side_Opfor = west;//Enemy side CUP CDF winter
A3E_VAR_Side_Ind = resistance;//Independent side CUP ION PMC winter

A3E_VAR_Flag_Opfor = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_cdf_co";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\flag_ion_CO.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"CUP_I_PMC_Winter_Soldier"
	,"CUP_I_PMC_Winter_Soldier"
	,"CUP_I_PMC_Winter_soldier_MG"
	,"CUP_I_PMC_Winter_Soldier_GL"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17_blk","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_blk_flashlight_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_blk_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_smg_Mac10","CUP_30Rnd_45ACP_MAC10_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_smg_SA61","CUP_20Rnd_B_765x17_Ball_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"];


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
	,"CUP_C_S1203_Militia_CIV"
	,"CUP_C_S1203_Militia_CIV"
	,"CUP_C_S1203_Militia_CIV"
	,"CUP_C_S1203_Militia_CIV"
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
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_LADA_LM_CIV"
	,"CUP_LADA_LM_CIV"
	,"CUP_LADA_LM_CIV"
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
	if(Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	};
	if(Param_UseDLCLaws==1) then {
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
		//Unarmed Cars  2 sets
		"CUP_B_S1203_Ambulance_CDF"  //1
		,"CUP_B_UAZ_Unarmed_CDF"
		,"CUP_B_UAZ_Open_CDF"
		,"CUP_B_Kamaz_CDF"
		,"CUP_B_Kamaz_Open_CDF"
		,"CUP_B_Ural_CDF"
		,"CUP_B_Ural_Empty_CDF"
		,"CUP_B_Ural_Open_CDF"
		,"CUP_B_S1203_Ambulance_CDF"  //2
		,"CUP_B_UAZ_Unarmed_CDF"
		,"CUP_B_UAZ_Open_CDF"
		,"CUP_B_Kamaz_CDF"
		,"CUP_B_Kamaz_Open_CDF"
		,"CUP_B_Ural_CDF"
		,"CUP_B_Ural_Empty_CDF"
		,"CUP_B_Ural_Open_CDF"
		//Supply Trucks  1 set
		,"CUP_B_Kamaz_Reammo_CDF"
		,"CUP_B_Kamaz_Refuel_CDF"
		,"CUP_B_Kamaz_Repair_CDF"
		,"CUP_B_Ural_Reammo_CDF"
		,"CUP_B_Ural_Refuel_CDF"
		,"CUP_B_Ural_Repair_CDF"
		//Unarmed APCs  1 set
		,"CUP_B_BMP2_AMB_CDF"
		,"CUP_B_BMP2_AMB_CDF"
		,"CUP_B_BMP2_AMB_CDF"
		//Armed Cars  1 set
		,"CUP_B_Ural_ZU23_CDF"
		,"CUP_B_UAZ_AGS30_CDF"
		,"CUP_B_UAZ_MG_CDF"
		,"CUP_B_UAZ_METIS_CDF"
		,"CUP_B_UAZ_SPG9_CDF"
		//MRAPS  1 set
		,"CUP_B_BRDM2_CDF"
		,"CUP_B_BRDM2_ATGM_CDF"
		,"CUP_B_BRDM2_HQ_CDF"
		//Light armed APCs  1 set
		,"CUP_B_BMP_HQ_CDF"
		,"CUP_B_BMP_HQ_CDF"
		,"CUP_B_BMP_HQ_CDF"
		//Heavily Armed APCs or AA  1 set
		,"CUP_B_ZSU23_CDF"
		,"CUP_B_ZSU23_Afghan_CDF"
		,"CUP_B_BMP2_CDF"
		,"CUP_B_BTR60_CDF"
		,"CUP_B_MTLB_pk_Winter_CDF"
		//Artillery  1 set
		,"CUP_B_BM21_CDF"
		//Tanks  1 set
		,"CUP_B_T72_CDF"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  1 set
		"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		//Armed Cars
		,"CUP_I_SUV_Armored_ION"
		//MRAPS
        ,"CUP_I_RG31_Mk19_W_ION"
		,"CUP_I_RG31E_M2_W_ION"
		,"CUP_I_RG31_M2_W_GC_ION"];
		if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_AT_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_LMG_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_unarmed_ION";
		};
		if(Param_UseDLCLaws==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_ammo_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Cargo_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Repair_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Transport_ION";
		};
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars  2 sets
		"CUP_B_S1203_Ambulance_CDF"  //1
		,"CUP_B_UAZ_Unarmed_CDF"
		,"CUP_B_UAZ_Open_CDF"
		,"CUP_B_Kamaz_CDF"
		,"CUP_B_Kamaz_Open_CDF"
		,"CUP_B_Ural_CDF"
		,"CUP_B_Ural_Empty_CDF"
		,"CUP_B_Ural_Open_CDF"
		,"CUP_B_S1203_Ambulance_CDF"  //2
		,"CUP_B_UAZ_Unarmed_CDF"
		,"CUP_B_UAZ_Open_CDF"
		,"CUP_B_Kamaz_CDF"
		,"CUP_B_Kamaz_Open_CDF"
		,"CUP_B_Ural_CDF"
		,"CUP_B_Ural_Empty_CDF"
		,"CUP_B_Ural_Open_CDF"
		//Supply Trucks  1 set
		,"CUP_B_Kamaz_Reammo_CDF"
		,"CUP_B_Kamaz_Refuel_CDF"
		,"CUP_B_Kamaz_Repair_CDF"
		,"CUP_B_Ural_Reammo_CDF"
		,"CUP_B_Ural_Refuel_CDF"
		,"CUP_B_Ural_Repair_CDF"
		//Unarmed APCs  1 set
		,"CUP_B_BMP2_AMB_CDF"
		,"CUP_B_BMP2_AMB_CDF"
		,"CUP_B_BMP2_AMB_CDF"
		//Armed Cars  2 sets
		,"CUP_B_Ural_ZU23_CDF"  //1
		,"CUP_B_UAZ_AGS30_CDF"
		,"CUP_B_UAZ_MG_CDF"
		,"CUP_B_UAZ_METIS_CDF"
		,"CUP_B_UAZ_SPG9_CDF"
		,"CUP_B_Ural_ZU23_CDF"  //2
		,"CUP_B_UAZ_AGS30_CDF"
		,"CUP_B_UAZ_MG_CDF"
		,"CUP_B_UAZ_METIS_CDF"
		,"CUP_B_UAZ_SPG9_CDF"
		//MRAPS  2 sets
		,"CUP_B_BRDM2_CDF"
		,"CUP_B_BRDM2_ATGM_CDF"
		,"CUP_B_BRDM2_HQ_CDF"
		,"CUP_B_BRDM2_CDF"
		,"CUP_B_BRDM2_ATGM_CDF"
		,"CUP_B_BRDM2_HQ_CDF"
		//Light armed APCs  1 set
		,"CUP_B_BMP_HQ_CDF"
		,"CUP_B_BMP_HQ_CDF"
		,"CUP_B_BMP_HQ_CDF"
		//Heavily Armed APCs or AA  1 set
		,"CUP_B_ZSU23_CDF"
		,"CUP_B_ZSU23_Afghan_CDF"
		,"CUP_B_BMP2_CDF"
		,"CUP_B_BTR60_CDF"
		,"CUP_B_MTLB_pk_Winter_CDF"
		//Artillery  1 set
		,"CUP_B_BM21_CDF"
		//Tanks  1 set
		,"CUP_B_T72_CDF"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  1 set
		"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		//Armed Cars  2 sets
		,"CUP_I_SUV_Armored_ION"
		,"CUP_I_SUV_Armored_ION"
		//MRAPS  2 sets
        ,"CUP_I_RG31_Mk19_W_ION"  //1
		,"CUP_I_RG31E_M2_W_ION"
		,"CUP_I_RG31_M2_W_GC_ION"
		,"CUP_I_RG31_Mk19_W_ION"  //2
		,"CUP_I_RG31E_M2_W_ION"
		,"CUP_I_RG31_M2_W_GC_ION"];
		if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_AT_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_LMG_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_unarmed_ION";
		};
		if(Param_UseDLCLaws==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_ammo_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Cargo_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Repair_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Transport_ION";
		};
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars  2 sets
		"CUP_B_S1203_Ambulance_CDF"  //1
		,"CUP_B_UAZ_Unarmed_CDF"
		,"CUP_B_UAZ_Open_CDF"
		,"CUP_B_Kamaz_CDF"
		,"CUP_B_Kamaz_Open_CDF"
		,"CUP_B_Ural_CDF"
		,"CUP_B_Ural_Empty_CDF"
		,"CUP_B_Ural_Open_CDF"
		,"CUP_B_S1203_Ambulance_CDF"  //2
		,"CUP_B_UAZ_Unarmed_CDF"
		,"CUP_B_UAZ_Open_CDF"
		,"CUP_B_Kamaz_CDF"
		,"CUP_B_Kamaz_Open_CDF"
		,"CUP_B_Ural_CDF"
		,"CUP_B_Ural_Empty_CDF"
		,"CUP_B_Ural_Open_CDF"
		//Supply Trucks  1 set
		,"CUP_B_Kamaz_Reammo_CDF"
		,"CUP_B_Kamaz_Refuel_CDF"
		,"CUP_B_Kamaz_Repair_CDF"
		,"CUP_B_Ural_Reammo_CDF"
		,"CUP_B_Ural_Refuel_CDF"
		,"CUP_B_Ural_Repair_CDF"
		//Unarmed APCs  1 set
		,"CUP_B_BMP2_AMB_CDF"
		,"CUP_B_BMP2_AMB_CDF"
		,"CUP_B_BMP2_AMB_CDF"
		//Armed Cars  2 sets
		,"CUP_B_Ural_ZU23_CDF"  //1
		,"CUP_B_UAZ_AGS30_CDF"
		,"CUP_B_UAZ_MG_CDF"
		,"CUP_B_UAZ_METIS_CDF"
		,"CUP_B_UAZ_SPG9_CDF"
		,"CUP_B_Ural_ZU23_CDF"  //2
		,"CUP_B_UAZ_AGS30_CDF"
		,"CUP_B_UAZ_MG_CDF"
		,"CUP_B_UAZ_METIS_CDF"
		,"CUP_B_UAZ_SPG9_CDF"
		//MRAPS  2 sets
		,"CUP_B_BRDM2_CDF"
		,"CUP_B_BRDM2_ATGM_CDF"
		,"CUP_B_BRDM2_HQ_CDF"
		,"CUP_B_BRDM2_CDF"
		,"CUP_B_BRDM2_ATGM_CDF"
		,"CUP_B_BRDM2_HQ_CDF"
		//Light armed APCs  1 set
		,"CUP_B_BMP_HQ_CDF"
		,"CUP_B_BMP_HQ_CDF"
		,"CUP_B_BMP_HQ_CDF"
		//Heavily Armed APCs or AA  2 sets
		,"CUP_B_ZSU23_CDF"  //1
		,"CUP_B_ZSU23_Afghan_CDF"
		,"CUP_B_BMP2_CDF"
		,"CUP_B_BTR60_CDF"
		,"CUP_B_MTLB_pk_Winter_CDF"
		,"CUP_B_ZSU23_CDF"  //2
		,"CUP_B_ZSU23_Afghan_CDF"
		,"CUP_B_BMP2_CDF"
		,"CUP_B_BTR60_CDF"
		,"CUP_B_MTLB_pk_Winter_CDF"
		//Artillery  1 set
		,"CUP_B_BM21_CDF"
		//Tanks  2 sets
		,"CUP_B_T72_CDF"
		,"CUP_B_T72_CDF"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  1 set
		"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		,"CUP_I_SUV_ION"
		//Armed Cars  2 sets
		,"CUP_I_SUV_Armored_ION"
		,"CUP_I_SUV_Armored_ION"
		//MRAPS  2 sets
        ,"CUP_I_RG31_Mk19_W_ION"  //1
		,"CUP_I_RG31E_M2_W_ION"
		,"CUP_I_RG31_M2_W_GC_ION"
		,"CUP_I_RG31_Mk19_W_ION"  //2
		,"CUP_I_RG31E_M2_W_ION"
		,"CUP_I_RG31_M2_W_GC_ION"];
		if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_AT_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_LMG_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_unarmed_ION";
		};
		if(Param_UseDLCLaws==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_ammo_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Cargo_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Repair_ION";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_Van_Transport_ION";
		};
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"CUP_B_CDF_Soldier_SNW"
	,"CUP_B_CDF_Soldier_AA_SNW"
	,"CUP_B_CDF_Soldier_AAT_SNW"
	,"CUP_B_CDF_Soldier_AMG_SNW"
	,"CUP_B_CDF_Soldier_LAT_SNW"
	,"CUP_B_CDF_Soldier_LAT_SNW"
	,"CUP_B_CDF_Soldier_AR_SNW"
	,"CUP_B_CDF_Soldier_GL_SNW"
	,"CUP_B_CDF_Soldier_MG_SNW"
	,"CUP_B_CDF_Soldier_Marksman_SNW"
	,"CUP_B_CDF_Militia_SNW"
	,"CUP_B_CDF_Officer_SNW"
	,"CUP_B_CDF_Soldier_RPG18_SNW"
	,"CUP_B_CDF_Sniper_SNW"
	,"CUP_B_CDF_Spotter_SNW"
	,"CUP_B_CDF_Soldier_TL_SNW"
	,"CUP_B_CDF_Engineer_SNW"
	,"CUP_B_CDF_Engineer_SNW"
	,"CUP_B_CDF_Medic_SNW"
	,"CUP_B_CDF_Medic_SNW"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"CUP_I_PMC_Winter_Soldier_TL"
	,"CUP_I_PMC_Winter_Soldier"
	,"CUP_I_PMC_Winter_Soldier_GL"
	,"CUP_I_PMC_Winter_Soldier_MG"
	,"CUP_I_PMC_Winter_Soldier_MG_PKM"
	,"CUP_I_PMC_Winter_Soldier_AA"
	,"CUP_I_PMC_Winter_Soldier_AT"
	,"CUP_I_PMC_Winter_Soldier_AT"
	,"CUP_I_PMC_Winter_Soldier_AT"
	,"CUP_I_PMC_Winter_Sniper_KSVK"
	,"CUP_I_PMC_Winter_Sniper"
	,"CUP_I_PMC_Winter_Medic"
	,"CUP_I_PMC_Winter_Engineer"];
a3e_arr_recon_InfantryTypes = [
	"CUP_B_CDF_Soldier_SNW"
	,"CUP_B_CDF_Soldier_AA_SNW"
	,"CUP_B_CDF_Soldier_AAT_SNW"
	,"CUP_B_CDF_Soldier_AMG_SNW"
	,"CUP_B_CDF_Soldier_LAT_SNW"
	,"CUP_B_CDF_Soldier_LAT_SNW"
	,"CUP_B_CDF_Soldier_AR_SNW"
	,"CUP_B_CDF_Soldier_GL_SNW"
	,"CUP_B_CDF_Soldier_MG_SNW"
	,"CUP_B_CDF_Soldier_Marksman_SNW"
	,"CUP_B_CDF_Militia_SNW"
	,"CUP_B_CDF_Officer_SNW"
	,"CUP_B_CDF_Soldier_RPG18_SNW"
	,"CUP_B_CDF_Sniper_SNW"
	,"CUP_B_CDF_Spotter_SNW"
	,"CUP_B_CDF_Soldier_TL_SNW"
	,"CUP_B_CDF_Engineer_SNW"
	,"CUP_B_CDF_Engineer_SNW"
	,"CUP_B_CDF_Medic_SNW"
	,"CUP_B_CDF_Medic_SNW"];
a3e_arr_recon_I_InfantryTypes = [
	"CUP_I_PMC_Winter_Soldier_TL"
	,"CUP_I_PMC_Winter_Soldier"
	,"CUP_I_PMC_Winter_Soldier_GL"
	,"CUP_I_PMC_Winter_Soldier_MG"
	,"CUP_I_PMC_Winter_Soldier_MG_PKM"
	,"CUP_I_PMC_Winter_Soldier_AA"
	,"CUP_I_PMC_Winter_Soldier_AT"
	,"CUP_I_PMC_Winter_Soldier_AT"
	,"CUP_I_PMC_Winter_Soldier_AT"
	,"CUP_I_PMC_Winter_Sniper_KSVK"
	,"CUP_I_PMC_Winter_Sniper"
	,"CUP_I_PMC_Winter_Medic"
	,"CUP_I_PMC_Winter_Engineer"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"CUP_B_BRDM2_ATGM_CDF"
	,"CUP_B_BRDM2_CDF"
	,"CUP_B_BTR60_CDF"
	,"CUP_B_MTLB_pk_Winter_CDF"
	,"CUP_B_UAZ_MG_CDF"
	,"CUP_B_UAZ_METIS_CDF"
	,"CUP_B_UAZ_SPG9_CDF"
	,"CUP_B_UAZ_AGS30_CDF"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"CUP_I_SUV_Armored_ION"
	,"CUP_I_SUV_Armored_ION"
    ,"CUP_I_RG31_Mk19_W_ION"
    ,"CUP_I_RG31E_M2_W_ION"
    ,"CUP_I_RG31_M2_W_GC_ION"];
	if(Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_AT_ION";
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_LMG_ION";
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_unarmed_ION";
	};

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"CUP_B_Ural_CDF"
	,"CUP_B_Ural_Open_CDF"
	,"CUP_B_Kamaz_CDF"
	,"CUP_B_Kamaz_Open_CDF"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CUP_I_SUV_ION"];
	if(Param_UseDLCLaws==1) then {
	a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind pushback "CUP_I_Van_Transport_ION";
	};



// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
    "CUP_B_BMP2_CDF"
	,"CUP_B_BTR60_CDF"
	,"CUP_B_MTLB_pk_Winter_CDF"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	 "CUP_B_BTR60_CDF"
	,"CUP_B_BRDM2_CDF"
	,"CUP_B_BRDM2_ATGM_CDF"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"CUP_B_ZSU23_CDF"
	,"CUP_B_T72_CDF"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"CUP_B_DSHKM_CDF"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"CUP_B_UAZ_Unarmed_CDF"
	,"CUP_B_UAZ_AGS30_CDF"
	,"CUP_B_UAZ_MG_CDF"
	,"CUP_B_UAZ_METIS_CDF"
	,"CUP_B_UAZ_Open_CDF"
	,"CUP_B_UAZ_SPG9_CDF"
	,"CUP_B_Ural_CDF"
	,"CUP_B_Kamaz_CDF"
	,"CUP_B_Kamaz_Reammo_CDF"
	,"CUP_B_Kamaz_Repair_CDF"
	,"CUP_B_S1203_Ambulance_CDF"
	,"CUP_B_MTLB_pk_Winter_CDF"
	,"CUP_B_MTLB_pk_Winter_CDF"
	,"CUP_B_Ural_Refuel_CDF"
	,"CUP_B_Ural_Repair_CDF"
	,"CUP_B_Ural_ZU23_CDF"
	,"CUP_I_SUV_ION"
	,"CUP_I_SUV_Armored_ION"
	,"CUP_I_SUV_Armored_ION"];
	if(Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_AT_ION";
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_LMG_ION";
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "CUP_I_4WD_unarmed_ION";
	};
	if(Param_UseDLCLaws==1) then {
	a3e_arr_ComCenParkedVehicles pushback "CUP_I_Van_ammo_ION";
	a3e_arr_ComCenParkedVehicles pushback "CUP_I_Van_Cargo_ION";
	a3e_arr_ComCenParkedVehicles pushback "CUP_I_Van_Repair_ION";
	a3e_arr_ComCenParkedVehicles pushback "CUP_I_Van_Transport_ION";
	};
	

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
	,"CUP_C_S1203_Militia_CIV"
	,"CUP_C_S1203_Militia_CIV"
	,"CUP_C_S1203_Militia_CIV"
	,"CUP_C_S1203_Militia_CIV"
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
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_C_Lada_White_CIV"
	,"CUP_LADA_LM_CIV"
	,"CUP_LADA_LM_CIV"
	,"CUP_LADA_LM_CIV"
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
	if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(Param_UseDLCLaws==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_service_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"CUP_B_DSHKM_CDF"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"CUP_B_Mi24_D_Dynamic_CDF"];
a3e_arr_O_transport_heli = [
	"CUP_B_Mi17_CDF"
	,"CUP_B_MI6T_CDF"];
a3e_arr_O_pilots = [
	"CUP_B_CDF_Pilot_SNW"];
a3e_arr_I_transport_heli = [
	"CUP_I_MH6M_ION"];
a3e_arr_I_pilots = [
	"CUP_I_PMC_Winter_Pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Makarov", 50, 2, 5, ["CUP_8Rnd_9x18_Makarov_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS", 25, 1, 2, ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS74U", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK74", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK74_GL", 75, 2, 4, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M", "CUP_1Rnd_HE_GP25_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_SVD_pso", 10, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_XM8_Carbine", 100, 3, 5, ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_XM8_Compact", 100, 3, 5, ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_XM8_Carbine_GL", 75, 3, 5, ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36", "CUP_1Rnd_HEDP_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_FNFAL5062", 50, 1, 2, ["CUP_20Rnd_762x51_FNFAL_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_FNFAL", 50, 1, 2, ["CUP_20Rnd_762x51_FNFAL_M"], 4];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_SVD", 50, 2, 4, ["CUP_10Rnd_762x54_SVD_M"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_PKM", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_RPK74_45", 50, 1, 2, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 4];

// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_xm8_SAW", 50, 2, 4, ["CUP_100Rnd_556x45_BetaCMag", "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag", "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag", "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_XM8_sharpshooter", 50, 2, 4, ["CUP_30Rnd_556x45_G36"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_PKM", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_ksvk_PSO3", 10, 1, 2, ["CUP_5Rnd_127x108_KSVK_M"], 9];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 50, 1, 2, ["CUP_PG7V_M", "CUP_PG7VM_M", "CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M", "CUP_TBG7V_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG18", 50, 3, 6, ["CUP_RPG18_M"], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 50, 1, 3, ["CUP_PG7VL_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Igla", 50, 1, 2, ["CUP_Igla_M"], 0];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG18", 50, 3, 6, ["CUP_RPG18_M"], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_Stinger_M"], 0];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_TimeBomb_M", "CUP_PipeBomb_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_MineE_M"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_M67"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_RGO", "CUP_HandGrenade_RGD5"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_Smoke_M203","CUP_1Rnd_SmokeRed_M203","CUP_1Rnd_SmokeGreen_M203","CUP_1Rnd_SmokeYellow_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["CUP_1Rnd_StarCluster_White_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_1Rnd_StarCluster_Green_M203","CUP_1Rnd_StarFlare_White_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarFlare_Green_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M", "CUP_1Rnd_SmokeYellow_GP25_M", "CUP_1Rnd_SmokeGreen_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["CUP_IlumFlareGreen_GP25_M", "CUP_IlumFlareRed_GP25_M", "CUP_IlumFlareWhite_GP25_M"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["CUP_B_USMC_AssaultPack"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_XM8_light_module", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_XM8", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_PB6P9", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_PBS4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Kobra", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_open", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_AK", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_AK_open", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_3", 10, 1, 1];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_3_open", 10, 1, 1];
if(Param_NoNightvision==0) then {
    a3e_arr_AmmoDepotItems pushback ["CUP_NVG_PVS7", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_GOSHAWK", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_NSPU", 10, 1, 3];
};


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_PB6P9_snds", "CUP_8Rnd_9x18_MakarovSD_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_FNFAL", "CUP_20Rnd_762x51_FNFAL_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_M14", "CUP_20Rnd_762x51_DMR", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_MicroUzi_snds", "CUP_30Rnd_9x19_UZI", 4];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_Saiga12K", "CUP_8Rnd_B_Saiga12_74Pellets_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_Saiga12K", "CUP_20Rnd_B_Saiga12_74Pellets_M", 4];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_Saiga12K", "CUP_8Rnd_B_Saiga12_74Slug_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_Saiga12K", "CUP_20Rnd_B_Saiga12_74Slug_M", 4];
a3e_arr_CivilianCarWeapons pushback ["CUP_lmg_UK59", "CUP_50Rnd_UK59_762x54R_Tracer", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AKS_Gold", "CUP_30Rnd_762x39_AK47_M", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_launch_RPG18","CUP_RPG18_M", 1];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_SA61","CUP_50Rnd_B_765x17_Ball_M", 3];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_CZ550", "CUP_5x_22_LR_17_HMR_M", 10];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_PipeBomb_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
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
a3e_arr_Bipods = [];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"CUP_O_Mi8_RU"
	,"CUP_O_Mi24_V_RU"];
a3e_arr_extraction_chopper_escort = [
	"CUP_O_Ka52_RU"
	,"CUP_O_Ka52_Blk_RU"
	,"CUP_O_Ka52_GreyCamo_RU"
	,"CUP_O_Ka52_Grey_RU"
	,"CUP_O_Mi24_P_RU"
	,"CUP_O_Mi24_V_RU"
	,"CUP_O_Ka50_RU"
	,"CUP_O_Ka50_AA_RU"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"CUP_B_Pchela1T_CDF"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"CUP_I_MH6M_ION"
	,"CUP_I_MH6M_ION_OBS"];
a3e_arr_searchChopperHard = [
	"CUP_I_Ka60_Blk_ION"
	,"CUP_I_Ka60_GL_Blk_ION"];
a3e_arr_searchChopper_pilot = [
	"CUP_I_PMC_Winter_Pilot"];
a3e_arr_searchChopper_crew = [
	"CUP_I_PMC_Winter_Pilot"];

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
	"CUP_B_RHIB_USMC"
	,"CUP_B_RHIB2Turret_USMC"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "CUPAmmobox_PMC";
a3e_additional_weapon_box_2 = "CUP_RUSpecialWeaponsBox";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"CUP_B_2b14_82mm_CDF"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"CUP_B_Su25_Dyn_CDF"
	,"CUP_B_SU34_CDF"];

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
	"CUP_Mi8Wreck"];
a3e_arr_CrashSiteCrew = [
	"CUP_O_RU_Pilot_EMR"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_BMP2_F"
	,"Land_Wreck_BRDM2_F"
];
a3e_arr_CrashSiteCrewCar = [
	"CUP_O_RU_Crew_EMR"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["CUP_hgun_PB6P9", 50, 2, 5, ["CUP_8Rnd_9x18_Makarov_M", "CUP_8Rnd_9x18_MakarovSD_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74m", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M","CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74M_GL", 50, 2, 5, ["CUP_30Rnd_545x39_AK_M","CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M","CUP_1Rnd_HE_GP25_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AKS74U", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_RPG7V", 10, 1, 2, ["CUP_PG7V_M"], 2];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_RPG7V", 10, 1, 2, ["CUP_PG7V_M", "CUP_PG7VM_M", "CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M", "CUP_TBG7V_M"], 2];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_RPG18", 10, 2, 4, ["CUP_RPG18_M"], 0];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_RPK74_45", 25, 1, 2, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 5];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_SVD_pso", 25, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_VSSVintorez_pso", 10, 1, 2, ["CUP_20Rnd_9x39_SP5_VSS_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_smg_bizon", 10, 1, 2, ["CUP_64Rnd_9x19_Bizon_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_Pecheneg", 25, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_sgun_Saiga12K", 10, 1, 2, ["CUP_8Rnd_B_Saiga12_74Pellets_M", "CUP_8Rnd_B_Saiga12_74Slug_M"], 6];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_PBS4", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_Bizon", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_Kobra", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_1_AK", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_1", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PechenegScope", 25, 1, 3];