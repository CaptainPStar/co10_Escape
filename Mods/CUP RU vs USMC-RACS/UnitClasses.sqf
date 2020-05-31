/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = east;//Player side CUP RU MSV - EMR
A3E_VAR_Side_Opfor = west;//Enemy side CUP USMC woodland
A3E_VAR_Side_Ind = resistance;//Independent side CUP RACS woodland

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_us_CO.paa";
A3E_VAR_Flag_Ind = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_racs_co";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"CUP_I_RACS_Soldier_wdl"
	,"CUP_I_RACS_Soldier_Light_wdl"
	,"CUP_I_RACS_GL_wdl"
	,"CUP_I_RACS_AR_wdl"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17_blk","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_blk_flashlight_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_blk_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];



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
		//Unarmed cars  4 sets
		"CUP_B_M1030_USMC"  //1
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		,"CUP_B_M1030_USMC"  //2
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		,"CUP_B_M1030_USMC"   //3
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		,"CUP_B_M1030_USMC"  //4
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		//Supply Trucks  3 sets
		,"CUP_B_MTVR_Ammo_USMC"  //1
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		,"CUP_B_MTVR_Ammo_USMC"  //2
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		,"CUP_B_MTVR_Ammo_USMC"  //3
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		//Unarmed APCs  1 set
		,"CUP_B_AAV_Unarmed_USMC"
		,"CUP_B_AAV_Unarmed_USMC"
		,"CUP_B_AAV_Unarmed_USMC"
		//Armed Cars  1 set
		,"CUP_B_HMMWV_Avenger_USMC"
		,"CUP_B_HMMWV_M1114_USMC"
		,"CUP_B_HMMWV_MK19_USMC"
		,"CUP_B_HMMWV_TOW_USMC"
		,"CUP_B_HMMWV_M2_USMC"
		,"CUP_B_M1151_M2_USMC"
		,"CUP_B_M1151_Deploy_USMC"
		,"CUP_B_M1151_Mk19_USMC"
		,"CUP_B_M1165_GMV_USMC"
		,"CUP_B_M1167_USMC"
		//MRAPs  1 set
		,"CUP_B_RG31_Mk19_OD_USMC"
		,"CUP_B_RG31E_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_GC_USMC"
		//Light Armed APCs  1 set
		,"CUP_B_LAV25_HQ_USMC"
		,"CUP_B_LAV25_HQ_USMC"
		,"CUP_B_LAV25_HQ_USMC"
		//Heavily Armed APCs or AA  1 set
		,"CUP_B_AAV_USMC"
		,"CUP_B_LAV25_USMC"
		,"CUP_B_LAV25M240_USMC"
		//Artillery  1 set
		,"CUP_B_M270_HE_USMC"
		,"CUP_B_M270_DPICM_USMC"
		//Tanks  1 set
		,"CUP_B_M1A1_Woodland_USMC"
		,"CUP_B_M1A2_TUSK_MG_USMC"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  1 set 
		"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		//Unarmed APCs  2 sets
		,"CUP_I_AAV_Unarmed_RACS"  //1
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_AAV_Unarmed_RACS"  //2
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_M113_Med_RACS"
		//Armed Cars  1 set
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		//Light Armed APCs  2 sets
		,"CUP_I_LAV25_HQ_RACS"  //1
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		,"CUP_I_LAV25_HQ_RACS"  //2
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		//Heavily Armed APCs or AA  1 set
		,"CUP_I_M163_RACS"
		,"CUP_I_AAV_RACS"
		,"CUP_I_LAV25_RACS"
		,"CUP_I_LAV25M240_RACS"
		//Tanks  1 set
		,"CUP_I_M60A3_RACS"
		,"CUP_I_M60A3_TTS_RACS"
		,"CUP_I_T72_RACS"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed cars  3 sets
		"CUP_B_M1030_USMC"  //1
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		,"CUP_B_M1030_USMC"  //2
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		,"CUP_B_M1030_USMC"  //3
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		//Supply Trucks  3 sets
		,"CUP_B_MTVR_Ammo_USMC"  //1
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		,"CUP_B_MTVR_Ammo_USMC"  //2
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		,"CUP_B_MTVR_Ammo_USMC"  //3
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		//Unarmed APCs  2 sets
		,"CUP_I_AAV_Unarmed_RACS"  //1
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_AAV_Unarmed_RACS"  //2
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_M113_Med_RACS"
		//Armed Cars  2 sets
		,"CUP_B_HMMWV_Avenger_USMC"  //1
		,"CUP_B_HMMWV_M1114_USMC"
		,"CUP_B_HMMWV_MK19_USMC"
		,"CUP_B_HMMWV_TOW_USMC"
		,"CUP_B_HMMWV_M2_USMC"
		,"CUP_B_M1151_M2_USMC"
		,"CUP_B_M1151_Deploy_USMC"
		,"CUP_B_M1151_Mk19_USMC"
		,"CUP_B_M1165_GMV_USMC"
		,"CUP_B_M1167_USMC"
		,"CUP_B_HMMWV_Avenger_USMC"  //2
		,"CUP_B_HMMWV_M1114_USMC"
		,"CUP_B_HMMWV_MK19_USMC"
		,"CUP_B_HMMWV_TOW_USMC"
		,"CUP_B_HMMWV_M2_USMC"
		,"CUP_B_M1151_M2_USMC"
		,"CUP_B_M1151_Deploy_USMC"
		,"CUP_B_M1151_Mk19_USMC"
		,"CUP_B_M1165_GMV_USMC"
		,"CUP_B_M1167_USMC"
		//MRAPs  2 sets
		,"CUP_B_RG31_Mk19_OD_USMC"  //1
		,"CUP_B_RG31E_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_GC_USMC"
		,"CUP_B_RG31_Mk19_OD_USMC"  //2
		,"CUP_B_RG31E_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_GC_USMC"
		//Light Armed APCs  1 set
		,"CUP_B_LAV25_HQ_USMC"
		,"CUP_B_LAV25_HQ_USMC"
		,"CUP_B_LAV25_HQ_USMC"
		//Heavily Armed APCs or AA  1 set  
		,"CUP_B_AAV_USMC"
		,"CUP_B_LAV25_USMC"
		,"CUP_B_LAV25M240_USMC"
		//Artillery  1 set
		,"CUP_B_M270_HE_USMC"
		,"CUP_B_M270_DPICM_USMC"
		//Tanks  1 set
		,"CUP_B_M1A1_Woodland_USMC"
		,"CUP_B_M1A2_TUSK_MG_USMC"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  1 set
		"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		//Unarmed APCs  2 sets
		,"CUP_I_AAV_Unarmed_RACS"  //1
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_AAV_Unarmed_RACS"  //2
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		//Armed Cars  2 sets
		,"CUP_I_LR_MG_RACS"  //1
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"  //2
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		//Light Armed APCs  4 sets
		,"CUP_I_LAV25_HQ_RACS"  //1
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		,"CUP_I_LAV25_HQ_RACS"  //2
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"  
		,"CUP_I_LAV25_HQ_RACS"  //3
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"  
		,"CUP_I_LAV25_HQ_RACS"  //4
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		//Heavily Armed APCs or AA  1 set
		,"CUP_I_M163_RACS"
		,"CUP_I_AAV_RACS"
		,"CUP_I_LAV25_RACS"
		,"CUP_I_LAV25M240_RACS"
		//Tanks  1 set
		,"CUP_I_M60A3_RACS"
		,"CUP_I_M60A3_TTS_RACS"
		,"CUP_I_T72_RACS"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed cars  3 sets
		"CUP_B_M1030_USMC"  //1
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		,"CUP_B_M1030_USMC"  //2
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		,"CUP_B_M1030_USMC"  //3
		,"CUP_B_HMMWV_Ambulance_USMC"
		,"CUP_B_HMMWV_Unarmed_USMC"
		,"CUP_B_M1151_USMC"
		,"CUP_B_M1152_USMC"
		,"CUP_B_MTVR_USMC"
		//Supply Trucks  3 sets
		,"CUP_B_MTVR_Ammo_USMC"  //1
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		,"CUP_B_MTVR_Ammo_USMC"  //2
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		,"CUP_B_MTVR_Ammo_USMC"  //3
		,"CUP_B_MTVR_Refuel_USMC"
		,"CUP_B_MTVR_Repair_USMC"
		//Unarmed APCs  1 set
		,"CUP_B_AAV_Unarmed_USMC"
		,"CUP_B_AAV_Unarmed_USMC"
		,"CUP_B_AAV_Unarmed_USMC"
		//Armed Cars  2 sets
		,"CUP_B_HMMWV_Avenger_USMC"  //1
		,"CUP_B_HMMWV_M1114_USMC"
		,"CUP_B_HMMWV_MK19_USMC"
		,"CUP_B_HMMWV_TOW_USMC"
		,"CUP_B_HMMWV_M2_USMC"
		,"CUP_B_M1151_M2_USMC"
		,"CUP_B_M1151_Deploy_USMC"
		,"CUP_B_M1151_Mk19_USMC"
		,"CUP_B_M1165_GMV_USMC"
		,"CUP_B_M1167_USMC"
		,"CUP_B_HMMWV_Avenger_USMC"  //2
		,"CUP_B_HMMWV_M1114_USMC"
		,"CUP_B_HMMWV_MK19_USMC"
		,"CUP_B_HMMWV_TOW_USMC"
		,"CUP_B_HMMWV_M2_USMC"
		,"CUP_B_M1151_M2_USMC"
		,"CUP_B_M1151_Deploy_USMC"
		,"CUP_B_M1151_Mk19_USMC"
		,"CUP_B_M1165_GMV_USMC"
		,"CUP_B_M1167_USMC"
		//MRAPs  2 sets
		,"CUP_B_RG31_Mk19_OD_USMC"  //1
		,"CUP_B_RG31E_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_GC_USMC"
		,"CUP_B_RG31_Mk19_OD_USMC"  //2
		,"CUP_B_RG31E_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_USMC"
		,"CUP_B_RG31_M2_OD_GC_USMC"
		//Light Armed APCs  1 set
		,"CUP_B_LAV25_HQ_USMC"
		,"CUP_B_LAV25_HQ_USMC"
		,"CUP_B_LAV25_HQ_USMC"
		//Heavily Armed APCs or AA  2 sets 
		,"CUP_B_AAV_USMC"  //1
		,"CUP_B_LAV25_USMC"
		,"CUP_B_LAV25M240_USMC"
		,"CUP_B_AAV_USMC"  //2
		,"CUP_B_LAV25_USMC"
		,"CUP_B_LAV25M240_USMC"
		//Artillery  1 set
		,"CUP_B_M270_HE_USMC"
		,"CUP_B_M270_DPICM_USMC"
		//Tanks  2 sets
		,"CUP_B_M1A1_Woodland_USMC"  //1
		,"CUP_B_M1A2_TUSK_MG_USMC"
		,"CUP_B_M1A1_Woodland_USMC"  //2
		,"CUP_B_M1A2_TUSK_MG_USMC"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars  1 set
		"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Ambulance_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		,"CUP_I_LR_Transport_RACS"
		//Unarmed APCs  2 sets
		,"CUP_I_AAV_Unarmed_RACS"  //1
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		,"CUP_I_AAV_Unarmed_RACS"  //2
		,"CUP_I_AAV_Unarmed_RACS"
		,"CUP_I_M113_Med_RACS"
		//Armed Cars  2 sets
		,"CUP_I_LR_MG_RACS"  //1
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"  //2
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		,"CUP_I_LR_MG_RACS"
		//Light Armed APCs  4 sets
		,"CUP_I_LAV25_HQ_RACS"  //1
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		,"CUP_I_LAV25_HQ_RACS"  //2
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		,"CUP_I_LAV25_HQ_RACS"  //3
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		,"CUP_I_LAV25_HQ_RACS"  //4
		,"CUP_I_M113_RACS"
		,"CUP_I_M113_RACS_URB"
		//Heavily Armed APCs or AA  2 sets
		,"CUP_I_M163_RACS"  //1
		,"CUP_I_AAV_RACS"
		,"CUP_I_LAV25_RACS"
		,"CUP_I_LAV25M240_RACS"
		,"CUP_I_M163_RACS"  //2
		,"CUP_I_AAV_RACS"
		,"CUP_I_LAV25_RACS"
		,"CUP_I_LAV25M240_RACS"
		//Tanks  2 sets
		,"CUP_I_M60A3_RACS"  //1
		,"CUP_I_M60A3_TTS_RACS"
		,"CUP_I_T72_RACS"
		,"CUP_I_M60A3_RACS"  //2
		,"CUP_I_M60A3_TTS_RACS"
		,"CUP_I_T72_RACS"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"CUP_B_USMC_Soldier"
	,"CUP_B_USMC_Soldier"
	,"CUP_B_USMC_Soldier"
	,"CUP_B_USMC_Soldier"
	,"CUP_B_USMC_Soldier_GL"
	,"CUP_B_USMC_Soldier_GL"
	,"CUP_B_USMC_Officer"
	,"CUP_B_USMC_Soldier_SL"
	,"CUP_B_USMC_Soldier_SL"
	,"CUP_B_USMC_Soldier_TL"
	,"CUP_B_USMC_Soldier_TL"
	,"CUP_B_USMC_Soldier_LAT"
	,"CUP_B_USMC_Soldier_LAT"
	,"CUP_B_USMC_Soldier_HAT"
	,"CUP_B_USMC_Soldier_AA"
	,"CUP_B_USMC_Soldier_AA"
	,"CUP_B_USMC_Medic"
	,"CUP_B_USMC_Medic"
	,"CUP_B_USMC_Soldier_AR"
	,"CUP_B_USMC_Soldier_AR"
	,"CUP_B_USMC_Soldier_AR"
	,"CUP_B_USMC_Spotter"
	,"CUP_B_USMC_Sniper_M40A3"
	,"CUP_B_USMC_Sniper_M107"
	,"CUP_B_USMC_Soldier_Marksman"
	,"CUP_B_USMC_Engineer"
	,"CUP_B_USMC_Engineer"
	,"CUP_B_USMC_Soldier_AT"
	,"CUP_B_USMC_Soldier_MG"
	,"CUP_B_USMC_Soldier_MG"
	,"CUP_B_USMC_Soldier_UAV"
	,"CUP_B_USMC_SpecOps"
	,"CUP_B_USMC_SpecOps_SD"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"CUP_I_RACS_Soldier_AA_wdl"
	,"CUP_I_RACS_Soldier_AA_wdl"
	,"CUP_I_RACS_Soldier_AAT_wdl"
	,"CUP_I_RACS_Soldier_AMG_wdl"
	,"CUP_I_RACS_Soldier_AMG_wdl"
	,"CUP_I_RACS_Soldier_MAT_wdl"
	,"CUP_I_RACS_Soldier_MAT_wdl"
	,"CUP_I_RACS_AR_wdl"
	,"CUP_I_RACS_AR_wdl"
	,"CUP_I_RACS_Engineer_wdl"
	,"CUP_I_RACS_Engineer_wdl"
	,"CUP_I_RACS_GL_wdl"
	,"CUP_I_RACS_GL_wdl"
	,"CUP_I_RACS_Soldier_HAT_wdl"
	,"CUP_I_RACS_MMG_wdl"
	,"CUP_I_RACS_MMG_wdl"
	,"CUP_I_RACS_M_wdl"
	,"CUP_I_RACS_Medic_wdl"
	,"CUP_I_RACS_Medic_wdl"
	,"CUP_I_RACS_Officer_wdl"
	,"CUP_I_RACS_Officer_wdl"
	,"CUP_I_RACS_Soldier_wdl"
	,"CUP_I_RACS_Soldier_wdl"
	,"CUP_I_RACS_Soldier_wdl"
	,"CUP_I_RACS_Soldier_wdl"
	,"CUP_I_RACS_Soldier_Light_wdl"
	,"CUP_I_RACS_Soldier_Light_wdl"
	,"CUP_I_RACS_Soldier_Light_wdl"
	,"CUP_I_RACS_Soldier_Light_wdl"
	,"CUP_I_RACS_Soldier_LAT_wdl"
	,"CUP_I_RACS_Soldier_LAT_wdl"
	,"CUP_I_RACS_Sniper_wdl"
	,"CUP_I_RACS_SL_wdl"];
