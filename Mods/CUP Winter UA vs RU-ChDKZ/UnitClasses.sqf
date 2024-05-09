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

A3E_VAR_Flag_Opfor = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_rus_co";
A3E_VAR_Flag_Ind = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_napa_co";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor]; // CUP AFU
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor]; // CUP RU Modern Winter
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind]; // CUP Chernarussion Movement of the Red Star

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
    "CUP_O_INS_Story_Bardak"
	,"CUP_O_INS_Woodlander3"
	,"CUP_O_INS_Woodlander2"
	,"CUP_O_INS_Worker2"
	,"CUP_O_INS_Woodlander1"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Browning_HP","CUP_13Rnd_9x19_Browning_HP"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_CZ75","CUP_16Rnd_9x19_cz75"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Compact","CUP_10Rnd_9x19_Compact"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Duty","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Duty_M3X","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Phantom_Flashlight","CUP_18Rnd_9x19_Phantom"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Phantom_Flashlight_snds","CUP_18Rnd_9x19_Phantom"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Deagle","CUP_7Rnd_50AE_Deagle"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M17_Black","CUP_21Rnd_9x19_M17_Black"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M17_Green","CUP_21Rnd_9x19_M17_Green"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17_blk","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9A1","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mk23","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_mk23_snds_lam","CUP_12Rnd_45ACP_mk23"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MP7","CUP_20Rnd_46x30_MP7"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MP7_woodland","CUP_40Rnd_46x30_MP7"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_P30L_blk","CUP_17Rnd_9x19_P30L"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_P30L_Match_blk","CUP_17Rnd_9x19_P30L"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PMM","CUP_12Rnd_9x18_PMM_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_SWM327MP","CUP_8Rnd_357SW_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TEC9_FA","CUP_32Rnd_9x19_TEC9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TT","CUP_8Rnd_762x25_TT"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_UZI","CUP_32Rnd_9x19_UZI_M"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	//CUP Civ
	"CUP_C_Datsun"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_Sport_random_Civ"
	,"CUP_C_Pickup_unarmed_CIV"
	,"CUP_C_Pickup_unarmed_CIV"
	,"CUP_C_Pickup_unarmed_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	//CUP Civ Cherna
	,"CUP_C_TT650_CIV"
	,"CUP_C_TT650_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Golf4_CR_Civ"
	,"CUP_C_Golf4_CR_Civ"
	,"CUP_C_Golf4_Sport_CR_Civ"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_Tractor_CIV"
	,"CUP_C_Tractor_Old_CIV"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Tigr_4x4_CIV"
	//Vanilla
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_repair_F"
	,"C_Quadbike_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_box_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"
	,"C_Truck_02_box_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_transport_F"];
	if(A3E_Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_service_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_transport_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_transport_F";
	};
	if(A3E_Param_UseDLCContact==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Tractor_01_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_covered_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_covered_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_covered_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_comms_F";
	};

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
	"CUP_O_Tigr_233011_WINTER_RU"
	,"CUP_O_Tigr_233011_WINTER_RU"
	,"CUP_O_Tigr_233014_WINTER_RU"
	,"CUP_O_Tigr_233014_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_RU"
	,"CUP_O_Tigr_M_233114_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_KORD_RU"
	,"CUP_O_Kamaz_6396_ammo_RUS_M"
	,"CUP_O_Kamaz_6396_fuel_RUS_M"
	,"CUP_O_Kamaz_6396_medical_RUS_M"
	,"CUP_O_Kamaz_6396_repair_RUS_M"
	,"CUP_O_Kamaz_6396_transport_RUS_M"
	,"CUP_O_Kamaz_6396_transport_RUS_M"
	,"CUP_O_Kamaz_6396_covered_RUS_M"
	,"CUP_O_Kamaz_6396_covered_RUS_M"
	,"CUP_O_Kamaz_RU"
	,"CUP_O_Kamaz_RU"
	,"CUP_O_Kamaz_Reammo_RU"
	,"CUP_O_Kamaz_Refuel_RU"
	,"CUP_O_Kamaz_Open_RU"
	,"CUP_O_Kamaz_Repair_RU"
	,"CUP_O_GAZ_Vodnik_Unarmed_RU"
	,"CUP_O_GAZ_Vodnik_Unarmed_RU"
	,"CUP_O_GAZ_Vodnik_PK_RU"
	,"CUP_O_GAZ_Vodnik_AGS_RU"
	,"CUP_O_GAZ_Vodnik_BPPU_RU"
	,"CUP_O_GAZ_Vodnik_KPVT_RU"
	,"CUP_O_GAZ_Vodnik_MedEvac_RU"
	,"CUP_O_MTLB_pk_Winter_RU"
	,"CUP_O_MTLB_pk_Winter_RU"
	,"CUP_O_MTLB_pk_Winter_RU"
	,"CUP_O_BMP2_AMB_RU"
	,"CUP_O_BMP_HQ_RU"
	,"CUP_O_BMP2_RU"
	,"CUP_O_BMP3_RU"
	,"CUP_O_BTR80_WINTER_RU"
	,"CUP_O_BTR80_WINTER_RU"
	,"CUP_O_BTR80A_WINTER_RU"
	,"CUP_O_BTR80A_WINTER_RU"
	,"CUP_O_BM21_RU"
	,"CUP_O_2S6_RU"
	,"CUP_O_2S6M_RU"
	,"CUP_O_T90_RU"
	,"CUP_O_T90M_WINTER_RU"];
	a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
	"CUP_O_TT650_CHDKZ"
	,"CUP_O_Datsun_4seat"
	,"CUP_O_Datsun_4seat"
	,"CUP_O_Datsun_PK_Random"
	,"CUP_O_Hilux_unarmed_CHDKZ"
	,"CUP_O_Hilux_unarmed_CHDKZ"
	,"CUP_O_Hilux_unarmed_CHDKZ"
	,"CUP_O_Hilux_AGS30_CHDKZ"
	,"CUP_O_Hilux_DSHKM_CHDKZ"
	,"CUP_O_Hilux_igla_CHDKZ"
	,"CUP_O_Hilux_metis_CHDKZ"
	,"CUP_O_Hilux_MLRS_CHDKZ"
	,"CUP_O_Hilux_podnos_CHDKZ"
	,"CUP_O_Hilux_SPG9_CHDKZ"
	,"CUP_O_Hilux_UB32_CHDKZ"
	,"CUP_O_Hilux_zu23_CHDKZ"
	,"CUP_O_UAZ_Unarmed_CHDKZ"
	,"CUP_O_UAZ_Unarmed_CHDKZ"
	,"CUP_O_UAZ_Unarmed_CHDKZ"
	,"CUP_O_UAZ_AGS30_CHDKZ"
	,"CUP_O_UAZ_MG_CHDKZ"
	,"CUP_O_UAZ_METIS_CHDKZ"
	,"CUP_O_UAZ_SPG9_CHDKZ"
	,"CUP_O_Ural_CHDKZ"
	,"CUP_O_Ural_CHDKZ"
	,"CUP_O_Ural_Reammo_CHDKZ"
	,"CUP_O_Ural_Empty_CHDKZ"
	,"CUP_O_Ural_Open_CHDKZ"
	,"CUP_O_Ural_Refuel_CHDKZ"
	,"CUP_O_Ural_Repair_CHDKZ"
	,"CUP_O_Datsun_AA_Random"
	,"CUP_O_UAZ_AA_CHDKZ"
	,"CUP_O_Ural_ZU23_CHDKZ"
	,"CUP_O_ZSU23_ChDKZ"
	,"CUP_O_ZSU23_Afghan_ChDKZ"
	,"CUP_O_BMP2_CHDKZ"
	,"CUP_O_BMP2_AMB_CHDKZ"
	,"CUP_O_BMP_HQ_CHDKZ"
	,"CUP_O_BRDM2_CHDKZ"
	,"CUP_O_BRDM2_ATGM_CHDKZ"
	,"CUP_O_BRDM2_HQ_CHDKZ"
	,"CUP_O_BTR60_CHDKZ"
	,"CUP_O_BTR60_CHDKZ"
	,"CUP_O_MTLB_pk_ChDKZ"
	,"CUP_O_MTLB_pk_ChDKZ"
	,"CUP_O_BM21_CHDKZ"
	,"CUP_O_T55_CHDKZ"
	,"CUP_O_T72_CHDKZ"];

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"CUP_O_RUS_M_Soldier_Lite_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Lite_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Lite_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Lite_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_TL_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_SL_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_A_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_AAR_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_AHAT_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_AAT_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_AR_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Medic_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Medic_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Engineer_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Exp_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_GL_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_MG_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Marksman_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Mine_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_AA_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_AT_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Repair_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_LAT_Ratnik_Winter"
	,"CUP_O_RUS_M_Soldier_HAT_Ratnik_Winter"];
