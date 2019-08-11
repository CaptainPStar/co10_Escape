/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = east;//player side IFA SOV
A3E_VAR_Side_Opfor = west;//enemy side IFA GER Wehrmacht
A3E_VAR_Side_Ind = resistance;//independent side IFA GER Wehrmacht

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_AAF_CO.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"LIB_GER_Unequip_w",
	"LIB_GER_Rifleman_w",
	"LIB_GER_Gun_crew_w",
	"LIB_GER_Unterofficer_w",
	"LIB_GER_Ober_rifleman_w"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_Colt_M1911","LIB_7Rnd_45ACP"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_M1895","LIB_7Rnd_762x38"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_M1896","LIB_10Rnd_9x19_M1896"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_P08","LIB_8Rnd_9x19_P08"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_P38","LIB_8Rnd_9x19"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_TT33","LIB_8Rnd_762x25"];
a3e_arr_PrisonBackpackWeapons pushback ["LIB_WaltherPPK","LIB_7Rnd_9x19"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"LIB_GazM1"
	,"LIB_GazM1_dirty"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_Kfz1"
		,"LIB_Kfz1_Hood"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_FlakPanzerIV_Wirbelwind"
		,"LIB_StuG_III_G"
		,"LIB_PzKpfwIV_H"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_Kfz1"
		,"LIB_Kfz1_Hood"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_FlakPanzerIV_Wirbelwind"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_Kfz1"
		,"LIB_Kfz1_Hood"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_FlakPanzerIV_Wirbelwind"
		,"LIB_StuG_III_G"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_Kfz1"
		,"LIB_Kfz1_Hood"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_FlakPanzerIV_Wirbelwind"
		,"LIB_StuG_III_G"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_Kfz1"
		,"LIB_Kfz1_Hood"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_opelblitz_ambulance"
		,"LIB_opelblitz_ammo"
		,"LIB_opelblitz_fuel"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_FlakPanzerIV_Wirbelwind"
		,"LIB_StuG_III_G"
		,"LIB_PzKpfwIV_H"
		,"LIB_PzKpfwV"
		,"LIB_PzKpfwVI_B"
		,"LIB_PzKpfwVI_E"
		,"LIB_PzKpfwVI_E_1"
		,"LIB_PzKpfwVI_E_2"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_Kfz1"
		,"LIB_Kfz1_Hood"
		,"LIB_Kfz1_MG42"
		,"LIB_opelblitz_open_y_camo"
		,"LIB_opelblitz_tent_y_camo"
		,"LIB_opelblitz_parm"
		,"LIB_SdKfz251"
		,"LIB_SdKfz_7"
		,"LIB_SdKfz_7_AA"
		,"LIB_SdKfz251_FFV"
		,"LIB_FlakPanzerIV_Wirbelwind"
		,"LIB_StuG_III_G"
		,"LIB_PzKpfwIV_H"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"LIB_GER_AT_soldier_w"
	,"LIB_GER_AT_grenadier_w"
	,"LIB_GER_Hauptmann_w"
	,"LIB_GER_Smgunner_w"
	,"LIB_GER_Ober_lieutenant_w"
	,"LIB_GER_Gun_crew_w"
	,"LIB_GER_Unterofficer_w"
	,"LIB_GER_Mgunner_w"
	,"LIB_GER_Medic_w"
	,"LIB_GER_Ober_rifleman_w"
	,"LIB_GER_Rifleman_ADS_w"
	,"LIB_GER_Rifleman3_w"
	,"LIB_GER_Unterofficer_w"
	,"LIB_GER_Stggunner_w"
	,"LIB_GER_Unequip_w"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"SG_sturmtrooper_AT_soldier"
	,"SG_sturmtrooper_AT_grenadier"
	,"SG_sturmtrooper_smgunner"
	,"SG_sturmtrooper_mgunner"
	,"SG_sturmtrooper_medic"
	,"SG_sturmtrooper_radioman"
	,"SG_sturmtrooper_ober_rifleman"
	,"SG_sturmtrooper_rifleman"
	,"SG_sturmtrooper_sapper"
	,"SG_sturmtrooper_sapper_gefr"
	,"SG_sturmtrooper_lieutenant"
	,"SG_sturmtrooper_unterofficer"
	,"SG_sturmtrooper_sniper"
	,"SG_sturmtrooper_stggunner"];
a3e_arr_recon_InfantryTypes = [
	"LIB_GER_scout_smgunner"
	,"LIB_GER_scout_lieutenant"
	,"LIB_GER_scout_mgunner"
	,"LIB_GER_radioman"
	,"LIB_GER_scout_ober_rifleman"
	,"LIB_GER_soldier_camo_base"
	,"LIB_GER_soldier_camo2_base"
	,"LIB_GER_soldier_camo3_base"
	,"LIB_GER_soldier_camo4_base"
	,"LIB_GER_soldier_camo5_base"
	,"LIB_GER_scout_rifleman"
	,"LIB_GER_sapper"
	,"LIB_GER_sapper_gefr"
	,"LIB_GER_scout_unterofficer"
	,"LIB_GER_scout_sniper"];
