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

A3E_VAR_Flag_Opfor = "\mas_us_rifle_c\flags\mas_flag_africanopf_co.paa";
A3E_VAR_Flag_Ind = "\mas_us_rifle_c\flags\mas_flag_africangov_co.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"I_mas_afr_recon_F",
	"I_mas_afr_recon_AR_F",
	"I_mas_afr_recon_M_F",
	"I_mas_afr_recon_TL_F"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_mas_m9_F","15Rnd_mas_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_mas_bhp_F","15Rnd_mas_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_mas_glock_F","17Rnd_mas_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_mas_usp_F","10Rnd_mas_45acp_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_mas_acp_F","10Rnd_mas_45acp_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_mas_mak_F","8Rnd_mas_9x18_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_mas_uzi_F","25Rnd_mas_9x19_Mag"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"C_mas_afr_Offroad_01_F"
	,"C_mas_afr_Truck_02_covered_F"
	,"C_mas_afr_Truck_02_covered_F"
	,"C_mas_afr_Truck_02_covered_F"
	,"C_mas_afr_Truck_02_refuel_F"
	,"C_mas_afr_Truck_02_refuel_F"
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
		"O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_AT_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Truck_02_covered_F"
		,"O_mas_afr_Truck_02_transport_F"
		,"O_mas_afr_Truck_02_transport_F"
		,"O_mas_afr_Truck_02_logistic_F"
		,"O_mas_afr_Truck_02_logistic_F"
		,"O_mas_afr_Truck_02_medic_F"
		,"O_mas_afr_Truck_02_ZU23_F"
		,"O_mas_afr_Truck_02_ZU23_F"
		,"O_mas_afr_MRAP_03_AT_F"
		,"O_mas_afr_MRAP_03_AT_F"
		,"O_mas_afr_Truck_02_BM21_F"
		,"O_mas_afr_MRAP_03_hmg_F"
		,"O_mas_afr_MRAP_03_hmg_F"
		,"O_mas_afr_T55_F"
		,"O_mas_afr_BRDM2"
		,"O_mas_afr_BRDM2"
		,"O_mas_afr_BMP1_F"
		,"O_mas_afr_BMP1_F"
		,"O_mas_afr_BTR60"
		,"O_mas_afr_BMP2_F"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		 "I_G_Offroad_01_repair_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_F"
		,"I_mas_afr_MRAP_03_F"
		,"I_mas_afr_Offroad_01_armed_F"
		,"I_mas_afr_Offroad_01_armed_F"
		,"I_mas_afr_BMP1_F"
		,"I_mas_afr_BMP2_F"
		,"I_mas_afr_BTR60"
		,"I_mas_afr_T55_F"
		,"I_mas_afr_T72_F"
		,"I_mas_afr_T55_F"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		 "O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_AT_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Truck_02_covered_F"
		,"O_mas_afr_Truck_02_transport_F"
		,"O_mas_afr_Truck_02_transport_F"
		,"O_mas_afr_Truck_02_logistic_F"
		,"O_mas_afr_Truck_02_logistic_F"
		,"O_mas_afr_Truck_02_medic_F"
		,"O_mas_afr_Truck_02_ZU23_F"
		,"O_mas_afr_Truck_02_ZU23_F"
		,"O_mas_afr_MRAP_03_AT_F"
		,"O_mas_afr_MRAP_03_AT_F"
		,"O_mas_afr_Truck_02_BM21_F"
		,"O_mas_afr_MRAP_03_hmg_F"
		,"O_mas_afr_MRAP_03_hmg_F"
		,"O_mas_afr_T55_F"
		,"O_mas_afr_BRDM2"
		,"O_mas_afr_BRDM2"
		,"O_mas_afr_BMP1_F"
		,"O_mas_afr_BMP1_F"
		,"O_mas_afr_BTR60"
		,"O_mas_afr_BMP2_F"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		 "I_G_Offroad_01_repair_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_F"
		,"I_mas_afr_MRAP_03_F"
		,"I_mas_afr_Offroad_01_armed_F"
		,"I_mas_afr_Offroad_01_armed_F"
		,"I_mas_afr_BMP1_F"
		,"I_mas_afr_BMP2_F"
		,"I_mas_afr_BTR60"
		,"I_mas_afr_T55_F"
		,"I_mas_afr_T72_F"
		,"I_mas_afr_T55_F"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
	         "O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_F"
		,"O_mas_afr_Offroad_01_armed_AT_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Quadbike_01_F"
		,"O_mas_afr_Truck_02_covered_F"
		,"O_mas_afr_Truck_02_transport_F"
		,"O_mas_afr_Truck_02_transport_F"
		,"O_mas_afr_Truck_02_logistic_F"
		,"O_mas_afr_Truck_02_logistic_F"
		,"O_mas_afr_Truck_02_medic_F"
		,"O_mas_afr_Truck_02_ZU23_F"
		,"O_mas_afr_Truck_02_ZU23_F"
		,"O_mas_afr_MRAP_03_AT_F"
		,"O_mas_afr_MRAP_03_AT_F"
		,"O_mas_afr_Truck_02_BM21_F"
		,"O_mas_afr_MRAP_03_hmg_F"
		,"O_mas_afr_MRAP_03_hmg_F"
		,"O_mas_afr_T55_F"
		,"O_mas_afr_BRDM2"
		,"O_mas_afr_BRDM2"
		,"O_mas_afr_BMP1_F"
		,"O_mas_afr_BMP1_F"
		,"O_mas_afr_BTR60"
		,"O_mas_afr_BMP2_F"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
	         "I_G_Offroad_01_repair_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_hmg_F"
		,"I_mas_afr_MRAP_03_F"
		,"I_mas_afr_MRAP_03_F"
		,"I_mas_afr_Offroad_01_armed_F"
		,"I_mas_afr_Offroad_01_armed_F"
		,"I_mas_afr_BMP1_F"
		,"I_mas_afr_BMP2_F"
		,"I_mas_afr_BTR60"
		,"I_mas_afr_T55_F"
		,"I_mas_afr_T72_F"
		,"I_mas_afr_T55_F"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"O_mas_afr_soldier_repair_F"
	,"O_mas_afr_soldier_repair_F"
	,"O_mas_afr_soldier_repair_F"
	,"O_mas_afr_medic_F"
	,"O_mas_afr_medic_F"
	,"O_mas_afr_medic_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_recon_LAA_F"
	,"O_mas_afr_recon_LAA_F"
	,"O_mas_afr_soldier_AR_F"
	,"O_mas_afr_soldier_AR_F"
	,"O_mas_afr_soldier_AR_F"
	,"O_mas_afr_soldier_LAT_F"
	,"O_mas_afr_soldier_LAT_F"
	,"O_mas_afr_soldier_exp_F"
	,"O_mas_afr_soldier_exp_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_GL_F"
	,"O_mas_afr_Soldier_GL_F"
	,"O_mas_afr_Soldier_GL_F"
	,"O_mas_afr_soldier_LAT_F"
	,"O_mas_afr_soldier_LAT_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_F"
	,"O_mas_afr_Soldier_lite_F"
	,"O_mas_afr_Soldier_lite_F"
	,"O_mas_afr_Soldier_lite_F"
	,"O_mas_afr_soldier_repair_F"
	,"O_mas_afr_soldier_repair_F"
	,"O_mas_afr_Soldier_off_F"
	,"O_mas_afr_Soldier_amort_F"
	,"O_mas_afr_Soldier_smort_F"
	,"O_mas_afr_Soldier_amort_F"
	,"O_mas_afr_Soldier_smort_F"
	,"O_mas_afr_recon_JTAC_F"
	,"O_mas_afr_soldier_MG_F"
	,"O_mas_afr_soldier_M_F"];
