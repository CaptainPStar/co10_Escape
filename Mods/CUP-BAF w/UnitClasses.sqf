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
A3E_VAR_Side_Opfor = west;//Enemy side CUP BAF woodland
A3E_VAR_Side_Ind = resistance;//Independent side CUP ION PMC

A3E_VAR_Flag_Opfor = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_unionjack_co";
A3E_VAR_Flag_Ind = "\CUP\BaseConfigs\CUP_BaseConfigs\Data\Flags\flag_ion_black_co";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"CUP_I_PMC_Bodyguard_M4"
	,"CUP_I_PMC_Contractor1"
	,"CUP_I_PMC_Contractor2"
	,"CUP_I_PMC_Soldier"
	,"CUP_I_PMC_Soldier_GL"
	,"CUP_I_PMC_Soldier_GL_M16A2"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911_snds","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Compact","CUP_10Rnd_9x19_Compact"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Duty","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Duty_M3X","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_glock17_flashlight_snds","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9_snds","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_PB6P9_snds","CUP_8Rnd_9x18_MakarovSD_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi_snds","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Phantom_Flashlight","CUP_18Rnd_9x19_Phantom"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Phantom_Flashlight_snds","CUP_18Rnd_9x19_Phantom"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455_gold","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_SA61","CUP_20Rnd_B_765x17_Ball_M"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_SUV_CIV"
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
		"CUP_B_LR_Transport_GB_W"
		,"CUP_B_LR_MG_GB_W"
		,"CUP_B_LR_Ambulance_GB_W"
		,"CUP_B_LR_Special_M2_GB_W"
		,"CUP_B_LR_Special_GMG_GB_W"
		,"CUP_B_Jackal2_L2A1_GB_W"
		,"CUP_B_Jackal2_GMG_GB_W"
		,"CUP_B_BAF_Coyote_L2A1_W"
		,"CUP_B_BAF_Coyote_GMG_W"
		,"CUP_B_Mastiff_LMG_GB_W"
		,"CUP_B_Mastiff_HMG_GB_W"
		,"CUP_B_Mastiff_GMG_GB_W"
		,"CUP_B_Ridgback_LMG_GB_W"
		,"CUP_B_Ridgback_HMG_GB_W"
		,"CUP_B_Ridgback_GMG_GB_W"
		,"CUP_B_Wolfhound_LMG_GB_W"
		,"CUP_B_Wolfhound_HMG_GB_W"
		,"CUP_B_Wolfhound_GMG_GB_W"
		,"CUP_B_FV432_Bulldog_GB_W"
		,"CUP_B_FV432_Bulldog_GB_W_RWS"
		,"CUP_B_FV510_GB_W"
		,"CUP_B_FV510_GB_W_SLAT"
		,"CUP_B_MCV80_GB_W"
		,"CUP_B_MCV80_GB_W_SLAT"
		,"CUP_B_Challenger2_Woodland_BAF"
		,"CUP_B_Challenger2_2CW_BAF"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"CUP_I_SUV_ION"
		,"CUP_I_SUV_Armored_ION"
		,"CUP_I_FENNEK_ION"
		,"CUP_I_FENNEK_GMG_ION"
		,"CUP_I_FENNEK_HMG_ION"
		,"CUP_I_MATV_ION"
		,"CUP_I_MATV_GMG_ION"
		,"CUP_I_MATV_HMG_ION"
		,"CUP_I_4WD_AT_ION"
		,"CUP_I_4WD_LMG_ION"
		,"CUP_I_4WD_unarmed_ION"
		,"CUP_I_LSV_02_AT_ION"
		,"CUP_I_LSV_02_Minigun_ION"
		,"CUP_I_LSV_02_unarmed_ION"
		,"CUP_I_Van_ammo_ION"
		,"CUP_I_Van_Cargo_ION"
		,"CUP_I_Van_Repair_ION"
		,"CUP_I_Van_Transport_ION"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"CUP_B_LR_Transport_GB_W"
		,"CUP_B_LR_MG_GB_W"
		,"CUP_B_LR_Ambulance_GB_W"
		,"CUP_B_LR_Special_M2_GB_W"
		,"CUP_B_LR_Special_GMG_GB_W"
		,"CUP_B_Jackal2_L2A1_GB_W"
		,"CUP_B_Jackal2_GMG_GB_W"
		,"CUP_B_BAF_Coyote_L2A1_W"
		,"CUP_B_BAF_Coyote_GMG_W"
		,"CUP_B_Mastiff_LMG_GB_W"
		,"CUP_B_Mastiff_HMG_GB_W"
		,"CUP_B_Mastiff_GMG_GB_W"
		,"CUP_B_Ridgback_LMG_GB_W"
		,"CUP_B_Ridgback_HMG_GB_W"
		,"CUP_B_Ridgback_GMG_GB_W"
		,"CUP_B_Wolfhound_LMG_GB_W"
		,"CUP_B_Wolfhound_HMG_GB_W"
		,"CUP_B_Wolfhound_GMG_GB_W"
		,"CUP_B_FV432_Bulldog_GB_W"
		,"CUP_B_FV432_Bulldog_GB_W_RWS"
		,"CUP_B_FV510_GB_W"
		,"CUP_B_FV510_GB_W_SLAT"
		,"CUP_B_MCV80_GB_W"
		,"CUP_B_MCV80_GB_W_SLAT"
		,"CUP_B_Challenger2_Woodland_BAF"
		,"CUP_B_Challenger2_2CW_BAF"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"CUP_I_SUV_ION"
		,"CUP_I_SUV_Armored_ION"
		,"CUP_I_FENNEK_ION"
		,"CUP_I_FENNEK_GMG_ION"
		,"CUP_I_FENNEK_HMG_ION"
		,"CUP_I_MATV_ION"
		,"CUP_I_MATV_GMG_ION"
		,"CUP_I_MATV_HMG_ION"
		,"CUP_I_4WD_AT_ION"
		,"CUP_I_4WD_LMG_ION"
		,"CUP_I_4WD_unarmed_ION"
		,"CUP_I_LSV_02_AT_ION"
		,"CUP_I_LSV_02_Minigun_ION"
		,"CUP_I_LSV_02_unarmed_ION"
		,"CUP_I_Van_ammo_ION"
		,"CUP_I_Van_Cargo_ION"
		,"CUP_I_Van_Repair_ION"
		,"CUP_I_Van_Transport_ION"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"CUP_B_LR_Transport_GB_W"
		,"CUP_B_LR_MG_GB_W"
		,"CUP_B_LR_Ambulance_GB_W"
		,"CUP_B_LR_Special_M2_GB_W"
		,"CUP_B_LR_Special_GMG_GB_W"
		,"CUP_B_Jackal2_L2A1_GB_W"
		,"CUP_B_Jackal2_GMG_GB_W"
		,"CUP_B_BAF_Coyote_L2A1_W"
		,"CUP_B_BAF_Coyote_GMG_W"
		,"CUP_B_Mastiff_LMG_GB_W"
		,"CUP_B_Mastiff_HMG_GB_W"
		,"CUP_B_Mastiff_GMG_GB_W"
		,"CUP_B_Ridgback_LMG_GB_W"
		,"CUP_B_Ridgback_HMG_GB_W"
		,"CUP_B_Ridgback_GMG_GB_W"
		,"CUP_B_Wolfhound_LMG_GB_W"
		,"CUP_B_Wolfhound_HMG_GB_W"
		,"CUP_B_Wolfhound_GMG_GB_W"
		,"CUP_B_FV432_Bulldog_GB_W"
		,"CUP_B_FV432_Bulldog_GB_W_RWS"
		,"CUP_B_FV510_GB_W"
		,"CUP_B_FV510_GB_W_SLAT"
		,"CUP_B_MCV80_GB_W"
		,"CUP_B_MCV80_GB_W_SLAT"
		,"CUP_B_Challenger2_Woodland_BAF"
		,"CUP_B_Challenger2_2CW_BAF"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"CUP_I_SUV_ION"
		,"CUP_I_SUV_Armored_ION"
		,"CUP_I_FENNEK_ION"
		,"CUP_I_FENNEK_GMG_ION"
		,"CUP_I_FENNEK_HMG_ION"
		,"CUP_I_MATV_ION"
		,"CUP_I_MATV_GMG_ION"
		,"CUP_I_MATV_HMG_ION"
		,"CUP_I_4WD_AT_ION"
		,"CUP_I_4WD_LMG_ION"
		,"CUP_I_4WD_unarmed_ION"
		,"CUP_I_LSV_02_AT_ION"
		,"CUP_I_LSV_02_Minigun_ION"
		,"CUP_I_LSV_02_unarmed_ION"
		,"CUP_I_Van_ammo_ION"
		,"CUP_I_Van_Cargo_ION"
		,"CUP_I_Van_Repair_ION"
		,"CUP_I_Van_Transport_ION"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"CUP_B_BAF_Soldier_WDL"
	,"CUP_B_BAF_Soldier_AA_WDL"
	,"CUP_B_BAF_Soldier_AA_WDL"
	,"CUP_B_BAF_Soldier_AAA_WDL"
	,"CUP_B_BAF_Soldier_AAT_WDL"
	,"CUP_B_BAF_Soldier_AHAT_WDL"
	,"CUP_B_BAF_Soldier_AAR_WDL"
	,"CUP_B_BAF_Soldier_AMG_WDL"
	,"CUP_B_BAF_Soldier_AT_WDL"
	,"CUP_B_BAF_Soldier_AT_WDL"
	,"CUP_B_BAF_Soldier_AT_WDL"
	,"CUP_B_BAF_Soldier_HAT_WDL"
	,"CUP_B_BAF_Soldier_HAT_WDL"
	,"CUP_B_BAF_Soldier_AR_WDL"
	,"CUP_B_BAF_Engineer_WDL"
	,"CUP_B_BAF_Engineer_WDL"
	,"CUP_B_BAF_Soldier_GL_WDL"
	,"CUP_B_BAF_Soldier_JTAC_WDL"
	,"CUP_B_BAF_Soldier_MG_WDL"
	,"CUP_B_BAF_Soldier_scout_WDL"
	,"CUP_B_BAF_Soldier_Marksman_WDL"
	,"CUP_B_BAF_Medic_WDL"
	,"CUP_B_BAF_Medic_WDL"
	,"CUP_B_BAF_Officer_WDL"
	,"CUP_B_BAF_Soldier_Backpack_WDL"
	,"CUP_B_BAF_Soldier_Light_WDL"
	,"CUP_B_BAF_Soldier_Night_WDL"
	,"CUP_B_BAF_Soldier_SL_WDL"
	,"CUP_B_BAF_Sniper_AS50_TWS_WDL"
	,"CUP_B_BAF_Sniper_WDL"
	,"CUP_B_BAF_Sniper_AS50_WDL"
	,"CUP_B_BAF_Spotter_WDL"
	,"CUP_B_BAF_Spotter_L85TWS_WDL"
	,"CUP_B_BAF_Soldier_TL_WDL"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"CUP_I_PMC_Soldier_TL"
	,"CUP_I_PMC_Soldier"
	,"CUP_I_PMC_Soldier_GL"
	,"CUP_I_PMC_Soldier_GL_M16A2"
	,"CUP_I_PMC_Soldier_M4A3"
	,"CUP_I_PMC_Soldier_MG"
	,"CUP_I_PMC_Soldier_MG_PKM"
	,"CUP_I_PMC_Soldier_AA"
	,"CUP_I_PMC_Soldier_AT"
	,"CUP_I_PMC_Soldier_AT"
	,"CUP_I_PMC_Soldier_AT"
	,"CUP_I_PMC_Sniper_KSVK"
	,"CUP_I_PMC_Sniper"
	,"CUP_I_PMC_Medic"
	,"CUP_I_PMC_Engineer"
	,"CUP_I_PMC_Bodyguard_AA12"
	,"CUP_I_PMC_Bodyguard_M4"
	,"CUP_I_PMC_Contractor1"
	,"CUP_I_PMC_Contractor2"];