a3e_arr_recon_I_InfantryTypes = [
	"LNRD_Luftwaffe_AT_soldier"
	,"LNRD_Luftwaffe_AT_grenadier"
	,"LNRD_Luftwaffe_smgunner"
	,"LNRD_Luftwaffe_flaksoldat"
	,"LNRD_Luftwaffe_mgunner"
	,"LNRD_Luftwaffe_medic"
	,"LNRD_Luftwaffe_radioman"
	,"LNRD_Luftwaffe_ober_rifleman"
	,"LNRD_Luftwaffe_rifleman"
	,"LNRD_Luftwaffe_sniper"
	,"LNRD_Luftwaffe_stggunner"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"LIB_SdKfz251"
	,"LIB_SdKfz251_FFV"
	,"LIB_Kfz1_MG42"
	,"LIB_Pak40"
	,"LIB_MG34_Lafette_Deployed"
	,"LIB_FlaK_30"
	,"LIB_GER_SearchLight"
	,"LIB_MG42_Lafette_Deployed"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"LIB_SdKfz251"
	,"LIB_SdKfz251_FFV"
	,"LIB_Kfz1_MG42"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"LIB_Kfz1"
	,"LIB_Kfz1_hood"
	,"LIB_SdKfz251_FFV"
	,"LIB_SdKfz251"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_opelblitz_open_y_camo"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"LIB_Kfz1"
	,"LIB_Kfz1_hood"
	,"LIB_SdKfz251_FFV"
	,"LIB_SdKfz251"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_opelblitz_open_y_camo"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"LIB_Kfz1"
	,"LIB_Kfz1_hood"
	,"LIB_SdKfz251_FFV"
	,"LIB_SdKfz251"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_opelblitz_open_y_camo"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"LIB_SdKfz251"
	,"LIB_SdKfz251_FFV"
	,"LIB_SdKfz_7_AA"];
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
	"LIB_MG42_Lafette_Deployed"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"LIB_opelblitz_ambulance"
	,"LIB_opelblitz_fuel"
	,"LIB_opelblitz_ammo"
	,"LIB_SdKfz251"
	,"LIB_opelblitz_parm"
	,"LIB_Kfz1"
	,"LIB_Kfz1_hood"
	,"LIB_SdKfz251_FFV"
	,"LIB_SdKfz251"
	,"LIB_opelblitz_tent_y_camo"
	,"LIB_opelblitz_open_y_camo"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"LIB_GazM1"
	,"LIB_GazM1_dirty"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"LIB_Kfz1_MG42"
	,"LIB_Pak40"
	,"LIB_MG34_Lafette_Deployed"
	,"LIB_FlaK_30"
	,"LIB_GER_SearchLight"
	,"LIB_MG42_Lafette_Deployed"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"LIB_FW190F8"
	,"LIB_FW190F8_4"
	,"LIB_FW190F8_5"
	,"LIB_FW190F8_2"
	,"LIB_FW190F8_3"
	,"LIB_Ju87"
	,"LIB_Ju87"
	,"LIB_Ju87"];
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
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_FG42G", 20, 1, 2, ["LIB_20Rnd_792x57"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M2_Flamethrower", 20, 3, 5, ["LIB_M2_Flamethrower_Mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_G3340", 50, 2, 4, ["LIB_5Rnd_792x57"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_G43", 75, 2, 4, ["LIB_10Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1918A2_BAR", 10, 2, 4, ["LIB_20Rnd_762x63"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1903A4_Springfield", 10, 1, 2, ["LIB_5Rnd_762x63"], 8];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_PzFaust_30m", 50, 1, 2, ["LIB_1Rnd_PzFaust_30m"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_Faustpatrone", 50, 1, 2, ["LIB_1Rnd_Faustpatrone"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_RPzB", 35, 1, 3, ["LIB_1Rnd_RPzB"], 3];

// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_M1A1_Bazooka", 10, 1, 2, ["LIB_1Rnd_60mm_M6"], 2];

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
	"LIB_P47"];

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
a3e_arr_searchdrone = ["LIB_FW190F8"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"LIB_FW190F8"];
a3e_arr_searchChopperHard = [
	"LIB_FW190F8"
	,"LIB_FW190F8_4"];
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
	"LIB_Ju87_Italy"
	,"LIB_Ju87"];

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
	,"LIB_P47_MRWreck"
	,"LIB_C47_Skytrain_wreck"
	,"Land_HistoricalPlaneWreck_03_F"];
a3e_arr_CrashSiteCrew = [
	"LIB_US_pilot"
	,"LIB_US_rifleman"];
a3e_arr_CrashSiteWrecksCar = [
	"LIB_M4A3_75_wreck"
	,"LIB_us6_Wreck"];
a3e_arr_CrashSiteCrewCar = [
	"LIB_US_tank_crew"
	,"LIB_US_tank_second_lieutenant"
	,"LIB_US_tank_sergeant"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1918A2_BAR", 10, 2, 4, ["LIB_20Rnd_762x63","LIB_20Rnd_762x63"], 3];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1903A4_Springfield", 50, 1, 2, ["LIB_5Rnd_762x63"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1A1_Bazooka", 30, 1, 2, ["LIB_1Rnd_60mm_M6"], 2];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1919A4", 50, 2, 4, ["LIB_50Rnd_762x63"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1919A6", 50, 1, 3, ["LIB_50Rnd_762x63"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1928A1_Thompson", 10, 1, 2, ["LIB_30Rnd_45ACP"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1903A3_Springfield", 100, 3, 5, ["LIB_5Rnd_762x63","LIB_5Rnd_762x63"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1_Carbine", 50, 2, 4, ["LIB_15Rnd_762x33","LIB_15Rnd_762x33"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_M1_Garand", 75, 2, 4, ["LIB_8Rnd_762x63","LIB_8Rnd_762x63","LIB_8Rnd_762x63"], 4];
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