a3e_arr_Escape_InfantryTypes_Ind = [
	 "I_mas_afr_soldier_repair_F"
	,"I_mas_afr_soldier_repair_F"
	,"I_mas_afr_soldier_repair_F"
	,"I_mas_afr_medic_F"
	,"I_mas_afr_medic_F"
	,"I_mas_afr_medic_F"
	,"I_mas_afr_Soldier_TL_F"
	,"I_mas_afr_Soldier_TL_F"
	,"I_mas_afr_Soldier_TL_F"
	,"I_mas_afr_soldier_LAA_F"
	,"I_mas_afr_soldier_LAA_F"
	,"I_mas_afr_soldier_AR_F"
	,"I_mas_afr_soldier_AR_F"
	,"I_mas_afr_soldier_AR_F"
	,"I_mas_afr_recon_LAT_F"
	,"I_mas_afr_soldier_exp_F"
	,"I_mas_afr_soldier_exp_F"
	,"I_mas_afr_soldier_exp_F"
	,"I_mas_afr_Soldier_F"
	,"I_mas_afr_Soldier_F"
	,"I_mas_afr_Soldier_F"
	,"I_mas_afr_Soldier_GL_F"
	,"I_mas_afr_Soldier_GL_F"
	,"I_mas_afr_Soldier_GL_F"
	,"I_mas_afr_Soldier_F"
	,"I_mas_afr_Soldier_F"
	,"I_mas_afr_Soldier_lite_F"
	,"I_mas_afr_Soldier_lite_F"
	,"I_mas_afr_Soldier_lite_F"
	,"I_mas_afr_soldier_MG_F"
	,"I_mas_afr_soldier_MG_F"
	,"I_mas_afr_soldier_MG_F"
	,"I_mas_afr_Soldier_off_F"
	,"I_mas_afr_Soldier_off_Fn"
	,"I_mas_afr_soldier_M_F"
	,"I_mas_afr_soldier_M_F"];
