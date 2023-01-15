// CSLA
// CSLA vs US and FIA

/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;	//player side CSLA CSLA
A3E_VAR_Side_Opfor = west;	//CSLA US
A3E_VAR_Side_Ind = resistance;	//CSLA FIA

A3E_VAR_Flag_Opfor = "\csla_misc\signs\flags\flag_us_co.paa";
A3E_VAR_Flag_Ind = "\csla_misc\signs\flags\fia_flag.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];


A3E_ItemsToBeRemoved = ["US85_watch","US85_scFAL","US85_FALbpd"]; //Items to randomly remove from units and to remove from guards

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"FIA_mcFAL"
	,"FIA_mcCmd"
	,"FIA_mcSa58"
	,"FIA_mcSa24"
	,"FIA_mcVG70"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"FIA_bpPack"
	,"US85_bpAlice"
	,"CSLA_bp60"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["CSLA_Sa61","CSLA_Sa61_20rnd_7_65Pi27"];
a3e_arr_PrisonBackpackWeapons pushback ["CSLA_Sa61t","CSLA_Sa61_20rnd_7_65Pi27"];
a3e_arr_PrisonBackpackWeapons pushback ["CSLA_Pi82","CSLA_Pi82_12rnd_9Pi82"];
a3e_arr_PrisonBackpackWeapons pushback ["CSLA_Pi52","CSLA_Pi52_8rnd_7_62Pi52"];
a3e_arr_PrisonBackpackWeapons pushback ["CSLA_Pi75lr","CSLA_Pi75_15Rnd_9Luger"];
a3e_arr_PrisonBackpackWeapons pushback ["CSLA_Pi75sr","CSLA_Pi75_15Rnd_9Luger"];
a3e_arr_PrisonBackpackWeapons pushback ["US85_M9","US85_M9_15Rnd_9Luger"];
a3e_arr_PrisonBackpackWeapons pushback ["US85_1911","US85_1911_7Rnd_045ACP"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"CSLA_CIV_ADA1600"
	,"CSLA_CIV_ADA1600"
	,"CSLA_CIV_ADA1600"
	,"CSLA_CIV_ADA1600VB"
	,"CSLA_CIV_JARA250"
	,"CSLA_CIV_V3S"
	,"CSLA_CIV_V3Sr"
	,"US85_TT650"
	,"CSLA_CIV_Sarka1200"
	,"CSLA_CIV_Sarka1200"
	,"CSLA_CIV_Sarka1200"
	,"CSLA_CIV_Sarka1200PO"
	//,"CSLA_CIV_AZU"
	,"CSLA_civ_CATOR"];
	if(A3E_Param_UseDLCContact==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Tractor_01_F";
	};
	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"US85_M1008"
		,"US85_M1008"
		,"US85_M1025_ua"
		,"US85_M1025_ua"
		,"US85_M1025_M60"
		,"US85_M1008_S250"
		,"US85_M1043_ua"
		,"US85_M1043_M2"
		,"US85_M1043_M60"
		,"US85_M998SFGT"
		,"US85_M1030"	//bike
		,"US85_M1030"
		,"US85_M923o"
		,"US85_M923a1om2"
		,"US85_M923c"
		,"US85_M923a1cm2"
		,"US85_M923a"
		,"US85_M923f"
		,"US85_M923r"
		,"US85_M923a1_s280"
		,"US85_M163"	//AA truck
		,"US85_M113"
		,"US85_M113"		//recon bmp
		,"US85_M113_DTP"	//rep
		,"US85_M113_AMB"	//ambulance
		,"US85_M270"		//Rocket arty
		,"US85_LAV25"
		,"US85_M1A1"
		,"US85_M1IP"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"FIA_AZU_para"
		,"FIA_AZU_para"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_T21"
		,"FIA_AZU_T21"
		,"CSLA_FIA_CATOR"
		,"FIA_BTR40"
		,"FIA_BTR40_DSKM"
		,"FIA_BTR40_DSKM"
		,"FIA_OT64C_VB"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"US85_M1008"
		,"US85_M1008"
		,"US85_M1025_ua"
		,"US85_M1025_ua"
		,"US85_M1025_M60"
		,"US85_M1025_M60"
		,"US85_M1008_S250"
		,"US85_M1043_ua"
		,"US85_M1043_M2"
		,"US85_M1043_M2"
		,"US85_M1043_M60"
		,"US85_M1043_M60"
		,"US85_M998SFGT"
		,"US85_M998SFGT"
		,"US85_M1030"	//bike
		,"US85_M1030"
		,"US85_M923o"
		,"US85_M923a1om2"
		,"US85_M923a1om2"
		,"US85_M923c"
		,"US85_M923a1cm2"
		,"US85_M923a1cm2"
		,"US85_M923a"
		,"US85_M923f"
		,"US85_M923r"
		,"US85_M923a1_s280"
		,"US85_M163"	//AA truck
		,"US85_M163"	//AA truck
		,"US85_M113"
		,"US85_M113"
		,"US85_M113"		//recon bmp
		,"US85_M113_DTP"	//rep
		,"US85_M113_AMB"	//ambulance
		,"US85_M270"		//Rocket arty
		,"US85_LAV25"
		,"US85_LAV25"
		,"US85_M1A1"
		,"US85_M1A1"
		,"US85_M1IP"
		,"US85_M1IP"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"FIA_AZU_para"
		,"FIA_AZU_para"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_T21"
		,"FIA_AZU_T21"
		,"FIA_AZU_T21"
		,"CSLA_FIA_CATOR"
		,"FIA_BTR40"
		,"FIA_BTR40_DSKM"
		,"FIA_BTR40_DSKM"
		,"FIA_OT64C_VB"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"US85_M1008"
		,"US85_M1008"
		,"US85_M1025_ua"
		,"US85_M1025_ua"
		,"US85_M1025_M60"
		,"US85_M1025_M60"
		,"US85_M1008_S250"
		,"US85_M1043_ua"
		,"US85_M1043_M2"
		,"US85_M1043_M2"
		,"US85_M1043_M60"
		,"US85_M1043_M60"
		,"US85_M998SFGT"
		,"US85_M998SFGT"
		,"US85_M1030"	//bike
		,"US85_M1030"
		,"US85_M923o"
		,"US85_M923a1om2"
		,"US85_M923a1om2"
		,"US85_M923c"
		,"US85_M923a1cm2"
		,"US85_M923a1cm2"
		,"US85_M923a"
		,"US85_M923f"
		,"US85_M923r"
		,"US85_M923a1_s280"
		,"US85_M163"	//AA truck
		,"US85_M163"	//AA truck
		,"US85_M163"	//AA truck
		,"US85_M113"
		,"US85_M113"
		,"US85_M113"		//recon bmp
		,"US85_M113_DTP"	//rep
		,"US85_M113_AMB"	//ambulance
		,"US85_M270"		//Rocket arty
		,"US85_LAV25"
		,"US85_LAV25"
		,"US85_LAV25"
		,"US85_M1A1"
		,"US85_M1A1"
		,"US85_M1IP"
		,"US85_M1IP"
		,"US85_M1IP"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"FIA_AZU_para"
		,"FIA_AZU_para"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_DSKM"
		,"FIA_AZU_T21"
		,"FIA_AZU_T21"
		,"FIA_AZU_T21"
		,"CSLA_FIA_CATOR"
		,"FIA_BTR40"
		,"FIA_BTR40_DSKM"
		,"FIA_BTR40_DSKM"
		,"FIA_BTR40_DSKM"
		,"FIA_OT64C_VB"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"US85_mcCprs"
	,"US85_mcCprs"
	,"US85_mcCprs"
	,"US85_mcM47"
	,"US85_mcCG"
	,"US85_mcM249"
	,"US85_mcM249"
	,"US85_mcSMAW"
	,"US85_mcSMAW"
	,"US85_mcDrv"
	,"US85_mcM16"
	,"US85_mcM16"
	,"US85_mcM136"
	,"US85_mcM136"
	,"US85_mcFIM92"
	,"US85_mcFIM92"
	,"US85_mcM16GL"
	,"US85_mcM16GL"
	,"US85_mcM60"
	,"US85_mcM60"
	,"US85_mcM21"
	,"US85_mcM21"
	,"US85_mcSgt"
	,"US85_mcOfc"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"FIA_mrDrM"
	,"FIA_mrDrM_Sa26"
	,"FIA_mcLA"
	,"FIA_mcLA"
	,"FIA_mcUK59L"
	,"FIA_mcUK59L"
	,"FIA_mcFAL"
	,"FIA_mcM16"
	,"FIA_mcSa58"
	,"FIA_mcSa58v"
	,"FIA_mcSa61"
	,"FIA_mcSnp"
	,"FIA_mcSvc"
	,"FIA_mcSvc"
	,"FIA_mcRPG7"
	,"FIA_mcRPG7"
	,"FIA_mcRPG7"
	,"FIA_mc9K32"
	,"FIA_mc9K32"
	,"FIA_mcCmd"
	,"FIA_mcCmd"
	,"FIA_mcVG70"
	,"FIA_mcVG70"
	,"FIA_mcVG70"
	,"FIA_mcMdc"
	,"FIA_mcMdc"
	,"FIA_mcMdc"
	,"FIA_mcSa24"
	,"FIA_mcSa24"];
