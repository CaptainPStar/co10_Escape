/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = west;//player side IFA GER Wehrmacht
A3E_VAR_Side_Opfor = east;//enemy side IFA SOV
A3E_VAR_Side_Ind = resistance;//independent side IFA US

A3E_VAR_Flag_Opfor = "\WW2\Core_t\IF_Decals_t\US\flag_USA_co.paa";
A3E_VAR_Flag_Ind = "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"LIB_US_rifleman",
	"LIB_US_rifleman",
	"LIB_US_second_lieutenant",
	"LIB_US_first_lieutenant",
	"LIB_US_rifleman"];

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
		"LIB_SOV_M3_Halftrack"
		,"LIB_SdKfz251_captured"
		,"LIB_SdKfz251_captured_FFV"
		,"LIB_US6_BM13"
		,"LIB_GazM1_SOV"
		,"LIB_GazM1_SOV_camo_sand"
		,"LIB_Scout_M3"
		,"LIB_Scout_M3_FFV"
		,"LIB_US6_Tent"
		,"LIB_US6_Ammo"
		,"LIB_US6_Open"
		,"LIB_Willys_MB"
		,"LIB_Zis5v_61K"
		,"LIB_Zis5v"
		,"LIB_Zis5v_Med"
		,"LIB_Zis5v_Fuel"
		,"LIB_Zis6_Parm"
		,"LIB_T34_76"
		,"LIB_T34_85"
		,"LIB_SU85"
		,"LIB_M4A2_SOV"
		,"LIB_JS2_43"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_US_M3_Halftrack"
		,"LIB_US_GMC_Tent"
		,"LIB_US_GMC_Ambulance"
		,"LIB_US_GMC_Ammo"
		,"LIB_US_GMC_Fuel"
		,"LIB_US_GMC_Open"
		,"LIB_US_GMC_Parm"
		,"LIB_US_Scout_M3"
		,"LIB_US_Scout_M3_FFV"
		,"LIB_US_Willys_MB"
		,"LIB_M8_Greyhound"
		,"LIB_M3A3_Stuart"
		,"LIB_M4A3_75"
		,"LIB_M4A3_75_Tubes"
		,"LIB_M4A4_FIREFLY"
		,"LIB_M4A3_76"
		,"LIB_M4A3_76_HVSS"
		,"LIB_M5A1_Stuart"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_SOV_M3_Halftrack"
		,"LIB_SdKfz251_captured"
		,"LIB_SdKfz251_captured_FFV"
		,"LIB_US6_BM13"
		,"LIB_GazM1_SOV"
		,"LIB_GazM1_SOV_camo_sand"
		,"LIB_Scout_M3"
		,"LIB_Scout_M3_FFV"
		,"LIB_US6_Tent"
		,"LIB_US6_Ammo"
		,"LIB_US6_Open"
		,"LIB_Willys_MB"
		,"LIB_Zis5v_61K"
		,"LIB_Zis5v"
		,"LIB_Zis5v_Med"
		,"LIB_Zis5v_Fuel"
		,"LIB_Zis6_Parm"
		,"LIB_T34_76"
		,"LIB_T34_85"
		,"LIB_SU85"
		,"LIB_M4A2_SOV"
		,"LIB_JS2_43"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_US_M3_Halftrack"
		,"LIB_US_GMC_Tent"
		,"LIB_US_GMC_Ambulance"
		,"LIB_US_GMC_Ammo"
		,"LIB_US_GMC_Fuel"
		,"LIB_US_GMC_Open"
		,"LIB_US_GMC_Parm"
		,"LIB_US_Scout_M3"
		,"LIB_US_Scout_M3_FFV"
		,"LIB_US_Willys_MB"
		,"LIB_M8_Greyhound"
		,"LIB_M3A3_Stuart"
		,"LIB_M4A3_75"
		,"LIB_M4A3_75_Tubes"
		,"LIB_M4A4_FIREFLY"
		,"LIB_M4A3_76"
		,"LIB_M4A3_76_HVSS"
		,"LIB_M5A1_Stuart"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"LIB_SOV_M3_Halftrack"
		,"LIB_SdKfz251_captured"
		,"LIB_SdKfz251_captured_FFV"
		,"LIB_US6_BM13"
		,"LIB_GazM1_SOV"
		,"LIB_GazM1_SOV_camo_sand"
		,"LIB_Scout_M3"
		,"LIB_Scout_M3_FFV"
		,"LIB_US6_Tent"
		,"LIB_US6_Ammo"
		,"LIB_US6_Open"
		,"LIB_Willys_MB"
		,"LIB_Zis5v_61K"
		,"LIB_Zis5v"
		,"LIB_Zis5v_Med"
		,"LIB_Zis5v_Fuel"
		,"LIB_Zis6_Parm"
		,"LIB_T34_76"
		,"LIB_T34_85"
		,"LIB_SU85"
		,"LIB_M4A2_SOV"
		,"LIB_JS2_43"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LIB_US_M3_Halftrack"
		,"LIB_US_GMC_Tent"
		,"LIB_US_GMC_Ambulance"
		,"LIB_US_GMC_Ammo"
		,"LIB_US_GMC_Fuel"
		,"LIB_US_GMC_Open"
		,"LIB_US_GMC_Parm"
		,"LIB_US_Scout_M3"
		,"LIB_US_Scout_M3_FFV"
		,"LIB_US_Willys_MB"
		,"LIB_M8_Greyhound"
		,"LIB_M3A3_Stuart"
		,"LIB_M4A3_75"
		,"LIB_M4A3_75_Tubes"
		,"LIB_M4A4_FIREFLY"
		,"LIB_M4A3_76"
		,"LIB_M4A3_76_HVSS"
		,"LIB_M5A1_Stuart"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"LIB_SOV_AT_soldier"
	,"LIB_SOV_AT_soldier"
	,"LIB_SOV_AT_soldier"
	,"LIB_SOV_AT_grenadier"
	,"LIB_SOV_AT_grenadier"
	,"LIB_SOV_captain"
	,"LIB_SOV_captain_summer"
	,"LIB_SOV_first_lieutenant"
	,"LIB_SOV_gun_lieutenant"
	,"LIB_SOV_gun_crew"
	,"LIB_SOV_gun_sergeant"
	,"LIB_SOV_mgunner"
	,"LIB_SOV_medic"
	,"LIB_SOV_LC_rifleman"
	,"LIB_SOV_LC_rifleman_summer"
	,"LIB_SOV_rifleman"
	,"LIB_SOV_p_officer"
	,"LIB_SOV_sergeant"
	,"LIB_SOV_staff_sergeant"
	,"LIB_SOV_unequip"
	,"LIB_SOV_assault_mgunner"
	,"LIB_SOV_assault_smgunner"
	,"LIB_SOV_assault_sergeant"
	,"LIB_SOV_sapper"
	,"LIB_SOV_operator"
	,"LIB_SOV_lieutenant"
	,"LIB_SOV_smgunner"
	,"LIB_SOV_smgunner_summer"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"LIB_US_AT_soldier"
	,"LIB_US_AT_soldier"
	,"LIB_US_AT_soldier"
	,"LIB_US_captain"
	,"LIB_US_engineer"
	,"LIB_US_first_lieutenant"
	,"LIB_US_grenadier"
	,"LIB_US_mgunner"
	,"LIB_US_medic"
	,"LIB_US_radioman"
	,"LIB_US_corporal"
	,"LIB_US_FC_rifleman"
	,"LIB_US_rifleman"
	,"LIB_US_second_lieutenant"
	,"LIB_US_sniper"
	,"LIB_US_smgunner"];