a3e_arr_Escape_InfantryTypes_Ind =  [
	"CUP_O_INS_Soldier_Ammo"
	,"CUP_O_INS_Soldier_AR"
	,"CUP_O_INS_Officer"
	,"CUP_O_INS_Soldier_GL"
	,"CUP_O_INS_Sniper"
	,"CUP_O_INS_Soldier_MG"
	,"CUP_O_INS_Soldier_Engineer"
	,"CUP_O_INS_Medic"
	,"CUP_O_INS_Soldier"
	,"CUP_O_INS_Soldier_AK74"
	,"CUP_O_INS_Soldier_LAT"
	,"CUP_O_INS_Soldier_AT"
	,"CUP_O_INS_Soldier_AA"
	,"CUP_O_INS_Soldier_Exp"
	,"CUP_O_INS_Saboteur"
	,"CUP_O_INS_Commander"
	,"CUP_O_INS_Story_Lopotev"];
a3e_arr_recon_InfantryTypes = [
	"CUP_O_RUS_M_Recon_MG_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_Exp_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_GL_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_Marksman_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_Medic_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_Rifleman_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_LAT_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_Sharpshooter_Gorka_Brown"
	,"CUP_O_RUS_M_Recon_TL_Gorka_Brown"];
a3e_arr_recon_I_InfantryTypes = [
	"CUP_O_INS_Villager3"
	,"CUP_O_INS_Woodlander3"
	,"CUP_O_INS_Woodlander2"
	,"CUP_O_INS_Worker2"
	,"CUP_O_INS_Villager4"
	,"CUP_O_INS_Woodlander1"];

