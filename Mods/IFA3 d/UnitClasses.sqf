/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = east;
A3E_VAR_Side_Opfor = west;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa";
A3E_VAR_Flag_Ind = "\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor]; // IFA3 UK Desert Rats + US North African Corps
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor]; // IFA3 Deutsches Afrikakorps
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind]; // IFA3 Deutsches Afrikakorps

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"LIB_DAK_Soldier",
	"LIB_DAK_Soldier_2",
	"LIB_DAK_Sentry",
	"LIB_DAK_Sentry_2"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_Colt_M1911","LIB_7Rnd_45ACP"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_M1895","LIB_7Rnd_762x38"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_M1896","LIB_10Rnd_9x19_M1896"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_P08","LIB_8Rnd_9x19_P08"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_P38","LIB_8Rnd_9x19"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_TT33","LIB_8Rnd_762x25"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_WaltherPPK","LIB_7Rnd_9x19"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_Webley_mk6","LIB_6Rnd_455"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"LIB_GazM1"
	,"LIB_GazM1_dirty"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_OpelBlitz_Ambulance"
		,"LIB_DAK_OpelBlitz_Ammo"
		,"LIB_DAK_OpelBlitz_Fuel"
		,"LIB_DAK_OpelBlitz_Open"
		,"LIB_DAK_OpelBlitz_Open_2"
		,"LIB_DAK_OpelBlitz_Open_3"
		,"LIB_DAK_OpelBlitz_Parm"
		,"LIB_DAK_OpelBlitz_Tent"
		,"LIB_DAK_OpelBlitz_Tent_2"
		,"LIB_DAK_OpelBlitz_Tent_3"
		,"LIB_DAK_Scout_M3_FFV"
		,"LIB_DAK_M3_Halftrack"
		,"LIB_DAK_SdKfz251"
		,"LIB_DAK_SdKfz_7"
		,"LIB_DAK_SdKfz_7_AA"
		,"LIB_DAK_SdKfz251_FFV"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_OpelBlitz_Ambulance"
		,"LIB_DAK_OpelBlitz_Ammo"
		,"LIB_DAK_OpelBlitz_Fuel"
		,"LIB_DAK_OpelBlitz_Open"
		,"LIB_DAK_OpelBlitz_Open_2"
		,"LIB_DAK_OpelBlitz_Open_3"
		,"LIB_DAK_OpelBlitz_Parm"
		,"LIB_DAK_OpelBlitz_Tent"
		,"LIB_DAK_OpelBlitz_Tent_2"
		,"LIB_DAK_OpelBlitz_Tent_3"
		,"LIB_DAK_Scout_M3_FFV"
		,"LIB_DAK_M3_Halftrack"
		,"LIB_DAK_SdKfz251"
		,"LIB_DAK_SdKfz_7"
		,"LIB_DAK_SdKfz_7_AA"
		,"LIB_DAK_SdKfz251_FFV"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_OpelBlitz_Ambulance"
		,"LIB_DAK_OpelBlitz_Ammo"
		,"LIB_DAK_OpelBlitz_Fuel"
		,"LIB_DAK_OpelBlitz_Open"
		,"LIB_DAK_OpelBlitz_Open_2"
		,"LIB_DAK_OpelBlitz_Open_3"
		,"LIB_DAK_OpelBlitz_Parm"
		,"LIB_DAK_OpelBlitz_Tent"
		,"LIB_DAK_OpelBlitz_Tent_2"
		,"LIB_DAK_OpelBlitz_Tent_3"
		,"LIB_DAK_Scout_M3_FFV"
		,"LIB_DAK_M3_Halftrack"
		,"LIB_DAK_SdKfz251"
		,"LIB_DAK_SdKfz_7"
		,"LIB_DAK_SdKfz_7_AA"
		,"LIB_DAK_SdKfz251_FFV"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_OpelBlitz_Ambulance"
		,"LIB_DAK_OpelBlitz_Ammo"
		,"LIB_DAK_OpelBlitz_Fuel"
		,"LIB_DAK_OpelBlitz_Open"
		,"LIB_DAK_OpelBlitz_Open_2"
		,"LIB_DAK_OpelBlitz_Open_3"
		,"LIB_DAK_OpelBlitz_Parm"
		,"LIB_DAK_OpelBlitz_Tent"
		,"LIB_DAK_OpelBlitz_Tent_2"
		,"LIB_DAK_OpelBlitz_Tent_3"
		,"LIB_DAK_Scout_M3_FFV"
		,"LIB_DAK_M3_Halftrack"
		,"LIB_DAK_SdKfz251"
		,"LIB_DAK_SdKfz_7"
		,"LIB_DAK_SdKfz_7_AA"
		,"LIB_DAK_SdKfz251_FFV"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_OpelBlitz_Ambulance"
		,"LIB_DAK_OpelBlitz_Ammo"
		,"LIB_DAK_OpelBlitz_Fuel"
		,"LIB_DAK_OpelBlitz_Open"
		,"LIB_DAK_OpelBlitz_Open_2"
		,"LIB_DAK_OpelBlitz_Open_3"
		,"LIB_DAK_OpelBlitz_Parm"
		,"LIB_DAK_OpelBlitz_Tent"
		,"LIB_DAK_OpelBlitz_Tent_2"
		,"LIB_DAK_OpelBlitz_Tent_3"
		,"LIB_DAK_Scout_M3_FFV"
		,"LIB_DAK_M3_Halftrack"
		,"LIB_DAK_SdKfz251"
		,"LIB_DAK_SdKfz_7"
		,"LIB_DAK_SdKfz_7_AA"
		,"LIB_DAK_SdKfz251_FFV"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_Kfz1"
		,"LIB_DAK_Kfz1_hood"
		,"LIB_DAK_Kfz1_MG42"
		,"LIB_DAK_OpelBlitz_Ambulance"
		,"LIB_DAK_OpelBlitz_Ammo"
		,"LIB_DAK_OpelBlitz_Fuel"
		,"LIB_DAK_OpelBlitz_Open"
		,"LIB_DAK_OpelBlitz_Open_2"
		,"LIB_DAK_OpelBlitz_Open_3"
		,"LIB_DAK_OpelBlitz_Parm"
		,"LIB_DAK_OpelBlitz_Tent"
		,"LIB_DAK_OpelBlitz_Tent_2"
		,"LIB_DAK_OpelBlitz_Tent_3"
		,"LIB_DAK_Scout_M3_FFV"
		,"LIB_DAK_M3_Halftrack"
		,"LIB_DAK_SdKfz251"
		,"LIB_DAK_SdKfz_7"
		,"LIB_DAK_SdKfz_7_AA"
		,"LIB_DAK_SdKfz251_FFV"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"
		,"LIB_DAK_FlakPanzerIV_Wirbelwind"
		,"LIB_DAK_PzKpfwIV_H"
		,"LIB_DAK_PzKpfwVI_E"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"LIB_DAK_AT_soldier"
	,"LIB_DAK_AT_grenadier"
	,"LIB_DAK_Soldier_2"
	,"LIB_DAK_Soldier_4"
	,"LIB_DAK_Soldier_3"
	,"LIB_DAK_medic"
	,"LIB_DAK_medic"
	,"LIB_DAK_radioman"
	,"LIB_DAK_Soldier"
	,"LIB_DAK_sapper"
	,"LIB_DAK_sapper_gefr"
	,"LIB_DAK_Lieutenant"
	,"LIB_DAK_Sentry"
	,"LIB_DAK_Sentry_2"
	,"LIB_DAK_NCO_2"
	,"LIB_DAK_NCO"
	,"LIB_DAK_Sniper"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"LIB_FSJ_AT_soldier_dak"
	,"LIB_FSJ_AT_grenadier_dak"
	,"LIB_FSJ_Soldier_2_dak"
	,"LIB_FSJ_Mgunner_dak"
	,"LIB_FSJ_medic_dak"
	,"LIB_FSJ_medic_dak"
	,"LIB_FSJ_radioman_dak"
	,"LIB_FSJ_Soldier_dak"
	,"LIB_FSJ_sapper_dak"
	,"LIB_FSJ_sapper_gefr_dak"
	,"LIB_FSJ_Lieutenant_dak"
	,"LIB_FSJ_NCO_dak"
	,"LIB_FSJ_Sniper_dak"];