a3e_arr_recon_InfantryTypes = [
	"CUP_B_FR_Commander"
	,"CUP_B_FR_Saboteur"
	,"CUP_B_FR_Soldier_Marksman"
	,"CUP_B_FR_Soldier_AR"
	,"CUP_B_FR_Soldier_GL"
	,"CUP_B_FR_Soldier_Exp"
	,"CUP_B_FR_Soldier_Operator"
	,"CUP_B_FR_Soldier_Assault_GL"
	,"CUP_B_FR_Soldier_TL"
	,"CUP_B_FR_Medic"
	,"CUP_B_FR_Soldier_Assault"
	,"CUP_B_FR_Soldier_UAV"];
a3e_arr_recon_I_InfantryTypes = [
	"CUP_I_RACS_RoyalCommando"
	,"CUP_I_RACS_RoyalGuard"
	,"CUP_I_RACS_RoyalMarksman"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
    "CUP_B_HMMWV_Avenger_USMC"
	,"CUP_B_M1151_Deploy_USMC"   
	,"CUP_B_M1151_Mk19_USMC"
	,"CUP_B_M1165_GMV_USMC"
	,"CUP_B_M1167_USMC"
	,"CUP_B_RG31_Mk19_OD_USMC"
	,"CUP_B_RG31_M2_OD_USMC"
	,"CUP_B_RG31_M2_OD_GC_USMC"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"CUP_I_LR_MG_RACS"
	,"CUP_I_LR_MG_RACS"
	,"CUP_I_M113_RACS"
	,"CUP_I_M163_RACS"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"CUP_B_MTVR_USMC"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CUP_I_LR_Transport_RACS"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"CUP_B_RG31E_M2_OD_USMC"
	,"CUP_B_AAV_USMC"
	,"CUP_B_LAV25_USMC"
	,"CUP_B_LAV25M240_USMC"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"CUP_B_RG31_M2_OD_GC_USMC"
	,"CUP_B_RG31_M2_OD_GC_USMC"
	,"CUP_B_RG31_Mk19_OD_USMC"
	,"CUP_B_RG31_Mk19_OD_USMC"
	,"CUP_B_LAV25_USMC"
	,"CUP_B_LAV25M240_USMC"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"CUP_B_M1A1_Woodland_USMC"
	,"CUP_B_M1A2_TUSK_MG_USMC"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"CUP_B_M2StaticMG_USMC"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
    "CUP_B_HMMWV_Ambulance_USMC"
	,"CUP_B_MTVR_USMC"
	,"CUP_B_MTVR_Ammo_USMC"
	,"CUP_B_MTVR_Refuel_USMC"
	,"CUP_B_MTVR_Repair_USMC"
	,"CUP_B_HMMWV_Unarmed_USMC"
	,"CUP_B_M1151_USMC"
	,"CUP_B_M1152_USMC"
	,"CUP_B_HMMWV_M1114_USMC"
	,"CUP_B_HMMWV_MK19_USMC"
	,"CUP_B_HMMWV_TOW_USMC"
	,"CUP_B_HMMWV_M2_USMC"
	,"CUP_B_M1151_Deploy_USMC"
	,"CUP_B_M1151_Mk19_USMC"
	,"CUP_B_M1152_USMC"
	,"CUP_B_M1165_GMV_USMC"
	,"CUP_B_M1167_USMC"
	,"CUP_B_M1151_M2_USMC"
	,"CUP_B_RG31_Mk19_OD_USMC"
	,"CUP_B_RG31_M2_OD_USMC"
	,"CUP_B_RG31E_M2_OD_USMC"
	,"CUP_B_RG31_M2_OD_GC_USMC"
	,"CUP_B_HMMWV_Avenger_USMC"
	,"CUP_B_AAV_USMC"];

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
	"CUP_B_M2StaticMG_USMC"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"CUP_B_AH1Z_Dynamic_USMC"];
