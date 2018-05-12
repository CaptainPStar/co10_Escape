/*
 * Description: This file contains the vehicle types for the units spawned in the mission for the independent side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND append [
	"I_G_Offroad_01_repair_F"
	,"I_G_Offroad_01_armed_F"
	,"I_G_Offroad_01_armed_F"
	,"I_G_Offroad_01_armed_F"
	,"I_G_Offroad_01_armed_F"
	,"I_G_Offroad_01_F"
	,"I_C_Offroad_02_unarmed_F"
	,"I_C_Van_01_transport_F"
	,"I_C_Van_01_transport_F"
	];
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND append [
			];
    };
    case 2: {//Some (4-6)
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND append [
			"I_C_Offroad_02_unarmed_F"
			,"I_C_Van_01_transport_F"
			,"I_C_Van_01_transport_F"
			];
    };
    default {//A lot (7-8)
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND append [
			"I_C_Offroad_02_unarmed_F"
			,"I_C_Van_01_transport_F"
			,"I_C_Van_01_transport_F"
			];
    };
};

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind append [
	"I_G_Offroad_01_armed_F"
	,"I_G_Offroad_01_F"
	,"I_C_Offroad_02_unarmed_F"
	,"I_HMG_01_high_F"
	,"I_static_AT_F"
	];
// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind append [
	"I_C_Offroad_02_unarmed_F"
	,"I_C_Van_01_transport_F"
	];

// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles append [
	"I_G_Offroad_01_repair_F"
	];

// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses append [
	"I_G_Offroad_01_repair_F"
	,"I_G_Offroad_01_armed_F"
	,"I_C_Offroad_02_unarmed_F"
	,"I_C_Van_01_transport_F"
	,"I_G_Offroad_01_F"
	];

//Random array. Types of helicopters to spawn
a3e_arr_I_transport_heli append [
	"I_C_Heli_Light_01_civil_F"
	];


//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy append [
	"O_Heli_Light_02_v2_F"
	,"O_Heli_Light_02_v2_F"
	];
a3e_arr_searchChopperHard append [
	"O_Heli_Light_02_v2_F"
	,"O_Heli_Light_02_v2_F"
	];