a3e_arr_recon_InfantryTypes = [
	"CUP_B_BAF_Soldier_MTP"
	,"CUP_B_BAF_Soldier_AA_MTP"
	,"CUP_B_BAF_Soldier_AA_MTP"
	,"CUP_B_BAF_Soldier_AAA_MTP"
	,"CUP_B_BAF_Soldier_AAT_MTP"
	,"CUP_B_BAF_Soldier_AHAT_MTP"
	,"CUP_B_BAF_Soldier_AAR_MTP"
	,"CUP_B_BAF_Soldier_AMG_MTP"
	,"CUP_B_BAF_Soldier_AT_MTP"
	,"CUP_B_BAF_Soldier_AT_MTP"
	,"CUP_B_BAF_Soldier_AT_MTP"
	,"CUP_B_BAF_Soldier_HAT_MTP"
	,"CUP_B_BAF_Soldier_HAT_MTP"
	,"CUP_B_BAF_Soldier_AR_MTP"
	,"CUP_B_BAF_Engineer_MTP"
	,"CUP_B_BAF_Engineer_MTP"
	,"CUP_B_BAF_Soldier_GL_MTP"
	,"CUP_B_BAF_Soldier_JTAC_MTP"
	,"CUP_B_BAF_Soldier_MG_MTP"
	,"CUP_B_BAF_Soldier_scout_MTP"
	,"CUP_B_BAF_Soldier_Marksman_MTP"
	,"CUP_B_BAF_Medic_MTP"
	,"CUP_B_BAF_Medic_MTP"
	,"CUP_B_BAF_Officer_MTP"
	,"CUP_B_BAF_Soldier_Backpack_MTP"
	,"CUP_B_BAF_Soldier_Light_MTP"
	,"CUP_B_BAF_Soldier_Night_MTP"
	,"CUP_B_BAF_Soldier_SL_MTP"
	,"CUP_B_BAF_Sniper_AS50_TWS_MTP"
	,"CUP_B_BAF_Sniper_MTP"
	,"CUP_B_BAF_Sniper_AS50_MTP"
	,"CUP_B_BAF_Spotter_MTP"
	,"CUP_B_BAF_Spotter_L85TWS_MTP"
	,"CUP_B_BAF_Soldier_TL_MTP"];