a3e_units_civilian_InfantryTypes = [
	"CUP_C_R_Assistant_01"
	,"CUP_C_R_Bully_01"
	,"CUP_C_R_Bully_02"
	,"CUP_C_R_Bully_03"
	,"CUP_C_R_Bully_04"
	,"CUP_C_R_Citizen_01"
	,"CUP_C_R_Citizen_02"
	,"CUP_C_R_Citizen_03"
	,"CUP_C_R_Citizen_04"
	,"CUP_C_R_Doctor_01"
	,"CUP_C_R_Functionary_01"
	,"CUP_C_R_Functionary_02"
	,"CUP_C_R_Functionary_03"
	,"CUP_C_R_Functionary_jacket_01"
	,"CUP_C_R_Functionary_jacket_02"
	,"CUP_C_R_Functionary_jacket_03"
	,"CUP_C_R_Worker_05"
	,"CUP_C_R_Mechanic_01"
	,"CUP_C_R_Mechanic_02"
	,"CUP_C_R_Mechanic_03"
	,"CUP_C_R_Policeman_01"
	,"CUP_C_R_Priest_01"
	,"CUP_C_R_Profiteer_01"
	,"CUP_C_R_Profiteer_02"
	,"CUP_C_R_Profiteer_03"
	,"CUP_C_R_Profiteer_04"
	,"CUP_C_R_Racketeer_01"
	,"CUP_C_R_Racketeer_02"
	,"CUP_C_R_Racketeer_03"
	,"CUP_C_R_Racketeer_04"
	,"CUP_C_R_Rocker_01"
	,"CUP_C_R_Rocker_02"
	,"CUP_C_R_Rocker_03"
	,"CUP_C_R_Rocker_04"
	,"CUP_C_R_Schoolteacher_01"
	,"CUP_C_R_Citizen_Random"
	,"CUP_C_R_Citizen_Random"
	,"CUP_C_R_Citizen_Random"
	,"CUP_C_R_Citizen_Random"
	,"CUP_C_R_Citizen_Random"
	,"CUP_C_R_Citizen_Random"
	,"CUP_C_R_Villager_01"
	,"CUP_C_R_Villager_02"
	,"CUP_C_R_Villager_03"
	,"CUP_C_R_Villager_04"
	,"CUP_C_R_Woodlander_01"
	,"CUP_C_R_Woodlander_02"
	,"CUP_C_R_Woodlander_03"
	,"CUP_C_R_Woodlander_04"
	,"CUP_C_R_Worker_01"
	,"CUP_C_R_Worker_02"
	,"CUP_C_R_Worker_03"
	,"CUP_C_R_Worker_04"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"CUP_O_Tigr_233014_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_KORD_RU"
	,"CUP_O_BMP3_RU"
	,"CUP_O_BTR60_Winter_RU"
	,"CUP_O_BTR80_WINTER_RU"
	,"CUP_O_BTR80A_WINTER_RU"
	,"CUP_O_GAZ_Vodnik_PK_RU"
	,"CUP_O_GAZ_Vodnik_KPVT_RU"
	,"CUP_O_GAZ_Vodnik_BPPU_RU"
	,"CUP_O_MTLB_pk_Winter_RU"
	,"CUP_O_ZU23_RUS_M_Winter"
	,"CUP_O_D30_AT_RUS_M_Winter"
	,"CUP_O_Igla_AA_pod_RUS_M_Winter"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"CUP_O_Datsun_PK_Random"
	,"CUP_O_Datsun_PK_Random"
	,"CUP_O_Datsun_PK_Random"
	,"CUP_O_Hilux_DSHKM_CHDKZ"
	,"CUP_O_Hilux_DSHKM_CHDKZ"
	,"CUP_O_Hilux_AGS30_CHDKZ"
	,"CUP_O_Hilux_metis_CHDKZ"
	,"CUP_O_Hilux_SPG9_CHDKZ"
	,"CUP_O_Hilux_UB32_CHDKZ"
	,"CUP_O_Hilux_zu23_CHDKZ"
	,"CUP_O_UAZ_MG_CHDKZ"
	,"CUP_O_UAZ_MG_CHDKZ"
	,"CUP_O_UAZ_MG_CHDKZ"
	,"CUP_O_UAZ_METIS_CHDKZ"
	,"CUP_O_UAZ_SPG9_CHDKZ"
	,"CUP_O_BRDM2_HQ_CHDKZ"
	,"CUP_O_BRDM2_HQ_CHDKZ"
	,"CUP_O_BRDM2_CHDKZ"
	,"CUP_O_BRDM2_CHDKZ"
	,"CUP_O_BRDM2_ATGM_CHDKZ"
	,"CUP_O_BTR60_CHDKZ"
	,"CUP_O_MTLB_pk_ChDKZ"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"CUP_O_Tigr_233014_WINTER_RU"	//3
	,"CUP_O_Tigr_M_233114_WINTER_PK_RU"
	,"CUP_O_MTLB_pk_Winter_RU"
	,"CUP_O_Kamaz_6396_covered_RUS_M"	//12
	,"CUP_O_Kamaz_RU"];	//12
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CUP_O_Ural_CHDKZ"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"CUP_O_MTLB_pk_Winter_RU"
	,"CUP_O_Tigr_M_233114_WINTER_KORD_RU"
	,"CUP_O_BTR80_WINTER_RU"
	,"CUP_O_BTR80A_WINTER_RU"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"CUP_O_BTR80A_WINTER_RU"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"CUP_O_T90M_WINTER_RU"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"CUP_O_KORD_high_RUS_M_Winter"
	];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"CUP_O_Tigr_233011_WINTER_RU"
	,"CUP_O_Tigr_233014_WINTER_RU"
	,"CUP_O_Tigr_233014_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_RU"
	,"CUP_O_Tigr_M_233114_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_KORD_RU"
	,"CUP_O_Kamaz_6396_transport_RUS_M"
	,"CUP_O_Kamaz_6396_covered_RUS_M"
	,"CUP_O_Kamaz_6396_ammo_RUS_M"
	,"CUP_O_Kamaz_6396_fuel_RUS_M"
	,"CUP_O_Kamaz_6396_repair_RUS_M"
	,"CUP_O_Kamaz_6396_medical_RUS_M"
	,"CUP_O_MTLB_pk_Winter_RU"
	,"CUP_O_BTR80_WINTER_RU"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	//CUP Civ
	"CUP_C_Datsun"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_Sport_random_Civ"
	,"CUP_C_Pickup_unarmed_CIV"
	,"CUP_C_Pickup_unarmed_CIV"
	,"CUP_C_Pickup_unarmed_CIV"
	,"CUP_C_Pickup_unarmed_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Octavia_CIV"
	//CUP Civ Cherna
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_Skoda_CR_CIV"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_C_S1203_CIV_CR"
	,"CUP_B_S1203_Ambulance_CR"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Volha_CR_CIV"
	,"CUP_C_Golf4_CR_Civ"
	,"CUP_C_Golf4_CR_Civ"
	,"CUP_C_Golf4_Sport_CR_Civ"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_O_Hilux_unarmed_CR_CIV"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_Ikarus_Chernarus"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_SUV_CIV"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	,"CUP_C_Lada_CIV"
	//Vanilla
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_repair_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_transport_F"];
	if(A3E_Param_UseDLCApex==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_service_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};
	if(A3E_Param_UseDLCContact==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_01_covered_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_01_covered_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_01_covered_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_01_comms_F";
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"CUP_O_AGS_RUS_M_Winter"
	,"CUP_O_Igla_AA_pod_RUS_M_Winter"
	,"CUP_O_KORD_RUS_M_Winter"
	,"CUP_O_KORD_RUS_M_Winter"
	,"CUP_O_KORD_high_RUS_M_Winter"
	,"CUP_O_Kornet_RUS_M_Winter"
	,"CUP_O_Metis_RUS_M_Winter"
	,"CUP_O_SearchLight_static_RUS_M_Winter"
	,"CUP_O_ZU23_RUS_M_Winter"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"CUP_O_Tigr_233011_WINTER_RU"
	,"CUP_O_Tigr_233014_WINTER_RU"
	,"CUP_O_Tigr_233014_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_RU"
	,"CUP_O_Tigr_M_233114_WINTER_PK_RU"
	,"CUP_O_Tigr_M_233114_WINTER_KORD_RU"
	,"CUP_O_Kamaz_6396_transport_RUS_M"
	,"CUP_O_Kamaz_6396_covered_RUS_M"
	,"CUP_O_GAZ_Vodnik_MedEvac_RU"
	,"CUP_O_Kamaz_6396_ammo_RUS_M"
	,"CUP_O_Kamaz_6396_fuel_RUS_M"
	,"CUP_O_Kamaz_6396_repair_RUS_M"
	,"CUP_O_Kamaz_RU"
	,"CUP_O_GAZ_Vodnik_PK_RU"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"CUP_O_Ka50_DL_RU"
	,"CUP_O_Ka50_DL_RU"
	,"CUP_O_Ka52_RU"
	,"CUP_O_Ka52_RU"
	,"CUP_O_Mi24_P_Dynamic_RU"
	,"CUP_O_Mi24_V_Dynamic_RU"
	,"CUP_O_Ka60_Grey_RU"];
