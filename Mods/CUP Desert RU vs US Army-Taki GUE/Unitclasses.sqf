/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */
 
//DON'T USE M1130 IT CAN'T HOLD PASSENGERS FOR SOME REASON

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = east;//Player side CUP RU
A3E_VAR_Side_Opfor = west;//Enemy side CUP US Army desert
A3E_VAR_Side_Ind = resistance; //CUP Takistani Locals

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_us_CO.paa";
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
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Browning_HP","CUP_13Rnd_9x19_Browning_HP"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Browning_HP","CUP_13Rnd_9x19_Browning_HP"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M17_Black","CUP_21Rnd_9x19_M17_Black"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M17_Coyote","CUP_21Rnd_9x19_M17_Coyote"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TT","CUP_8Rnd_762x25_TT"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TT","CUP_8Rnd_762x25_TT"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TT","CUP_8Rnd_762x25_TT"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TT","CUP_8Rnd_762x25_TT"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];

//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_smg_SA61","CUP_20Rnd_B_765x17_Ball_M"];


// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
    //Cars
	"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV" //8
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
    ,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV" 	//16
	,"CUP_C_Golf4_black_Civ"
	,"CUP_C_Golf4_blue_Civ"
	,"CUP_C_Golf4_green_Civ"
	,"CUP_C_Golf4_yellow_Civ"
	,"CUP_C_Golf4_white_Civ"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_black_Civ"
	,"CUP_C_Golf4_blue_Civ"
	,"CUP_C_Golf4_green_Civ"
	,"CUP_C_Golf4_yellow_Civ"
	,"CUP_C_Golf4_white_Civ"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_black_Civ"
	,"CUP_C_Golf4_blue_Civ"
	,"CUP_C_Golf4_green_Civ"
	,"CUP_C_Golf4_yellow_Civ"
	,"CUP_C_Golf4_white_Civ"
	,"CUP_C_Golf4_red_Civ"    //18
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV" //8
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV" //18
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"  //12
    //Sports Cars
	,"CUP_C_Golf4_camo_Civ"
	,"CUP_C_Golf4_camodark_Civ"
	,"CUP_C_Golf4_camodigital_Civ"
	,"CUP_C_Golf4_crowe_Civ"
	,"CUP_C_Golf4_kitty_Civ"
	,"CUP_C_Golf4_reptile_Civ"
	,"CUP_C_Golf4_whiteblood_Civ"
    //Light Trucks Open
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"  //30
    //Light Trucks Closed
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Covered"
    //Heavy Trucks Open
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"  //22
    //Heavy Trucks Covered
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"  //22
    //Transport Cars (Can fit 6 people or more)
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"  //16
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"  //16
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"  //8
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"  //12
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"  //12
    //Buses
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"  //16
    //One Seaters
    ,"CUP_C_TowingTractor_CIV"
	,"CUP_C_TowingTractor_CIV"
	,"CUP_C_TowingTractor_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_Tractor_CIV"
	,"CUP_C_Tractor_CIV"
	,"CUP_C_Tractor_CIV"
	,"CUP_C_Tractor_Old_CIV"
	,"CUP_C_Tractor_Old_CIV"
	,"CUP_C_Tractor_Old_CIV"
	,"CUP_C_TT650_TK_CIV"
	,"CUP_C_TT650_TK_CIV"
	,"CUP_C_TT650_TK_CIV"
	,"CUP_C_TT650_TK_CIV"];  //21
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
		//Unarmed cars
        "CUP_B_M1030_USA"  //1
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //2
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
        ,"CUP_B_M1030_USA"  //3
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
		,"CUP_B_M1030_USA"  //4
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //5
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
        ,"CUP_B_M1030_USA"  //6
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //7
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //8
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"		
		//Supply Trucks 
		,"CUP_B_MTVR_Ammo_USA"  //1
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //2
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //3
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //4
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //5
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //6
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		//Unarmed APCs   2 sets
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"  //2
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		//Armed Cars  1 set
		,"CUP_B_HMMWV_Avenger_USA"
		,"CUP_B_HMMWV_MK19_USA"
		,"CUP_B_HMMWV_TOW_USA"
		,"CUP_B_HMMWV_Crows_M2_USA"
		,"CUP_B_HMMWV_Crows_MK19_USA"	
		,"CUP_B_HMMWV_M2_GPK_USA"
		,"CUP_B_HMMWV_M2_USA"
		,"CUP_B_HMMWV_SOV_M2_USA"
		,"CUP_B_HMMWV_SOV_USA"
		,"CUP_B_M1151_M2_USA"
		,"CUP_B_M1151_Deploy_USA"
		,"CUP_B_M1151_Mk19_USA"
		,"CUP_B_M1165_GMV_USA"
		,"CUP_B_M1167_USA"
		//MRAPs  1 set
        ,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		//Light Armed APCs  1 set
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"	
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"	
        ,"CUP_B_M113_desert_USA"		
		//Heavily Armed APCs or AA
        ,"CUP_B_M6LineBacker_USA_D"
		,"CUP_B_M1126_ICV_M2_Desert"
		,"CUP_B_M1126_ICV_MK19_Desert"
		,"CUP_B_M1128_MGS_Desert"
		,"CUP_B_M1135_ATGMV_Desert"
		,"CUP_B_M2Bradley_USA_D"
		,"CUP_B_M2A3Bradley_USA_D"
		,"CUP_B_M7Bradley_USA_D"
		//Artillery  1 set
		,"CUP_B_M1129_MC_MK19_Desert"
		,"CUP_B_M270_DPICM_USA"
		,"CUP_B_M270_HE_USA"
		//Tanks  1 set
		,"CUP_B_M1A1_DES_US_Army"
		,"CUP_B_M1A2_TUSK_MG_DES_US_Army"];
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
		//Unarmed cars
        "CUP_B_M1030_USA"  //1
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //2
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
        ,"CUP_B_M1030_USA"  //3
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
		,"CUP_B_M1030_USA"  //4
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //5
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
        ,"CUP_B_M1030_USA"  //6
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"		
		//Supply Trucks 
		,"CUP_B_MTVR_Ammo_USA"  //1
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //2
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //3
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //4
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //5
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //6
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		//Unarmed APCs   2 sets
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"  //2
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		//Armed Cars  2 sets
		,"CUP_B_HMMWV_Avenger_USA"
		,"CUP_B_HMMWV_MK19_USA"
		,"CUP_B_HMMWV_TOW_USA"
		,"CUP_B_HMMWV_Crows_M2_USA"
		,"CUP_B_HMMWV_Crows_MK19_USA"	
		,"CUP_B_HMMWV_M2_GPK_USA"
		,"CUP_B_HMMWV_M2_USA"
		,"CUP_B_HMMWV_SOV_M2_USA"
		,"CUP_B_HMMWV_SOV_USA"
		,"CUP_B_M1151_M2_USA"
		,"CUP_B_M1151_Deploy_USA"
		,"CUP_B_M1151_Mk19_USA"
		,"CUP_B_M1165_GMV_USA"
		,"CUP_B_M1167_USA"
		,"CUP_B_HMMWV_Avenger_USA"  //2
		,"CUP_B_HMMWV_MK19_USA"
		,"CUP_B_HMMWV_TOW_USA"
		,"CUP_B_HMMWV_Crows_M2_USA"
		,"CUP_B_HMMWV_Crows_MK19_USA"	
		,"CUP_B_HMMWV_M2_GPK_USA"
		,"CUP_B_HMMWV_M2_USA"
		,"CUP_B_HMMWV_SOV_M2_USA"
		,"CUP_B_HMMWV_SOV_USA"
		,"CUP_B_M1151_M2_USA"
		,"CUP_B_M1151_Deploy_USA"
		,"CUP_B_M1151_Mk19_USA"
		,"CUP_B_M1165_GMV_USA"
		,"CUP_B_M1167_USA"
		//MRAPs  2 sets
        ,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		//Light Armed APCs  1 set
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"	
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"	
        ,"CUP_B_M113_desert_USA"		
		//Heavily Armed APCs or AA
        ,"CUP_B_M6LineBacker_USA_D"
		,"CUP_B_M1126_ICV_M2_Desert"
		,"CUP_B_M1126_ICV_MK19_Desert"
		,"CUP_B_M1128_MGS_Desert"
		,"CUP_B_M1135_ATGMV_Desert"
		,"CUP_B_M2Bradley_USA_D"
		,"CUP_B_M2A3Bradley_USA_D"
		,"CUP_B_M7Bradley_USA_D"
		//Artillery  1 set
		,"CUP_B_M1129_MC_MK19_Desert"
		,"CUP_B_M270_DPICM_USA"
		,"CUP_B_M270_HE_USA"
		//Tanks  1 set
		,"CUP_B_M1A1_DES_US_Army"
		,"CUP_B_M1A2_TUSK_MG_DES_US_Army"];
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
		//Unarmed cars
        "CUP_B_M1030_USA"  //1
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //2
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
        ,"CUP_B_M1030_USA"  //3
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
		,"CUP_B_M1030_USA"  //4
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"
        ,"CUP_B_M1030_USA"  //5
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
        ,"CUP_B_M1030_USA"  //6
		,"CUP_B_HMMWV_Ambulance_USA"
		,"CUP_B_HMMWV_Transport_USA"
		,"CUP_B_HMMWV_Terminal_USA"
		,"CUP_B_M1151_USA"
		,"CUP_B_M1152_USA"
		,"CUP_B_MTVR_USA"	
		//Supply Trucks 
		,"CUP_B_MTVR_Ammo_USA"  //1
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //2
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //3
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //4
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //5
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		,"CUP_B_MTVR_Ammo_USA"  //6
		,"CUP_B_MTVR_Refuel_USA"
		,"CUP_B_MTVR_Repair_USA"
		//Unarmed APCs   2 sets
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"  //2
		,"CUP_B_M1133_MEV_Desert"
		,"CUP_B_M1133_MEV_Desert"
		//Armed Cars  2 sets
		,"CUP_B_HMMWV_Avenger_USA"
		,"CUP_B_HMMWV_MK19_USA"
		,"CUP_B_HMMWV_TOW_USA"
		,"CUP_B_HMMWV_Crows_M2_USA"
		,"CUP_B_HMMWV_Crows_MK19_USA"	
		,"CUP_B_HMMWV_M2_GPK_USA"
		,"CUP_B_HMMWV_M2_USA"
		,"CUP_B_HMMWV_SOV_M2_USA"
		,"CUP_B_HMMWV_SOV_USA"
		,"CUP_B_M1151_M2_USA"
		,"CUP_B_M1151_Deploy_USA"
		,"CUP_B_M1151_Mk19_USA"
		,"CUP_B_M1165_GMV_USA"
		,"CUP_B_M1167_USA"
		,"CUP_B_HMMWV_Avenger_USA"  //2
		,"CUP_B_HMMWV_MK19_USA"
		,"CUP_B_HMMWV_TOW_USA"
		,"CUP_B_HMMWV_Crows_M2_USA"
		,"CUP_B_HMMWV_Crows_MK19_USA"	
		,"CUP_B_HMMWV_M2_GPK_USA"
		,"CUP_B_HMMWV_M2_USA"
		,"CUP_B_HMMWV_SOV_M2_USA"
		,"CUP_B_HMMWV_SOV_USA"
		,"CUP_B_M1151_M2_USA"
		,"CUP_B_M1151_Deploy_USA"
		,"CUP_B_M1151_Mk19_USA"
		,"CUP_B_M1165_GMV_USA"
		,"CUP_B_M1167_USA"
		//MRAPs  2 sets
        ,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		,"CUP_B_RG31_Mk19_USA"
		,"CUP_B_RG31E_M2_USA"
		,"CUP_B_RG31_M2_USA"
		,"CUP_B_RG31_M2_GC_USA"
		//Light Armed APCs  1 set
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"	
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"
        ,"CUP_B_M113_desert_USA"	
        ,"CUP_B_M113_desert_USA"		
		//Heavily Armed APCs or AA  2 sets
        ,"CUP_B_M6LineBacker_USA_D"
		,"CUP_B_M1126_ICV_M2_Desert"
		,"CUP_B_M1126_ICV_MK19_Desert"
		,"CUP_B_M1128_MGS_Desert"
		,"CUP_B_M1135_ATGMV_Desert"
		,"CUP_B_M2Bradley_USA_D"
		,"CUP_B_M2A3Bradley_USA_D"
		,"CUP_B_M7Bradley_USA_D"
		,"CUP_B_M6LineBacker_USA_D"  //2
		,"CUP_B_M1126_ICV_M2_Desert"
		,"CUP_B_M1126_ICV_MK19_Desert"
		,"CUP_B_M1128_MGS_Desert"
		,"CUP_B_M1135_ATGMV_Desert"
		,"CUP_B_M2Bradley_USA_D"
		,"CUP_B_M2A3Bradley_USA_D"
		,"CUP_B_M7Bradley_USA_D"
		//Artillery  1 set
		,"CUP_B_M1129_MC_MK19_Desert"
		,"CUP_B_M270_DPICM_USA"
		,"CUP_B_M270_HE_USA"
		//Tanks  2 sets
		,"CUP_B_M1A1_DES_US_Army"
		,"CUP_B_M1A2_TUSK_MG_DES_US_Army"
		,"CUP_B_M1A1_DES_US_Army"
		,"CUP_B_M1A2_TUSK_MG_DES_US_Army"];
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
    //Rifleman
	"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier_ACOG"
	,"CUP_B_US_Soldier_ACOG"
	,"CUP_B_US_Soldier_ACOG"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Backpack"
	,"CUP_B_US_Soldier_Backpack"
	,"CUP_B_US_Soldier_Backpack"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier"
	,"CUP_B_US_Soldier_ACOG"
	,"CUP_B_US_Soldier_ACOG"
	,"CUP_B_US_Soldier_ACOG"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Light"
	,"CUP_B_US_Soldier_Backpack"
	,"CUP_B_US_Soldier_Backpack"
	,"CUP_B_US_Soldier_Backpack"
    //Ammo carrier Classes
	,"CUP_B_US_Soldier_AAT"
	,"CUP_B_US_Soldier_AHAT"
	,"CUP_B_US_Soldier_AAR"
	,"CUP_B_US_Soldier_AMG"
	,"CUP_B_US_Soldier_AAT"
	,"CUP_B_US_Soldier_AHAT"
	,"CUP_B_US_Soldier_AAR"
	,"CUP_B_US_Soldier_AMG"
    //Machine gunners/Autoriflemen
	,"CUP_B_US_Soldier_AR"
	,"CUP_B_US_Soldier_MG"
	,"CUP_B_US_Soldier_AR"
	,"CUP_B_US_Soldier_MG"
	,"CUP_B_US_Soldier_AR"
	,"CUP_B_US_Soldier_MG"
	,"CUP_B_US_Soldier_AR"
	,"CUP_B_US_Soldier_MG"
	,"CUP_B_US_Soldier_AR"
	,"CUP_B_US_Soldier_MG"
	,"CUP_B_US_Soldier_AR"
	,"CUP_B_US_Soldier_MG"
    //Grenadiers
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
	,"CUP_B_US_Soldier_GL"
    //Buildable Weapon Classes
    //Buildable Mortar Classes
    //Classes with Medkit
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
	,"CUP_B_US_Medic"
    //Classes with Toolkit
	,"CUP_B_US_Engineer"
	,"CUP_B_US_Soldier_Engineer_EOD"
	,"CUP_B_US_Engineer"
	,"CUP_B_US_Soldier_Engineer_EOD"
	,"CUP_B_US_Engineer"
	,"CUP_B_US_Soldier_Engineer_EOD"
    ,"CUP_B_US_Engineer"
	,"CUP_B_US_Soldier_Engineer_EOD"
	,"CUP_B_US_Engineer"
	,"CUP_B_US_Soldier_Engineer_EOD"
	,"CUP_B_US_Engineer"
	,"CUP_B_US_Soldier_Engineer_EOD"
	//Squad Leaders
	,"CUP_B_US_Soldier_SL"
	,"CUP_B_US_Soldier_TL"
	,"CUP_B_US_Soldier_SL"
	,"CUP_B_US_Soldier_TL"
	,"CUP_B_US_Soldier_SL"
	,"CUP_B_US_Soldier_TL"
	,"CUP_B_US_Soldier_SL"
	,"CUP_B_US_Soldier_TL"
    //Light AT
	,"CUP_B_US_Soldier_AT"
	,"CUP_B_US_Soldier_LAT"
	,"CUP_B_US_Soldier_AT"
	,"CUP_B_US_Soldier_LAT"
	,"CUP_B_US_Soldier_AT"
	,"CUP_B_US_Soldier_LAT"
	,"CUP_B_US_Soldier_AT"
	,"CUP_B_US_Soldier_LAT"
	,"CUP_B_US_Soldier_AT"
	,"CUP_B_US_Soldier_LAT"
	,"CUP_B_US_Soldier_AT"
	,"CUP_B_US_Soldier_LAT"
    //Heavy AT
	,"CUP_B_US_Soldier_HAT"
	,"CUP_B_US_Soldier_HAT"
	,"CUP_B_US_Soldier_HAT"
	,"CUP_B_US_Soldier_HAT"
	,"CUP_B_US_Soldier_HAT"
	,"CUP_B_US_Soldier_HAT"
    //AA
	,"CUP_B_US_Soldier_AA"
	,"CUP_B_US_Soldier_AA"
	,"CUP_B_US_Soldier_AA"
	,"CUP_B_US_Soldier_AA"
	,"CUP_B_US_Soldier_AA"
	,"CUP_B_US_Soldier_AA"
    //Marksmen
	,"CUP_B_US_Soldier_Marksman"
	,"CUP_B_US_Soldier_Marksman_EBR_UCP"
	,"CUP_B_US_Soldier_Marksman"
	,"CUP_B_US_Soldier_Marksman_EBR_UCP"
	,"CUP_B_US_Soldier_Marksman"
	,"CUP_B_US_Soldier_Marksman_EBR_UCP"
	,"CUP_B_US_Soldier_Marksman"
	,"CUP_B_US_Soldier_Marksman_EBR_UCP"
    //Snipers
	,"CUP_B_US_Sniper"
	,"CUP_B_US_Sniper_M107"
	,"CUP_B_US_Sniper_M110_TWS"
	,"CUP_B_US_Spotter"
    //UAV
	,"CUP_B_US_Soldier_UAV"
	,"CUP_B_US_Soldier_UAV"
	,"CUP_B_US_Soldier_UAV"
	,"CUP_B_US_Soldier_UAV"
	,"CUP_B_US_Soldier_UAV"
	,"CUP_B_US_Soldier_UAV"
	,"CUP_B_US_Soldier_UAV"
	,"CUP_B_US_Soldier_UAV"
    //Officers
	,"CUP_B_US_Officer"
	,"CUP_B_US_Officer"
	,"CUP_B_US_Officer"
	,"CUP_B_US_Officer"
    //Explosive Specialists
	,"CUP_B_US_Soldier_Engineer_Sapper"
	,"CUP_B_US_Soldier_Engineer_Sapper"
	,"CUP_B_US_Soldier_Engineer_Sapper"
	,"CUP_B_US_Soldier_Engineer_Sapper"
	,"CUP_B_US_Soldier_Engineer_Sapper"
	,"CUP_B_US_Soldier_Engineer_Sapper"];