a3e_arr_recon_InfantryTypes = [
	"LIB_DAK_AT_soldier"
	,"LIB_DAK_AT_grenadier"
	,"LIB_DAK_Soldier_2"
	,"LIB_DAK_Soldier_4"
	,"LIB_DAK_Soldier_3"
	,"LIB_DAK_medic"
	,"LIB_DAK_medic"
	,"LIB_DAK_radioman"
	,"LIB_DAK_Soldier"
	,"LIB_DAK_sapper"
	,"LIB_DAK_sapper_gefr"
	,"LIB_DAK_Lieutenant"
	,"LIB_DAK_Sentry"
	,"LIB_DAK_Sentry_2"
	,"LIB_DAK_NCO_2"
	,"LIB_DAK_NCO"
	,"LIB_DAK_Sniper"];
a3e_arr_recon_I_InfantryTypes = [
	"LIB_FSJ_AT_soldier_dak"
	,"LIB_FSJ_AT_grenadier_dak"
	,"LIB_FSJ_Soldier_2_dak"
	,"LIB_FSJ_Mgunner_dak"
	,"LIB_FSJ_medic_dak"
	,"LIB_FSJ_medic_dak"
	,"LIB_FSJ_radioman_dak"
	,"LIB_FSJ_Soldier_dak"
	,"LIB_FSJ_sapper_dak"
	,"LIB_FSJ_sapper_gefr_dak"
	,"LIB_FSJ_Lieutenant_dak"
	,"LIB_FSJ_NCO_dak"
	,"LIB_FSJ_Sniper_dak"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"LIB_DAK_SdKfz251"
	,"LIB_DAK_SdKfz251_FFV"
	,"LIB_DAK_Kfz1_MG42"
	,"LIB_DAK_Pak40"
	,"LIB_DAK_SdKfz_7_AA"
	,"LIB_DAK_FlaK_36"
	,"LIB_DAK_SdKfz251_DLV"
	,"LIB_DAK_SdKfz_7"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"LIB_DAK_Scout_M3"
	,"LIB_DAK_Scout_M3_FFV"
	,"LIB_DAK_Scout_M3_DLV"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"LIB_DAK_Kfz1"
	,"LIB_DAK_Kfz1_hood"
	,"LIB_DAK_SdKfz251"
	,"LIB_DAK_SdKfz251_FFV"
	,"LIB_DAK_OpelBlitz_Open"
	,"LIB_DAK_OpelBlitz_Tent"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"LIB_DAK_OpelBlitz_Open_2"
	,"LIB_DAK_OpelBlitz_Tent_2"
	,"LIB_DAK_Scout_M3"
	,"LIB_DAK_M3_Halftrack"
	,"LIB_DAK_OpelBlitz_Open_3"
	,"LIB_DAK_OpelBlitz_Tent_3"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"LIB_DAK_Kfz1_MG42"
	,"LIB_DAK_Kfz1_MG42"
	,"LIB_DAK_SdKfz251_FFV"
	,"LIB_DAK_SdKfz251"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_opelblitz_open_y_camo"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"LIB_DAK_SdKfz251"
	,"LIB_DAK_SdKfz251_FFV"
	,"LIB_DAK_SdKfz_7_AA"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"LIB_DAK_PzKpfwIV_H"
	,"LIB_DAK_PzKpfwVI_E"
	,"LIB_DAK_FlakPanzerIV_Wirbelwind"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"LIB_MG42_Lafette_Deployed"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"LIB_DAK_OpelBlitz_Ambulance"
	,"LIB_DAK_OpelBlitz_Ammo"
	,"LIB_DAK_OpelBlitz_Fuel"
	,"LIB_DAK_SdKfz251"
	,"LIB_DAK_OpelBlitz_Parm"
	,"LIB_DAK_Kfz1"
	,"LIB_DAK_Kfz1_hood"
	,"LIB_DAK_SdKfz251_FFV"
	,"LIB_DAK_SdKfz251"
	,"LIB_DAK_OpelBlitz_Tent"
	,"LIB_DAK_OpelBlitz_Open"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"LIB_GazM1"
	,"LIB_GazM1_dirty"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"LIB_Kfz1_MG42"
	,"LIB_DAK_Pak40"
	,"LIB_MG34_Lafette_Deployed"
	,"LIB_DAK_FlaK_36"
	,"LIB_GER_SearchLight"
	,"LIB_MG42_Lafette_Deployed"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"LIB_DAK_FW190F8_Desert"
	,"LIB_DAK_FW190F8_Desert2"
	,"LIB_DAK_FW190F8_Desert3"
	,"LIB_Ju87_Italy2"
	,"LIB_Ju87_Italy2"];