a3e_arr_recon_InfantryTypes = [
	"O_mas_afr_recon_exp_F"
	,"O_mas_afr_recon_AR_F"
	,"O_mas_afr_recon_M_F"
	,"O_mas_afr_recon_medic_F"
	,"O_mas_afr_recon_F"
	,"O_mas_afr_soldier_LAT_F"
	,"O_mas_afr_recon_TL_F"];
a3e_arr_recon_I_InfantryTypes = [
	"I_mas_afr_recon_exp_F"
	,"I_mas_afr_recon_JTAC_F"
	,"I_mas_afr_recon_F"
	,"I_mas_afr_recon_medic_F"
	,"I_mas_afr_recon_F"
	,"I_mas_afr_soldier_LAT_F"
	,"I_mas_afr_Soldier_off_Fn"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"O_mas_afr_Offroad_01c_armed_F"
	,"O_mas_afr_Offroad_01_armed_AT_F"
	,"O_mas_afr_MRAP_03_hmg_F"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"I_mas_afr_BMP1_F"
	,"I_mas_afr_Offroad_01_armed_AGS_F"
	,"I_mas_afr_MRAP_03_hmg_F"
	,"I_mas_afr_Offroad_01_armed_AT_F"
	,"I_mas_afr_Offroad_01_armed_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"O_mas_afr_Truck_02_transport_F"
	,"O_mas_afr_Truck_02_covered_F"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"I_mas_afr_Truck_02_covered_F"
	,"I_mas_afr_Truck_02_transport_F"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"O_mas_afr_BMP2_F"
	,"O_mas_afr_BMP1_F"
	,"O_mas_afr_BTR60"
	,"O_mas_afr_BRDM2"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"O_mas_afr_Offroad_01_armed_F"
	,"O_mas_afr_Offroad_01_armed_F"
	,"O_mas_afr_Offroad_01_armed_AT_F"
	,"O_mas_afr_Truck_02_ZU23_F"
	,"O_mas_afr_Truck_02_transport_F"
	,"O_mas_afr_Truck_02_transport_F"
	,"O_mas_afr_Truck_02_covered_F"
	,"O_mas_afr_Truck_02_logistic_F"
	,"O_mas_afr_Offroad_01_F"
	,"O_mas_afr_Truck_02_medic_F"
	,"O_mas_afr_Offroad_01_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"O_mas_afr_T55_F"
	,"O_mas_afr_BMP2_F"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"O_mas_afr_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"O_mas_afr_Offroad_01_F"
	,"O_mas_afr_Truck_02_logistic_F"
	,"O_mas_afr_Truck_02_medic_F"
	,"O_mas_afr_Truck_02_transport_F"
	,"O_mas_afr_Truck_02_covered_F"
	,"O_mas_afr_Offroad_01_F"
	,"O_mas_afr_Offroad_01_armed_F"
	,"O_mas_afr_Offroad_01_armed_AT_F"
	,"O_mas_afr_Truck_02_ZU23_F"
	,"O_mas_afr_Truck_02_covered_F"
	,"O_mas_afr_BRDM2"
	,"O_mas_afr_BRDM2"
	,"O_mas_afr_Offroad_01_armed_F"
	,"I_mas_afr_Offroad_01_armed_F"
	,"I_mas_afr_Offroad_01_armed_F"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"C_mas_afr_Offroad_01_F"
	,"C_mas_afr_Truck_02_covered_F"
	,"C_mas_afr_Truck_02_covered_F"
	,"C_mas_afr_Truck_02_covered_F"
	,"C_mas_afr_Truck_02_refuel_F"
	,"C_mas_afr_Truck_02_refuel_F"
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

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"O_mas_afr_HMG_01_high_F"
	,"O_mas_afr_HMG_01_high_F"
	,"O_mas_afr_HMG_01_high_F"
	,"O_mas_afr_static_AT_F"
	,"O_mas_afr_static_AA_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"O_mas_afr_Offroad_01_F"
	,"O_mas_afr_Truck_02_logistic_F"
	,"O_mas_afr_Truck_02_medic_F"
	,"O_mas_afr_Truck_02_transport_F"
	,"O_mas_afr_Truck_02_covered_F"
	,"O_mas_afr_Offroad_01_F"
	,"O_mas_afr_Offroad_01_armed_F"
	,"O_mas_afr_Offroad_01_armed_AT_F"
	,"O_mas_afr_Truck_02_ZU23_F"
	,"O_mas_afr_Truck_02_covered_F"
	,"O_mas_afr_BRDM2"
	,"O_mas_afr_BRDM2"
	,"O_mas_afr_Offroad_01_armed_F"
	,"I_mas_afr_Offroad_01_armed_F"
	,"I_mas_afr_Offroad_01_armed_F"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"O_mas_afr_MI8MTV"
	,"O_mas_afr_MI8MTV"
	,"I_mas_afr_MI24"];