a3e_arr_recon_InfantryTypes = [
	"LIB_SOV_scout_smgunner"
	,"LIB_SOV_scout_mgunner"
	,"LIB_SOV_scout_rifleman_autumn"
	,"LIB_SOV_scout_rifleman"
	,"LIB_SOV_scout_p_officer"
	,"LIB_SOV_scout_sergeant"
	,"LIB_SOV_scout_lieutenant"
	,"LIB_SOV_scout_sniper_autumn"
	,"LIB_SOV_scout_sniper_spring"
	,"LIB_SOV_scout_sniper"
	,"LIB_SOV_operator"
	,"LIB_SOV_scout_rifleman"
	,"LIB_SOV_scout_rifleman"];
a3e_arr_recon_I_InfantryTypes = [
	"LIB_US_101AB_AT_soldier"
	,"LIB_US_101AB_AT_soldier"
	,"LIB_US_82AB_CO"
	,"LIB_US_82AB_mgunner_assistant"
	,"LIB_US_82AB_mgunner"
	,"LIB_US_82AB_medic"
	,"LIB_US_82AB_radioman"
	,"LIB_US_82AB_corporal"
	,"LIB_US_82AB_FC_rifleman"
	,"LIB_US_82AB_rifleman"
	,"LIB_US_82AB_smgunner"
	,"LIB_US_82AB_NCO"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"LIB_SOV_M3_Halftrack"
	,"LIB_SdKfz251_captured"
	,"LIB_SdKfz251_captured_FFV"
	,"LIB_Scout_M3_FFV"
	,"LIB_Zis5v_61K"
	,"LIB_61k"
	,"LIB_Zis3"
	,"LIB_Maxim_M30_base"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"LIB_US_M3_Halftrack"
	,"LIB_US_Scout_M3"
	,"LIB_US_Scout_M3_FFV"
	,"LIB_M1919_M2"
	,"LIB_M8_Greyhound"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"LIB_SOV_M3_Halftrack"
	,"LIB_SdKfz251_captured"
	,"LIB_SdKfz251_captured_FFV"
	,"LIB_GazM1_SOV"
	,"LIB_GazM1_SOV_camo_sand"
	,"LIB_Zis5v"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"LIB_US_M3_Halftrack"
	,"LIB_US_Scout_M3"
	,"LIB_US_Scout_M3_FFV"
	,"LIB_US_Willys_MB"
	,"LIB_US_GMC_Tent"
	,"LIB_US_GMC_Open"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"LIB_SOV_M3_Halftrack"
	,"LIB_SdKfz251_captured"
	,"LIB_SdKfz251_captured_FFV"
	,"LIB_Scout_M3"
	,"LIB_Scout_M3_FFV"
	,"LIB_US6_Tent"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"LIB_SOV_M3_Halftrack"
	,"LIB_SdKfz251_captured"
	,"LIB_SdKfz251_captured_FFV"
	,"LIB_Scout_M3"
	,"LIB_Scout_M3_FFV"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"LIB_T34_76"
	,"LIB_T34_85"
	,"LIB_SU85"
	,"LIB_M4A2_SOV"
	,"LIB_JS2_43"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"LIB_Maxim_M30_base"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"LIB_US6_Tent"
	,"LIB_US6_Ammo"
	,"LIB_US6_Open"
	,"LIB_Willys_MB"
	,"LIB_Zis5v_61K"
	,"LIB_Zis5v"
	,"LIB_Zis5v_Med"
	,"LIB_Zis5v_Fuel"
	,"LIB_Zis6_Parm"
	,"LIB_GazM1_SOV"
	,"LIB_GazM1_SOV_camo_sand"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"LIB_GazM1"
	,"LIB_GazM1_dirty"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"LIB_61k"
	,"LIB_Zis3"
	,"LIB_Maxim_M30_base"
	,"LIB_M1919_M2"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"LIB_Pe2"
	,"LIB_P39"
	,"LIB_RA_P39_2"
	,"LIB_RA_P39_3"];