a3e_arr_Escape_InfantryTypes_Ind = [
    //Rifleman
    //Ammo carrier Classes
    //Machine gunners/Autoriflemen
    //Grenadiers
    //Buildable Weapon Classes
    //Buildable Mortar Classes
    //Classes with Medkit
    //Classes with Toolkit
    //Squad Leaders
    //Light AT
    //Heavy AT
    //AA
    //Marksmen
    //Snipers
    //UAV
    //Officers
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
	"CUP_B_US_SpecOps_AR"
	,"CUP_B_US_SpecOps_JTAC"
	,"CUP_B_US_SpecOps_MG"
	,"CUP_B_US_SpecOps_M"
	,"CUP_B_US_SpecOps_Medic"
	,"CUP_B_US_SpecOps"
	,"CUP_B_US_SpecOps_Assault"
	,"CUP_B_US_SpecOps_M14"
	,"CUP_B_US_SpecOps_Night"
	,"CUP_B_US_SpecOps_SD"
	,"CUP_B_US_SpecOps_TL"
	,"CUP_B_US_SpecOps_UAV"];
a3e_arr_recon_I_InfantryTypes = [
	"CUP_I_TK_GUE_Soldier_M16A2"
	,"CUP_I_TK_GUE_Soldier_M16A2"
	,"CUP_I_TK_GUE_Soldier_M16A2"
	,"CUP_I_TK_GUE_Soldier_GL"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"CUP_B_HMMWV_Crows_M2_USA"
	,"CUP_B_HMMWV_Crows_MK19_USA"
	,"CUP_B_HMMWV_M2_GPK_USA"
	,"CUP_B_M1151_M2_USA"
	,"CUP_B_M1151_Deploy_USA"
	,"CUP_B_M1165_GMV_USA"
	,"CUP_B_RG31_Mk19_USA"
	,"CUP_B_RG31_M2_USA"
	,"CUP_B_RG31_M2_GC_USA"];
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
	"CUP_B_MTVR_USA"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CUP_I_V3S_Open_TKG"
	,"CUP_I_V3S_Covered_TKG"];
    

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"CUP_B_M113_desert_USA"
	,"CUP_B_M113_desert_USA"
	,"CUP_B_M113_desert_USA"
	,"CUP_B_M1126_ICV_M2_Desert"
	,"CUP_B_M1126_ICV_M2_Desert_Slat"
	,"CUP_B_M1126_ICV_MK19_Desert"
	,"CUP_B_M1126_ICV_MK19_Desert_Slat"
	,"CUP_B_M2Bradley_USA_D"
	,"CUP_B_M2A3Bradley_USA_D"
	,"CUP_B_M7Bradley_USA_D"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"CUP_B_M1126_ICV_M2_Desert"
	,"CUP_B_M1126_ICV_MK19_Desert"
	,"CUP_B_RG31_M2_GC_USA"
	,"CUP_B_RG31_M2_GC_USA"
	,"CUP_B_RG31_Mk19_USA"
	,"CUP_B_RG31_Mk19_USA"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"CUP_B_M1A2_TUSK_MG_DES_US_Army"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"CUP_B_M2StaticMG_US"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"CUP_B_M113_desert_USA"
	,"CUP_B_HMMWV_Unarmed_USA"
	,"CUP_B_HMMWV_Ambulance_USA"
	,"CUP_B_HMMWV_M2_GPK_USA"
	,"CUP_B_HMMWV_M2_USA"
	,"CUP_B_HMMWV_MK19_USA"
	,"CUP_B_HMMWV_SOV_M2_USA"
	,"CUP_B_HMMWV_TOW_USA"
	,"CUP_B_HMMWV_Transport_USA"
	,"CUP_B_HMMWV_Avenger_USA"
	,"CUP_B_MTVR_USA"
	,"CUP_B_MTVR_Ammo_USA"
	,"CUP_B_MTVR_Refuel_USA"
	,"CUP_B_MTVR_Repair_USA"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
    //Cars
	"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV" //8
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
    ,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV" 	//16
	,"CUP_C_Golf4_black_Civ"
	,"CUP_C_Golf4_blue_Civ"
	,"CUP_C_Golf4_green_Civ"
	,"CUP_C_Golf4_yellow_Civ"
	,"CUP_C_Golf4_white_Civ"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_black_Civ"
	,"CUP_C_Golf4_blue_Civ"
	,"CUP_C_Golf4_green_Civ"
	,"CUP_C_Golf4_yellow_Civ"
	,"CUP_C_Golf4_white_Civ"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_black_Civ"
	,"CUP_C_Golf4_blue_Civ"
	,"CUP_C_Golf4_green_Civ"
	,"CUP_C_Golf4_yellow_Civ"
	,"CUP_C_Golf4_white_Civ"
	,"CUP_C_Golf4_red_Civ"    //18
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV" //8
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Gray_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Blue_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV"
	,"CUP_C_Volha_Limo_TKCIV" //18
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_GreenTK_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"
	,"CUP_C_Lada_TK2_CIV"  //12
    //Sports Cars
	,"CUP_C_Golf4_camo_Civ"
	,"CUP_C_Golf4_camodark_Civ"
	,"CUP_C_Golf4_camodigital_Civ"
	,"CUP_C_Golf4_crowe_Civ"
	,"CUP_C_Golf4_kitty_Civ"
	,"CUP_C_Golf4_reptile_Civ"
	,"CUP_C_Golf4_whiteblood_Civ"
    //Light Trucks Open
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_4seat"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"
	,"CUP_O_Hilux_unarmed_TK_CIV"  //30
    //Heavy Trucks Open
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"  //22
    //Heavy Trucks Covered
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"  //22
    //Transport Cars (Can fit 6 people or more)
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"
	,"CUP_C_S1203_Ambulance_CIV"  //16
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"
	,"CUP_C_LR_Transport_CTK"  //16
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"  //8
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"  //12
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"  //12
    //Buses
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Ikarus_TKC"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"
	,"CUP_C_Bus_City_TKCIV"];  //16
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
	"CUP_B_M2StaticMG_US"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"CUP_B_AH64D_DL_USA"
	,"CUP_B_AH64_DL_USA"];