a3e_arr_recon_I_InfantryTypes = [
	"CUP_I_PMC_Soldier_TL"
	,"CUP_I_PMC_Soldier"
	,"CUP_I_PMC_Soldier_GL"
	,"CUP_I_PMC_Soldier_GL_M16A2"
	,"CUP_I_PMC_Soldier_M4A3"
	,"CUP_I_PMC_Soldier_MG"
	,"CUP_I_PMC_Soldier_MG_PKM"
	,"CUP_I_PMC_Soldier_AA"
	,"CUP_I_PMC_Soldier_AT"
	,"CUP_I_PMC_Soldier_AT"
	,"CUP_I_PMC_Soldier_AT"
	,"CUP_I_PMC_Sniper_KSVK"
	,"CUP_I_PMC_Sniper"
	,"CUP_I_PMC_Medic"
	,"CUP_I_PMC_Engineer"
	,"CUP_I_PMC_Bodyguard_AA12"
	,"CUP_I_PMC_Bodyguard_M4"
	,"CUP_I_PMC_Contractor1"
	,"CUP_I_PMC_Contractor2"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"CUP_B_LR_MG_GB_W"
	,"CUP_B_LR_Special_GMG_GB_W"
	,"CUP_B_Mastiff_HMG_GB_W"
	,"CUP_B_BAF_Coyote_L2A1_W"
	,"CUP_B_FV510_GB_W_SLAT"
	,"CUP_B_LR_MG_GB_W"
	,"CUP_B_L111A1_BAF_WDL"
	,"CUP_B_L111A1_MiniTripod_BAF_WDL"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"CUP_I_FENNEK_HMG_ION"
	,"CUP_I_FENNEK_GMG_ION"
	,"CUP_I_SUV_Armored_ION"
	,"CUP_I_SUV_Armored_ION"
	,"CUP_I_MATV_HMG_ION"
	,"CUP_I_4WD_AT_ION"
	,"CUP_I_4WD_LMG_ION"
	,"CUP_I_LSV_02_AT_ION"
	,"CUP_I_LSV_02_Minigun_ION"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"CUP_B_LR_Transport_GB_W"//7
	,"CUP_B_LR_Special_M2_GB_W"//7
	,"CUP_B_Jackal2_L2A1_GB_W"//8
	,"CUP_B_BAF_Coyote_L2A1_W"//9
	,"CUP_B_Mastiff_LMG_GB_W"//8
	,"CUP_B_Mastiff_GMG_GB_W"//8
	,"CUP_B_FV510_GB_W"//7
	,"CUP_B_FV432_Bulldog_GB_W"];//8
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"CUP_I_SUV_ION"//12
	,"CUP_I_SUV_Armored_ION"//9
	,"CUP_I_SUV_ION"//12
	,"CUP_I_SUV_Armored_ION"//9
	,"CUP_I_FENNEK_ION"
	,"CUP_I_4WD_unarmed_ION"
	,"CUP_I_Van_Transport_ION"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"CUP_B_LR_Transport_GB_W"
	,"CUP_B_LR_Special_M2_GB_W"
	,"CUP_B_LR_Special_GMG_GB_W"
	,"CUP_B_Ridgback_LMG_GB_W"
	,"CUP_B_Ridgback_HMG_GB_W"
	,"CUP_B_Ridgback_GMG_GB_W"
	,"CUP_B_Mastiff_HMG_GB_W"
	,"CUP_B_Jackal2_L2A1_GB_W"
	,"CUP_B_BAF_Coyote_L2A1_W"
	,"CUP_B_FV432_Bulldog_GB_W"
	,"CUP_B_FV432_Bulldog_GB_W_RWS"
	,"CUP_B_FV510_GB_W"
	,"CUP_B_MCV80_GB_W"
	,"CUP_I_SUV_Armored_ION"
	,"CUP_I_LSV_02_Minigun_ION"
	,"CUP_I_4WD_LMG_ION"
	,"CUP_I_MATV_HMG_ION"
	,"CUP_I_FENNEK_HMG_ION"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"CUP_B_Ridgback_HMG_GB_W"
	,"CUP_B_Ridgback_GMG_GB_W"
	,"CUP_B_FV432_Bulldog_GB_W"
	,"CUP_B_FV432_Bulldog_GB_W_RWS"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"CUP_B_FV510_GB_W_SLAT"
	,"CUP_B_MCV80_GB_W_SLAT"
	,"CUP_B_Challenger2_Woodland_BAF"
	,"CUP_B_Challenger2_Woodland_BAF"
	,"CUP_B_Challenger2_2CW_BAF"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"CUP_B_L111A1_BAF_WDL"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"I_G_Offroad_01_repair_F"
	,"CUP_B_FV432_Bulldog_GB_W"
	,"CUP_B_FV432_Bulldog_GB_W"
	,"CUP_B_BAF_Coyote_L2A1_W"
	,"CUP_B_BAF_Coyote_GMG_W"
	,"CUP_B_Jackal2_L2A1_GB_W"
	,"CUP_B_LR_Ambulance_GB_W"
	,"CUP_B_LR_MG_GB_W"
	,"CUP_B_LR_Transport_GB_W"
	,"CUP_B_LR_Special_GMG_GB_W"
	,"CUP_B_LR_Special_M2_GB_W"
	,"CUP_B_MTVR_USMC"
	,"CUP_B_MTVR_Ammo_USMC"
	,"CUP_B_MTVR_Refuel_USMC"
	,"CUP_B_MTVR_Repair_USMC"
	,"CUP_I_SUV_ION"
	,"CUP_I_SUV_Armored_ION"
	,"CUP_I_SUV_Armored_ION"
	,"CUP_I_4WD_AT_ION"
	,"CUP_I_4WD_LMG_ION"
	,"CUP_I_LSV_02_Minigun_ION"
	,"CUP_I_Van_Transport_ION"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_Ural_Civ_01"
	,"CUP_C_Ural_Civ_02"
	,"CUP_C_Ural_Civ_03"
	,"CUP_C_Ural_Open_Civ_01"
	,"CUP_C_Ural_Open_Civ_02"
	,"CUP_C_Ural_Open_Civ_03"
	,"CUP_C_Datsun"
	,"CUP_C_Datsun_4seat"
	,"CUP_C_Datsun_Plain"
	,"CUP_C_Datsun_Covered"
	,"CUP_C_Datsun_Tubeframe"
	,"CUP_C_Octavia_CIV"
	,"CUP_C_Skoda_White_CIV"
	,"CUP_C_Skoda_Red_CIV"
	,"CUP_C_Skoda_Blue_CIV"
	,"CUP_C_Skoda_Green_CIV"
	,"CUP_C_Golf4_red_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_Golf4_random_Civ"
	,"CUP_C_SUV_CIV"
	,"C_Hatchback_01_F"
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
	"CUP_B_L111A1_BAF_WDL"
	,"CUP_B_L111A1_MiniTripod_BAF_WDL"
	,"CUP_I_MK19_TriPod_AAF"
	,"CUP_B_TOW_TriPod_US"
	,"CUP_I_Igla_AA_pod_AAF"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"CUP_B_AH1_DL_BAF"];
