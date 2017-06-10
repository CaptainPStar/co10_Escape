/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;
A3E_VAR_Side_Opfor = west;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_AAF_CO.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"LEN_SS_rifleman2",
	"LEN_SS_rifleman",
	"LEN_SS_soldier_camo_MP40",
	"LEN_SS_stggunner"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_Colt_M1911","LIB_7Rnd_45ACP"];
a3e_arr_PrisonBackpackWeapons pushback ["LEN_Welrod","LEN_7Rnd_765x17"];
a3e_arr_PrisonBackpackWeapons pushback ["LEN_P640b","LEN_13Rnd_9x19"];
a3e_arr_PrisonBackpackWeapons pushback ["LEN_P35","lib_8Rnd_9x19"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_TT33","LIB_8Rnd_762x25"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_M1895","LIB_7Rnd_762x38"];


// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"LIB_Kfz1"
	,"LIB_CIV_FFI_CitC4"
	,"LIB_CIV_FFI_CitC4_4"
	,"LIB_CIV_FFI_CitC4_2"
	,"LIB_CIV_FFI_CitC4_3"
	,"LIB_CIV_FFI_CitC4_5"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_Kfz1"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"
		,"LIB_PzKpfwVI_E"
		,"LIB_PzKpfwVI_E_2"
		,"LIB_PzKpfwVI_E_1"
		,"LIB_StuG_III_G"];
		
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_Kfz1"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"
		,"LIB_PzKpfwVI_E"
		,"LIB_PzKpfwVI_E_2"
		,"LIB_PzKpfwVI_E_1"
		,"LIB_StuG_III_G"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_Kfz1"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"
		,"LIB_PzKpfwVI_E"
		,"LIB_PzKpfwVI_E_2"
		,"LIB_PzKpfwVI_E_1"
		,"LIB_StuG_III_G"];

        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_Kfz1"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"
		,"LIB_PzKpfwVI_E"
		,"LIB_PzKpfwVI_E_2"
		,"LIB_PzKpfwVI_E_1"
		,"LIB_StuG_III_G"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_Kfz1"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"
		,"LIB_PzKpfwVI_E"
		,"LIB_PzKpfwVI_E_2"
		,"LIB_PzKpfwVI_E_1"
		,"LIB_StuG_III_G"];

        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_Kfz1"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"
		,"LIB_PzKpfwVI_E"
		,"LIB_PzKpfwVI_E_2"
		,"LIB_PzKpfwVI_E_1"
		,"LIB_StuG_III_G"];

    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"LIB_GER_unterofficer"
	,"LIB_GER_mgunner"
	,"LIB_GER_medic"
	,"LIB_GER_scout_ober_rifleman"
	,"LIB_GER_ober_rifleman"
	,"LIB_GER_rifleman"
	,"LIB_GER_AT_grenadier"
	,"LIB_GER_scout_rifleman"
	,"LIB_GER_AT_soldier"
	,"LEN_SS_PlatLeader_camo"
	,"LEN_SS_mgunner_camo"
	,"LEN_SS_sniper_camo"
	,"LEN_SS_rifleman_camo"
	,"LEN_SS_soldier_camo_MP40"
	,"LEN_SS_rifleman3"
	,"LEN_SS_stggunner_camo"
	,"LEN_SS_stggunner"
	,"LEN_SS_rifleman2_camo"
	,"LEN_SS_medic_camo"
	,"LEN_SS_SecLeader"
	,"LEN_SS_Sapper_Gefr"
	,"LEN_SS_Sapper"
	,"LEN_SS_mgunner"
	,"LEN_SS_medic"
	,"LEN_SS_ober_rifleman"
	,"LEN_SS_rifleman"
	,"LEN_SS_rifleman2_camo"
	,"LEN_SS_rifleman2"
	,"LEN_SS_rifleman"
	,"LEN_SS_rifleman_camo"
	,"LEN_SS_SecLeader_camo"
	,"LEN_SS_rifleman_AT_RPzB"
	,"LEN_SS_rifleman_AT_RPzB_Support"
	,"LIB_GER_scout_sniper"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"LIB_GER_unterofficer"
	,"LIB_GER_mgunner"
	,"LIB_GER_medic"
	,"LIB_GER_scout_ober_rifleman"
	,"LIB_GER_ober_rifleman"
	,"LIB_GER_rifleman"
	,"LIB_GER_AT_grenadier"
	,"LIB_GER_scout_rifleman"
	,"LIB_GER_AT_soldier"
	,"LEN_SS_PlatLeader_camo"
	,"LEN_SS_mgunner_camo"
	,"LEN_SS_sniper_camo"
	,"LEN_SS_rifleman_camo"
	,"LEN_SS_soldier_camo_MP40"
	,"LEN_SS_rifleman3"
	,"LEN_SS_stggunner_camo"
	,"LEN_SS_stggunner"
	,"LEN_SS_rifleman2_camo"
	,"LEN_SS_medic_camo"
	,"LEN_SS_SecLeader"
	,"LEN_SS_Sapper_Gefr"
	,"LEN_SS_Sapper"
	,"LEN_SS_mgunner"
	,"LEN_SS_medic"
	,"LEN_SS_ober_rifleman"
	,"LEN_SS_rifleman"
	,"LEN_SS_rifleman2_camo"
	,"LEN_SS_rifleman2"
	,"LEN_SS_rifleman"
	,"LEN_SS_rifleman_camo"
	,"LEN_SS_SecLeader_camo"
	,"LEN_SS_rifleman_AT_RPzB"
	,"LEN_SS_rifleman_AT_RPzB_Support"
	,"I_G_Sharpshooter_F"];