a3e_arr_O_transport_heli = [
	"LIB_Ju52"];
a3e_arr_O_pilots = [
	"LIB_GER_pilot"];
a3e_arr_I_transport_heli = [
	"LIB_Ju52"];
a3e_arr_I_pilots = [
	"LIB_GER_pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_P08", 50, 2, 5, ["LIB_8Rnd_9x19_P08"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_MP40", 10, 1, 2, ["LIB_32Rnd_9x19"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_K98", 100, 3, 5, ["LIB_5Rnd_792x57"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_G3340", 50, 2, 4, ["LIB_5Rnd_792x57"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_G43", 75, 2, 4, ["LIB_10Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_MG42", 20, 1, 2, ["LIB_50Rnd_792x57"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_K98ZF39", 10, 1, 2, ["LIB_5Rnd_792x57_sS"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_MP44", 10, 2, 4, ["LIB_30Rnd_792x33"], 6];

// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1919A4", 10, 2, 4, ["LIB_50Rnd_762x63"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1919A6", 10, 1, 3, ["LIB_50Rnd_762x63"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1928A1_Thompson", 10, 1, 2, ["LIB_30Rnd_45ACP"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1903A3_Springfield", 10, 3, 5, ["LIB_5Rnd_762x63","LIB_5Rnd_762x63"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1_Carbine", 20, 2, 4, ["LIB_15Rnd_762x33"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1_Garand", 20, 2, 4, ["LIB_8Rnd_762x63"], 8];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_MG34", 50, 2, 4, ["LIB_50Rnd_792x57"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_MG34_PT", 50, 1, 3, ["LIB_75Rnd_792x57"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_MP40", 10, 1, 2, ["LIB_32Rnd_9x19"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_K98", 100, 3, 5, ["LIB_5Rnd_792x57"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_G3340", 50, 2, 4, ["LIB_5Rnd_792x57"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_G43", 75, 2, 4, ["LIB_10Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1918A2_BAR", 10, 2, 4, ["LIB_20Rnd_762x63"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1903A4_Springfield", 10, 1, 2, ["LIB_5Rnd_762x63"], 8];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_PzFaust_30m", 10, 1, 2, ["LIB_1Rnd_PzFaust_30m"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_RPzB", 10, 1, 3, ["LIB_1Rnd_RPzB"], 3];

// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_M1A1_Bazooka", 30, 1, 2, ["LIB_1Rnd_60mm_M6"], 2];

// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_SMI_35_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_shumine_42_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_Ladung_Big_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_Ladung_Small_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 10, 1, 5, ["LIB_TM44_MINE_mag", "LIB_US_TNT_4pound_mag"], 1];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_US_M1A1_ATMINE_mag"], 2];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_M3_MINE_mag", "LIB_US_M3_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_PMD6_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_pomzec_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_shumine_42_MINE_mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_shg24"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_shg24x7"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_m39"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_nb39"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["LIB_pwm"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_1Rnd_G_SPRGR_30"], 10];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_1Rnd_G_PZGR_30"], 10];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["LIB_1Rnd_G_PZGR_40"], 10];

a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_LIB_GER_Backpack"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["LIB_GER_Gloves2", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Binoculars", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["LIB_Binocular_GER", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf2_B", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf2_G", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf_G", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf_B", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["LIB_GER_Gloves2", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Binoculars", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["LIB_Binocular_GER", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf2_B", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf2_G", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf_G", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["LIB_ACC_GW_SB_Empty", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["LIB_ACC_K98_Bayo", 75, 1, 5];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf_B", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];


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
a3e_arr_CivilianCarWeapons pushback ["LIB_DELISLE", ["LIB_7Rnd_45ACP"], 6];
a3e_arr_CivilianCarWeapons pushback ["LIB_Bagpipes", ["LIB_7Rnd_45ACP"], 6];


// Here is a list of scopes:
a3e_arr_Scopes = [""];
a3e_arr_Scopes_SMG = [""];
a3e_arr_Scopes_Sniper = [""];
a3e_arr_NightScopes = [""];
a3e_arr_TWSScopes = [""];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [""];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"B_Heli_Transport_01_F"];
a3e_arr_extraction_chopper_escort = [
	"LIB_US_NAC_P39"
	,"LIB_US_NAC_P39_2"
	,"LIB_US_NAC_P39_3"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"LIB_LCM3_Armed"];
a3e_arr_extraction_boat_escort = [
	"LIB_LCM3_Armed"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = ["LIB_DAK_FW190F8_Desert"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"LIB_DAK_FW190F8_Desert"];
a3e_arr_searchChopperHard = [
	"LIB_DAK_FW190F8_Desert2"
	,"LIB_DAK_FW190F8_Desert3"];
a3e_arr_searchChopper_pilot = [
	"LIB_GER_pilot"];
a3e_arr_searchChopper_crew = [
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
	"LIB_LCVP"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "LIB_WeaponsBox_Big_GER";
a3e_additional_weapon_box_2 = "LIB_BasicWeaponsBox_GER";

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
	"LIB_DAK_Ju87"
	,"LIB_DAK_Ju87_2"];

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
	"LIB_HORSA_Wreck"
	,"LIB_CG4_WACO_Wreck2"
	,"LIB_CG4_WACO_Wreck"
	,"LIB_P47_MRWreck"];
a3e_arr_CrashSiteCrew = [
	"LIB_US_pilot"
	,"LIB_US_rifleman"];
a3e_arr_CrashSiteWrecksCar = [
	"LIB_M4A3_75_wreck"];
a3e_arr_CrashSiteCrewCar = [
	"LIB_UK_DR_Tank_Crew"
	,"LIB_UK_DR_Tank_Crew"
	,"LIB_UK_DR_Tank_Commander"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["LIB_Welrod_mk1", 10, 2, 4, ["LIB_6Rnd_9x19_Welrod"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_DELISLE", 20, 1, 2, ["LIB_7Rnd_45ACP"], 8];
a3e_arr_CrashSiteWeapons pushback ["LIB_Sten_Mk2", 20, 1, 2, ["LIB_32Rnd_9x19_Sten"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_Sten_Mk5_Bayonet", 20, 1, 2, ["LIB_32Rnd_9x19_Sten"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_PIAT", 30, 1, 2, ["LIB_1Rnd_89m_PIAT","LIB_1Rnd_89m_G_PIAT"], 2];
a3e_arr_CrashSiteWeapons pushback ["LIB_PIAT_Rifle", 20, 1, 2, ["LIB_1Rnd_89m_PIAT","LIB_1Rnd_89m_G_PIAT"], 2];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1919A4", 50, 2, 4, ["LIB_50Rnd_762x63"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1919A6", 50, 1, 3, ["LIB_50Rnd_762x63"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1928_Thompson", 10, 1, 2, ["LIB_50Rnd_45ACP"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_LeeEnfield_No4_Bayonet", 100, 3, 5, ["LIB_10Rnd_770x56"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_LeeEnfield_No1_Bayonet", 50, 2, 4, ["LIB_10Rnd_770x56"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_LeeEnfield_No1_CUP", 75, 2, 4, ["LIB_10Rnd_770x56"], 4];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["G_LIB_Scarf2_B", 50, 2, 3, [], 0];
a3e_arr_CrashSiteItems pushback ["G_LIB_Scarf2_G", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["G_LIB_Scarf_G", 10, 1, 2];
a3e_arr_CrashSiteItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["G_LIB_Scarf_B", 50, 1, 10];
a3e_arr_CrashSiteItems pushback ["LIB_Binocular_SU", 50, 1, 10];
a3e_arr_CrashSiteItems pushback ["LIB_US_M36_Rope", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["LIB_US_M36", 50, 1, 10];
a3e_arr_CrashSiteItems pushback ["LIB_US_Backpack", 50, 1, 10];