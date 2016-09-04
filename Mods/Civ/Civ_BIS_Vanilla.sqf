/*
 * Description: This file contains the vehicle types spawned in the mission for the civilian side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Hatchback_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Hatchback_01_sport_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Quadbike_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_SUV_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Hatchback_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Hatchback_01_sport_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Quadbike_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_SUV_01_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_01_box_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_01_transport_F";
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_01_fuel_F";

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Hatchback_01_F";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Hatchback_01_sport_F";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_01_F";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Quadbike_01_F";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_SUV_01_F";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_01_box_F";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_01_transport_F";
a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_01_fuel_F";

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];