a3e_arr_recon_InfantryTypes = [
	"LEN_SS_soldier_camo_MP40"
	,"LEN_SS_rifleman3"
	,"LEN_SS_stggunner_camo"
	,"LEN_SS_stggunner"
	,"LEN_SS_rifleman2_camo"
	,"LEN_SS_medic_camo"
	,"LIB_GER_scout_ober_rifleman"
	,"LIB_GER_scout_sniper"];
a3e_arr_recon_I_InfantryTypes = [
	"LEN_SS_soldier_camo_MP40"
	,"LEN_SS_rifleman3"
	,"LEN_SS_stggunner_camo"
	,"LEN_SS_stggunner"
	,"LEN_SS_rifleman2_camo"
	,"LEN_SS_medic_camo"
	,"LIB_GER_scout_ober_rifleman"
	,"LIB_GER_scout_sniper"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"LIB_FlaK_30"
	,"LIB_FlaK_38"
	,"LIB_Flakvierling_38"
	,"LIB_GrWr34"
	,"LIB_MG42_Lafette"
	,"LIB_MG42_Lafette_low"
	,"LIB_Pak40"
	,"LIB_Kfz1_MG42"
	,"LIB_GER_SearchLight"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"LIB_FlaK_30"
	,"LIB_FlaK_38"
	,"LIB_Flakvierling_38"
	,"LIB_GrWr34"
	,"LIB_MG42_Lafette"
	,"LIB_MG42_Lafette_low"
	,"LIB_Pak40"
	,"LIB_Kfz1_MG42"
	,"LIB_GER_SearchLight"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"LIB_opelblitz_open_y_camo"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_opelblitz_ambulance"
	,"LIB_SdKfz_7"
	,"LIB_SdKfz251_FFV"
	,"LIB_Kfz1"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"LIB_opelblitz_open_y_camo"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_opelblitz_ambulance"
	,"LIB_SdKfz_7"
	,"LIB_SdKfz251_FFV"
	,"LIB_Kfz1"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_ReinforcementTruck_vehicleClasses above.
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [16, 16, 16, 16];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"LIB_Kfz1"
	,"LIB_Kfz1_MG42"
	,"LIB_SdKfz251"
	,"LIB_SdKfz_7"
	,"LIB_SdKfz_7_AA"
	,"LIB_SdKfz251_FFV"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [8, 8, 8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"LIB_Kfz1_MG42"
	,"LIB_SdKfz251"
	,"LIB_SdKfz_7"
	,"LIB_SdKfz_7_AA"
	,"LIB_SdKfz251_FFV"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"LIB_PzKpfwIV_H"
	,"LIB_PzKpfwV"
	,"LIB_PzKpfwVI_B"
	,"LIB_PzKpfwVI_E"
	,"LIB_PzKpfwVI_E_2"
	,"LIB_PzKpfwVI_E_1"
	,"LIB_StuG_III_G"];
// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"LIB_MG42_Lafette"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"LIB_Kfz1"
	,"LIB_Kfz1_MG42"
	,"LIB_opelblitz_ambulance"
	,"LIB_opelblitz_ammo"
	,"LIB_opelblitz_fuel"
	,"LIB_opelblitz_open_y_camo"
	,"LIB_opelblitz_parm"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_SdKfz251"
	,"LIB_SdKfz_7"
	,"LIB_SdKfz_7_AA"
	,"LIB_SdKfz251_FFV"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"LIB_CIV_FFI_CitC4"
	,"LIB_CIV_FFI_CitC4_4"
	,"LIB_CIV_FFI_CitC4_2"
	,"LIB_CIV_FFI_CitC4_3"
	,"LIB_CIV_FFI_CitC4_5"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"LIB_MG42_Lafette_low"
	,"LIB_Pak40"
	,"LIB_FlaK_30"
	,"LIB_GER_SearchLight"];

// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"LIB_Kfz1"
	,"LIB_Kfz1_MG42"
	,"LIB_opelblitz_ambulance"
	,"LIB_opelblitz_ammo"
	,"LIB_opelblitz_fuel"
	,"LIB_opelblitz_open_y_camo"
	,"LIB_opelblitz_parm"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_SdKfz251"
	,"LIB_SdKfz_7"
	,"LIB_SdKfz_7_AA"
	,"LIB_SdKfz251_FFV"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"LEN_FW190F8_DAK3"
	,"LEN_FW190F8_DAK2"
	,"LEN_FW190F8_DAK"];
a3e_arr_O_pilots = [
	"LIB_GER_pilot"];
a3e_arr_I_transport_heli = [
	"I_Heli_Transport_02_F"
	,"I_Heli_light_03_F"
	,"I_Heli_light_03_unarmed_F"];
a3e_arr_I_pilots = [
	"I_helipilot_F"
	,"I_helicrew_F"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_P38", 50, 4, 8, ["lib_8Rnd_9x19"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_MP40", 50, 4, 8, ["lib_32Rnd_9x19"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LEN_FG42", 100, 2, 4, ["LEN_20Rnd_792x57"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_MP44", 50, 2, 4, ["LIB_30Rnd_792x33", "LIB_30Rnd_792x33"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_K98ZF39", 75, 2, 4, ["lib_5Rnd_792x57", "lib_10Rnd_792x57"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_G43", 50, 2, 4, ["30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_MG42", 50, 2, 4, ["LIB_50Rnd_792x57", "LIB_250Rnd_792x57_sS", "LIB_250Rnd_792x57_SMK", "LIB_50Rnd_792x57_sS"], 4];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1_Garand", 100, 2, 4, ["LIB_8Rnd_762x63"], 9];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1_Carbine", 20, 2, 4, ["LIB_15Rnd_762x33"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1903A3_Springfield", 20, 2, 4, ["LIB_5Rnd_762x63"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1903A4_Springfield", 20, 2, 4, ["LIB_5Rnd_762x63"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1A1_Thompson", 20, 2, 4, ["LIB_30Rnd_45ACP"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1_Carbine", 20, 2, 4, ["LEN_10Rnd_303"], 6];



// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_P38", 50, 4, 8, ["lib_8Rnd_9x19"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_MP40", 50, 4, 8, ["lib_32Rnd_9x19"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LEN_FG42", 100, 2, 4, ["LEN_20Rnd_792x57"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_MP44", 50, 2, 4, ["LIB_30Rnd_792x33", "LIB_30Rnd_792x33"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_K98ZF39", 75, 2, 4, ["lib_5Rnd_792x57", "lib_10Rnd_792x57"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_G43", 50, 2, 4, ["30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_MG42", 50, 2, 4, ["LIB_50Rnd_792x57", "LIB_250Rnd_792x57_sS", "LIB_250Rnd_792x57_SMK", "LIB_50Rnd_792x57_sS"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1_Garand", 100, 2, 4, ["LIB_8Rnd_762x63"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1_Carbine", 20, 2, 4, ["LIB_15Rnd_762x33"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1903A3_Springfield", 20, 2, 4, ["LIB_5Rnd_762x63"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1903A4_Springfield", 20, 2, 4, ["LIB_5Rnd_762x63"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1A1_Thompson", 20, 2, 4, ["LIB_30Rnd_45ACP"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1_Carbine", 20, 2, 4, ["LEN_10Rnd_303"], 6];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_RPzB", 50, 3, 5, ["LIB_1Rnd_RPzB"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_M1A1_Bazooka", 50, 1, 1, ["LIB_1Rnd_60mm_M6"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_PzFaust_30m", 50, 1, 1, ["LIB_1Rnd_PzFaust_30m"], 3];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_RPzB", 50, 3, 5, ["LIB_1Rnd_RPzB"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_M1A1_Bazooka", 50, 1, 1, ["LIB_1Rnd_60mm_M6"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_PzFaust_30m", 50, 1, 1, ["LIB_1Rnd_PzFaust_30m"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_TM44_MINE_mag", "LIB_US_TNT_4pound_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_Ladung_Big_MINE_mag", "LIB_Ladung_Small_MINE_mag", "LIB_US_M1A1_ATMINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_M3_MINE_mag", "LIB_US_M3_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_PMD6_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_pomzec_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_shumine_42_MINE_mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = [];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["LIB_Binocular_GER", 60, 2, 8];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 60, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["LIB_Binocular_SU", 60, 2, 3, 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
};

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["LIB_M1_Garand", ["LIB_8Rnd_762x63"], 9];
a3e_arr_CivilianCarWeapons pushback ["LIB_MP40", ["lib_32Rnd_9x19"], 6];
a3e_arr_CivilianCarWeapons pushback ["LIB_K98ZF39", 75, 2, 4, ["lib_5Rnd_792x57", "lib_10Rnd_792x57"], 4];
a3e_arr_CivilianCarWeapons pushback ["LIB_M1_Carbine", ["LIB_15Rnd_762x33"], 6];
a3e_arr_CivilianCarWeapons pushback ["LIB_M1903A3_Springfield", ["LIB_5Rnd_762x63"], 6];
a3e_arr_CivilianCarWeapons pushback ["LIB_M1903A4_Springfield", ["LIB_5Rnd_762x63"], 6];
a3e_arr_CivilianCarWeapons pushback ["LIB_M1A1_Thompson", ["LIB_30Rnd_45ACP"], 6];
a3e_arr_CivilianCarWeapons pushback ["LIB_M1_Carbine", ["LEN_10Rnd_303"], 6];

// Here is a list of scopes:
a3e_arr_Scopes = [];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [];
a3e_arr_NightScopes = [];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"B_Heli_Transport_01_F"];
a3e_arr_extraction_chopper_escort = [
	"B_Heli_Attack_01_F"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"LEN_FW190F8_DAK3"
	,"LEN_FW190F8_DAK2"
	,"LEN_FW190F8_DAK"];
//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"LEN_FW190F8_DAK3"
	,"LEN_FW190F8_DAK2"
	,"LEN_FW190F8_DAK"];
a3e_arr_searchChopperHard = [
	"LEN_FW190F8_DAK3"
	,"LEN_FW190F8_DAK2"
	,"LEN_FW190F8_DAK"];
a3e_arr_searchChopper_pilot = [
	"LIB_GER_pilot"];

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
	"LIB_LCVP_w"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "LIB_BasicWeaponsBox_GER";
a3e_additional_weapon_box_2 = "LIB_WeaponsBox_Big_GER";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"LIB_GrWr34"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"LEN_Ju87_DAK"
	,"LEN_Ju87_DAK3"];

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
	"Land_HistoricalPlaneWreck_03_F"
	,"LIB_Pe2_MRWreck"
	,"LIB_P47_MRWreck"
	,"LIB_Ju87_MRWreck"];
a3e_arr_CrashSiteCrew = [
	"LIB_GER_pilot"
	,"LIB_US_pilot"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["LIB_P38", 50, 4, 8, ["lib_8Rnd_9x19"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_MP40", 50, 4, 8, ["lib_32Rnd_9x19"], 6];
a3e_arr_CrashSiteWeapons pushback ["LEN_FG42", 100, 2, 4, ["LEN_20Rnd_792x57"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_MP44", 50, 2, 4, ["LIB_30Rnd_792x33", "LIB_30Rnd_792x33"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_K98ZF39", 75, 2, 4, ["lib_5Rnd_792x57", "lib_10Rnd_792x57"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_G43", 50, 2, 4, ["30Rnd_556x45_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_MG42", 50, 2, 4, ["LIB_50Rnd_792x57", "LIB_250Rnd_792x57_sS", "LIB_250Rnd_792x57_SMK", "LIB_50Rnd_792x57_sS"], 4];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["LIB_Binocular_GER", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["Binocular", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["LIB_Binocular_SU", 10, 1, 3];