a3e_arr_O_transport_heli = [
	"O_mas_afr_MI8"
	,"O_mas_afr_MI8"
	,"O_mas_afr_MI8"];
a3e_arr_O_pilots = [
	"O_mas_afr_pilot_F"
	,"O_mas_afr_pilot_F"];
a3e_arr_I_transport_heli = [
	"I_mas_afr_MI8"
	,"I_mas_afr_MI8"
	,"I_mas_afr_MI24"];
a3e_arr_I_pilots = [
	"I_mas_afr_pilot_F"
	,"I_mas_afr_pilot_F"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_mas_mak_F", 50, 4, 8, ["8Rnd_mas_9x18_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_aks74u", 50, 4, 8, ["30Rnd_mas_545x39_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_ak_74m", 100, 2, 4, ["30Rnd_mas_545x39_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_aks74", 50, 2, 4, ["30Rnd_mas_545x39_mag", "30Rnd_mas_762x39_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_ak_74m_gl", 75, 2, 4, ["30Rnd_mas_545x39_mag", "1Rnd_HE_Grenade_shell"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_akms", 50, 2, 4, ["30Rnd_mas_762x39_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_akms_gl", 50, 2, 4, ["30Rnd_mas_762x39_mag", "1Rnd_HE_Grenade_shell"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_saiga", 50, 2, 4, ["10Rnd_mas_12Gauge_Pellets"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_mas_mak_F", 10, 4, 8, ["8Rnd_mas_9x18_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_mas_uzi_F", 20, 4, 8, ["25Rnd_mas_9x19_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_mas_bhp_F", 10, 4, 8, ["15Rnd_mas_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_mas_sa61_F", 20, 4, 8, ["20Rnd_mas_765x17_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_mp5", 10, 4, 8, ["30Rnd_mas_9x21_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_SDAR_F", 10, 2, 4, ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_fal", 10, 2, 4, ["20Rnd_mas_762x51_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_g3", 10, 2, 4, ["20Rnd_mas_762x51_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_mas_g3_m203", 10, 2, 4, ["20Rnd_mas_762x51_Stanag", "1Rnd_HE_Grenade_shell"], 6];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_mas_m91", 10, 2, 4, ["10Rnd_mas_762x54_mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_mas_svd", 10, 2, 4, ["10Rnd_mas_762x54_mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_mas_ksvk", 10, 2, 4, ["5Rnd_mas_127x108_mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_mas_rpk_F", 50, 2, 4, ["100Rnd_mas_545x39_mag", "30Rnd_mas_545x39_mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_mas_pkm_F", 30, 2, 4, ["100Rnd_mas_762x54_mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_mas_m14", 10, 2, 4, ["20Rnd_mas_762x51_Stanag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_mas_mg3_F", 10, 2, 4, ["100Rnd_mas_762x51_T_Stanag"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_mas_lee", 10, 2, 4, ["5Rnd_mas_762x51_Stanag"], 12];
// non-CAST weapons
//a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_mas_m14", 100, 2, 4, ["20Rnd_mas_762x51_Stanag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_mas_m24", 20, 2, 4, ["5Rnd_mas_762x51_Stanag"], 6];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_RPG18_F", 50, 3, 5, ["mas_PG18"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_M136_F", 50, 1, 1, ["mas_M136"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_Strela_F", 50, 1, 1, ["mas_Strela"], 3];
// non-CSAT weapons
//a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_RPG7_F", 100, 3, 5, ["mas_PG7V"], 6];
//a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_Strela_F", 100, 1, 1, ["mas_Strela"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_maaws_F", 100, 1, 1, ["mas_MAAWS"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_Stinger_F", 100, 1, 1, ["mas_Stinger"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["mas_launch_Metis_F", 100, 1, 1, ["mas_Metis"], 3];


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
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5];
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
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_acp", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_H", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_H_MG", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_L", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_M", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_mas_kobra", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Aco_smg", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_mas_PSO", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn_smg", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Arco", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Hamr", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Holosight", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Holosight_smg", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_MRCO", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_mas_PSO", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_mas_kobra", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_mas_nspu", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_mas_goshawk", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_mas_DMS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_mas_acog", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_mas_PSO", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_AMS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_mas_kobra", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_mtp", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_oli", 10, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["hgun_mas_mak_F", "8Rnd_mas_9x18_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_mas_uzi_F", "25Rnd_mas_9x19_Mag", 4];
a3e_arr_CivilianCarWeapons pushback ["hgun_mas_bhp_F", "15Rnd_mas_9x21_Mag", 9];
a3e_arr_CivilianCarWeapons pushback ["hgun_mas_sa61_F", "20Rnd_mas_765x17_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["arifle_mas_ak_74m", "30Rnd_mas_545x39_mag", 8];
a3e_arr_CivilianCarWeapons pushback ["arifle_mas_akms", "30Rnd_mas_762x39_mag", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_mas_saiga", "10Rnd_mas_12Gauge_Pellets", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_mas_g3", "20Rnd_mas_762x51_Stanag", 5];
a3e_arr_CivilianCarWeapons pushback ["arifle_mas_fal", "20Rnd_mas_762x51_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["arifle_mas_m14", "20Rnd_mas_762x51_Stanag", 5];
a3e_arr_CivilianCarWeapons pushback ["srifle_mas_svd", "10Rnd_mas_762x54_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["LMG_mas_rpk_F", "100Rnd_mas_545x39_mag", 8];
a3e_arr_CivilianCarWeapons pushback ["srifle_mas_m24", "5Rnd_mas_762x51_Stanag", 5];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"optic_Aco"
	,"optic_ACO_grn"
	,"optic_Arco"
	,"optic_Hamr"
	,"optic_MRCO"
	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [
	"optic_Aco_smg"
	,"optic_Holosight_smg"];
a3e_arr_Scopes_Sniper = [
	"optic_SOS"
	,"optic_DMS"
	,"optic_LRPS"
	,"optic_AMS"
	,"optic_AMS_khk"
	,"optic_AMS_snd"
	,"optic_KHS_blk"
	,"optic_KHS_hex"
	,"optic_KHS_old"
	,"optic_KHS_tan"];
a3e_arr_NightScopes = [
	"optic_NVS"];
a3e_arr_TWSScopes = [
	"optic_Nightstalker"
	,"optic_tws"
	,"optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"bipod_01_F_snd"
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
	"B_mas_afr_MI8"];
a3e_arr_extraction_chopper_escort = [
	"B_mas_afr_Heli_Light_02_F"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"O_UAV_01_F"
	,"O_UAV_02_CAS_F"
	,"O_UAV_02_F"
	,"O_UAV_02_F"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"I_mas_afr_MI8"
	,"O_mas_afr_MI8"];
a3e_arr_searchChopperHard = [
	"I_mas_afr_MI24"
	,"O_mas_afr_MI8MTV"];
a3e_arr_searchChopper_pilot = [
	"I_helipilot_F"];
a3e_arr_searchChopper_crew = [
	"I_helicrew_F"];

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
	"O_mas_afr_Boat_Transport_01_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "Box_NATO_Wps_F";
a3e_additional_weapon_box_2 = "Box_NATO_WpsSpecial_F";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"O_mas_afr_Mortar_01_F"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"O_Plane_CAS_02_F"
	,"I_Plane_Fighter_03_CAS_F"];

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
	"B_mas_afr_Helipilot_F"
	,"B_mas_afr_Helicrew_F"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_HMMWV_F"
	,"Land_Wreck_Hunter_F"
	,"Land_Wreck_Slammer_F"];
a3e_arr_CrashSiteCrewCar = [
	"B_mas_afr_soldier_M_F"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["mas_launch_M136_F", 10, 1, 2, ["mas_M136"], 3];
a3e_arr_CrashSiteWeapons pushback ["arifle_mas_m4", 10, 1, 2, ["30Rnd_mas_556x45_Stanag"], 8];
a3e_arr_CrashSiteWeapons pushback ["arifle_mas_hk416", 10, 1, 2, ["30Rnd_mas_556x45_Stanag"], 8];
a3e_arr_CrashSiteWeapons pushback ["arifle_mas_mp5", 75, 2, 4, ["30Rnd_mas_9x21_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_mas_m4_m203", 50, 2, 4, ["30Rnd_mas_556x45_Stanag", "1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], 6];
a3e_arr_CrashSiteWeapons pushback ["srifle_mas_ebr", 10, 1, 2, ["20Rnd_mas_762x51_Stanag"], 4];
a3e_arr_CrashSiteWeapons pushback ["srifle_mas_hk417", 10, 1, 2, ["20Rnd_mas_762x51_Stanag"], 8];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["optic_Hamr", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Aco", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Aco_smg", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Holosight", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_SOS", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["muzzle_snds_H", 10, 1, 3];