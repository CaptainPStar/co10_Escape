// SPE
// GER Wehrmacht vs US Army


/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;	//player side SPE Wehrmacht
A3E_VAR_Side_Opfor = east;	//SPE US Army
A3E_VAR_Side_Ind = resistance;	//SPE French

A3E_VAR_Flag_Opfor = "\WW2\SPE_Core_t\Data_t\Flags\flag_USA_co.paa";
A3E_VAR_Flag_Ind = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

A3E_ItemsToBeRemoved = ["SPE_Binocular_US","SPE_US_ItemCompass"]; //Items to randomly remove from units and to remove from guards

//Disable NVGs parameter for the whole SPE version.
missionNamespace setvariable["A3E_Param_NoNightvision",1];


//////////////////////////////////////////////////////////////////
// fn_createStartPos.sqf
// Array of templates to use for prisons
//////////////////////////////////////////////////////////////////
A3E_PrisonTemplates = [
	"a3e_fnc_BuildPrison1"
	,"a3e_fnc_BuildPrison2"
	,"a3e_fnc_BuildPrison3"
	,"a3e_fnc_BuildPrison4"
	,"a3e_fnc_BuildPrison5"
	];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"SPE_FFI_CellLeader"
	,"SPE_FFI_Fighter"
	,"SPE_FFI_Fighter_Carbine"
	,"SPE_FFI_Fighter_Garand"
	,"SPE_FFI_Fighter_G43"
	,"SPE_FFI_Fighter_M3"
	,"SPE_FFI_Fighter_MP40"
	,"SPE_FFI_Fighter_Sten"
	,"SPE_FFI_Militia"
	,"SPE_FFI_Militia_Shotgun"
	,"SPE_FFI_Fighter_No3"
	,"SPE_FFI_Autorifleman_303_LMG"
	,"SPE_FFI_Militia_M37_Shotgun"
	,"SPE_FFI_Militia_No3"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"B_SPE_GER_A_frame"
	,"B_SPE_CIV_satchel"
	,"B_SPE_CIV_musette"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["SPE_P08","SPE_8Rnd_9x19_P08"];
