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
A3E_VAR_Side_Opfor = west;//Enemy side CUP Horizon Islands Legion
A3E_VAR_Side_Ind = resistance;//Independent side CUP RACS jungle

A3E_VAR_Flag_Opfor = "\A3\Data_F_Exp\Flags\flag_Tanoa_CO.paa";
A3E_VAR_Flag_Ind = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_racs_co";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"CUP_I_RACS_Soldier_Mech"
	,"CUP_I_RACS_Soldier_Light_Mech"
	,"CUP_I_RACS_GL_Mech"
	,"CUP_I_RACS_AR_Mech"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
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
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];



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
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"  //16
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
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"  //24
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"  //20
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
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
    ,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV" 	//24
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
	,"CUP_C_Datsun"  //12
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
	,"CUP_O_Hilux_unarmed_TK_CIV"  //12
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
	,"CUP_C_Datsun_Covered"  //12
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
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"  //22
	//Heavy Trucks Covered
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"  //22
	//Transport Cars/Light Trucks (Can fit 6 people or more)
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
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
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"  //51
	//Buses
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"  //16
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
		//Unarmed cars  8 sets
		"CUP_B_M151_HIL"  //1
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //2
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //3
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //4
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //5
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //6
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //7
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //8
		,"CUP_B_MTVR_HIL"
		//Supply Trucks  3 sets
		,"CUP_B_MTVR_Ammo_HIL"  //1
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		,"CUP_B_MTVR_Ammo_HIL"  //2
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		,"CUP_B_MTVR_Ammo_HIL"  //3
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		//Unarmed APCs  1 set
		//Armed Cars  1 set
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"  //15 cars
		//MRAPs  1 set
		//Light Armed APCs  1 set
		//Heavily Armed APCs or AA  1 set
		,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"
		,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"
		//Artillery  1 set
		,"CUP_B_M270_DPICM_HIL"
		,"CUP_B_M270_HE_HIL"
		//Tanks  1 set
        ,"CUP_B_Leopard2A6_HIL"];
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
		//Unarmed cars  6 sets
		"CUP_B_M151_HIL"  //1
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //2
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //3
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //4
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //5
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //6
		,"CUP_B_MTVR_HIL"
		//Supply Trucks  3 sets
		,"CUP_B_MTVR_Ammo_HIL"  //1
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		,"CUP_B_MTVR_Ammo_HIL"  //2
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		,"CUP_B_MTVR_Ammo_HIL"  //3
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		//Unarmed APCs  2 sets
		//Armed Cars  1.5 sets
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"  //20 cars
		//MRAPs  2 sets
		//Light Armed APCs  1 set
		//Heavily Armed APCs or AA  1 set
        ,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"
		,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"		
		//Artillery  1 set
		,"CUP_B_M270_DPICM_HIL"
		,"CUP_B_M270_HE_HIL"
		//Tanks  1 set
		,"CUP_B_Leopard2A6_HIL"];
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
		//Unarmed cars  6 sets
		"CUP_B_M151_HIL"  //1
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //2
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //3
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //4
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //5
		,"CUP_B_MTVR_HIL"
		,"CUP_B_M151_HIL"  //6
		,"CUP_B_MTVR_HIL"
		//Supply Trucks  3 sets
		,"CUP_B_MTVR_Ammo_HIL"  //1
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		,"CUP_B_MTVR_Ammo_HIL"  //2
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		,"CUP_B_MTVR_Ammo_HIL"  //3
		,"CUP_B_MTVR_Refuel_HIL"
		,"CUP_B_MTVR_Repair_HIL"
		//Unarmed APCs  2 sets
		//Armed Cars  1.5 sets
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"
		,"CUP_B_M151_M2_HIL"  //20 cars
		//MRAPs  2 sets
		//Light Armed APCs  2 sets
		//Heavily Armed APCs or AA  2 sets 
		,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"
		,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"   //1
 		,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"
		,"CUP_B_Boxer_GMG_HIL"
		,"CUP_B_Boxer_HMG_HIL"	 //2
		//Artillery  1 set
		,"CUP_B_M270_DPICM_HIL"
		,"CUP_B_M270_HE_HIL"
		//Tanks  2 sets
		,"CUP_B_Leopard2A6_HIL"
		,"CUP_B_Leopard2A6_HIL"];
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
    //Rifleman
	"CUP_B_HIL_Soldier"
	,"CUP_B_HIL_Soldier"
	,"CUP_B_HIL_Soldier"
	,"CUP_B_HIL_Soldier"
	,"CUP_B_HIL_Soldier_Light"
	,"CUP_B_HIL_Soldier_Light"
	,"CUP_B_HIL_Soldier_Light"
	,"CUP_B_HIL_Soldier_Light"
	//Ammo carrier Classes
	,"CUP_B_HIL_Soldier_AAT"
    ,"CUP_B_HIL_AMG"
	,"CUP_B_HIL_Soldier_AAT"
    ,"CUP_B_HIL_AMG"
	//Machine gunners/Autoriflemen
	,"CUP_B_HIL_MMG"
	,"CUP_B_HIL_MMG"
	,"CUP_B_HIL_MMG"
	//Grenadiers
	,"CUP_B_HIL_GL"
	,"CUP_B_HIL_GL"
	//Buildable Weapon Classes
	//Buildable Mortar Classes
	//Classes with Medkit
	,"CUP_B_HIL_Medic"
	,"CUP_B_HIL_Medic"
	//Classes with Toolkit
	,"CUP_B_HIL_Engineer"
	,"CUP_B_HIL_Engineer"
	//Squad Leaders
	,"CUP_B_HIL_SL"
	//Light AT
	,"CUP_B_HIL_Soldier_LAT"
	,"CUP_B_HIL_Soldier_MAT"
	//Heavy AT
	,"CUP_B_HIL_Soldier_HAT"
	//AA
	,"CUP_B_HIL_Soldier_AA"
	,"CUP_B_HIL_Soldier_AA"
	//Marksmen
	,"CUP_B_HIL_M"
	//Snipers
	//UAV
	//Officers
	,"CUP_B_HIL_Officer"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"CUP_I_RACS_Soldier_AA_Mech"
	,"CUP_I_RACS_Soldier_AA_Mech"
	,"CUP_I_RACS_Soldier_AAT_Mech"
	,"CUP_I_RACS_Soldier_AMG_Mech"
	,"CUP_I_RACS_Soldier_AMG_Mech"
	,"CUP_I_RACS_Soldier_MAT_Mech"
	,"CUP_I_RACS_Soldier_MAT_Mech"
	,"CUP_I_RACS_AR_Mech"
	,"CUP_I_RACS_AR_Mech"
	,"CUP_I_RACS_Engineer_Mech"
	,"CUP_I_RACS_Engineer_Mech"
	,"CUP_I_RACS_GL_Mech"
	,"CUP_I_RACS_GL_Mech"
	,"CUP_I_RACS_Soldier_HAT_Mech"
	,"CUP_I_RACS_MMG_Mech"
	,"CUP_I_RACS_MMG_Mech"
	,"CUP_I_RACS_M_Mech"
	,"CUP_I_RACS_Medic_Mech"
	,"CUP_I_RACS_Medic_Mech"
	,"CUP_I_RACS_Officer_Mech"
	,"CUP_I_RACS_Officer_Mech"
	,"CUP_I_RACS_Soldier_Mech"
	,"CUP_I_RACS_Soldier_Mech"
	,"CUP_I_RACS_Soldier_Mech"
	,"CUP_I_RACS_Soldier_Mech"
	,"CUP_I_RACS_Soldier_Light_Mech"
	,"CUP_I_RACS_Soldier_Light_Mech"
	,"CUP_I_RACS_Soldier_Light_Mech"
	,"CUP_I_RACS_Soldier_Light_Mech"
	,"CUP_I_RACS_Soldier_LAT_Mech"
	,"CUP_I_RACS_Soldier_LAT_Mech"
	,"CUP_I_RACS_Sniper_Mech"
	,"CUP_I_RACS_SL_Mech"];