a3e_arr_O_transport_heli = [
	"CUP_B_CH47F_USA"
	,"CUP_B_MH47E_USA"];
a3e_arr_O_pilots = [
	"CUP_B_US_Pilot"];
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

 
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_M9", 50, 2, 5, ["CUP_15Rnd_9x19_M9"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Colt1911", 50, 2, 5, ["CUP_7Rnd_45ACP_1911"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP5A5", 20, 1, 2, ["CUP_30Rnd_9x19_MP5"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP5A5_flashlight", 20, 1, 2, ["CUP_30Rnd_9x19_MP5"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP5SD6", 20, 1, 2, ["CUP_30Rnd_9x19_MP5"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP5SD6_Holo_Light", 20, 1, 2, ["CUP_30Rnd_9x19_MP5"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_black", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_desert", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_desert_carryhandle", 50, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A3_black", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A3_desert", 50, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_BUIS_GL", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_GL_carryhandle", 100, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_GL_carryhandle_desert", 50, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M4A1_BUIS_desert_GL", 50, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKM", 100, 3, 5, ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_TK_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_LeeEnfield", 100, 3, 5, ["CUP_10x_303_M"], 15];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK74", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKM_GL", 75, 2, 4, ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_TK_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M", "CUP_1Rnd_HE_GP25_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2", 50, 2, 4, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2_GL", 50, 2, 4, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS", 75, 2, 4, ["CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Yellow_Tracer_762x39_AK47_M"], 6];



// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_AFG_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_FG_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_SFG_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_EGLM_black", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_AFG_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_FG_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_SFG_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_EGLM_black", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_AFG", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_FG", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_SFG", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_EGLM", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_AFG", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_FG", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_SFG", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_EGLM", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_SV", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_SV_black", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_AFG_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_FG_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_SFG_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_EGLM_black", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_AFG_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_FG_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_SFG_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_EGLM_black", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_AFG", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_FG", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_SFG", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_EGLM", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_AFG", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_FG", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_SFG", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_EGLM", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk20_LeupoldMk4MRT", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk20_black", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_bkl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_bkl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_mk18_black", 50, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_mk18_m203_black", 50, 3, 5, ["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag_Tracer_Yellow","CUP_30Rnd_556x45_Stanag_Tracer_Green","CUP_30Rnd_556x45_Stanag_Tracer_Red","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_M240_B", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_m249_pip1", 50, 2, 4, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_m249_pip3", 50, 2, 4, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_m249_pip4", 50, 2, 4, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_Mk48", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_Mk48_tan", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_Mk48_des", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M14_DMR_LeupoldMk4", 50, 1, 2, ["20Rnd_762x51_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_Mk18_blk_LP4", 50, 1, 2, ["CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR","CUP_20Rnd_TE1_Red_Tracer_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR","CUP_20Rnd_TE1_White_Tracer_762x51_DMR"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_Mk18_des", 50, 1, 2, ["CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR","CUP_20Rnd_TE1_Red_Tracer_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR","CUP_20Rnd_TE1_White_Tracer_762x51_DMR"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M24_des_LeupoldMk4LRT", 25, 1, 2, ["CUP_5Rnd_762x51_M24"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M24_blk_LeupoldMk4LRT", 25, 1, 2, ["CUP_5Rnd_762x51_M24"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M110", 50, 2, 4, ["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110","CUP_20Rnd_TE1_Red_Tracer_762x51_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110","CUP_20Rnd_TE1_White_Tracer_762x51_M110"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M110_black", 50, 2, 4, ["CUP_20Rnd_762x51_B_M110","CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110","CUP_20Rnd_TE1_Red_Tracer_762x51_M110","CUP_20Rnd_TE1_Green_Tracer_762x51_M110","CUP_20Rnd_TE1_White_Tracer_762x51_M110"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M107_desert", 10, 1, 1, ["CUP_10Rnd_127x99_M107"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M107_LeupoldMk4", 10, 1, 1, ["CUP_10Rnd_127x99_M107"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M107_LeupoldVX3", 10, 1, 1, ["CUP_10Rnd_127x99_M107"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014", 10, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_vfg", 10, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_solidstock", 10, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_Entry", 10, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_sgun_M1014_Entry_vfg", 10, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_glaunch_M32", 20, 1, 2, ["CUP_6Rnd_HE_M203"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_RPK74_45", 50, 2, 4, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_PKM", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_SVD_pso", 50, 1, 4, ["CUP_10Rnd_762x54_SVD_M"], 9];



// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M136", 50, 1, 3, ["CUP_M136_M"], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_MAAWS_Scope", 50, 1, 2, ["CUP_MAAWS_HEAT_M","CUP_MAAWS_HEDP_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Javelin", 25, 1, 3, ["CUP_Javelin_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_Stinger_M"], 0];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG18", 50, 3, 6, ["CUP_RPG18_M"], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 50, 1, 3, ["CUP_PG7VL_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M47", 25, 1, 2, ["CUP_Dragon_EP1_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_Stinger_M"], 0];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_TimeBomb_M", "CUP_PipeBomb_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "CUP_Mine_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];
//INDEP
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_IED_V4_M", "CUP_IED_V3_M", "CUP_IED_V2_M", "CUP_IED_V1_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["IEDLandSmall_Remote_Mag", "IEDUrbanSmall_Remote_Mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_M67"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_Smoke_M203","CUP_1Rnd_SmokeRed_M203","CUP_1Rnd_SmokeGreen_M203","CUP_1Rnd_SmokeYellow_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["CUP_1Rnd_HE_GP25_M"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["CUP_1Rnd_StarCluster_White_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_1Rnd_StarCluster_Green_M203","CUP_1Rnd_StarFlare_White_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarFlare_Green_M203"], 25];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_FlareWhite_M203","CUP_FlareGreen_M203","CUP_FlareRed_M203","CUP_FlareYellow_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M","CUP_1Rnd_SMOKERED_GP25_M","CUP_1Rnd_SMOKEGREEN_GP25_M","CUP_1Rnd_SMOKEYELLOW_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["CUP_IlumFlareWhite_GP25_M","CUP_IlumFlareRed_GP25_M","CUP_IlumFlareGreen_GP25_M"], 25];


a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["CUP_B_US_IIID_UCP"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
//General Equipment
a3e_arr_AmmoDepotItems pushback ["Laserdesignator", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["B_UavTerminal", 10, 1, 3];
//OPFOR/BLUFOR Equipment
//SCOPES
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ElcanM145", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553_Black", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553_Coyote", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553Grey", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G33_HWS_BLK", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G33_HWS_COYOTE", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G33_HWS_TAN", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_10x40_LRT_Desert", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_MRT_Tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldM3LR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_20x40_LRT", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_25x50_LRT", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_25x50_LRT_Desert", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_CQ_T", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Leupold_VX3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_low", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_low_coyote", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_M68_BLK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_M68_TAN", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_COMPM2_BLK", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_COMPM2_TAN", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Coyote", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Desert", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_Coyote", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_RMR_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_RMR_Coyote", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_RMR_Tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01B_Tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_RCO", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_RCO_desert", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01NSN_RMR_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01NSN_RMR_Coyote", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01NSN_RMR_Tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA01NSN_Tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA31_KF", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_TA31_KF_Desert", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG_Reflex_Desert", 10, 1, 3];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PAS_13c1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PAS_13c2", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_10", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_10_black", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_GOSHAWK", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_NSPU", 10, 1, 3];
};
//Rail Attachments
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Black", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Black_Top", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Tan_Top", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Flashlight_Black_L", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Flashlight_Tan_L", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight_desert", 10, 1, 3];
//Barrel Attachments
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Flashhider_556x45_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Flashhider_556x45_Tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Flashhider_762x51_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Flashhider_762x51_Tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_SCAR_L", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_SCAR_H", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_SCAR_L", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_SCAR_H", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M16", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M16_desert", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M16_coyote", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M14", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Suppressor_M107_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Suppressor_M107_Desert", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Suppressor_M107_Grey", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M110_black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M110", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_H_MG", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Suppressor_M107_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Suppressor_M107_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Suppressor_M107_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_mfsup_Suppressor_M107_Black", 10, 1, 3];
//Bipods
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod_black", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod", 20, 1, 2];
//INDEP Equipment 
//SCOPES
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4", 20, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4_M14", 20, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4_M16", 20, 1, 3];
};
//Bipods
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_Harris_1A2_L", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_Harris_1A2_L_BLK", 10, 1, 2];

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_PB6P9_snds", "CUP_8Rnd_9x18_MakarovSD_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_FNFAL_railed", "CUP_20Rnd_762x51_FNFAL_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_Pellets", 11];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_HE", 9];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_CZ805_A2_Holo_Laser", "CUP_30Rnd_556x45_Stanag", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_M14", "CUP_20Rnd_762x51_DMR", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_MicroUzi_snds", "CUP_30Rnd_9x19_UZI", 4];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_Saiga12K", "CUP_8Rnd_B_Saiga12_74Pellets_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_lmg_UK59", "CUP_50Rnd_UK59_762x54R_Tracer", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AKS_Gold", "CUP_30Rnd_762x39_AK47_M", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_ksvk_PSO3", "CUP_5Rnd_127x108_KSVK_M", 10];
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
    "CUP_optic_ElcanM145"
	,"CUP_optic_Eotech553_Black"
	,"CUP_optic_Eotech553Grey"
	,"CUP_optic_Eotech553"
	,"CUP_optic_G33_HWS_BLK"
    ,"CUP_optic_LeupoldMk4_CQ_T"
    ,"CUP_optic_CompM2_low"
    ,"CUP_optic_CompM2_low_coyote"
    ,"CUP_optic_AIMM_M68_BLK"
    ,"CUP_optic_AIMM_M68_TAN"
    ,"CUP_optic_AIMM_COMPM2_BLK"
    ,"CUP_optic_AIMM_COMPM2_TAN"
    ,"CUP_optic_CompM2_Black"
    ,"CUP_optic_CompM2_Coyote"
    ,"CUP_optic_CompM2_Desert"
    ,"CUP_optic_ACOG_TA01B_Black"
    ,"CUP_optic_ACOG_TA01B_Coyote"
    ,"CUP_optic_ACOG_TA01B_RMR_Black"
    ,"CUP_optic_ACOG_TA01B_RMR_Coyote"
    ,"CUP_optic_ACOG_TA01B_RMR_Tan"
    ,"CUP_optic_ACOG_TA01B_Tan"
    ,"CUP_optic_RCO"
    ,"CUP_optic_RCO_desert"
    ,"CUP_optic_ACOG_TA01NSN_RMR_Black"
    ,"CUP_optic_ACOG_TA01NSN_RMR_Coyote"
    ,"CUP_optic_ACOG_TA01NSN_RMR_Tan"
    ,"CUP_optic_ACOG_TA01NSN_Tan"
    ,"CUP_optic_ACOG2"
    ,"CUP_optic_ACOG_TA31_KF"
    ,"CUP_optic_ACOG_TA31_KF_Desert"
    ,"CUP_optic_ACOG"
    ,"CUP_optic_ACOG_Reflex_Desert"
	,"CUP_optic_HoloBlack"
	,"CUP_optic_HoloWdl"
	,"CUP_optic_HoloDesert"
	,"CUP_optic_Eotech533"
	,"CUP_optic_Eotech533Grey"
	,"CUP_optic_CompM4"
	,"CUP_optic_SUSAT"
	,"CUP_optic_ACOG"
	,"CUP_optic_RCO"
	,"CUP_optic_RCO_desert"
	,"CUP_optic_ElcanM145"];
