/*
 * Description: This file contains the vehicle types for the units spawned in the mission for the independent side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_repair_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_hmg_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_hmg_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MBT_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_repair_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_hmg_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_hmg_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MBT_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MBT_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
    };
    default {//A lot (7-8)
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_repair_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_hmg_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MRAP_03_hmg_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Offroad_01_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MBT_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_MBT_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_APC_tracked_03_cannon_F";
    };
};

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_G_Offroad_01_armed_F";
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_MRAP_03_hmg_F";
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_HMG_01_high_f";
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_static_AT_F";
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_G_Offroad_01_F";

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind pushback "I_Truck_02_transport_F";
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind pushback "I_Truck_02_covered";
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_ReinforcementTruck_vehicleClasses above.
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo pushback 16;
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo pushback 16;
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo pushback 16;
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo pushback 16;

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses pushback "O_APC_Wheeled_02_rcws_F";
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses pushback "O_APC_Tracked_02_cannon_F";
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses pushback "O_APC_Wheeled_02_rcws_F";
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo pushback 8;
a3e_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo pushback 8;
a3e_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo pushback 8;

// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles pushback "I_G_Offroad_01_repair_F";
a3e_arr_ComCenParkedVehicles pushback "I_G_Offroad_01_armed_F";
a3e_arr_ComCenParkedVehicles pushback "I_MRAP_03_hmg_F";
a3e_arr_ComCenParkedVehicles pushback "I_MRAP_03_gmg_F";
a3e_arr_ComCenParkedVehicles pushback "I_G_Offroad_01_F";


// Vehicles, weapons and ammo at ammo depots
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses pushback "I_G_Offroad_01_repair_F";
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses pushback "I_G_Offroad_01_armed_F";
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses pushback "I_MRAP_03_hmg_F";
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses pushback "I_MRAP_03_gmg_F";
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses pushback "I_G_Offroad_01_F";

//Random array. Types of helicopters to spawn
a3e_arr_I_transport_heli pushback "I_Heli_Transport_02_F";
a3e_arr_I_transport_heli pushback "I_Heli_light_03_F";
a3e_arr_I_transport_heli pushback "I_Heli_light_03_unarmed_F";


//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy pushback "I_Heli_light_03_F";
a3e_arr_searchChopperHard pushback "I_Heli_light_03_F";

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane pushback "I_Plane_Fighter_03_CAS_F";