a3e_arr_O_transport_heli = [
	"CUP_B_AW159_Unarmed_RN_Blackcat"
	,"CUP_B_AW159_Unarmed_GB"
	,"CUP_B_AW159_Unarmed_RN_Grey"
	,"CUP_B_CH47F_GB"
	,"CUP_B_Merlin_HC3_GB"
	,"CUP_B_Merlin_HC3_Armed_GB"
	,"CUP_B_Merlin_HC3A_GB"
	,"CUP_B_Merlin_HC3A_Armed_GB"
	,"CUP_B_Merlin_HC4_GB"
	,"CUP_B_SA330_Puma_HC1_BAF"
	,"CUP_B_SA330_Puma_HC2_BAF"];
a3e_arr_O_pilots = [
	"CUP_B_BAF_Pilot_WDL"];
a3e_arr_I_transport_heli = [
	"CUP_I_MH6M_ION"];
a3e_arr_I_pilots = [
	"CUP_I_PMC_Pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_L85A2", 20, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_L85A2_G", 50, 3, 5, ["CUP_30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_L85A2_NG", 50, 2, 4, ["CUP_30Rnd_9x19_EVO"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_L85A2_GL", 75, 2, 4, ["CUP_30Rnd_556x45_Stanag","CUP_1Rnd_HEDP_M203"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_lmg_M240", 20, 1, 2, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_M24_wdl", 20, 1, 2, ["CUP_5Rnd_762x51_M24"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_L129A1", 10, 1, 2, ["CUP_20Rnd_762x51_L129_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_L129A1_HG", 10, 1, 2, ["CUP_20Rnd_762x51_L129_M"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_xm8_SAW", 50, 2, 4, ["CUP_100Rnd_556x45_BetaCMag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_L86A2", 50, 1, 3, ["CUP_30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_XM8_Carbine_GL", 50, 1, 3, ["CUP_30Rnd_556x45_G36","CUP_1Rnd_HEDP_M203"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_XM8_Carbine", 50, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_M14", 20, 1, 2, ["CUP_20Rnd_762x51_DMR"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_Sa58RIS1", 10, 1, 2, ["CUP_30Rnd_Sa58_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_L85A2_GL", 25, 1, 2, ["CUP_30Rnd_556x45_Stanag","CUP_1Rnd_HE_M203"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_Mk16_CQC_SFG", 20, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_Mk16_STD_FG", 50, 1, 2, ["CUP_30Rnd_556x45_Stanag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_Mk17_STD", 20, 1, 2, ["CUP_20Rnd_762x51_B_SCAR"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_sgun_AA12", 20, 1, 2, ["CUP_20Rnd_B_AA12_Pellets"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_sgun_M1014", 10, 1, 2, ["CUP_8Rnd_B_Beneli_74Slug","CUP_8Rnd_B_Beneli_74Pellets"], 10];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_AWM_des", 50, 2, 4, ["CUP_5Rnd_86x70_L115A1"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M110", 10, 2, 4, ["CUP_20Rnd_762x51_B_M110"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M24_ghillie", 50, 2, 4, ["CUP_5Rnd_762x51_M24"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_Mk48_wdl", 50, 1, 2, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_L110A1", 50, 1, 3, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_L7A2", 50, 1, 3, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_AS50", 10, 2, 4, ["CUP_5Rnd_127x99_as50_M"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_MG36", 30, 1, 2, ["CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag"], 6];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Mk153Mod0", 50, 1, 2, ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M"], 4];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M136", 50, 1, 3, ["CUP_M136_M"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_NLAW", 25, 1, 3, ["CUP_NLAW_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M47", 50, 1, 3, ["CUP_Dragon_EP1_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_MAAWS_Scope", 40, 1, 2, ["CUP_MAAWS_HEAT_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Javelin", 25, 1, 3, ["CUP_Javelin_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 2, ["CUP_Stinger_M"], 3];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 10, 1, 2, ["CUP_PG7V_M", "CUP_PG7VL_M", "CUP_PG7VR_M", "CUP_OG7_M"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG18", 30, 1, 3, ["CUP_RPG18_M"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 20, 1, 3, ["CUP_PG7V_M"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Metis", 10, 1, 3, ["CUP_AT13_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_Igla", 10, 1, 2, ["CUP_Igla_M"], 3];


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
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["CUP_1Rnd_HE_GP25_M"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 25, 1, 1, ["CUP_1Rnd_StarCluster_White_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_1Rnd_StarCluster_Green_M203","CUP_1Rnd_StarFlare_White_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarFlare_Green_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_FlareWhite_M203","CUP_FlareGreen_M203","CUP_FlareRed_M203","CUP_FlareYellow_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25];
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
a3e_arr_AmmoDepotItems pushback ["Laserdesignator", 10, 1, 2];
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
a3e_arr_AmmoDepotItems pushback ["CUP_acc_ANPEQ_15", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M16", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M16_camo", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Eotech533", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_SUSAT", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ACOG", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ElcanM145", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Leupold_VX3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_RCO", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Woodland", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Woodland2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_CompM2_Black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_CQ_T", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ELCAN_SpecterDR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_SB_11_4x20_PM", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_ZDDot", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_MRad", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_TrijiconRx01_black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_SB_3_12x50_PMII", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_HoloBlack", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_HoloWdl", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldM3LR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_LeupoldMk4_10x40_LRT_Woodland", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_Kobra", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PechenegScope", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_3", 20, 1, 3];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PAS_13c1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_AN_PVS_10", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_CWS", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_GOSHAWK", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_NSPU", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Yorris", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_LRPS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_AMS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_mtp", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_oli", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_VLTOR_Modpod", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_Harris_1A2_L", 10, 1, 2];


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
	"CUP_optic_Kobra"
	,"CUP_optic_PSO_1"
	,"CUP_optic_PSO_3"
	,"CUP_optic_PechenegScope"
	,"CUP_optic_SB_3_12x50_PMII"
	,"CUP_optic_LeupoldMk4"
	,"CUP_optic_HoloWdl"
	,"CUP_optic_HoloWdl"
	,"CUP_optic_HoloWdl"
	,"CUP_optic_Eotech533"
	,"CUP_optic_Eotech533Grey"
	,"CUP_optic_CompM4"
	,"CUP_optic_SUSAT"
	,"CUP_optic_ACOG"
	,"CUP_optic_RCO"
	,"CUP_optic_RCO"
	,"CUP_optic_ElcanM145"
	,"CUP_optic_ELCAN_SpecterDR"
	,"CUP_optic_LeupoldMk4_CQ_T"
	,"CUP_optic_ZDDot"];
a3e_arr_Scopes_SMG = [
	"CUP_optic_Kobra"
	,"CUP_optic_Eotech533"
	,"CUP_optic_ZDDot"];
a3e_arr_Scopes_Sniper = [
	"CUP_optic_PSO_1"
	,"CUP_optic_PSO_3"
	,"CUP_optic_LeupoldMk4"
	,"CUP_optic_SB_3_12x50_PMII"
	,"CUP_optic_LeupoldMk4_10x40_LRT_Woodland"];
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
	,"CUP_bipod_Harris_1A2_L"
	,"bipod_01_F_snd"
	,"bipod_01_F_blk"
	,"bipod_01_F_mtp"
	,"bipod_02_F_blk"
	,"bipod_02_F_tan"
	,"bipod_02_F_hex"
	,"bipod_03_F_blk"
	,"bipod_03_F_oli"];


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
	"CUP_USMC_MQ9"];

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
	"CUP_I_PMC_Pilot"];
a3e_arr_searchChopper_crew = [
	"CUP_I_PMC_Pilot"];

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
	"CUP_B_L16A2_BAF_WDL"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"CUP_B_F35B_BAF"
	,"CUP_B_F35B_Stealth_BAF"
	,"CUP_B_GR9_DYN_GB"];

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
	"CUP_O_RU_Pilot"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_BMP2_F"
	,"Land_Wreck_BRDM2_F"
];
a3e_arr_CrashSiteCrewCar = [
	"CUP_O_RU_Crew_VDV"
	,"CUP_O_RU_Soldier_Saiga_VDV"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74M_GL", 50, 2, 5, ["CUP_30Rnd_545x39_AK_M","CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M","CUP_1Rnd_HE_GP25_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_RPG7V", 10, 1, 2, ["CUP_PG7V_M"], 2];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK107", 100, 3, 5, ["CUP_30Rnd_545x39_AK_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_RPK74_45", 10, 1, 2, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 5];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AKS", 75, 2, 4, ["CUP_30Rnd_762x39_AK47_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_SVD_camo_g_half", 20, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_VSSVintorez", 10, 1, 2, ["CUP_20Rnd_9x39_SP5_VSS_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_PKM", 10, 1, 2, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 6];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_PBS4", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_Bizon", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_Kobra", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_Kobra", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_1", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_3", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PechenegScope", 10, 1, 3];