a3e_arr_recon_InfantryTypes = [
	"US85_sfDrv"
	,"US85_sfSpr"
	,"US85_sfGL"
	,"US85_sfAR"
	,"US85_sfMPV"
	,"US85_sfMdc"
	,"US85_sfBaseman"
	,"US85_sfLAW"
	,"US85_sfRTO"
	,"US85_sfSptG"
	,"US85_sfM21"];
a3e_arr_recon_I_InfantryTypes = [
	"FIA_cdRPG7"
	,"FIA_cdCmd"
	,"FIA_cdSpr"
	,"FIA_cdUK59L"
	,"FIA_cdMdc"
	,"FIA_cdFAL"
	,"FIA_cdSa26RPG75"
	,"FIA_cdOP63"];

a3e_units_civilian_InfantryTypes = [
	"CSLA_CIV_Citizen"
	,"CSLA_CIV_Citizen_V2"
	,"CSLA_CIV_Citizen_V3"
	,"CSLA_CIV_Citizen_V4"
	,"CSLA_CIV_Foreman"
	,"CSLA_CIV_Foreman_V2"
	,"CSLA_CIV_Woodlander"
	,"CSLA_CIV_Woodlander_V2"
	,"CSLA_CIV_Woodlander_V3"
	,"CSLA_CIV_Woodlander_V4"
	,"CSLA_CIV_Functionary"
	,"CSLA_CIV_Functionary_V2"
	,"CSLA_CIV_Villager"
	,"CSLA_CIV_Villager_V2"
	,"CSLA_CIV_Villager_V3"
	,"CSLA_CIV_Villager_V4"
	,"CSLA_CIV_Worker"
	,"CSLA_CIV_Worker_V2"
	,"CSLA_CIV_Worker_V3"
	,"CSLA_CIV_Worker_V4"
//	,"CSLA_CIV_Policeman"
//	,"CSLA_CIV_PoliceManSa61"
	,"CSLA_CIV_Doctor"];