a3e_arr_Scopes_SMG = [
	"CUP_optic_Eotech533"
	,"CUP_optic_Eotech553Grey"];
a3e_arr_Scopes_Sniper = [
    "CUP_optic_LeupoldMk4"
   ,"CUP_optic_LeupoldMk4_10x40_LRT_Desert"
   ,"CUP_optic_LeupoldMk4_MRT_Tan"
   ,"CUP_optic_LeupoldM3LR"
   ,"CUP_optic_LeupoldMk4_20x40_LRT"
   ,"CUP_optic_LeupoldMk4_25x50_LRT"
   ,"CUP_optic_LeupoldMk4_25x50_LRT_Desert"
   ,"CUP_optic_Leupold_VX3"];
a3e_arr_NightScopes = [
	"CUP_optic_AN_PVS_10"
	,"CUP_optic_AN_PVS_4"
	,"CUP_optic_AN_PVS_4_M14"
	,"CUP_optic_AN_PVS_4_M16"];
a3e_arr_TWSScopes = [
	"CUP_optic_AN_PAS_13c2"
	,"CUP_optic_AN_PAS_13c1"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"CUP_bipod_VLTOR_Modpod_black"
	,"CUP_bipod_Harris_1A2_L"
	,"CUP_bipod_Harris_1A2_L_BLK"];

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
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"O_Boat_Armed_01_hmg_F"
	,"CUP_O_PBX_RU"];