a3e_arr_recon_InfantryTypes = [
    "CUP_B_HIL_Soldier_SF"
	,"CUP_B_HIL_Soldier_LAT_SF"
	,"CUP_B_HIL_Soldier_Engineer_SF"
	,"CUP_B_HIL_Soldier_GL_SF"
	,"CUP_B_HIL_Soldier_MMG_SF"
	,"CUP_B_HIL_Soldier_M_SF"
	,"CUP_B_HIL_Soldier_Medic_SF"
	,"CUP_B_HIL_Soldier_HAT_SF"
	,"CUP_B_HIL_Soldier_MAT_SF"
	,"CUP_B_HIL_SL_SF"];
a3e_arr_recon_I_InfantryTypes = [
	"CUP_I_RACS_RoyalCommando"
	,"CUP_I_RACS_RoyalGuard"
	,"CUP_I_RACS_RoyalMarksman"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
    "CUP_B_M151_M2_HIL"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"CUP_I_LR_MG_RACS"
	,"CUP_I_LR_MG_RACS"
	,"CUP_I_M113_RACS"
	,"CUP_I_M163_RACS"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
    "CUP_B_MTVR_HIL"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CUP_I_LR_Transport_RACS"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
    "CUP_B_Boxer_HMG_HIL"
	,"CUP_B_Boxer_HMG_HIL"
	,"CUP_B_Boxer_GMG_HIL"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.
// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
     "CUP_B_Boxer_HMG_HIL"
	,"CUP_B_Boxer_GMG_HIL"
	,"CUP_B_Boxer_GMG_HIL"]; 
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
    "CUP_B_Leopard2A6_HIL"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"CUP_B_M2StaticMG_USMC"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
    "CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_MTVR_HIL"
	,"CUP_B_MTVR_Ammo_HIL"  
	,"CUP_B_MTVR_Refuel_HIL"
	,"CUP_B_MTVR_Repair_HIL"];
		
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
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"  //16
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
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"  //24
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"  //20
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
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
    ,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV" 	//24
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
	,"CUP_C_Datsun_4seat"  //12
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
	,"CUP_O_Hilux_unarmed_TK_CIV"  //12
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
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Open_TKC"  //22
	//Heavy Trucks Covered
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_01"  //22
	//Transport Cars/Light Trucks (Can fit 6 people or more)
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
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
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_SUV_TK"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"  //51
	//Buses
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"
	,"CUP_C_Bus_City_CRCIV"];  //16
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
	"CUP_B_M2StaticMG_USMC"
	,"CUP_B_RBS70_HIL"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
    "CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_M151_M2_HIL"
	,"CUP_B_Boxer_GMG_HIL"
	,"CUP_B_Boxer_HMG_HIL"
	,"CUP_B_MTVR_HIL"
	,"CUP_B_MTVR_Ammo_HIL"  
	,"CUP_B_MTVR_Refuel_HIL"
	,"CUP_B_MTVR_Repair_HIL"
	,"CUP_B_Leopard2A6_HIL"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
    "CUP_B_AH1_DL_BAF"];