a3e_arr_O_transport_heli = [
	"LIB_Li2"];
a3e_arr_O_pilots = [
	"LIB_SOV_pilot"];
a3e_arr_I_transport_heli = [
	"LIB_HORSA"
	,"LIB_C47_Skytrain"];
a3e_arr_I_pilots = [
	"LIB_US_Pilot"
	,"LIB_US_Pilot_2"
	,"LIB_US_Bomber_Pilot"
	,"LIB_US_Bomber_Crew"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_TT33", 50, 2, 5, ["LIB_8Rnd_762x25"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_PPSh41_m", 10, 1, 2, ["LIB_32Rnd_9x19"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M9130", 100, 3, 5, ["LIB_5Rnd_762x54"], 12];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_PPSh41_d", 50, 2, 4, ["LIB_71Rnd_762x25"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_PPSh41_m", 75, 2, 4, ["LIB_35Rnd_762x25","LIB_35Rnd_762x25_t","LIB_35Rnd_762x25_ap"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_DP28", 20, 1, 2, ["LIB_47Rnd_762x54"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M9130PU", 10, 1, 2, ["LIB_5Rnd_762x54"], 12];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_SVT_40", 10, 2, 4, ["LIB_10Rnd_762x54"], 10];

// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M3_GreaseGun", 70, 1, 4, ["LIB_30Rnd_45ACP"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1928A1_Thompson", 20, 1, 2, ["LIB_50Rnd_45ACP"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1928_Thompson", 30, 1, 2, ["LIB_30Rnd_45ACP"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1A1_Thompson", 30, 1, 2, ["LIB_30Rnd_45ACP"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1903A3_Springfield", 60, 3, 5, ["LIB_5Rnd_762x63","LIB_5Rnd_762x63"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1_Carbine", 20, 2, 4, ["LIB_15Rnd_762x33"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1A1_Carbine", 20, 2, 4, ["LIB_15Rnd_762x33"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["LIB_M1_Garand", 40, 2, 4, ["LIB_8Rnd_762x63"], 12];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_DT", 50, 2, 4, ["LIB_63Rnd_762x54d"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_DT_OPTIC", 50, 1, 3, ["LIB_63Rnd_762x54"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_SVT_40", 10, 1, 2, ["LIB_10Rnd_762x54_d"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M38", 100, 3, 5, ["LIB_5Rnd_762x54_t46"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_PTRD", 50, 2, 4, ["LIB_1Rnd_145x114"], 15];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M44", 75, 2, 4, ["LIB_5Rnd_762x54","LIB_5Rnd_762x54_D","LIB_5Rnd_762x54_b30"], 4];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1919A4", 10, 2, 4, ["LIB_50Rnd_762x63"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1919A6", 10, 1, 3, ["LIB_50Rnd_762x63"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1918A2_BAR", 10, 2, 4, ["LIB_20Rnd_762x63"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LIB_M1903A4_Springfield", 10, 1, 2, ["LIB_5Rnd_762x63"], 8];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_PzFaust_30m", 40, 1, 2, ["LIB_1Rnd_PzFaust_30m"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_RPzB", 30, 1, 3, ["LIB_1Rnd_RPzB"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["LIB_PTRD", 40, 1, 3, ["LIB_1Rnd_145x114"], 15];

// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["LIB_M1A1_Bazooka", 30, 1, 2, ["LIB_1Rnd_60mm_M6"], 2];

// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_SMI_35_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_shumine_42_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_SMI_35_1_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["LIB_US_TNT_4pound_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 10, 1, 5, ["LIB_TM44_MINE_mag", "LIB_US_TNT_4pound_mag"], 1];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_US_M1A1_ATMINE_mag"], 2];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_M3_MINE_mag", "LIB_US_M3_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_PMD6_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_pomzec_MINE_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 5, ["LIB_shumine_42_MINE_mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_Rpg6"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_RDG"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_Rg42"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_nb39"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["LIB_US_Mk_2"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["LIB_1Rnd_G_DYAKONOV"], 20];

a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_LIB_SOV_RA_Rucksack2_Green"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Mohawk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Binoculars", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["LIB_Binocular_SU", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf2_B", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["LIB_GER_Gloves4", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["G_LIB_GER_Gloves5", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Dust_Goggles", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["LIB_Headwrap_gloves", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Binoculars", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["LIB_Binocular_SU", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf2_B", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["G_LIB_Scarf2_G", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["LIB_ACC_M1891_Bayo", 80, 1, 5];
a3e_arr_AmmoDepotItems pushback ["LIB_ACC_GL_DYAKONOV_Empty", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["LIB_ACC_M1_Bayo", 50, 1, 2];
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


// Here is a list of scopes:
a3e_arr_Scopes = [""];
a3e_arr_Scopes_SMG = [""];
a3e_arr_Scopes_Sniper = [""];
a3e_arr_NightScopes = [""];
a3e_arr_TWSScopes = [""];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [""];

//////////////////////////////////////////////////////////////////
// SelectExtractionZone.sqf
// Which type of extractions are supported/preferred by this unitclasses version?
// Only if supported by terrain, so if corresponding markers are placed
// Basic fallback is always Heli extraction
// Available types: a3e_arr_extractiontypes = ["air","land","sea"];
//////////////////////////////////////////////////////////////////
a3e_arr_extractiontypes = [
	"land"
	,"sea"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"B_Heli_Transport_01_F"];
a3e_arr_extraction_chopper_escort = [
	"LIB_FW190F8_Italy"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"LIB_LCVP"];
a3e_arr_extraction_boat_escort = [
	"LIB_LCVP"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Cars/APCs that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"LIB_OpelBlitz_Open_G_Camo"	//12
	,"LIB_OpelBlitz_Open_Y_Camo"	//12
	,"LIB_OpelBlitz_Tent_Y_Camo"	//12
	,"LIB_SdKfz_7"	//11
	,"LIB_OpelBlitz_Ambulance"	//8
	,"LIB_SdKfz251"	//10
	,"LIB_SdKfz234_1"];	//7
a3e_arr_extraction_car_escort = [
	"LIB_FlakPanzerIV_Wirbelwind"
	,"LIB_StuG_III_G"
	,"LIB_PzKpfwIV_H"
	,"LIB_PzKpfwVI_E"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = ["LIB_Li2"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"LIB_Li2"];
a3e_arr_searchChopperHard = [
	"LIB_P39"
	,"LIB_Pe2"];
a3e_arr_searchChopper_pilot = [
	"LIB_SOV_pilot"];
a3e_arr_searchChopper_crew = [
	"LIB_SOV_pilot"];

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
	"LIB_LCM3_Armed"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "LIB_BasicWeaponsBox_SU";
a3e_additional_weapon_box_2 = "LIB_BasicWeaponsBox_US";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"LIB_BM37"
	,"LIB_M2_60"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"LIB_Pe2"];

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
	"LIB_FW190F8_MRWreck"
	,"LIB_Ju87_MRWreck"
	,"LIB_JU52_wreck"];
a3e_arr_CrashSiteCrew = [
	"LIB_GER_pilot"];
a3e_arr_CrashSiteWrecksCar = [
	"LIB_StuG_III_G_wreck"
	,"LIB_SdKfz251_Wreck"
	,"LIB_PzKpfwVI_B_camo_wreck"
	,"LIB_PzKpfwVI_B_wreck"
	,"LIB_PzKpfwV_Wreck"
	,"LIB_PzKpfwIV_H_Wreck"
	,"LIB_OpelBlitz_2_Wreck"
	,"LIB_OpelBlitz_Wreck"
	,"LIB_kfz1_Wreck"];
a3e_arr_CrashSiteCrewCar = [
	"LIB_GER_tank_crew"
	,"LIB_GER_tank_unterofficer"
	,"LIB_GER_tank_lieutenant"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["LIB_MG42", 10, 2, 4, ["LIB_50Rnd_792x57"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_MG34", 10, 2, 4, ["LIB_50Rnd_792x57"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_MG34_PT", 10, 2, 4, ["LIB_75Rnd_792x57"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_K98ZF39", 50, 1, 2, ["LIB_5Rnd_792x57_sS"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_G43", 30, 1, 2, ["LIB_10Rnd_792x57","LIB_5Rnd_792x57","LIB_5Rnd_792x57"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_K98", 50, 2, 4, ["LIB_5Rnd_792x57"], 4];
a3e_arr_CrashSiteWeapons pushback ["LIB_MP40", 50, 1, 3, ["LIB_32Rnd_9x19"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_MP44", 10, 1, 2, ["LIB_30Rnd_792x33"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_G3340", 50, 2, 4, ["LIB_5Rnd_792x57"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_M2_Flamethrower", 25, 2, 4, ["LIB_M2_Flamethrower_Mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["LIB_FG42G", 25, 2, 4, ["LIB_20Rnd_792x57"], 8];
a3e_arr_CrashSiteWeapons pushback ["LIB_PzFaust_30m", 50, 1, 4, ["LIB_1Rnd_PzFaust_30m"], 2];
a3e_arr_CrashSiteWeapons pushback ["LIB_PzFaust_60m", 40, 1, 2, ["LIB_1Rnd_PzFaust_60m"], 2];
a3e_arr_CrashSiteWeapons pushback ["LIB_Faustpatrone", 50, 1, 4, ["LIB_1Rnd_Faustpatrone"], 2];
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