a3e_arr_extraction_boat_escort = [
	"O_Boat_Armed_01_hmg_F"
	,"CUP_O_ZUBR_RU"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"CUP_O_Kamaz_RU"	//10+
	,"CUP_O_BTR80_DESERT_RU"	//10+
	,"CUP_O_BTR80A_DESERT_RU"	//10+
	,"CUP_O_MTLB_pk_WDL_RU"];	//9
a3e_arr_extraction_car_escort = [
	"CUP_O_BTR80_DESERT_RU"
	,"CUP_O_BTR80A_DESERT_RU"
	,"CUP_O_T72_RU"
	,"CUP_O_T90_RU"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"CUP_USMC_MQ9"
	,"CUP_B_AH6X_USA"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"CUP_B_MH6M_OBS_USA"
	,"CUP_B_MH6J_OBS_USA"
	,"CUP_B_MH6M_USA"
	,"CUP_B_MH6M_USA"
	,"CUP_B_UH60M_Unarmed_US"
	,"CUP_B_UH60M_Unarmed_FFV_US"];
a3e_arr_searchChopperHard = [
    "CUP_B_AH6J_USA"
	,"CUP_B_AH6M_USA"
	,"CUP_B_UH60M_US"
	,"CUP_B_UH60M_FFV_US"
	,"CUP_B_MH60L_DAP_2x_US"
	,"CUP_B_MH60L_DAP_4x_US"];
a3e_arr_searchChopper_pilot = [
	"CUP_B_US_Pilot"];
a3e_arr_searchChopper_crew = [
	"CUP_B_US_Pilot"];

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
	"CUP_B_M252_US"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"CUP_B_A10_CAS_USA"];

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
	 "Mi8Wreck"
	,"CUP_Mi8Wreck"];
a3e_arr_CrashSiteCrew = [
	"CUP_O_RU_Pilot"];
a3e_arr_CrashSiteWrecksCar = [
	 "BMP2Wreck"
	,"Land_Wreck_T72_hull_F"
	,"BRDMWreck"];
a3e_arr_CrashSiteCrewCar = [
	"CUP_O_RU_Crew"];
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