a3e_arr_O_transport_heli = [
	"CUP_B_UH1Y_UNA_USMC"
	,"CUP_B_MH60S_FFV_USMC"
	,"CUP_B_UH60S_USN"
	,"CUP_B_MH60S_USMC"
	,"CUP_B_CH53E_USMC"
	,"CUP_B_MV22_USMC"
	,"CUP_B_MV22_USMC_RAMPGUN"];
a3e_arr_O_pilots = [
	"CUP_B_USMC_Pilot"];
a3e_arr_I_transport_heli = [
	"CUP_I_CH47F_RACS"
	,"CUP_I_SA330_Puma_HC1_RACS"
	,"CUP_I_SA330_Puma_HC2_RACS"
	,"CUP_I_UH1H_RACS"
	,"CUP_I_UH1H_Slick_RACS"
	,"CUP_I_UH60L_RACS"
	,"CUP_I_UH60L_FFV_RACS"
	,"CUP_I_UH60L_Unarmed_RACS"
	,"CUP_I_UH60L_Unarmed_FFV_Racs"];
a3e_arr_I_pilots = [
	"CUP_I_GUE_Pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Colt1911", 50, 2, 5, ["CUP_7Rnd_45ACP_1911"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_M9", 50, 2, 5, ["CUP_15Rnd_9x19_M9"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP5A5", 20, 1, 2, ["CUP_30Rnd_9x19_MP5"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A4_base", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A4_grip", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A4_GL", 75, 2, 4, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_black", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_camo_carryhandle", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A3_black", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A3_camo", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_camo", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_BUIS_GL", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_GL_carryhandle", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_GL_carryhandle_camo", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_BUIS_camo_GL", 75, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Glock17", 50, 2, 5, ["CUP_17Rnd_9x19_glock17"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Glock17_flashlight", 50, 2, 5, ["CUP_17Rnd_9x19_glock17"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Glock17_blk", 50, 2, 5, ["CUP_17Rnd_9x19_glock17"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2", 50, 2, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2_GL", 75, 2, 4, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_G36C", 75, 3, 5, ["CUP_30Rnd_556x45_G36"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_G36A", 75, 3, 5, ["CUP_30Rnd_556x45_G36"], 6];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_M240", 20, 1, 2, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_m249_pip1", 50, 2, 4, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_Mk12SPR", 50, 2, 4, ["CUP_20Rnd_556x45_Stanag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M14_DMR", 50, 2, 4, ["CUP_20Rnd_762x51_DMR"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M24_wdl", 50, 2, 4, ["CUP_5Rnd_762x51_M24"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M24_blk", 50, 2, 4, ["CUP_5Rnd_762x51_M24"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M40A3", 50, 2, 4, ["CUP_5Rnd_762x51_M24"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014", 50, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_vfg", 50, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_solidstock", 50, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_Entry", 50, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_Entry_vfg", 50, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M107_Base", 10, 1, 2, ["CUP_10Rnd_127x99_M107"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M107_Pristine", 10, 1, 2, ["CUP_10Rnd_127x99_M107"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M107_Woodland", 10, 1, 2, ["CUP_10Rnd_127x99_M107"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_glaunch_M32", 20, 1, 2, ["CUP_6Rnd_HE_M203"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_M249_E2", 20, 1, 2, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], 4];



// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Mk153Mod0", 50, 1, 3, ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Mk153Mod0_blk", 50, 1, 3, ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M136", 50, 3, 6, ["CUP_M136_M"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Javelin", 25, 1, 2, ["CUP_Javelin_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_Stinger_M"], 0];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_MAAWS", 50, 1, 2, ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M", "MRAWS_HEAT_F", "MRAWS_HE_F"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M47", 10, 1, 2, ["CUP_Dragon_EP1_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M72A6", 50, 3, 6, [], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M72A6_Special", 10, 1, 1, [], 0];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_TimeBomb_M", "CUP_PipeBomb_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "CUP_Mine_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_M67"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_Smoke_M203","CUP_1Rnd_SmokeRed_M203","CUP_1Rnd_SmokeGreen_M203","CUP_1Rnd_SmokeYellow_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["CUP_1Rnd_StarCluster_White_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_1Rnd_StarCluster_Green_M203","CUP_1Rnd_StarFlare_White_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarFlare_Green_M203"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["CUP_B_USMC_MOLLE_WDL"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["CUP_SOFLAM", 10, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Black", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_OD", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Flashlight_Black_L", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Flashlight_OD_L", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight_wdl", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Flashhider_556x45_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Flashhider_556x45_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M16", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M16_camo", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_COMPM4_BLK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ElcanM145", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan_SpecterDR_black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan_SpecterDR_od", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan_SpecterDR_RMR_black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan_SpecterDR_RMR_od", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan_reflex", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Elcan_reflex_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_HoloBlack", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_HoloWdl", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["cup_optic_eotech533grey", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G33_HWS_BLK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G33_HWS_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_10x40_LRT_Woodland", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldM3LR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_20x40_LRT", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_25x50_LRT", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_25x50_LRT_Woodland", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_CQ_T", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Leupold_VX3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_low", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_low_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_M68_BLK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_M68_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_COMPM2_BLK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_COMPM2_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Woodland2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Woodland", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_SUSAT", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_RMR_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_RMR_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_RCO", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01NSN_RMR_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01NSN_RMR_OD", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA31_KF", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA31_KF_Wood", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ELCAN_SpecterDR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_MRad", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_TrijiconRx01_black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_SB_3_12x50_PMII", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_Reflex_Wood", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_TrijiconRx01_black", 10, 1, 3];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PAS_13c1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PAS_13c2", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_10_black", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_10_od", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4_M14", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4_M16", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod_black", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod_OD", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_Harris_1A2_L", 20, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_PB6P9_snds", "CUP_8Rnd_9x18_MakarovSD_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_FNFAL_railed", "CUP_20Rnd_762x51_FNFAL_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_Pellets", 11];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_74Slug", 9];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_CZ550", "CUP_5x_22_LR_17_HMR_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_M14", "CUP_20Rnd_762x51_DMR", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_MicroUzi_snds", "CUP_30Rnd_9x19_UZI", 4];
a3e_arr_CivilianCarWeapons pushback ["CUP_lmg_UK59", "CUP_50Rnd_UK59_762x54R_Tracer", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AKS_Gold", "CUP_30Rnd_762x39_AK47_M", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_launch_RPG18","CUP_RPG18_M", 1];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes:
a3e_arr_Scopes = [
	"CUP_optic_HoloBlack"
	,"CUP_optic_ACOG"
	,"CUP_optic_CompM2_low"
	,"CUP_optic_RCO"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"CUP_optic_LeupoldMk4"
	,"CUP_optic_LeupoldM3LR"
	,"CUP_optic_LeupoldMk4_20x40_LRT"
	,"CUP_optic_LeupoldMk4_25x50_LRT"];
a3e_arr_NightScopes = [
	"CUP_optic_AN_PVS_10_black"
	,"CUP_optic_AN_PVS_4"
	,"CUP_optic_AN_PVS_4_M14"
	,"CUP_optic_AN_PVS_4_M16"];
a3e_arr_TWSScopes = [
     "CUP_optic_AN_PAS_13c1"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"CUP_bipod_VLTOR_Modpod_black"
	,"CUP_bipod_Harris_1A2_L"];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"CUP_O_Mi24_V_Dynamic_RU"
	,"CUP_O_Mi8_RU"];
a3e_arr_extraction_chopper_escort = [
	"CUP_O_Mi24_V_Dynamic_RU"
	,"CUP_O_Mi24_P_Dynamic_RU"
	,"CUP_O_Ka50_DL_RU"
	,"CUP_O_Ka52_RU"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"CUP_USMC_MQ9"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"CUP_B_UH1Y_UNA_USMC"];
a3e_arr_searchChopperHard = [
     "CUP_B_MH60L_DAP_2x_USN"
	,"CUP_B_MH60L_DAP_4x_USN"
    ,"CUP_B_MH60S_USMC"
	,"CUP_B_UH60S_USN"
	,"CUP_B_UH1Y_Gunship_Dynamic_USMC"];
a3e_arr_searchChopper_pilot = [
	"CUP_B_USMC_Pilot"];
a3e_arr_searchChopper_crew = [
	"CUP_B_USMC_Pilot"];

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
a3e_additional_weapon_box_1 = "CUP_USBasicWeaponsBox";
a3e_additional_weapon_box_2 = "CUP_USSpecialWeaponsBox";
a3e_additional_weapon_box_arsenal_cfgPatches = [
	"CUP_Weapons_AA12",
	"CUP_Weapons_ACR",
	"CUP_Weapons_AS50",
	"CUP_Weapons_AWM",
	"CUP_Weapons_CZ750",
	"CUP_Weapons_CZ805",
	"CUP_Weapons_EVO",
	"CUP_Weapons_G36",
	"CUP_Weapons_HK416",
	"CUP_Weapons_L129",
	"CUP_Weapons_L85",
	"CUP_Weapons_M1014",
	"CUP_Weapons_M107",
	"CUP_Weapons_M110",
	"CUP_Weapons_M14",
	"CUP_Weapons_M14_DMR",
	"CUP_Weapons_M16",
	"CUP_Weapons_M24",
	"CUP_Weapons_M240",
	"CUP_Weapons_M249",
	"CUP_Weapons_M60E4",
	"CUP_Weapons_Mk48",
	"CUP_Weapons_RSASS",
	"CUP_Weapons_Sa58",
	"CUP_Weapons_SCAR",
	"CUP_Weapons_Steyr",
	"CUP_Weapons_West_Attachments",
	"CUP_Weapons_XM8"];
a3e_additional_weapon_box_arsenal_weapons = [
	"CUP_glaunch_M32",
	"CUP_glaunch_M79",
	"CUP_glaunch_Mk13"];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"CUP_B_M252_USMC"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"CUP_B_AV8B_DYN_USMC"
	,"CUP_B_F35B_CAS_USMC"];

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