//////////////////////////////////////////////////////////////////
// fn_RoadBlocks.sqf
// Array of templates to use for roadblocks
//////////////////////////////////////////////////////////////////
A3E_RoadblockTemplates = [
	"A3E_fnc_Roadblock"
	,"A3E_fnc_Roadblock2"
	,"A3E_fnc_Roadblock3"
	,"A3E_fnc_Roadblock4"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"US85_M1025_M60"
	,"US85_M1025_M60"
	,"US85_M1043_M2"
	,"US85_M1043_M2"
	,"US85_M1043_M60"
	,"US85_M1043_M60"
	,"US85_M113"
	,"US85_M113"
	,"US85_M163"
	,"US85_LAV25"
	,"US85_M2h"
	,"US85_TOW_Stat"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"FIA_AZU_DSKM"
	,"FIA_AZU_T21"
	,"FIA_BTR40_DSKM"
	,"FIA_OT64C_VB"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"US85_M1008"
	,"US85_M923o"
	,"US85_M923a1om2"
	,"US85_M923c"
	,"US85_M923a1cm2"
	,"US85_M113"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"FIA_AZU_para"
	,"FIA_AZU_para"
	,"FIA_BTR40"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"US85_M998SFGT"
	,"US85_M1025_M60"
	,"US85_M1043_M2"
	,"US85_M1043_M60"
	,"US85_M113"];

