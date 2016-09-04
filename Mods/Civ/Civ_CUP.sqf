/*
 * Description: This file contains the vehicle types spawned in the mission for the civilian side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_UAZ_Unarmed_TK_CIV";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_UAZ_Open_TK_CIV";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Ural_Civ_01";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Ural_Civ_02";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Ural_Civ_03";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Ural_Open_Civ_01";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Ural_Open_Civ_02";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Ural_Open_Civ_03";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Datsun";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Datsun_4seat";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Datsun_Plain";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Datsun_Covered";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Datsun_Tubeframe";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Skoda_White_CIV";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Skoda_Red_CIV";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Skoda_Blue_CIV";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Skoda_Green_CIV";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Golf4_red_Civ";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Golf4_random_Civ";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_Golf4_random_Civ";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "CUP_C_SUV_CIV";

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_UAZ_Unarmed_TK_CIV";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_UAZ_Open_TK_CIV";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Ural_Civ_01";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Ural_Civ_02";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Ural_Civ_03";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Ural_Open_Civ_01";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Ural_Open_Civ_02";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Ural_Open_Civ_03";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Datsun";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Datsun_4seat";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Datsun_Plain";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Datsun_Covered";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Datsun_Tubeframe";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Skoda_White_CIV";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Skoda_Red_CIV";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Skoda_Blue_CIV";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Skoda_Green_CIV";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Golf4_red_Civ";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Golf4_random_Civ";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_Golf4_random_Civ";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "CUP_C_SUV_CIV";

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_AKS_Gold", "CUP_30Rnd_545x39_AK_M", 5];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_CZ550", "CUP_5x_22_LR_17_HMR_M", 10];