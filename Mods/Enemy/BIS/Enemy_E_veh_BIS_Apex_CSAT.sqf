/*
 * Description: This file contains the vehicle types  for the units spawned in the mission for the enemy side (east or west).
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses append [
	"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_Quadbike_01_ghex_F"
	,"O_T_Quadbike_01_ghex_F"
	,"O_T_Quadbike_01_ghex_F"
	,"O_T_Quadbike_01_ghex_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_LSV_02_armed_F"
	,"O_T_LSV_02_armed_F"
	,"O_T_APC_Wheeled_02_rcws_ghex_F"
	,"O_T_APC_Tracked_02_AA_ghex_F"
	,"O_T_APC_Tracked_02_cannon_ghex_F"
	,"O_T_MBT_02_arty_ghex_F"
	,"O_T_MBT_02_cannon_ghex_F"
	,"O_T_Truck_03_device_ghex_F"
	,"O_T_Truck_03_transport_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	,"O_T_Truck_03_ammo_ghex_F"
	,"O_T_Truck_03_fuel_ghex_F"
	,"O_T_Truck_03_medical_ghex_F"
	,"O_T_Truck_03_repair_ghex_F"
	];
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses append [
		];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses append [
			"O_T_APC_Wheeled_02_rcws_ghex_F"
			,"O_T_APC_Tracked_02_AA_ghex_F"
			,"O_T_APC_Tracked_02_cannon_ghex_F"
			,"O_T_MBT_02_arty_ghex_F"
			,"O_T_MBT_02_cannon_ghex_F"
			];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses append [
			"O_T_APC_Wheeled_02_rcws_ghex_F"
			,"O_T_APC_Tracked_02_AA_ghex_F"
			,"O_T_APC_Tracked_02_cannon_ghex_F"
			,"O_T_MBT_02_arty_ghex_F"
			,"O_T_MBT_02_cannon_ghex_F"
			];
    };
};

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes append [
	"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_LSV_02_armed_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_HMG_01_high_F"
	,"O_static_AT_F"
	];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses append [
	"O_T_Truck_03_transport_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses append [
	"O_T_APC_Wheeled_02_rcws_ghex_F"
	,"O_T_APC_Tracked_02_cannon_ghex_F"
	,"O_T_APC_Wheeled_02_rcws_ghex_F"
	];


// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses append [
	"O_T_MRAP_02_gmg_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_APC_Wheeled_02_rcws_ghex_F"
	,"O_T_APC_Tracked_02_AA_ghex_F"
	,"O_T_Truck_03_device_ghex_F"
	,"O_T_Truck_03_transport_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	,"O_T_Truck_03_ammo_ghex_F"
	,"O_T_Truck_03_fuel_ghex_F"
	,"O_T_Truck_03_medical_ghex_F"
	,"O_T_Truck_03_repair_ghex_F"
	];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses append [
	"O_T_MBT_02_cannon_ghex_F"
	,"O_T_APC_Tracked_02_cannon_ghex_F"
	];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons append [
	"O_HMG_01_high_F"
	,"O_GMG_01_high_F"
	];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles append [
	"O_T_Truck_03_fuel_ghex_F"
	,"O_T_Truck_03_medical_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	,"O_T_Truck_03_transport_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_gmg_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_Truck_03_ammo_ghex_F"
	,"O_T_Truck_03_repair_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_LSV_02_armed_F"
	,"O_T_LSV_02_unarmed_F"
	];


// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses append [
	"O_HMG_01_high_F"
	,"O_GMG_01_high_F"
	,"O_HMG_01_high_F"
	,"O_static_AT_F"
	,"O_static_AA_F"
	];
// An ammo depot have one parked and empty vehicle of the following possible types.
	a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses append [
	"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_gmg_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	,"O_T_Truck_03_ammo_ghex_F"
	,"O_T_Truck_03_repair_ghex_F"
	,"O_T_Truck_03_device_ghex_F"
	,"O_T_Truck_03_transport_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	,"O_T_Truck_03_ammo_ghex_F"
	,"O_T_Truck_03_fuel_ghex_F"
	,"O_T_Truck_03_medical_ghex_F"
	,"O_T_Truck_03_repair_ghex_F"
	];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli append [
	"O_Heli_Attack_02_black_F"
	,"O_Heli_Light_02_F"
	,"O_T_VTOL_02_infantry_F"
	];
a3e_arr_O_transport_heli append [
	"O_Heli_Light_02_unarmed_F"
	,"O_Heli_Transport_04_bench_black_F"
	,"O_Heli_Transport_04_covered_black_F"
	];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone append [
	"O_UAV_01_F"
	,"O_T_UAV_04_CAS_F"
	];

//////////////////////////////////////////////////////////////////
// fn_PopulateAquaticPatrol
// boats that are spawned
//////////////////////////////////////////////////////////////////
a3e_arr_AquaticPatrols append [
	"O_T_Boat_Armed_01_hmg_F"
	];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite append [
	"O_Mortar_01_F"
	];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane append [
	"O_T_VTOL_02_infantry_F"
	,"O_T_VTOL_02_infantry_F"
	];