//////////////////////////////////////////////////////////////////
// fn_createMotorPools.sqf
// Array of templates to use for motor pool
//////////////////////////////////////////////////////////////////
A3E_MotorPoolTemplates = [
	"A3E_fnc_BuildMotorPool"
	];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

//////////////////////////////////////////////////////////////////
// fn_createComCenters.sqf
// Array of templates to use for com centers
//////////////////////////////////////////////////////////////////
A3E_ComCenterTemplates = [
	"a3e_fnc_BuildComCenter"
	,"a3e_fnc_BuildComCenter2"
	,"a3e_fnc_BuildComCenter3"
	,"a3e_fnc_BuildComCenter4"
	,"a3e_fnc_BuildComCenter5"
	];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"US85_M113"
	,"US85_M163"
	,"US85_LAV25"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"US85_M1A1"
	,"US85_M1IP"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"US85_M2h"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"US85_M1008"
	,"US85_M1025_ua"
	,"US85_M1043_M60"
	,"US85_M923o"
	,"US85_M923a1om2"
	,"US85_M923c"
	,"US85_M923a1cm2"
	,"US85_M923a"
	,"US85_M923f"
	,"US85_M923r"
	,"US85_M113"
	,"US85_M113_DTP"
	,"US85_M998SFGT"
	,"US85_M1030"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"CSLA_CIV_ADA1600"
	,"CSLA_CIV_ADA1600"
	,"CSLA_CIV_ADA1600"
	,"CSLA_CIV_ADA1600VB"
	,"CSLA_CIV_JARA250"
	,"CSLA_CIV_V3S"
	,"CSLA_CIV_V3Sr"
	,"US85_TT650"
	//,"CSLA_CIV_AZU"
	,"CSLA_CIV_Sarka1200"
	,"CSLA_CIV_Sarka1200"
	,"CSLA_CIV_Sarka1200"
	,"CSLA_CIV_Sarka1200PO"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"US85_M2h"
	,"US85_M2l"
	,"US85_TOW_Stat"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"US85_M1008"
	,"US85_M1025_ua"
	,"US85_M1043_M60"
	,"US85_M923o"
	,"US85_M923a1om2"
	,"US85_M923c"
	,"US85_M923a1cm2"
	,"US85_M923a"
	,"US85_M923f"
	,"US85_M923r"
	,"US85_M113"
	,"US85_M113_DTP"
	,"US85_M998SFGT"
	,"US85_M1030"
	,"US85_M163"
	,"US85_M270"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"US85_MH60FFAR"
	,"US85_AH1F"];
a3e_arr_O_transport_heli = [
	"US85_UH60"
	,"US85_UH60M240"];
a3e_arr_O_pilots = [
	"US85_plt"];
a3e_arr_I_transport_heli = [
	"CSLA_Mi17"];
a3e_arr_I_pilots = [
	"FIA_mrDrM"];