a3e_arr_O_transport_heli = [
	"CUP_O_MI6T_RU"
	,"CUP_O_Mi8AMT_RU"
	,"CUP_O_Mi8_RU"
	,"CUP_O_Mi8_medevac_RU"
	,"CUP_O_Mi8_RU"];
a3e_arr_O_pilots = [
	"CUP_O_RU_Pilot_VDV_M_EMR"];
a3e_arr_I_transport_heli = [
	"CUP_O_Mi8_CHDKZ"
	,"CUP_O_Mi8_medevac_CHDKZ"];
a3e_arr_I_pilots = [
	"CUP_O_INS_Pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Rook40_F", 50, 2, 5, ["16Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_RPK74M", 40, 1, 2, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK12_AFG_winter", 100, 3, 5, ["CUP_30Rnd_545x39_AK12_Grey_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK12_VG_snowtiger", 10, 3, 5, ["CUP_30Rnd_545x39_AK12_Grey_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK15_winter", 20, 3, 5, ["CUP_30Rnd_762x39_AK15_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK15_snowtiger", 10, 3, 5, ["75rnd_762x39_AK12_Mag_Tracer_F"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK12_GP34_black", 75, 2, 4, ["CUP_30Rnd_545x39_AK_M", "CUP_IlumFlareWhite_GP25_M", "CUP_1Rnd_HE_GP25_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS74U_railed", 20, 1, 2, ["CUP_30Rnd_545x39_AK74_plum_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_SVD", 30, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_SVD_wdl_ghillie", 10, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Makarov", 50, 1, 3, ["CUP_8Rnd_9x18_Makarov_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_sgun_Saiga12K", 50, 2, 4, ["CUP_8Rnd_B_Saiga12_74Slug_M","CUP_8Rnd_B_Saiga12_74Pellets_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS", 50, 1, 3, ["CUP_30Rnd_762x39_AK47_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKM", 50, 1, 3, ["CUP_30Rnd_762x39_AK47_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS74U", 50, 1, 3, ["CUP_30Rnd_545x39_AK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK74M_GL", 50, 1, 3, ["CUP_30Rnd_545x39_AK_M","CUP_1Rnd_HE_GP25_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK74", 50, 1, 3, ["CUP_30Rnd_545x39_AK_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_RPK74", 30, 1, 2, ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_FNFAL5062", 10, 1, 2, ["CUP_20Rnd_762x51_FNFAL_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_FNFAL", 10, 1, 2, ["CUP_20Rnd_762x51_FNFAL_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK107_GL_kobra", 10, 1, 2, ["CUP_30Rnd_545x39_AK_M", "CUP_1Rnd_HE_GP25_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_Sa58_Klec", 10, 1, 2, ["CUP_45Rnd_Sa58_M"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_SAIGA_MK03_Wood", 10, 1, 2, ["CUP_10Rnd_762x39_SaigaMk03_M"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_SKS", 10, 1, 2, ["CUP_10Rnd_762x39_SKS_M"], 12];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AK109", 10, 1, 2, ["CUP_30Rnd_762x39_AK103_bakelite_M","CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_SR3M_Vikhr", 10, 1, 2, ["CUP_30Rnd_9x39_SP5_VIKHR_M"], 8];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_hgun_PB6P9", 50, 2, 4, ["CUP_8Rnd_9x18_MakarovSD_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_AS_VAL", 60, 2, 4, ["CUP_20Rnd_9x39_SP5_VSS_M"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_AS_VAL_flash_top", 30, 2, 4, ["CUP_20Rnd_9x39_SP5_VSS_M"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_ksvk", 20, 2, 4, ["CUP_5Rnd_127x108_KSVK_M"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_VSSVintorez_pso", 40, 2, 4, ["CUP_10Rnd_9x39_SP5_VSS_M"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_Pecheneg", 30, 1, 3, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_Pecheneg_top_rail_B50_vfg", 20, 1, 3, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_smg_BallisticShield_PP19", 30, 2, 4, ["CUP_30Rnd_9x19AP_Vityaz"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_OTS14_GROZA_762_GL", 30, 2, 4, ["CUP_30Rnd_762x39_AK47_M","CUP_1Rnd_HE_GP25_M"], 6];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_Sa58_Klec", 20, 2, 4, ["CUP_45Rnd_Sa58_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_CZ550", 40, 1, 2, ["CUP_5x_22_LR_17_HMR_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_PKM", 30, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_UK59", 10, 1, 2, ["CUP_50Rnd_UK59_762x54R_Tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_smg_bizon_snds", 50, 1, 2, ["CUP_64Rnd_9x19_Bizon_M"], 7];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arfile_Sa58_Carbine_RIS_AFG_woodland", 20, 1, 2, ["CUP_30Rnd_Sa58_woodland_M"], 10];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 10, 1, 2, ["CUP_PG7V_M", "CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG18", 10, 1, 3, ["CUP_RPG18_M"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 50, 1, 3, ["CUP_PG7V_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Metis", 50, 1, 3, ["CUP_AT13_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Igla", 50, 1, 2, ["CUP_Igla_M"], 3];
// non-CSAT weapons
//a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_MAAWS_Scope", 10, 1, 2, ["CUP_MAAWS_HEAT_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RShG2_Loaded", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG26_Loaded", 20, 1, 1, ["CUP_RPG26_M"], 1];
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
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_RGD5"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_Smoke_M203","CUP_1Rnd_SmokeRed_M203","CUP_1Rnd_SmokeGreen_M203","CUP_1Rnd_SmokeYellow_M203"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_GP25_M"], 25];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_IlumFlareWhite_GP25_M","CUP_IlumFlareRed_GP25_M","CUP_IlumFlareGreen_GP25_M","CUP_FlareWhite_GP25_M","CUP_FlareGreen_GP25_M","CUP_FlareRed_GP25_M","CUP_FlareYellow_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_SMOKE_GP25_M","CUP_1Rnd_SMOKERED_GP25_M","CUP_1Rnd_SMOKEGREEN_GP25_M","CUP_1Rnd_SMOKEYELLOW_GP25_M"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["CUP_B_RUS_Patrol_bag_Winter"];

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
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_Bizon", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_PBS4", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_PB6P9", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_1P87_RIS", 100, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_OKP_7_rail", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_OKP_7_w_rail", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_1P87_1P90_BLK", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_3", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PechenegScope", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_arifle_OTS14_GROZA_762_GL", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PGO7V3", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Zenit_2DS", 100, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_KZRZP_AK545_woodland", 20, 1, 3];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_4", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_NSPU", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_GOSHAWK", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_Harris_1A2_L", 10, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_TaurusTracker455_gold", "CUP_6Rnd_45ACP_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_FlareGun", "CUP_StarClusterWhite_265_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AKS_Gold", "CUP_30Rnd_762x39_AK47_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_Pellets", 9];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_M4A1_MOE_winter", "CUP_30Rnd_556x45_Stanag", 9];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_AA12", "CUP_20Rnd_B_AA12_HE", 9];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AKS74UN_kobra_snds", "CUP_30Rnd_545x39_AK_M", 9];
a3e_arr_CivilianCarWeapons pushback ["CUP_smg_Mac10", "CUP_30Rnd_45ACP_MAC10_M", 9];
a3e_arr_CivilianCarWeapons pushback ["CUP_glaunch_6G30", "CUP_1Rnd_HE_GP25_M", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_smg_M3A1", "CUP_30Rnd_45ACP_M3A1_M", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_Mk16_CQC_FG_woodland", "CUP_30Rnd_556x45_Stanag_Mk16_woodland", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_CZ805_A1_ZDDot_Laser", "CUP_30Rnd_556x45_CZ805", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_CZ_BREN2_556_14_Grn", "CUP_30Rnd_556x45_Stanag", 7];
a3e_arr_CivilianCarWeapons pushback ["CUP_lmg_M240", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_Mosin_Nagant", "CUP_5Rnd_762x54_Mosin_M", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_CZ550", "CUP_5x_22_LR_17_HMR_M", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_CZ750_SOS_bipod", "CUP_10Rnd_762x51_CZ750", 10];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_slamfire", "CUP_1Rnd_12Gauge_Pellets_No00_Buck", 20];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_slamfire", "CUP_1Rnd_12Gauge_HE", 20];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_m29_ke_caseless_stiger", "30Rnd_65x39_caseless_black_mag", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_smg_saiga9", "CUP_10Rnd_9x19_Saiga9", 8];
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
	"CUP_optic_Kobra"
	,"CUP_optic_OKP_7_rail"
	,"CUP_optic_OKP_7_w_rail"
	,"CUP_optic_PSO_1"
	,"CUP_optic_PSO_3"
	,"CUP_optic_PechenegScope"
	,"CUP_optic_1P87_RIS"
	,"CUP_optic_1P87_1P90_BLK"
	,"CUP_optic_OKP_7"
	,"CUP_optic_OKP_7_w"];
a3e_arr_Scopes_SMG = [
	"CUP_optic_Kobra"
	,"CUP_optic_OKP_7"
	,"CUP_optic_OKP_7_w"
	,"CUP_optic_OKP_7_rail"
	,"CUP_optic_OKP_7_w_rail"];
a3e_arr_Scopes_Sniper = [
	"CUP_optic_PSO_1"
	,"CUP_optic_PSO_3"];
a3e_arr_NightScopes = [
	"CUP_optic_NSPU"
	,"CUP_optic_AN_PVS_10"
	,"CUP_optic_AN_PVS_4"];
a3e_arr_TWSScopes = [
	"CUP_optic_GOSHAWK"
	,"CUP_optic_AN_PAS_13c2"
	,"CUP_optic_AN_PAS_13c1"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"CUP_bipod_VLTOR_Modpod"
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
	"CUP_B_Mi17_AFU"
	,"CUP_B_Mi17_AFU"
	,"CUP_B_Mi17_AFU"
	,"CUP_B_Mi24_D_MEV_Dynamic_AFU"];
a3e_arr_extraction_chopper_escort = [
	"CUP_B_Mi24_D_Dynamic_AFU"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"CUP_B_RHIB_USMC"
	,"CUP_B_RHIB_USMC"
	,"CUP_B_RHIB2Turret_USMC"
	,"CUP_B_MK10_GB"
	,"CUP_B_LCU1600_USMC"];
a3e_arr_extraction_boat_escort = [
	"CUP_B_RHIB_USMC"
	,"CUP_B_RHIB2Turret_USMC"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"CUP_B_Tigr_233011_AFU"	//8
	,"CUP_B_Tigr_M_233114_PK_AFU"	//7
	,"CUP_B_Ural_AFU"	//
	,"CUP_B_BTR60_AFU"	//
	,"CUP_B_MTLB_pk_AFU"	//9
	,"CUP_B_M2A3Bradley_AFU"];	//6
a3e_arr_extraction_car_escort = [
	"CUP_B_M2A3Bradley_AFU"
	,"CUP_B_Leopard_1A3GRNCROSS_UA"
	,"CUP_B_Leopard_1A3GRN_UA"
	,"CUP_B_Leopard2A6Green_UA"
	,"CUP_B_Leopard2A6_UA"
	,"CUP_B_M1A1_AFU"
	,"CUP_B_M1A1_TUSK_AFU"];

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
	"CUP_O_Mi8_medevac_CHDKZ","CUP_O_Mi8_VIV_CHDKZ"];
a3e_arr_searchChopperHard = [
	"CUP_O_Mi8_CHDKZ"];
a3e_arr_searchChopper_pilot = [
	"CUP_O_INS_Pilot"];
a3e_arr_searchChopper_crew = [
	"CUP_O_INS_Pilot"];

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
	"CUP_O_PBX_RU"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "CUP_RUBasicWeaponsBox";
a3e_additional_weapon_box_2 = "CUP_RUSpecialWeaponsBox";
a3e_additional_weapon_box_arsenal_cfgPatches = [
	"CUP_Weapons_AK",
	"CUP_Weapons_Bizon",
	"CUP_Weapons_East_Attachments",
	"CUP_Weapons_GROZA",
	"CUP_Weapons_KSVK",
	"CUP_Weapons_PK",
	"CUP_Weapons_SVD",
	"CUP_Weapons_VSS"];
a3e_additional_weapon_box_arsenal_weapons = [
	"CUP_glaunch_6G30"];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"CUP_O_2b14_82mm_RUS_M_Winter"]; //O_Mortar_01_F

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"CUP_O_Su25_Dyn_RU"
	,"CUP_O_SU34_RU","CUP_O_SU34_RU","CUP_O_SU34_RU"];

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
	,"Land_Wreck_Heli_Attack_01_F"
	,"CUP_UH1Y_StaticWeapon_Wreck"];
a3e_arr_CrashSiteCrew = [
	"CUP_B_AFU_Soldier_HeliPilot"
	,"CUP_B_AFU_Soldier_HeliCrew"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_HMMWV_F"
	,"Land_Wreck_Hunter_F"
	,"Land_Wreck_Slammer_F"];
a3e_arr_CrashSiteCrewCar = [
	"CUP_B_AFU_Soldier_Crewman"
	,"CUP_B_AFU_Soldier_ReconScout"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK12_GP34_black", 50, 2, 5, ["CUP_30Rnd_545x39_AK12_M","CUP_1Rnd_HE_GP25_M","CUP_IlumFlareWhite_GP25_M","CUP_FlareGreen_GP25_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74M_GL_camo", 40, 2, 5, ["CUP_30Rnd_545x39_AK74M_camo_M","CUP_1Rnd_HE_GP25_M","CUP_IlumFlareWhite_GP25_M","CUP_1Rnd_SMOKE_GP25_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_Metis", 30, 1, 2, ["CUP_AT13_M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_Igla", 50, 1, 2, ["CUP_HandGrenade_RGD5"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_HandGrenade_RGD5"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_MAAWS", 30, 1, 2, ["CUP_MAAWS_HEAT_M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_PzF3_Loaded", 40, 1, 2, ["CUP_PTF3IT_M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_PzF3_Loaded", 10, 1, 2, ["CUP_PTFHE_M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_PzF3_Loaded", 10, 1, 2, ["CUP_PTFHC_M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_APILAS", 30, 1, 2, ["CUP_HandGrenade_M67"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_Javelin", 50, 1, 2, ["CUP_Javelin_M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74M", 50, 3, 5, ["CUP_30Rnd_545x39_AK74M_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74M_camo", 100, 3, 5, ["CUP_30Rnd_545x39_AK74M_camo_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK12_black", 30, 3, 5, ["CUP_30Rnd_545x39_AK12_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK12_bicolor", 50, 3, 5, ["CUP_30Rnd_545x39_AK12_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_RPK74M", 40, 3, 5, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_hgun_FlareGun", 50, 1, 2, ["CUP_StarClusterGreen_265_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_Pecheneg", 75, 2, 4, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 5];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_SVD", 40, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 10];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_SVD_wdl", 30, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 10];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_ksvk", 30, 1, 2, ["CUP_5Rnd_127x108_KSVK_M"], 10];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_m249_pip4", 20, 1, 2, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_M4A1_SOMMOD_snow", 20, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_M4A1_SOMMOD_green", 20, 1, 2, ["CUP_30Rnd_556x45_PMAG_OD_RPL_Tracer_Red"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_MG3", 20, 1, 2, ["CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], 5];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_G3A3_modern_ris", 20, 1, 2, ["CUP_20Rnd_762x51_G3"], 10];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_ACR_blk_556", 40, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_M4A1_camo", 40, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_HK417_20", 30, 1, 2, ["CUP_20Rnd_762x51_HK417"], 12];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_HK416_CQB_M203_Wood", 20, 1, 2, ["CUP_30Rnd_556x45_Emag","CUP_1Rnd_HEDP_M203","CUP_1Rnd_StarFlare_White_M203"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_CZ_BREN2_556_8", 20, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_M2010_wdl", 20, 1, 2, ["CUP_5Rnd_762x67_M2010_M"], 12];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_RSASS_Winter", 30, 1, 2, ["CUP_20Rnd_762x51_B_M110"], 10];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_m29_caseless_winter", 10, 1, 2, ["30Rnd_65x39_caseless_black_mag","CUP_6Rnd_HE_Grenade_M"], 12];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["CUP_optic_OKP_7_rail", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_Kobra", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_acc_Zenit_2DS", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_1P87_RIS", 100, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PechenegScope", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_1", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_3", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_KZRZP_AK545", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_KZRZP_SVD_woodland", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_SVD_camo_g", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_M16", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_Elcan_SpecterDR_RMR_black", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_socom762rc", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_AN_PVS_10_black", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_bipod_G3SG1", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_VortexRazor_UH1_Black", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_CompM2_low_OD", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_MAAWS_Scope", 40, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_acc_ANPEQ_2", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_SB_3_12x50_PMII", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["bipod_01_F_blk", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_M16_camo", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_acc_ANPEQ_2_Flashlight_OD_L", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_CompM2_low_OD", 40, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_ZDDot", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_G33_HWS_OD", 40, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_LeupoldMk4_20x40_LRT", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_LeupoldMk4_25x50_LRT_SNOW", 50, 1, 3];