a3e_arr_PrisonBackpackWeapons pushback ["SPE_P08","SPE_8Rnd_9x19_P08"];
a3e_arr_PrisonBackpackWeapons pushback ["SPE_M1911","SPE_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["SPE_M1911","SPE_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["SPE_Fusil_Mle_208_12_Sawedoff","SPE_2Rnd_12x65_Pellets"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [];
	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"SPE_US_G503_MB_Open"
		,"SPE_US_G503_MB_Open"
		,"SPE_US_G503_MB"
		,"SPE_US_G503_MB"
		,"SPE_US_G503_MB_Armoured"
		,"SPE_US_G503_MB_Ambulance"
		,"SPE_US_G503_MB_M1919"
		,"SPE_US_G503_MB_M1919_Armoured"
		,"SPE_US_G503_MB_M2"
		,"SPE_US_G503_MB_M2_Armoured"
		,"SPE_US_G503_MB_M1919_PATROL"
		,"SPE_US_G503_MB_M2_PATROL"
		,"SPE_CCKW_353"
		,"SPE_CCKW_353"
		,"SPE_CCKW_353_Open"
		,"SPE_CCKW_353_Open"
		,"SPE_CCKW_353_M2"
		,"SPE_CCKW_353_M2"
		,"SPE_CCKW_353_Ambulance"
		,"SPE_CCKW_353_Ammo"
		,"SPE_CCKW_353_Fuel"
		,"SPE_CCKW_353_Repair"
		,"SPE_US_M16_Halftrack"
		,"SPE_US_M3_Halftrack_Unarmed"
		,"SPE_US_M3_Halftrack_Unarmed_Open"
		,"SPE_US_M3_Halftrack"
		,"SPE_US_M3_Halftrack_Ambulance"
		,"SPE_US_M3_Halftrack_Ammo"
		,"SPE_US_M3_Halftrack_Fuel"
		,"SPE_US_M3_Halftrack_Repair"
		,"SPE_M20_AUC"
		,"SPE_M20_AUC"
		,"SPE_M20_AUC"
		,"SPE_M8_LAC"
		,"SPE_M8_LAC"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M10"
		,"SPE_M18_Hellcat"
		,"SPE_M4A0_75_Early"
		,"SPE_M4A0_75"
		,"SPE_M4A0_composite"
		,"SPE_M4A0_105"
		,"SPE_M4A1_75_erla"
		,"SPE_M4A1_75"
		,"SPE_M4A1_T34_Calliope_Direct"
		,"SPE_M4A1_T34_Calliope"
		,"SPE_M4A3_75"
		,"SPE_M4A3_105"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"SPE_FFI_SdKfz250_1"
		,"SPE_FFI_R200_Unarmed"
		,"SPE_FFI_R200_Hood"
		,"SPE_FFI_R200_MG34"
		,"SPE_FFI_OpelBlitz"
		,"SPE_FFI_OpelBlitz_Open"
		,"SPE_FFI_OpelBlitz_Ambulance"
		,"SPE_FFI_OpelBlitz_Ammo"
		,"SPE_FFI_OpelBlitz_Fuel"
		,"SPE_FFI_OpelBlitz_Repair"
		,"SPE_FR_M16_Halftrack"
		,"SPE_FR_M3_Halftrack_Unarmed"
		,"SPE_FR_M3_Halftrack"
		,"SPE_FR_M3_Halftrack_Ambulance"
		,"SPE_FR_M3_Halftrack_Ammo"
		,"SPE_FR_M3_Halftrack_Fuel"
		,"SPE_FR_M3_Halftrack_Repair"
		,"SPE_FR_M20_AUC"
		,"SPE_FR_M8_LAC"
		,"SPE_FR_M8_LAC_ringMount"
		,"SPE_FR_M4A0_105"
		,"SPE_FR_M10"
		,"SPE_FR_M4A0_75_Early"
		,"SPE_FR_M4A0_75_mid"
		,"SPE_FR_M4A1_75"
		,"SPE_FR_M4A1_76"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"SPE_US_G503_MB_Open"
		,"SPE_US_G503_MB_Open"
		,"SPE_US_G503_MB"
		,"SPE_US_G503_MB"
		,"SPE_US_G503_MB_Armoured"
		,"SPE_US_G503_MB_Ambulance"
		,"SPE_US_G503_MB_M1919"
		,"SPE_US_G503_MB_M1919_Armoured"
		,"SPE_US_G503_MB_M2"
		,"SPE_US_G503_MB_M2_Armoured"
		,"SPE_US_G503_MB_M1919_PATROL"
		,"SPE_US_G503_MB_M2_PATROL"
		,"SPE_CCKW_353"
		,"SPE_CCKW_353"
		,"SPE_CCKW_353_Open"
		,"SPE_CCKW_353_Open"
		,"SPE_CCKW_353_M2"
		,"SPE_CCKW_353_M2"
		,"SPE_CCKW_353_Ambulance"
		,"SPE_CCKW_353_Ammo"
		,"SPE_CCKW_353_Fuel"
		,"SPE_CCKW_353_Repair"
		,"SPE_US_M16_Halftrack"
		,"SPE_US_M3_Halftrack_Unarmed"
		,"SPE_US_M3_Halftrack_Unarmed_Open"
		,"SPE_US_M3_Halftrack"
		,"SPE_US_M3_Halftrack_Ambulance"
		,"SPE_US_M3_Halftrack_Ammo"
		,"SPE_US_M3_Halftrack_Fuel"
		,"SPE_US_M3_Halftrack_Repair"
		,"SPE_M20_AUC"
		,"SPE_M20_AUC"
		,"SPE_M20_AUC"
		,"SPE_M8_LAC"
		,"SPE_M8_LAC"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M10"
		,"SPE_M10"
		,"SPE_M10"
		,"SPE_M18_Hellcat"
		,"SPE_M18_Hellcat"
		,"SPE_M18_Hellcat"
		,"SPE_M4A0_75_Early"
		,"SPE_M4A0_75"
		,"SPE_M4A0_composite"
		,"SPE_M4A0_105"
		,"SPE_M4A1_75_erla"
		,"SPE_M4A1_75"
		,"SPE_M4A1_76"
		,"SPE_M4A1_T34_Calliope_Direct"
		,"SPE_M4A1_T34_Calliope"
		,"SPE_M4A3_75"
		,"SPE_M4A3_76"
		,"SPE_M4A3_105"
		,"SPE_M4A3_T34_Calliope_Direct"
		,"SPE_M4A3_T34_Calliope"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"SPE_FFI_SdKfz250_1"
		,"SPE_FFI_R200_Unarmed"
		,"SPE_FFI_R200_Hood"
		,"SPE_FFI_R200_MG34"
		,"SPE_FFI_OpelBlitz"
		,"SPE_FFI_OpelBlitz_Open"
		,"SPE_FFI_OpelBlitz_Ambulance"
		,"SPE_FFI_OpelBlitz_Ammo"
		,"SPE_FFI_OpelBlitz_Fuel"
		,"SPE_FFI_OpelBlitz_Repair"
		,"SPE_FR_M16_Halftrack"
		,"SPE_FR_M3_Halftrack_Unarmed"
		,"SPE_FR_M3_Halftrack"
		,"SPE_FR_M3_Halftrack_Ambulance"
		,"SPE_FR_M3_Halftrack_Ammo"
		,"SPE_FR_M3_Halftrack_Fuel"
		,"SPE_FR_M3_Halftrack_Repair"
		,"SPE_FR_M20_AUC"
		,"SPE_FR_M8_LAC"
		,"SPE_FR_M8_LAC_ringMount"
		,"SPE_FR_M4A0_105"
		,"SPE_FR_M4A3_75"
		,"SPE_FR_M10"
		,"SPE_FR_M4A0_75_Early"
		,"SPE_FR_M4A0_75_mid"
		,"SPE_FR_M4A1_75"
		,"SPE_FR_M4A1_76"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"SPE_US_G503_MB_Open"
		,"SPE_US_G503_MB"
		,"SPE_US_G503_MB_Armoured"
		,"SPE_US_G503_MB_Ambulance"
		,"SPE_US_G503_MB_M1919"
		,"SPE_US_G503_MB_M1919_Armoured"
		,"SPE_US_G503_MB_M2"
		,"SPE_US_G503_MB_M2_Armoured"
		,"SPE_US_G503_MB_M1919_PATROL"
		,"SPE_US_G503_MB_M2_PATROL"
		,"SPE_CCKW_353"
		,"SPE_CCKW_353_Open"
		,"SPE_CCKW_353_M2"
		,"SPE_CCKW_353_M2"
		,"SPE_CCKW_353_Ambulance"
		,"SPE_CCKW_353_Ammo"
		,"SPE_CCKW_353_Fuel"
		,"SPE_CCKW_353_Repair"
		,"SPE_US_M16_Halftrack"
		,"SPE_US_M3_Halftrack_Unarmed"
		,"SPE_US_M3_Halftrack_Unarmed_Open"
		,"SPE_US_M3_Halftrack"
		,"SPE_US_M3_Halftrack_Ambulance"
		,"SPE_US_M3_Halftrack_Ammo"
		,"SPE_US_M3_Halftrack_Fuel"
		,"SPE_US_M3_Halftrack_Repair"
		,"SPE_M20_AUC"
		,"SPE_M20_AUC"
		,"SPE_M8_LAC"
		,"SPE_M8_LAC"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M8_LAC_ringMount"
		,"SPE_M10"
		,"SPE_M10"
		,"SPE_M18_Hellcat"
		,"SPE_M18_Hellcat"
		,"SPE_M4A0_75_Early"
		,"SPE_M4A0_75"
		,"SPE_M4A0_composite"
		,"SPE_M4A0_105"
		,"SPE_M4A1_75_erla"
		,"SPE_M4A1_75"
		,"SPE_M4A1_76"
		,"SPE_M4A1_T34_Calliope_Direct"
		,"SPE_M4A1_T34_Calliope"
		,"SPE_M4A3_75"
		,"SPE_M4A3_76"
		,"SPE_M4A3_105"
		,"SPE_M4A3_T34_Calliope_Direct"
		,"SPE_M4A3_T34_Calliope"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"SPE_FFI_SdKfz250_1"
		,"SPE_FFI_R200_Unarmed"
		,"SPE_FFI_R200_Hood"
		,"SPE_FFI_R200_MG34"
		,"SPE_FFI_OpelBlitz"
		,"SPE_FFI_OpelBlitz_Open"
		,"SPE_FFI_OpelBlitz_Ambulance"
		,"SPE_FFI_OpelBlitz_Ammo"
		,"SPE_FFI_OpelBlitz_Fuel"
		,"SPE_FFI_OpelBlitz_Repair"
		,"SPE_FR_M16_Halftrack"
		,"SPE_FR_M3_Halftrack_Unarmed"
		,"SPE_FR_M3_Halftrack"
		,"SPE_FR_M3_Halftrack_Ambulance"
		,"SPE_FR_M3_Halftrack_Ammo"
		,"SPE_FR_M3_Halftrack_Fuel"
		,"SPE_FR_M3_Halftrack_Repair"
		,"SPE_FR_M20_AUC"
		,"SPE_FR_M8_LAC"
		,"SPE_FR_M8_LAC_ringMount"
		,"SPE_FR_M4A0_105"
		,"SPE_FR_M4A3_75"
		,"SPE_FR_M4A3_76"
		,"SPE_FR_M10"
		,"SPE_FR_M4A0_75_Early"
		,"SPE_FR_M4A0_75_mid"
		,"SPE_FR_M4A1_75"
		,"SPE_FR_M4A1_76"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"SPE_US_Engineer"
	,"SPE_US_Engineer"
	,"SPE_US_Engineer"
	,"SPE_US_Medic"
	,"SPE_US_Medic"
	,"SPE_US_Medic"
	,"SPE_US_Rifleman_AmmoBearer"
	,"SPE_US_Mortar_AmmoBearer"
	,"SPE_US_HMG_AmmoBearer"
	,"SPE_US_Assist_Autorifleman"
	,"SPE_US_AHMGunner"
	,"SPE_US_Assist_SquadLead"
	,"SPE_US_Mortar_AGunner"
	,"SPE_US_AT_Soldier"
	,"SPE_US_AT_Soldier"
	,"SPE_US_AT_Soldier"
	,"SPE_US_Autorifleman"
	,"SPE_US_Autorifleman"
	,"SPE_US_Captain"
	,"SPE_US_Driver"
	,"SPE_US_First_Lieutenant"
	,"SPE_US_Flamethrower_Operator"
	,"SPE_US_Grenadier"
	,"SPE_US_Grenadier"
	,"SPE_US_Mortar_Gunner"
	,"SPE_US_HMGunner"
	,"SPE_US_Radioman"
	,"SPE_US_Rifleman"
	,"SPE_US_Rifleman"
	,"SPE_US_Rifleman"
	,"SPE_US_Second_Lieutenant"
	,"SPE_US_Sniper"
	,"SPE_US_SquadLead"
	,"SPE_US_HMG_AmmoBearer_M2"
	,"SPE_US_AHMGunner_M2"
	,"SPE_US_HMGunner_M2"
	,"SPE_US_Sentry_Carbine"
	,"SPE_US_Sentry"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"SPE_FFI_CellLeader"
	,"SPE_FFI_Doctor"
	,"SPE_FFI_Doctor"
	,"SPE_FFI_Fighter_G43"
	,"SPE_FFI_Fighter_Garand"
	,"SPE_FFI_Fighter"
	,"SPE_FFI_Fighter_Carbine"
	,"SPE_FFI_Fighter_M3"
	,"SPE_FFI_Fighter_MP40"
	,"SPE_FFI_Fighter_Sten"
	,"SPE_FFI_Grenadier"
	,"SPE_FFI_Autorifleman"
	,"SPE_FFI_MGunner"
	,"SPE_FFI_Militia"
	,"SPE_FFI_Militia_Shotgun"
	,"SPE_FFI_Saboteur_M3A1"
	,"SPE_FFI_Saboteur"
	,"SPE_FFI_Sapper"
	,"SPE_FFI_Sapper_Mle208"
	,"SPE_FFI_Sniper"
	,"SPE_FFI_Tankhunter"
	,"SPE_FFI_Tankhunter"
	,"SPE_FFI_TeamLeader"
	,"SPE_FFI_TeamLeader_Sten"
	,"SPE_FFI_Fighter_No3"
	,"SPE_FFI_Autorifleman_303_LMG"
	,"SPE_FFI_Militia_M37_Shotgun"
	,"SPE_FFI_Militia_No3"];
a3e_arr_recon_InfantryTypes = [
	"SPE_US_Rangers_Rifleman_AmmoBearer"
	,"SPE_US_Rangers_Assist_Autorifleman"
	,"SPE_US_Rangers_AHMGunner"
	,"SPE_US_Rangers_Assist_SquadLead"
	,"SPE_US_Rangers_AT_soldier"
	,"SPE_US_Rangers_Autorifleman"
	,"SPE_US_Rangers_captain"
	,"SPE_US_Rangers_engineer"
	,"SPE_US_Rangers_engineer_bangalore"
	,"SPE_US_Rangers_first_lieutenant"
	,"SPE_US_Rangers_Flamethrower_Operator"
	,"SPE_US_Rangers_grenadier"
	,"SPE_US_Rangers_HMGunner"
	,"SPE_US_Rangers_medic"
	,"SPE_US_Rangers_radioman"
	,"SPE_US_Rangers_rifleman"
	,"SPE_US_Rangers_second_lieutenant"
	,"SPE_US_Rangers_SquadLead"];
a3e_arr_recon_I_InfantryTypes = [
	"SPE_FR_Assist_Autorifleman"
	,"SPE_FR_AHMGunner"
	,"SPE_FR_Assist_SquadLead"
	,"SPE_FR_AT_Soldier"
	,"SPE_FR_Autorifleman"
	,"SPE_FR_Captain"
	,"SPE_FR_Engineer"
	,"SPE_FR_Flamethrower_Operator"
	,"SPE_FR_Grenadier"
	,"SPE_FR_HMGunner"
	,"SPE_FR_Medic"
	,"SPE_FR_Radioman"
	,"SPE_FR_Rifleman"
	,"SPE_FR_Rifleman_Carbine"
	,"SPE_FR_Sniper"
	,"SPE_FR_SquadLead"
	,"SPE_FR_Mortar_AmmoBearer"
	,"SPE_FR_HMG_AmmoBearer"
	,"SPE_FR_Mortar_AGunner"
	,"SPE_FR_Mortar_Gunner"
	,"SPE_FR_Sentry_Carbine"
	,"SPE_FR_Sentry"];

a3e_units_civilian_InfantryTypes = [
	"SPE_CIV_Citizen_1"
	,"SPE_CIV_Citizen_1_tie"
	,"SPE_CIV_Citizen_1_trop"
	,"SPE_CIV_Citizen_2"
	,"SPE_CIV_Citizen_2_tie"
	,"SPE_CIV_Citizen_2_trop"
	,"SPE_CIV_Citizen_3"
	,"SPE_CIV_Citizen_3_tie"
	,"SPE_CIV_Citizen_3_trop"
	,"SPE_CIV_Citizen_4"
	,"SPE_CIV_Citizen_4_tie"
	,"SPE_CIV_Citizen_4_trop"
	,"SPE_CIV_Citizen_5"
	,"SPE_CIV_Citizen_5_tie"
	,"SPE_CIV_Citizen_5_trop"
	,"SPE_CIV_Citizen_6"
	,"SPE_CIV_Citizen_6_tie"
	,"SPE_CIV_Citizen_6_trop"
	,"SPE_CIV_Citizen_7"
	,"SPE_CIV_Citizen_7_tie"
	,"SPE_CIV_Citizen_7_trop"
	,"SPE_CIV_pak2_zwart"
	,"SPE_CIV_pak2_zwart_alt"
	,"SPE_CIV_pak2_zwart_tie"
	,"SPE_CIV_pak2_zwart_tie_alt"
	,"SPE_CIV_pak2_zwart_swetr"
	,"SPE_CIV_pak2_bruin"
	,"SPE_CIV_pak2_bruin_tie"
	,"SPE_CIV_pak2_bruin_swetr"
	,"SPE_CIV_pak2_grijs"
	,"SPE_CIV_pak2_grijs_tie"
	,"SPE_CIV_pak2_grijs_swetr"
	,"SPE_CIV_Swetr_1"
	,"SPE_CIV_Swetr_1_vest"
	,"SPE_CIV_Swetr_2"
	,"SPE_CIV_Swetr_2_vest"
	,"SPE_CIV_Swetr_3"
	,"SPE_CIV_Swetr_3_vest"
	,"SPE_CIV_Swetr_4"
	,"SPE_CIV_Swetr_4_vest"
	,"SPE_CIV_Swetr_5"
	,"SPE_CIV_Swetr_5_vest"
	,"SPE_CIV_Worker_Coverall_1"
	,"SPE_CIV_Worker_Coverall_1_trop"
	,"SPE_CIV_Worker_Coverall_2"
	,"SPE_CIV_Worker_Coverall_2_trop"
	,"SPE_CIV_Worker_Coverall_3"
	,"SPE_CIV_Worker_Coverall_3_trop"
	,"SPE_CIV_Worker_1"
	,"SPE_CIV_Worker_1_tie"
	,"SPE_CIV_Worker_1_trop"
	,"SPE_CIV_Worker_2"
	,"SPE_CIV_Worker_2_tie"
	,"SPE_CIV_Worker_2_trop"
	,"SPE_CIV_Worker_3"
	,"SPE_CIV_Worker_3_tie"
	,"SPE_CIV_Worker_3_trop"
	,"SPE_CIV_Worker_4"
	,"SPE_CIV_Worker_4_tie"
	,"SPE_CIV_Worker_4_trop"];

//////////////////////////////////////////////////////////////////
// fn_RoadBlocks.sqf
// Array of templates to use for roadblocks
//////////////////////////////////////////////////////////////////
A3E_RoadblockTemplates = [
	"rb_spe_rb1"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"SPE_US_G503_MB_M1919"
	,"SPE_US_G503_MB_M2"
	,"SPE_US_G503_MB_M1919_Armoured"
	,"SPE_US_G503_MB_M2_Armoured"
	,"SPE_US_G503_MB_M1919_PATROL"
	,"SPE_US_G503_MB_M2_PATROL"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M16_Halftrack"
	,"SPE_US_M16_Halftrack"
	,"SPE_US_M16_Halftrack"
	,"SPE_M20_AUC"
	,"SPE_M8_LAC"
	,"SPE_M8_LAC_ringMount"
	,"SPE_M1_81"
	,"SPE_M1_81"
	,"SPE_M1_81"
	,"SPE_M10"
	,"SPE_M18_Hellcat"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"SPE_FFI_R200_MG34"
	,"SPE_FFI_R200_MG34"
	,"SPE_FFI_SdKfz250_1"
	,"SPE_FFI_SdKfz250_1"
	,"SPE_FR_M3_Halftrack"
	,"SPE_FR_M16_Halftrack"
	,"SPE_FR_M20_AUC"
	,"SPE_FR_57mm_M1"
	,"SPE_FR_M45_Quadmount"
	,"SPE_FR_M10"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"SPE_CCKW_353"
	,"SPE_CCKW_353_Open"
	,"SPE_CCKW_353_M2"
	,"SPE_US_M3_Halftrack_Unarmed"
	,"SPE_US_M3_Halftrack_Unarmed"
	,"SPE_US_M3_Halftrack"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"SPE_FR_M3_Halftrack_Unarmed"
	,"SPE_FR_M3_Halftrack_Unarmed"
	,"SPE_FR_M3_Halftrack"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"SPE_US_M3_Halftrack"
	,"SPE_US_M16_Halftrack"
	,"SPE_US_M16_Halftrack"
	,"SPE_M20_AUC"
	,"SPE_M8_LAC"
	,"SPE_M8_LAC_ringMount"
	,"SPE_M4A0_75_Early"];

//////////////////////////////////////////////////////////////////
// fn_createMotorPools.sqf
// Array of templates to use for motor pool
//////////////////////////////////////////////////////////////////
A3E_MotorPoolTemplates = [
	"A3E_fnc_BuildMotorPool_SPE"
	];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

//////////////////////////////////////////////////////////////////
// fn_createComCenters.sqf
// Array of templates to use for com centers
//////////////////////////////////////////////////////////////////
A3E_ComCenterTemplates = [
	"a3e_fnc_BuildComCenter_spe1"
	];

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"SPE_M8_LAC"
	,"SPE_M8_LAC_ringMount"
	,"SPE_M10"
	,"SPE_M18_Hellcat"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"SPE_M4A0_75_Early"
	,"SPE_M4A0_75"
	,"SPE_M4A0_composite"
	,"SPE_M4A0_105"
	,"SPE_M4A1_76"
	,"SPE_M4A1_75"
	,"SPE_M4A1_75_erla"
	,"SPE_M4A3_105"
	,"SPE_M4A3_75"
	,"SPE_M4A3_76"
	,"SPE_M4A1_T34_Calliope_Direct"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
//For SPE templates only the bipod variants
a3e_arr_ComCenStaticWeapons = [
	"SPE_M1919A6_Bipod"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"SPE_US_G503_MB_Open"
	,"SPE_US_G503_MB"
	,"SPE_US_G503_MB_Armoured"
	,"SPE_US_G503_MB_M1919"
	,"SPE_US_G503_MB_M1919_Armoured"
	,"SPE_US_G503_MB_M2"
	,"SPE_US_G503_MB_M2_Armoured"
	,"SPE_US_G503_MB_M1919_PATROL"
	,"SPE_US_G503_MB_M2_PATROL"
	,"SPE_CCKW_353"
	,"SPE_CCKW_353_Open"
	,"SPE_CCKW_353_M2"
	,"SPE_CCKW_353_Ambulance"
	,"SPE_CCKW_353_Ammo"
	,"SPE_CCKW_353_Fuel"
	,"SPE_CCKW_353_Repair"
	,"SPE_US_M3_Halftrack_Unarmed"
	,"SPE_US_M3_Halftrack_Unarmed"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M3_Halftrack_Ambulance"
	,"SPE_US_M3_Halftrack_Ammo"
	,"SPE_US_M3_Halftrack_Fuel"
	,"SPE_US_M3_Halftrack_Repair"
	,"SPE_US_M16_Halftrack"
	,"SPE_M20_AUC"
	,"SPE_M8_LAC"
	,"SPE_M8_LAC_ringMount"
	,"SPE_M4A0_105"
	,"SPE_M4A0_75_Early"
	,"SPE_M18_Hellcat"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
//Should be civilian, as there are no civ vehicles its a normal enemy truck
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"SPE_FFI_OpelBlitz"
	,"SPE_FFI_R200_Hood"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"SPE_M1919_M2"
	,"SPE_M1919_M2"
	,"SPE_M2_M3"
	,"SPE_57mm_M1"
	,"SPE_M45_Quadmount"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"SPE_US_G503_MB_Open"
	,"SPE_US_G503_MB"
	,"SPE_US_G503_MB_Armoured"
	,"SPE_US_G503_MB_M1919"
	,"SPE_US_G503_MB_M1919_Armoured"
	,"SPE_US_G503_MB_M2"
	,"SPE_US_G503_MB_M2_Armoured"
	,"SPE_US_G503_MB_M1919_PATROL"
	,"SPE_US_G503_MB_M2_PATROL"
	,"SPE_CCKW_353"
	,"SPE_CCKW_353_Open"
	,"SPE_CCKW_353_M2"
	,"SPE_CCKW_353_Ambulance"
	,"SPE_CCKW_353_Ammo"
	,"SPE_CCKW_353_Fuel"
	,"SPE_CCKW_353_Repair"
	,"SPE_US_M3_Halftrack_Unarmed"
	,"SPE_US_M3_Halftrack_Unarmed"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M3_Halftrack"
	,"SPE_US_M3_Halftrack_Ambulance"
	,"SPE_US_M3_Halftrack_Ammo"
	,"SPE_US_M3_Halftrack_Fuel"
	,"SPE_US_M3_Halftrack_Repair"
	,"SPE_US_M16_Halftrack"
	,"SPE_M20_AUC"
	,"SPE_M8_LAC"
	,"SPE_M8_LAC_ringMount"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"SPE_P47"];
a3e_arr_O_transport_heli = [
	"SPE_P47"];
a3e_arr_O_pilots = [
	"SPE_US_Pilot"
	,"SPE_US_Pilot_2"];
a3e_arr_I_transport_heli = [
	"SPE_P47"];
a3e_arr_I_pilots = [
	"SPE_US_Pilot_Unequipped"];

//////////////////////////////////////////////////////////////////
// fn_createAmmoDepots.sqf
// Array of templates to usefor ammo depots
//////////////////////////////////////////////////////////////////
A3E_AmmoDepotTemplates = [
	"A3E_fnc_AmmoDepot_spe1"
	,"A3E_fnc_AmmoDepot_spe2"
	,"A3E_fnc_AmmoDepot_spe3"
	];

//Ammo Depot Crates
// classnames to be used for the crates that are placed at an ammo depot
a3e_arr_AmmoDepotCrate_Basic = ["SPE_BasicWeaponsBox_US"];
a3e_arr_AmmoDepotCrate_Special = ["SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball"];
a3e_arr_AmmoDepotCrate_Launchers = ["SPE_BasicWeaponsBox_US"];
a3e_arr_AmmoDepotCrate_Ordnance = ["SPE_Mine_AmmoBox_US"];
a3e_arr_AmmoDepotCrate_Vehicle = ["SPE_AmmoCrate_VehicleAmmo_US"];
a3e_arr_AmmoDepotCrate_Items = ["SPE_BasicAmmunitionBox_US"];
a3e_arr_AmmoDepotCrate_Random = ["SPE_BasicWeaponsBox_US"];
a3e_arr_AmmoDepotCrate_RandomInf = ["SPE_BasicWeaponsBox_US"];
a3e_arr_AmmoDepotCrate_Car = ["SPE_US_Open_Ammocrate_Rifle_Ball"];
a3e_arr_AmmoDepotCrate_CrashSite = ["SPE_Weaponcrate_MP40_GER"];
a3e_arr_AmmoDepotCrate_Extra1 = ["SPE_Hay_WeaponCache_FFI"];
a3e_arr_AmmoDepotCrate_Extra2 = ["SPE_Hay_WeaponCache_FFI"];

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
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M1911", 50, 4, 8, ["SPE_7Rnd_45ACP_1911"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M1_Carbine", 50, 4, 8, ["SPE_15Rnd_762x33"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M1_Garand", 100, 2, 4, ["SPE_8Rnd_762x63"], 12];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M1918A2_BAR", 30, 2, 4, ["SPE_20Rnd_762x63"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M1918A0_BAR", 20, 2, 4, ["SPE_20Rnd_762x63"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M1918A2_erla_BAR", 20, 2, 4, ["SPE_20Rnd_762x63"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M1A1_Thompson", 30, 2, 4, ["SPE_30Rnd_Thompson_45ACP"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_M3_GreaseGun", 50, 2, 4, ["SPE_30Rnd_M3_GreaseGun_45ACP"], 8];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_K98_Late", 30, 1, 3, ["SPE_5Rnd_792x57"], 16];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_K98_GW", 30, 1, 3, ["SPE_5Rnd_792x57", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_NBGR_42", "SPE_1Rnd_G_FLGR"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_No3_Mk1_Enfield_M1917_Bayonet", 30, 1, 3, ["SPE_5Rnd_770x56", "SPE_5Rnd_770x56_MKVIII", "SPE_5Rnd_770x56_AP_MKI"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_Fusil_Mle_208_12", 50, 1, 3, ["SPE_2Rnd_12x65_Pellets","SPE_2Rnd_12x65_Slug"], 20];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_MP40", 30, 1, 3, ["SPE_32Rnd_9x19"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_MAS_36", 30, 1, 3, ["SPE_5Rnd_75x54","SPE_5Rnd_75x54_35P_AP"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["SPE_G43", 30, 1, 3, ["SPE_10Rnd_792x57"], 8];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_Sten_Mk2", 50, 1, 2, ["SPE_32Rnd_9x19_Sten"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_Sten_Mk2_Suppressed", 25, 1, 2, ["SPE_32Rnd_9x19_Sten"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_Model_37_Riotgun", 25, 1, 2, ["SPE_5Rnd_12x70_Slug","SPE_5Rnd_12x70_Pellets","SPE_5Rnd_12x70_No4_Buck"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_Model_37_Trenchgun_M1917_Bayonet", 25, 1, 2, ["SPE_5Rnd_12x70_Slug","SPE_5Rnd_12x70_Pellets","SPE_5Rnd_12x70_No4_Buck"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_M1903A4_Springfield", 40, 2, 4, ["SPE_5Rnd_762x63_M1"], 20];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_M1_Garand_M7", 50, 1, 2, ["SPE_8Rnd_762x63_t", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_M1_Carbine_M8", 50, 2, 4, ["SPE_15Rnd_762x33_t", "SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_M17A1"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_M2_Flamethrower", 20, 1, 2, ["SPE_M2_Flamethrower_Mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_M1_Carbine_M8", 20, 1, 2, ["SPE_15Rnd_762x33_t"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_M1919A4", 25, 1, 2, ["SPE_50Rnd_762x63_M1"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_M1919A6", 20, 1, 2, ["SPE_50Rnd_762x63_M2_AP"], 8];

// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_FM_24_M29", 40, 2, 4, ["SPE_25Rnd_75x54"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_LMG_303_Mk2", 40, 2, 4, ["SPE_30Rnd_770x56"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_LMG_303_Mk2", 30, 2, 4, ["SPE_30Rnd_770x56_MKVIII","SPE_30Rnd_770x56_AP_MKI"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_K98ZF39", 20, 2, 4, ["SPE_5Rnd_792x57"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["SPE_Fusil_Mle_208_12_Sawedoff", 30, 2, 4, ["SPE_2Rnd_12x65_Pellets","SPE_2Rnd_12x65_No4_Buck"], 20];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["SPE_M1A1_Bazooka", 50, 3, 5, ["SPE_1Rnd_60mm_M6"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["SPE_M9A1_Bazooka", 40, 3, 5, ["SPE_1Rnd_60mm_M6A3"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["SPE_M1_81_Barrel", 30, 1, 3, [objNull], 0];
a3e_arr_AmmoDepotLaunchers pushback ["SPE_M1_81_Stand", 30, 1, 3, [objNull], 0];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["SPE_PzFaust_30m", 20, 1, 2, ["SPE_1Rnd_PzFaust_30m"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["SPE_PzFaust_60m", 10, 1, 2, ["SPE_1Rnd_PzFaust_60m"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["SPE_Faustpatrone", 30, 1, 2, ["SPE_1Rnd_Faustpatrone"], 1];

// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["SPE_US_TNT_half_pound_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["SPE_US_TNT_4pound_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["SPE_US_M1A1_ATMINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["SPE_US_Bangalore_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["SPE_US_M3_Pressure_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["SPE_US_M3_MINE_mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["SPE_US_Mk_1"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["SPE_US_Mk_2"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["SPE_US_Mk_2_Yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["SPE_US_Mk_3"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["SPE_M39"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["SPE_US_AN_M14"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 80, 1, 1, ["SPE_US_M15", "SPE_US_M18", "SPE_US_M18_Green", "SPE_US_M18_Red", "SPE_US_M18_Violet","SPE_US_M18_Yellow"], 20];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SPE_1Rnd_G_Mk2"], 20];	//HE
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SPE_1Rnd_G_M9A1"], 20];	//HEAT
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SPE_1Rnd_G_M2_AN_M14"], 20];	//Incendiary
a3e_arr_AmmoDepotVehicle pushback [objNull, 100, 1, 1, ["SPE_1Rnd_G_M17A1","SPE_1Rnd_G_M19A1","SPE_1Rnd_G_M21A1","SPE_1Rnd_G_M51A1"], 30];	//Flare
a3e_arr_AmmoDepotVehicle pushback [objNull, 80, 1, 1, ["SPE_1Rnd_G_M2_ANM8", "SPE_1Rnd_G_M2_M18_Red", "SPE_1Rnd_G_M2_M18_Green" ,"SPE_1Rnd_G_M2_M18_Yellow" ,"SPE_1Rnd_G_M2_M18_Violet"], 20];	//Smoke
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["SPE_ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["SPE_US_Medkit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["SPE_US_FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Sunglasses_US_Red", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Sunglasses_US_Yellow", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Polar_Goggles", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_SWDG_Goggles", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Ful_Vue", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Ful_Vue_Reinforced", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Pipe_Sir_Winston", 20, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Cigarette_Grundstein", 20, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Cigarette_Belomorkanal", 20, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Cigar_Moza", 20, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["G_SPE_Cigarette_Strike_Outs", 20, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_SPE_US_M36","B_SPE_US_M36_Bandoleer","B_SPE_US_M2Flamethrower","B_SPE_US_Backpack_roll"];
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
a3e_arr_AmmoDepotItems pushback ["SPE_Binocular_US", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["SPE_US_ItemCompass", 50, 1, 3];
//a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["SPE_US_ItemWatch", 50, 1, 10];
//a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
//a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["SPE_M1918A2_BAR_Handle", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["SPE_M1918A2_BAR_Bipod", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["SPE_ACC_M1_Bayo", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["SPE_ACC_M1905_Bayo", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["SPE_ACC_M1917_Bayo", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["SPE_ACC_GL_M1", 30, 1, 3];	//Springfield
a3e_arr_AmmoDepotItems pushback ["SPE_ACC_GL_M7", 30, 1, 3];	//Garand
a3e_arr_AmmoDepotItems pushback ["SPE_ACC_GL_M8", 30, 1, 3];	//M1
a3e_arr_AmmoDepotItems pushback ["SPE_ACC_M3_Suppressor_45acp", 20, 1, 3];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["SPE_P08", "SPE_8Rnd_9x19_P08", 5];
a3e_arr_CivilianCarWeapons pushback ["SPE_M1911", "SPE_7Rnd_45ACP_1911", 5];
a3e_arr_CivilianCarWeapons pushback ["SPE_Fusil_Mle_208_12_Sawedoff", "SPE_2Rnd_12x65_Pellets", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_Fusil_Mle_208_12_Sawedoff", "SPE_2Rnd_12x65_No4_Buck", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_Fusil_Mle_208_12", "SPE_2Rnd_12x65_Slug", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_Fusil_Mle_208_12", "SPE_2Rnd_12x65_Pellets", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_Model_37_Riotgun", "SPE_5Rnd_12x70_Pellets", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_Model_37_Riotgun", "SPE_5Rnd_12x70_No4_Buck", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_K98_Late", "SPE_5Rnd_792x57", 10];
a3e_arr_CivilianCarWeapons pushback ["SPE_PzFaust_30m", "SPE_1Rnd_PzFaust_30m", 1];
a3e_arr_CivilianCarWeapons pushback ["SPE_M1903A3_Springfield", "SPE_5Rnd_762x63_M1", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_No3_Mk1_Enfield_M1917_Bayonet", "SPE_5Rnd_770x56", 6];
a3e_arr_CivilianCarWeapons pushback ["SPE_MP40", "SPE_32Rnd_9x19", 8];
a3e_arr_CivilianCarWeapons pushback ["SPE_STG44", "SPE_30Rnd_792x33", 12];
a3e_arr_CivilianCarWeapons pushback ["SPE_FM_24_M29", "SPE_25Rnd_75x54", 12];
a3e_arr_CivilianCarWeapons pushback ["SPE_Faustpatrone", "SPE_1Rnd_Faustpatrone", 1];
//a3e_arr_CivilianCarWeapons pushback ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5];
//a3e_arr_CivilianCarWeapons pushback ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12];
//a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
//a3e_arr_CivilianCarWeapons pushback ["launch_RPG32_F", "RPG32_F", 2];
a3e_arr_CivilianCarWeapons pushback ["SPE_GER_FirstAidKit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["SPE_US_Medkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["SPE_ToolKit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["SPE_Binocular_US", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SPE_US_TNT_4pound_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "SPE_Shg24_Frag", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SPE_Rauchsichtzeichen_Orange", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"SPE_M1918A2_BAR_Handle"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [];
a3e_arr_NightScopes = [];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"SPE_M1918A2_BAR_Bipod"];

//////////////////////////////////////////////////////////////////
// revive/functions/revive/fn_Check_Revive_FAK.sqf and fn_HandleRevive
// additional types of FAKs or Medkits that should work for revives
// arrays have to be global, because check is performed on client
//////////////////////////////////////////////////////////////////
private _faks = [
	"FirstAidKit"
	,"SPE_US_FirstAidKit"
	,"SPE_GER_FirstAidKit"];
missionNamespace setvariable ["a3e_arr_faks",_faks,true];
_medkits = [
	"Medikit"
	,"SPE_GER_Medkit"
	,"SPE_US_Medkit"];
missionNamespace setvariable ["a3e_arr_medkits",_medkits,true];

//////////////////////////////////////////////////////////////////
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
	"land"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"B_Heli_Transport_01_F"];
a3e_arr_extraction_chopper_escort = [
	"B_Heli_Attack_01_dynamicLoadout_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"B_Boat_Armed_01_minigun_F"];
a3e_arr_extraction_boat_escort = [
	"B_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Cars/APCs that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"SPE_OpelBlitz",	//12
	"SPE_OpelBlitz_Open"];	//12
a3e_arr_extraction_car_escort = [
	"SPE_SdKfz250_1"
	,"SPE_PzKpfwIII_J"
	,"SPE_PzKpfwIII_L"
	,"SPE_PzKpfwIII_M"
	,"SPE_PzKpfwIII_N"
	,"SPE_PzKpfwIV_G"
	,"SPE_PzKpfwV_G"
	,"SPE_PzKpfwVI_H1"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"SPE_P47"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf
// Classnames of leaflet drones, disabled if array is created but empty 
//////////////////////////////////////////////////////////////////
a3e_arr_leafletdrone = [];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"SPE_P47"];
a3e_arr_searchChopperHard = [
	"SPE_P47"];
a3e_arr_searchChopper_pilot = [
	"SPE_US_Pilot"];
a3e_arr_searchChopper_crew = [
	"SPE_US_Pilot_2"];

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
if (isClass(configFile >> "CfgPatches" >> "spex_tem_utah_beach")) 
then {
	a3e_arr_AquaticPatrols = ["SPEX_LCVP"];
		} 
else {
	a3e_arr_AquaticPatrols = [];
	};

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "SPE_BasicWeaponsBox_US";
a3e_additional_weapon_box_2 = "SPE_BasicWeaponsBox_GER";

//////////////////////////////////////////////////////////////////
// fn_createMortarSites.sqf
// Array of templates to usefor mortar sites
//////////////////////////////////////////////////////////////////
A3E_MortarSiteTemplates = [
	"A3E_fnc_MortarSite_spe1"
	];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"SPE_M1_81"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"SPE_P47"];

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
	"SPE_FW190F8_MRWreck"];
a3e_arr_CrashSiteCrew = [
	"SPE_GER_pilot"];
a3e_arr_CrashSiteWrecksCar = [
	];
a3e_arr_CrashSiteCrewCar = [
	];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["SPE_PzFaust_30m", 50, 1, 2, ["SPE_1Rnd_PzFaust_30m"], 1];
a3e_arr_CrashSiteWeapons pushback ["SPE_PzFaust_60m", 40, 1, 2, ["SPE_1Rnd_PzFaust_60m"], 2];
a3e_arr_CrashSiteWeapons pushback ["SPE_Faustpatrone", 40, 1, 2, ["SPE_1Rnd_Faustpatrone"], 1];
a3e_arr_CrashSiteWeapons pushback ["SPE_RPzB_43", 30, 1, 2, ["SPE_1Rnd_RPzBGr_4322"], 1];
a3e_arr_CrashSiteWeapons pushback ["SPE_RPzB_54", 30, 1, 2, ["SPE_1Rnd_RPzBGr_4322"], 1];
a3e_arr_CrashSiteWeapons pushback ["SPE_K98_Bayonet", 15, 1, 2, ["SPE_5Rnd_792x57_sS"], 10];
a3e_arr_CrashSiteWeapons pushback ["SPE_K98_Late", 100, 1, 2, ["SPE_5Rnd_792x57"], 8];
a3e_arr_CrashSiteWeapons pushback ["SPE_K98_GW", 50, 1, 2, ["SPE_5Rnd_792x57","SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_NBGR_42","SPE_1Rnd_G_FLGR"], 8];
a3e_arr_CrashSiteWeapons pushback ["SPE_K98_Late_GW", 30, 2, 4, ["SPE_5Rnd_792x57", "SPE_1Rnd_G_PZGR_40", "SPE_1Rnd_G_NBGR_42", "SPE_1Rnd_G_FLGR"], 6];
a3e_arr_CrashSiteWeapons pushback ["SPE_K98ZF39", 75, 2, 4, ["SPE_5Rnd_792x57"], 12];
a3e_arr_CrashSiteWeapons pushback ["SPE_G43", 50, 2, 4, ["SPE_10Rnd_792x57", "SPE_10Rnd_792x57_T", "SPE_10Rnd_792x57_SMK"], 6];
a3e_arr_CrashSiteWeapons pushback ["SPE_MP40", 75, 1, 2, ["SPE_32Rnd_9x19"], 8];
a3e_arr_CrashSiteWeapons pushback ["SPE_MP35", 75, 1, 2, ["SPE_32Rnd_MP35_9x19"], 8];
a3e_arr_CrashSiteWeapons pushback ["SPE_STG44", 30, 1, 2, ["SPE_30Rnd_792x33"], 6];
a3e_arr_CrashSiteWeapons pushback ["SPE_FG42_E", 30, 1, 2, ["SPE_20Rnd_792x57"], 8];
a3e_arr_CrashSiteWeapons pushback ["SPE_Flammenwerfer41", 25, 1, 2, ["SPE_Flammenwerfer41_Mag"], 4];
a3e_arr_CrashSiteWeapons pushback ["SPE_MG34", 20, 1, 2, ["SPE_50Rnd_792x57_SMK"], 4];
a3e_arr_CrashSiteWeapons pushback ["SPE_MG42", 30, 1, 2, ["SPE_50Rnd_792x57"], 4];
a3e_arr_CrashSiteWeapons pushback [objNull, 50, 1, 1, ["SPE_Shg24_Frag","SPE_Shg24"], 10];
a3e_arr_CrashSiteWeapons pushback [objNull, 50, 1, 1, ["SPE_Shg24x7"], 10];
a3e_arr_CrashSiteWeapons pushback [objNull, 50, 1, 1, ["SPE_Handrauchzeichen_Red","SPE_Handrauchzeichen_Violet","SPE_Handrauchzeichen_Yellow"], 10];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["SPE_ACC_K98_Bayo", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["SPE_ACC_GW_SB_Empty", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["SPE_Optic_ZFG42", 20, 1, 3];

//Mines and traps, fn_initTraps
A3E_Trap_Classes = [["roadside","SPE_US_M3_Pressure_MINE"],["roadcenter","SPE_US_M3_MINE"],["roadcenter","SPE_US_M1A1_ATMINE"]];//Classnames of traps and mines. String or array in form [classname, trigger range, scriptcode]
A3E_Trap_Pathes = ["TRAIL","TRACK","ROAD","MAIN ROAD"]; //Classnames of roads and pathes for the traps to spawn