//////////////////////////////////////////////////////////////////
// fn_createAmmoDepots.sqf
// Array of templates to usefor ammo depots
//////////////////////////////////////////////////////////////////
A3E_AmmoDepotTemplates = [
	"A3E_fnc_AmmoDepot"
	,"A3E_fnc_AmmoDepot2"
	,"A3E_fnc_AmmoDepot3"
	,"A3E_fnc_AmmoDepot4"
	,"A3E_fnc_AmmoDepot5"
	];

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
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_1911", 70, 4, 8, ["US85_7Rnd_45ACP"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_M9", 20, 1, 3, ["US85_15Rnd_9x19"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_M16A2", 100, 4, 8, ["US85_30Rnd_556x45"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_MPVN", 30, 2, 4, ["US85_MPV_30Rnd_9Luger"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_M14", 30, 2, 4, ["US85_20Rnd_762M61"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_M16A2GL", 50, 2, 4, ["US85_30Rnd_556x45","US85_M406","US85_M583A1","1Rnd_Smoke_Grenade_shell"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_M16A2CAR", 25, 2, 4, ["US85_30Rnd_556x45"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["CSLA_Pi52", 30, 1, 3, ["CSLA_Pi52_8rnd_7_62Pi52"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CSLA_Sa24", 30, 1, 3, ["CSLA_Sa24_32rnd_7_62Pi52"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CSLA_Sa26", 30, 1, 3, ["CSLA_Sa24_32rnd_7_62Pi52"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_M16A2", 20, 1, 3, ["US85_30Rnd_556x45"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_FALf", 20, 1, 3, ["US85_20Rnd_762x51"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["US85_FAL", 30, 1, 3, ["US85_20Rnd_762x51"], 10];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["US85_MPVSD", 30, 1, 2, ["US85_MPV_30Rnd_9Luger"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["US85_M21", 40, 2, 4, ["US85_20Rnd_762x51"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["US85_M249", 50, 1, 2, ["US85_200Rnd_556x45"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["US85_M60", 50, 1, 2, ["US85_100Rnd_762x51"], 4];

// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CSLA_HuntingRifle", 20, 2, 4, ["CSLA_10Rnd_762hunt"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CSLA_rSa61t", 20, 2, 4, ["CSLA_Sa58_30rnd_7_62Sv43"], 6];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
//a3e_arr_AmmoDepotLaunchers pushback ["CSLA_RPG7", 50, 1, 3, ["CSLA_PG7M110V"], 2];
//a3e_arr_AmmoDepotLaunchers pushback ["CSLA_RPG75", 50, 1, 5, ["CSLA_RPG75_Mag"], 1];
//a3e_arr_AmmoDepotLaunchers pushback ["CSLA_9K32", 50, 1, 2, ["CSLA_9M32M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["US85_LAW72", 50, 1, 2, ["US85_LAW72_Mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["US85_M136", 30, 1, 2, ["US85_M136_Mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["US85_SMAW", 30, 1, 2, ["US85_SMAW_HEAA","US85_SMAW_HEDP"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["US85_MAAWS", 30, 1, 2, ["US85_MAAWS_HEAT","US85_MAAWS_HEDP"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["US85_M47", 30, 1, 2, ["US85_M47_Mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["US85_FIM92", 50, 1, 2, ["US85_FIM92_Mag"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CSLA_RPG7", 20, 1, 2, ["CSLA_PG7M110V"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["CSLA_9K32", 10, 1, 2, ["CSLA_9M32M"], 2];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CSLA_TNT0100g"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CSLA_PtMiBa3_mag"], 5];	//AT Mine
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CSLA_IVZ"], 5];	//IED
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CSLA_PPMiNa_mag"], 5];	//AP Mine
//a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CSLA_F1m_mag","CSLA_NO2","CSLA_RG4m_mag","CSLA_URG86m_mag"], 5];	//grenades on sticks

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CSLA_RG4u","CSLA_RG4o"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["US85_M67"], 20];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CSLA_dymZl", "CSLA_dymB", "CSLA_dymC", "CSLA_dymZ"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["US85_dymZl", "US85_dymC", "US85_dymZ", "US85_dymB"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CSLA_F1"], 5];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CSLA_26_5vz70"], 20]; //VG70 HE
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CSLA_26_5sigB1a", "CSLA_26_5sigCv1a", "CSLA_26_5sigZl1a"], 25];	//VG70 flares
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CSLA_26_5sigCrD", "CSLA_26_5sigOrD", "CSLA_26_5sigMD"], 25];	//VG70 smokes
a3e_arr_AmmoDepotVehicle pushback [objNull, 25, 1, 1, ["US85_M583A1"], 10]; //M203 Flare
a3e_arr_AmmoDepotVehicle pushback [objNull, 25, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell"], 15];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["US85_M406"], 20]; //M203 HE
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["US85_toolkit_B", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["US85_MediKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["US85_FAK", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["US85_bpAlice"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
//a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02_ghex_F", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
//	a3e_arr_AmmoDepotItems pushback ["CSLA_nokto", 30, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["US85_ANPVS5_Goggles", 10, 1, 3];
};
//a3e_arr_AmmoDepotItems pushback ["CSLA_bino", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["US85_bino", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
//a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["US85_watch", 10, 1, 10];	//watch
//a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
//a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["US85_M9tlm", 10, 1, 2]; //M9 suppressor
a3e_arr_AmmoDepotItems pushback ["US85_M16bntM7", 50, 1, 2]; //bayonet
a3e_arr_AmmoDepotItems pushback ["US85_M16bntM9", 50, 1, 2]; //bayonet
//a3e_arr_AmmoDepotItems pushback ["US85_scFAL", 20, 1, 2]; //FAL scope
//a3e_arr_AmmoDepotItems pushback ["US85_FALbpd", 50, 1, 2]; //FAL bipod
//a3e_arr_AmmoDepotItems pushback ["CSLA_PGO7", 40, 1, 3]; //RPG sight
//a3e_arr_AmmoDepotItems pushback ["CSLA_ZD4x8", 50, 1, 5]; //vz58 scope
//a3e_arr_AmmoDepotItems pushback ["CSLA_PSO1_OP63", 60, 1, 5]; //dragunov scope
//a3e_arr_AmmoDepotItems pushback ["CSLA_UK59_ZD4x8", 30, 1, 3]; //MG scope
a3e_arr_AmmoDepotItems pushback ["US85_sc4x20M249", 20, 1, 3]; //MG scope
a3e_arr_AmmoDepotItems pushback ["US85_sc2000M249", 20, 1, 3]; //MG scope
a3e_arr_AmmoDepotItems pushback ["US85_sc4x20_M16", 30, 1, 3]; //M16 scope
a3e_arr_AmmoDepotItems pushback ["US85_sc2000_M16", 20, 1, 3]; //M16 scope
a3e_arr_AmmoDepotItems pushback ["US85_scM21", 30, 1, 3]; //M21 scope
a3e_arr_AmmoDepotItems pushback ["US85_M21tlm", 30, 1, 3]; //M21 suppressor
a3e_arr_AmmoDepotItems pushback ["US85_M14bpd", 50, 1, 3]; //M14 bipod
a3e_arr_AmmoDepotItems pushback ["US85_M16tlm", 20, 1, 3]; //M16 suppressor
a3e_arr_AmmoDepotItems pushback ["US85_M16fl", 70, 1, 3]; //M16 flashlight
a3e_arr_AmmoDepotItems pushback ["FIA_Hairs_Brown", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["FIA_Hairs_Silver", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["US85_ANPVS4_FAL", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["CSLA_NSPU_OP63", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["CSLA_NSPU", 10, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["US85_ANPVS4_M16", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["US85_ANPVS4_M21", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["US85_ANPVS4_M60", 10, 1, 1];
};

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CSLA_Sa61", "CSLA_Sa61_20rnd_7_65Pi27", 4];
a3e_arr_CivilianCarWeapons pushback ["CSLA_Pi52", "CSLA_Pi52_8rnd_7_62Pi52", 4];
a3e_arr_CivilianCarWeapons pushback ["CSLA_Pi75lr", "CSLA_Pi75_15Rnd_9Luger", 4];
a3e_arr_CivilianCarWeapons pushback ["CSLA_Sa26", "CSLA_Sa24_32rnd_7_62Pi52", 6];
a3e_arr_CivilianCarWeapons pushback ["US85_M9", "US85_M9_15Rnd_9Luger", 4];
a3e_arr_CivilianCarWeapons pushback ["CSLA_Sa58Pn", "CSLA_Sa58_30rnd_7_62Cv43", 6];
a3e_arr_CivilianCarWeapons pushback ["CSLA_HuntingRifle", "CSLA_10Rnd_762hunt", 10];
a3e_arr_CivilianCarWeapons pushback ["US85_M16A2CAR", "US85_30Rnd_556x45", 8];
a3e_arr_CivilianCarWeapons pushback ["US85_M16A1", "US85_20Rnd_556x45", 8];
a3e_arr_CivilianCarWeapons pushback ["US85_FALf", "US85_20Rnd_762M61", 8];
a3e_arr_CivilianCarWeapons pushback ["CSLA_RPG75", "CSLA_RPG75_Mag", 1];
//a3e_arr_CivilianCarWeapons pushback ["US85_LAW72", "US85_LAW72_Mag", 1];
a3e_arr_CivilianCarWeapons pushback ["CSLA_rSa61t", "CSLA_Sa61_20rnd_7_65Pi27", 10];
//a3e_arr_CivilianCarWeapons pushback ["arifle_MXM_SOS_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 7];
//a3e_arr_CivilianCarWeapons pushback ["arifle_Katiba_C_F", "30Rnd_65x39_caseless_green", 5];
//a3e_arr_CivilianCarWeapons pushback ["arifle_Mk20_GL_ACO_F", "UGL_FlareWhite_F", 8];
//a3e_arr_CivilianCarWeapons pushback ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5];
//a3e_arr_CivilianCarWeapons pushback ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12];
//a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
//a3e_arr_CivilianCarWeapons pushback ["launch_RPG32_F", "RPG32_F", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["US85_bino", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "CSLA_TNT0100g", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CSLA_F1", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "CSLA_dymZ", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"US85_scFAL"
	,"US85_sc4x20_M16"
	,"US85_sc2000_M16"
	//,"US85_scM21"
	//,"US85_sc4x20M249"
	//,"US85_sc2000M249"
	,"CSLA_ZD4x8"
	,"CSLA_UK59_ZD4x8"];
//	"optic_Aco"
//	"optic_ACO_grn"
//	,"optic_Arco"
//	,"optic_Hamr"
//	,"optic_MRCO"
//	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"CSLA_PSO1_OP63"];
a3e_arr_NightScopes = [
	"CSLA_NSPU"
	,"CSLA_NSPU_OP63"
	,"US85_ANPVS4_FAL"
	,"US85_ANPVS4_M16"
//	,"US85_ANPVS4_M21"
//	,"US85_ANPVS4_M60"
	];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"CSLA_Sa58bpd"
	,"CSLA_Sa58bnt"
	,"US85_FALbpd"];

//////////////////////////////////////////////////////////////////
// revive/functions/revive/fn_Check_Revive_FAK.sqf and fn_HandleRevive
// additional types of FAKs or Medkits that should work for revives
// arrays have to be global, because check is performed on client
//////////////////////////////////////////////////////////////////
private _faks = [
	"FirstAidKit"
	,"CSLA_Ob80"
	,"US85_FAK"];
missionNamespace setvariable ["a3e_arr_faks",_faks,true];
_medkits = [
	"Medikit"
	,"US85_MediKit"
	,"CSLA_MediKit_Z80"];
missionNamespace setvariable ["a3e_arr_medkits",_medkits,true];

//////////////////////////////////////////////////////////////////
// fn_addIntel.sqf
// types of intel items you can find on enemies
//////////////////////////////////////////////////////////////////
A3E_IntelItems = [
	"Files"
	,"FileTopSecret"
	,"FilesSecret"
	//,"FlashDisk"
	,"DocumentsSecret"
	,"Wallet_ID"
	,"FileNetworkStructure"
	//,"MobilePhone"
	//,"SmartPhone"
	//,"CSLA_Documents_item"
	];

//////////////////////////////////////////////////////////////////
// SelectExtractionZone.sqf
// Which type of extractions are supported/preferred by this unitclasses version?
// Only if supported by terrain, so if corresponding markers are placed
// Basic fallback is always Heli extraction
// Available types: a3e_arr_extractiontypes = ["air","land","sea"];
//////////////////////////////////////////////////////////////////
a3e_arr_extractiontypes = [
	"air",
	"land"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"CSLA_Mi17"
	,"CSLA_Mi17mg"
	,"CSLA_Mi17pylons"];
a3e_arr_extraction_chopper_escort = [
	"CSLA_Mi24V"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"CSLA_lodka"];
a3e_arr_extraction_boat_escort = [
	"CSLA_lodka"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Cars/APCs that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"CSLA_AZU_para"	//7
	,"CSLA_V3SLizard"	//6
	,"CSLA_F813o"	//24
	,"CSLA_F813"	//24
	,"CSLA_OT64C"	//11
	,"CSLA_OT64C_VB"	//11
	,"CSLA_BVP1"];	//9
a3e_arr_extraction_car_escort = [
	"CSLA_BVP1",
	"CSLA_BPzV",
	"CSLA_T72",
	"CSLA_T72M",
	"CSLA_T72M1"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"CSLA_CIV_An2_1"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"US85_UH60"];
a3e_arr_searchChopperHard = [
	"US85_UH60M240"
	,"US85_MH60M134"];
a3e_arr_searchChopper_pilot = [
	"US85_plt"];
a3e_arr_searchChopper_crew = [
	"US85_plt"];

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
	"US85_zodiac"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "US85_ammobox_firearms";
a3e_additional_weapon_box_2 = "US85_ammobox_launchers";

//////////////////////////////////////////////////////////////////
// fn_createMortarSites.sqf
// Array of templates to usefor mortar sites
//////////////////////////////////////////////////////////////////
A3E_MortarSiteTemplates = [
	"A3E_fnc_MortarSite"
	];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"US85_M252_Stat"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"I_Plane_Fighter_03_Cluster_F"];

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
	"CSLA_Mi17_wreck"];
a3e_arr_CrashSiteCrew = [
	"CSLA_pltMi8"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_T72_hull_F"
	,"Land_V3S_wreck_F"
	,"Land_Wreck_UAZ_F"
	,"Land_Wreck_BMP2_F"
	,"Land_Wreck_BRDM2_F"];
a3e_arr_CrashSiteCrewCar = [
	"CSLA_drM"
	,"CSLA_crw"
	,"CSLA_engCrw"
	,"CSLA_svc"
	,"CSLA_tnkCmd"
	,"CSLA_tnkEnl"
	,"CSLA_tnkDrM"
	,"CSLA_tnkOfc"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["CSLA_RPG75", 15, 1, 2, ["CSLA_RPG75_Mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["CSLA_RPG7", 15, 1, 2, ["CSLA_PG7M110V"], 2];
a3e_arr_CrashSiteWeapons pushback ["CSLA_9K32", 20, 1, 2, ["CSLA_9M32M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CSLA_HuntingRifle", 20, 1, 2, ["CSLA_10Rnd_762hunt"], 12];
a3e_arr_CrashSiteWeapons pushback ["CSLA_OP63", 20, 1, 2, ["CSLA_OP63_10rnd_7_62Odst59"], 10];
a3e_arr_CrashSiteWeapons pushback ["CSLA_Sa26", 25, 1, 2, ["CSLA_Sa24_32rnd_7_62Pi52"], 8];
a3e_arr_CrashSiteWeapons pushback ["CSLA_Sa58P", 75, 2, 4, ["CSLA_Sa58_30rnd_7_62vz43"], 5];
a3e_arr_CrashSiteWeapons pushback ["CSLA_VG70", 50, 2, 4, ["CSLA_Sa58_30rnd_7_62vz43", "CSLA_26_5vz70", "CSLA_26_5sigB1a", "CSLA_26_5sigCrD"], 8];
a3e_arr_CrashSiteWeapons pushback ["CSLA_Sa58Ppb", 30, 1, 2, ["CSLA_Sa58_30rnd_7_62Sv43"], 4];
a3e_arr_CrashSiteWeapons pushback ["CSLA_rSa61", 30, 1, 2, ["CSLA_Sa58_30rnd_7_62Sv43"], 8];
a3e_arr_CrashSiteWeapons pushback ["CSLA_rSa61t", 30, 1, 2, ["CSLA_Sa61_20rnd_7_65Pi27"], 8];
a3e_arr_CrashSiteWeapons pushback ["CSLA_UK59L", 25, 1, 2, ["CSLA_UK59_50rnd_7_62vz59"], 4];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["CSLA_bino", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["US85_M16fl", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_ZD4x8", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_PSO1_OP63", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_UK59_ZD4x8", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_Sa61tlm", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_Sa58bpd", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_Sa58bnt", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_PGO7", 20, 1, 3];
if(A3E_Param_NoNightvision==0) then {
a3e_arr_CrashSiteItems pushback ["CSLA_NSPU_OP63", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CSLA_NSPU", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["US85_ANPVS4_FAL", 20, 1, 3];
};