a3e_arr_O_transport_heli = [
    "CUP_B_CH47F_HIL"];
a3e_arr_O_pilots = [
    "CUP_B_HIL_Pilot"];
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
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_M9", 50, 2, 5, ["CUP_15Rnd_9x19_M9"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Mk23", 25, 2, 5, ["CUP_12Rnd_45ACP_mk23"], 6]; 
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP5A5", 20, 1, 2, ["CUP_30Rnd_9x19_MP5"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP7", 20, 1, 2, ["CUP_40Rnd_46x30_MP7","CUP_40Rnd_46x30_MP7_Red_Tracer","CUP_40Rnd_46x30_MP7_Green_Tracer","CUP_40Rnd_46x30_MP7_Yellow_Tracer"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP7_woodland", 20, 1, 2, ["CUP_40Rnd_46x30_MP7","CUP_40Rnd_46x30_MP7_Red_Tracer","CUP_40Rnd_46x30_MP7_Green_Tracer","CUP_40Rnd_46x30_MP7_Yellow_Tracer"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_Famas_F1_Rail", 100, 5, 10, ["CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas_Tracer_Red","CUP_25Rnd_556x45_Famas_Tracer_Green","CUP_25Rnd_556x45_Famas_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_Famas_F1_Rail_Wood", 100, 5, 10, ["CUP_25Rnd_556x45_Famas_Wood","CUP_25Rnd_556x45_Famas_Wood_Tracer_Red","CUP_25Rnd_556x45_Famas_Wood_Tracer_Green","CUP_25Rnd_556x45_Famas_Wood_Tracer_Yellow"], 6];
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
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_AFG_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_black","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_FG_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_SFG_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_CQC_EGLM_woodland", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_AFG_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_FG_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_SFG_woodland", 5, 2, 4, ["CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk16_STD_EGLM_woodland", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_30Rnd_556x45_Stanag_Mk16_woodland","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Red","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Green","CUP_30Rnd_556x45_Stanag_Mk16_woodland_Tracer_Yellow"], 6];
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
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_AFG_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_FG_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_SFG_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_CQC_EGLM_woodland", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_AFG_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_FG_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_SFG_woodland", 5, 2, 4, ["CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Mk17_STD_EGLM_woodland", 5, 2, 4, ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_20Rnd_762x51_B_SCAR_wdl","CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_wdl","CUP_20Rnd_TE1_White_Tracer_762x51_SCAR_wdl"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_FNMAG_RIS", 50, 2, 4, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_M60E4_jungle", 25, 2, 4, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M14_DMR", 50, 2, 4, ["CUP_20Rnd_762x51_DMR"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_glaunch_M32", 20, 1, 2, ["CUP_6Rnd_HE_M203"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_M249_E2", 50, 1, 2, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249","CUP_200Rnd_TE4_Green_Tracer_556x45_M249","CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_Mk12SPR_LeupoldM3LR", 50, 2, 4, ["CUP_20Rnd_556x45_Stanag"], 9];



// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Mk153Mod0", 20, 1, 3, ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Mk153Mod0_blk", 20, 1, 3, ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Mk153Mod0_SMAWOptics", 20, 1, 2, ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Mk153Mod0_blk_SMAWOptics", 20, 1, 2, ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_APILAS", 75, 2, 4, [], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Javelin", 25, 1, 2, ["CUP_Javelin_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_Stinger_M"], 0];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_MAAWS", 50, 1, 2, ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M", "MRAWS_HEAT_F", "MRAWS_HE_F"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_MAAWS_Scope", 50, 1, 2, ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M", "MRAWS_HEAT_F", "MRAWS_HE_F"], 3];
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
a3e_arr_AmmoDepotVehicleBackpacks = ["CUP_B_HIL_TacticalPack_CCE_MG"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
//General Equipment
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 20, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_NVG_PVS7", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
//OPFOR/BLUFOR Equipment
//SCOPES
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ZeissZPoint", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ZeissZPoint_wood", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_MicroT1", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_MicroT1_low", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_MicroT1_OD", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_MicroT1_low_OD", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_MICROT1_BLK", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_AIMM_MICROT1_OD", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553_Black", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech553_OD", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G33_HWS_BLK", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G33_HWS_OD", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_10x40_LRT_Woodland", 10, 1, 2];
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
a3e_arr_AmmoDepotItems pushback ["CUP_optic_SB_11_4x20_PM", 25, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_SB_11_4x20_PM_od", 25, 1, 5];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PAS_13c1", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PAS_13c2", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_10_black", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_10_od", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4", 20, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4_M14", 20, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4_M16", 20, 1, 3];
};
//Rail Attachments
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_2_grey", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_2_camo", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_2_Black_Top", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_2_OD_Top", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_2_Flashlight_Black_L", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_2_Flashlight_OD_L", 10, 1, 5];
//Suppressors
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_MP7", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_FAMAS", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_FAMAS_Wood", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M14", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_SCAR_L", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_SCAR_H", 10, 1, 5];
//Bipods
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod_black", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod_OD", 20, 1, 5];
//INDEP Equipment 
//SCOPES
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldM3LR", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4", 10, 1, 5];
//Bipods
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_Harris_1A2_L", 20, 1, 2];



// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_PB6P9_snds", "CUP_8Rnd_9x18_MakarovSD_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_FNFAL_railed", "CUP_20Rnd_762x51_FNFAL_M", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_Pellets", 4];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_74Slug", 4];
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
	"CUP_optic_Eotech553_Black"
	,"CUP_optic_G33_HWS_BLK"
	,"CUP_optic_CompM2_low"
	,"CUP_optic_MicroT1"];
a3e_arr_Scopes_SMG = [
    "CUP_optic_ZeissZPoint"];
a3e_arr_Scopes_Sniper = [
	"CUP_optic_LeupoldMk4"
	,"CUP_optic_LeupoldM3LR"
	,"CUP_optic_SB_11_4x20_PM"];
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
    "CUP_O_Mi24_D_Dynamic_SLA"
	,"CUP_O_Mi8_SLA_1"
	,"CUP_O_Mi8_SLA_2"
	,"CUP_O_UH1H_SLA"
	,"CUP_O_UH1H_armed_SLA"
	,"CUP_O_UH1H_slick_SLA"];
a3e_arr_extraction_chopper_escort = [
	"CUP_O_Mi24_D_Dynamic_SLA"
	,"CUP_O_Ka50_DL_SLA"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"CUP_O_LCVP_SLA"];
a3e_arr_extraction_boat_escort = [
	"CUP_O_LCVP_SLA"
	,"CUP_O_LCVP_SLA"
	,"CUP_O_ZUBR_SLA"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"CUP_O_Ural_SLA"	//10+
	,"CUP_O_BTR60_SLA"
	,"CUP_O_BTR80_SLA"	//10+
	,"CUP_O_BTR80A_SLA"	//10+
	,"CUP_O_MTLB_pk_SLA"];	//9
a3e_arr_extraction_car_escort = [
	"CUP_O_BMP2_SLA"
	,"CUP_O_ZSU23_SLA"
	,"CUP_O_T55_SLA"
	,"CUP_O_T72_SLA"];

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
    "CUP_B_AW159_Unarmed_HIL"];
a3e_arr_searchChopperHard = [
    "CUP_B_AW159_HIL"];
a3e_arr_searchChopper_pilot = [
	"CUP_B_HIL_Pilot"];
a3e_arr_searchChopper_crew = [
	"CUP_B_HIL_Pilot"];

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
	"CUP_B_RHIB_HIL"
	,"CUP_B_RHIB2Turret_HIL"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "CUP_BOX_RACS_Wps_F";
a3e_additional_weapon_box_2 = "CUP_BOX_RACS_WpsSpecial_F";
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
	"CUP_B_M252_HIL"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"CUP_B_JAS39_HIL"];

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
	"CUP_O_RU_Pilot_EMR"];
a3e_arr_CrashSiteWrecksCar = [
	 "BMP2Wreck"
	,"Land_Wreck_T72_hull_F"
	,"BRDMWreck"];
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