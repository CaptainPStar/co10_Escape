// SOGPF
// PAVN vs MACV and ARVN


/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;	//player side SOGPF PAVN NVA
A3E_VAR_Side_Opfor = west; //SOGPF ANZAC
A3E_VAR_Side_Ind = resistance; //SOGPF ARVN

A3E_VAR_Flag_Opfor = "\vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa";
A3E_VAR_Flag_Ind = "\vn\objects_f_vietnam\flags\data\vn_flag_01_arvn_co.paa";

// \vn\objects_f_vietnam\flags\data\vn_flag_01_usarmy_co.paa

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"vn_i_men_army_15"	//Rifleman 1
	,"vn_i_men_army_16"	//Rifleman 2
	,"vn_i_men_army_18"	//Rifleman 3
	,"vn_i_men_army_19"	//Rifleman 4
	,"vn_i_men_army_20"	//Rifleman 5
	,"vn_i_men_army_21"	//Rifleman 6
	,"vn_i_men_army_08"	//Scout
	,"vn_i_men_army_09"];	//Scout

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"vn_o_pack_01"
	,"vn_o_pack_02"
	,"vn_o_pack_06"
	,"vn_c_pack_01"
	,"vn_b_pack_01"
	,"vn_b_pack_01_02"
	,"vn_b_pack_trp_02_02"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["vn_p38s","vn_m10_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_hd","vn_hd_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_hp","vn_hp_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_izh54_p","vn_izh54_so_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_izh54_p","vn_izh54_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1895","vn_m1895_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1895_sd","vn_m1895_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1911", "vn_m1911_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m1911_sd", "vn_m1911_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_mx991_m1911", "vn_m1911_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m712","vn_m712_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m79_p","vn_40mm_m576_buck_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_mk22","vn_mk22_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_mk22_sd","vn_mk22_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m10","vn_m10_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_m10_sd","vn_m10_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_pm","vn_pm_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_pm_sd","vn_pm_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_fkb1_pm","vn_pm_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_tt33","vn_tt33_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_welrod","vn_welrod_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["vn_vz61_p","vn_vz61_mag"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"vn_c_bicycle_01"
	,"vn_c_bicycle_02"
	,"vn_c_wheeled_m151_02"
	,"vn_c_wheeled_m151_01"
	,"vn_c_car_01_01"
	,"vn_c_car_02_01"
	,"vn_c_car_03_01"
	,"vn_c_car_04_01"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"vn_b_wheeled_m151_01"
		,"vn_b_wheeled_m151_02"	//covered
		,"vn_b_wheeled_m151_01_mp"
		,"vn_b_wheeled_m151_02_mp"
		,"vn_b_wheeled_m151_mg_02"
		,"vn_b_wheeled_m151_mg_03"	//patrol
		,"vn_b_wheeled_m151_mg_04"	//armored
		,"vn_b_wheeled_m151_mg_02_mp"
		,"vn_b_wheeled_m151_mg_03_mp"	//patrol
		,"vn_b_wheeled_m151_mg_04_mp"	//armored
		,"vn_b_wheeled_m151_mg_05"	//TOW
		,"vn_b_wheeled_m151_mg_05"
		,"vn_b_wheeled_m151_mg_06"	//M40
		,"vn_b_wheeled_m54_03"
		,"vn_b_wheeled_m54_repair"
		,"vn_b_wheeled_m54_fuel"
		,"vn_b_wheeled_m54_ammo"
		,"vn_b_wheeled_m54_01"
		,"vn_b_wheeled_m54_02"
		,"vn_b_wheeled_m54_01_sog"
		,"vn_b_wheeled_m54_02_sog"
		,"vn_b_wheeled_m54_mg_01"	//3xM2
		,"vn_b_wheeled_m54_mg_03"	//minigun
		,"vn_b_wheeled_m54_mg_02"	//aa
		,"vn_b_armor_m113_01"
		,"vn_b_armor_m113_01"
		,"vn_b_armor_m113_acav_01"	//M2
		,"vn_b_armor_m113_acav_06"	//M2/M40
		,"vn_b_armor_m41_01_01"
		,"vn_b_armor_m41_01_01"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"vn_i_wheeled_m151_01"
		,"vn_i_wheeled_m151_02"
		,"vn_i_wheeled_m151_01_mp"
		,"vn_i_wheeled_m151_02_mp"
		,"vn_i_wheeled_m151_mg_01"
		,"vn_i_wheeled_m151_mg_01_mp"
		,"vn_i_wheeled_m151_mg_06"	//M40
		,"vn_i_armor_m113_01"
		,"vn_i_armor_m113_acav_02"	//M1919
		,"vn_i_wheeled_m54_01"
		,"vn_i_wheeled_m54_02"
		,"vn_i_wheeled_m54_03"
		,"vn_i_wheeled_m54_repair"
		,"vn_i_wheeled_m54_fuel"
		,"vn_i_wheeled_m54_ammo"
		,"vn_i_armor_type63_01"
		,"vn_i_armor_m41_01"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"vn_b_wheeled_m151_01"
		,"vn_b_wheeled_m151_02"
		,"vn_b_wheeled_m151_01_mp"
		,"vn_b_wheeled_m151_02_mp"
		,"vn_b_wheeled_m151_mg_02"
		,"vn_b_wheeled_m151_mg_02"
		,"vn_b_wheeled_m151_mg_03"
		,"vn_b_wheeled_m151_mg_03"
		,"vn_b_wheeled_m151_mg_04"
		,"vn_b_wheeled_m151_mg_04"
		,"vn_b_wheeled_m151_mg_02_mp"
		,"vn_b_wheeled_m151_mg_03_mp"
		,"vn_b_wheeled_m151_mg_04_mp"
		,"vn_b_wheeled_m151_mg_05"
		,"vn_b_wheeled_m151_mg_05"
		,"vn_b_wheeled_m151_mg_06"	//M40
		,"vn_b_wheeled_m151_mg_06"	//M40
		,"vn_b_wheeled_m54_03"
		,"vn_b_wheeled_m54_repair"
		,"vn_b_wheeled_m54_fuel"
		,"vn_b_wheeled_m54_ammo"
		,"vn_b_wheeled_m54_01"
		,"vn_b_wheeled_m54_02"
		,"vn_b_wheeled_m54_01_sog"
		,"vn_b_wheeled_m54_02_sog"
		,"vn_b_wheeled_m54_mg_01"
		,"vn_b_wheeled_m54_mg_01"
		,"vn_b_wheeled_m54_mg_03"
		,"vn_b_wheeled_m54_mg_03"
		,"vn_b_wheeled_m54_mg_02"
		,"vn_b_wheeled_m54_mg_02"
		,"vn_b_armor_m113_01"
		,"vn_b_armor_m113_01"
		,"vn_b_armor_m113_acav_01"	//M2
		,"vn_b_armor_m113_acav_06"	//M2/M40
		,"vn_b_armor_m113_acav_03"	//M60
		,"vn_b_armor_m113_acav_05"	//Mk19
		,"vn_b_armor_m41_01_01"
		,"vn_b_armor_m41_01_01"
		,"vn_b_armor_m41_01_01"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"vn_i_wheeled_m151_01"
		,"vn_i_wheeled_m151_02"
		,"vn_i_wheeled_m151_01_mp"
		,"vn_i_wheeled_m151_02_mp"
		,"vn_i_wheeled_m151_mg_01"
		,"vn_i_wheeled_m151_mg_01"
		,"vn_i_wheeled_m151_mg_01_mp"
		,"vn_i_wheeled_m151_mg_06"	//M40
		,"vn_i_armor_m113_01"
		,"vn_i_armor_m113_acav_02"	//M1919
		,"vn_i_armor_m113_acav_03"	//M60
		,"vn_i_wheeled_m54_01"
		,"vn_i_wheeled_m54_02"
		,"vn_i_wheeled_m54_03"
		,"vn_i_wheeled_m54_repair"
		,"vn_i_wheeled_m54_fuel"
		,"vn_i_wheeled_m54_ammo"
		,"vn_i_armor_type63_01"
		,"vn_i_armor_type63_01"
		,"vn_i_armor_m41_01"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"vn_b_wheeled_m151_01"
		,"vn_b_wheeled_m151_02"
		,"vn_b_wheeled_m151_01_mp"
		,"vn_b_wheeled_m151_02_mp"
		,"vn_b_wheeled_m151_mg_02"
		,"vn_b_wheeled_m151_mg_02"
		,"vn_b_wheeled_m151_mg_03"
		,"vn_b_wheeled_m151_mg_03"
		,"vn_b_wheeled_m151_mg_04"
		,"vn_b_wheeled_m151_mg_04"
		,"vn_b_wheeled_m151_mg_02_mp"
		,"vn_b_wheeled_m151_mg_03_mp"
		,"vn_b_wheeled_m151_mg_04_mp"
		,"vn_b_wheeled_m151_mg_05"
		,"vn_b_wheeled_m151_mg_05"
		,"vn_b_wheeled_m151_mg_06"	//M40
		,"vn_b_wheeled_m151_mg_06"	//M40
		,"vn_b_wheeled_m54_03"
		,"vn_b_wheeled_m54_repair"
		,"vn_b_wheeled_m54_fuel"
		,"vn_b_wheeled_m54_ammo"
		,"vn_b_wheeled_m54_01"
		,"vn_b_wheeled_m54_02"
		,"vn_b_wheeled_m54_01_sog"
		,"vn_b_wheeled_m54_02_sog"
		,"vn_b_wheeled_m54_mg_01"
		,"vn_b_wheeled_m54_mg_01"
		,"vn_b_wheeled_m54_mg_03"
		,"vn_b_wheeled_m54_mg_03"
		,"vn_b_wheeled_m54_mg_02"
		,"vn_b_wheeled_m54_mg_02"
		,"vn_b_wheeled_m54_mg_02"
		,"vn_b_armor_m113_01"
		,"vn_b_armor_m113_01"
		,"vn_b_armor_m113_acav_01"	//M2
		,"vn_b_armor_m113_acav_06"	//M2/M40
		,"vn_b_armor_m113_acav_03"	//M60
		,"vn_b_armor_m113_acav_05"	//Mk19
		,"vn_i_armor_m113_acav_04"	//M134
		,"vn_b_armor_m41_01_01"
		,"vn_b_armor_m41_01_01"
		,"vn_b_armor_m41_01_01"
		,"vn_b_armor_m41_01_01"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"vn_i_wheeled_m151_01"
		,"vn_i_wheeled_m151_02"
		,"vn_i_wheeled_m151_01_mp"
		,"vn_i_wheeled_m151_02_mp"
		,"vn_i_wheeled_m151_mg_01"
		,"vn_i_wheeled_m151_mg_01"
		,"vn_i_wheeled_m151_mg_01_mp"
		,"vn_i_wheeled_m151_mg_06"	//M40
		,"vn_i_armor_m113_01"
		,"vn_i_armor_m113_acav_02"	//M1919
		,"vn_i_armor_m113_acav_03"	//M60
		,"vn_i_wheeled_m54_01"
		,"vn_i_wheeled_m54_02"
		,"vn_i_wheeled_m54_03"
		,"vn_i_wheeled_m54_repair"
		,"vn_i_wheeled_m54_fuel"
		,"vn_i_wheeled_m54_ammo"
		,"vn_i_armor_type63_01"
		,"vn_i_armor_type63_01"
		,"vn_i_armor_m41_01"
		,"vn_i_armor_m41_01"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"vn_b_men_army_04"	//Engineer
	,"vn_b_men_army_04"	//Engineer
	,"vn_b_men_army_04"	//Engineer
	,"vn_b_men_army_03"	//Medic
	,"vn_b_men_army_03"	//Medic
	,"vn_b_men_army_03"	//Medic
	,"vn_b_men_army_09"	//Scout
	,"vn_b_men_army_09"	//Scout
	,"vn_b_men_army_10"	//Marksman
	,"vn_b_men_army_10"	//Marksman
	,"vn_b_men_army_10"	//Marksman
	,"vn_b_men_army_11"	//Sniper
	,"vn_b_men_army_11"	//Sniper
	,"vn_b_men_army_05"	//Demolitions
	,"vn_b_men_army_05"	//Demolitions
	,"vn_b_men_army_15"	//Rifleman 1
	,"vn_b_men_army_16"	//Rifleman 2
	,"vn_b_men_army_18"	//Rifleman 3
	,"vn_b_men_army_19"	//Rifleman 4
	,"vn_b_men_army_20"	//Rifleman 5
	,"vn_b_men_army_21"	//Rifleman 6
	,"vn_b_men_army_07"	//Grenadier
	,"vn_b_men_army_07"	//Grenadier
	,"vn_b_men_army_17"	//Grenadier 2
	,"vn_b_men_army_17"	//Grenadier 2
	,"vn_b_men_army_12"	//AT
	,"vn_b_men_army_12"	//AT
	,"vn_b_men_army_06"	//Machinegunner
	,"vn_b_men_army_06"	//Machinegunner
	,"vn_b_men_army_27"	//Machinegunner 2
	,"vn_b_men_army_26"	//Tunnel Rat
	,"vn_b_men_army_26"	//Tunnel Rat
	,"vn_b_men_army_08"	//RTO
	,"vn_b_men_army_02"	//Squad Leader
	,"vn_b_men_army_02"];	//Squad Leader
a3e_arr_Escape_InfantryTypes_Ind = [
	"vn_i_men_ranger_12"		//AT
	,"vn_i_men_ranger_05"	//Demolitions
	,"vn_i_men_ranger_04"	//Engineer
	,"vn_i_men_ranger_07"	//Grenadier
	,"vn_i_men_ranger_17"	//Grenadier 2
	,"vn_i_men_ranger_06"	//Machinegunner
	,"vn_i_men_ranger_11"	//Machinegunner 2
	,"vn_i_men_ranger_10"	//Marksman
	,"vn_i_men_ranger_03"	//Medic
	,"vn_i_men_ranger_01"	//Officer
	,"vn_i_men_ranger_15"	//Rifleman 1
	,"vn_i_men_ranger_16"	//Rifleman 2
	,"vn_i_men_ranger_18"	//Rifleman 3
	,"vn_i_men_ranger_19"	//Rifleman 4
	,"vn_i_men_ranger_20"	//Rifleman 5
	,"vn_i_men_ranger_21"	//Rifleman 6
	,"vn_i_men_ranger_08"	//RTO
	,"vn_i_men_ranger_09"	//Scout
	,"vn_i_men_ranger_02"];	//Squad Leader
a3e_arr_recon_InfantryTypes = [
	"vn_b_men_sog_04"		//Squad Leader
	,"vn_b_men_sog_09"	//Scout
	,"vn_b_men_sog_19"	//Scout 2
	,"vn_b_men_sog_08"	//Demolitions
	,"vn_b_men_sog_06"	//Machinegunner
	,"vn_b_men_sog_16"	//Machinegunner 2
	,"vn_b_men_sog_18"	//Machinegunner 3
	,"vn_b_men_sog_12"	//Marksman
	,"vn_b_men_sog_21"	//Marksman 2
	,"vn_b_men_sog_10"	//Medic
	,"vn_b_men_sog_20"	//Medic 2
	,"vn_b_men_sog_05"	//RTO
	,"vn_b_men_sog_17"	//RTO 2
	,"vn_b_men_sog_07"	//Grenadier
	,"vn_b_men_sog_11"];	//Grenadier 2
a3e_arr_recon_I_InfantryTypes = [
	"vn_i_men_sf_12"	//AT
	,"vn_i_men_sf_05"	//Demolitions
	,"vn_i_men_sf_04"	//Engineer
	,"vn_i_men_sf_07"	//Grenadier
	,"vn_i_men_sf_06"	//Machinegunner
	,"vn_i_men_sf_11"	//Machinegunner 2
	,"vn_i_men_sf_10"	//Marksman
	,"vn_i_men_sf_03"	//Medic
	,"vn_i_men_sf_01"	//Officer
	,"vn_i_men_sf_08"	//RTO
	,"vn_i_men_sf_09"	//Scout
	,"vn_i_men_sf_02"];	//Squad Leader

a3e_units_civilian_InfantryTypes = [
	"vn_c_men_13"		//Men
	,"vn_c_men_14"
	,"vn_c_men_15"
	,"vn_c_men_16"
	,"vn_c_men_17"
	,"vn_c_men_18"
	,"vn_c_men_19"
	,"vn_c_men_20"
	,"vn_c_men_21"
	,"vn_c_men_22"
	,"vn_c_men_23"
	,"vn_c_men_24"
	,"vn_c_men_25"
	,"vn_c_men_26"
	,"vn_c_men_27"
	,"vn_c_men_28"
	,"vn_c_men_29"
	,"vn_c_men_30"
	,"vn_c_men_31"
	,"vn_c_men_32"
	,"vn_c_men_01"	//Elders
	,"vn_c_men_02"
	,"vn_c_men_03"
	,"vn_c_men_04"
	,"vn_c_men_05"	//Doctors
	,"vn_c_men_06"
	,"vn_c_men_07"
	,"vn_c_men_08"
	,"vn_c_men_09"	//Engineers
	,"vn_c_men_10"
	,"vn_c_men_11"
	,"vn_c_men_12"];

//////////////////////////////////////////////////////////////////
// fn_RoadBlocks.sqf
// Array of templates to use for roadblocks
//////////////////////////////////////////////////////////////////
A3E_RoadblockTemplates = [
	"A3E_fnc_Roadblock_vn1"
	,"A3E_fnc_Roadblock_vn2"
	,"A3E_fnc_Roadblock2"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"vn_b_wheeled_m151_mg_02"
	,"vn_b_wheeled_m151_mg_03"
	,"vn_b_wheeled_m151_mg_04"
	,"vn_b_wheeled_m54_mg_01"
	,"vn_b_wheeled_m54_mg_03"
	,"vn_b_wheeled_m54_mg_02"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"vn_i_wheeled_m151_mg_01"
	,"vn_i_wheeled_m151_mg_01_mp"
	,"vn_i_wheeled_m151_mg_06"
	,"vn_i_armor_m113_01"
	,"vn_i_armor_m113_acav_03"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"vn_b_wheeled_m151_mg_04"
	,"vn_b_wheeled_m54_01_sog"
	,"vn_b_wheeled_m54_02_sog"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"vn_i_wheeled_m151_02"
	,"vn_i_wheeled_m54_01"
	,"vn_i_wheeled_m54_02"];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"vn_b_wheeled_m151_mg_03"
	,"vn_b_wheeled_m151_mg_04"
	,"vn_b_wheeled_m54_mg_01"
	,"vn_b_wheeled_m54_mg_03"
	,"vn_b_armor_m113_01"];

//////////////////////////////////////////////////////////////////
// fn_createMotorPools.sqf
// Array of templates to use for motor pool
//////////////////////////////////////////////////////////////////
A3E_MotorPoolTemplates = [
	"A3E_fnc_BuildMotorPool_VN"
	];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

//////////////////////////////////////////////////////////////////
// fn_createComCenters.sqf
// Array of templates to use for com centers
//////////////////////////////////////////////////////////////////
A3E_ComCenterTemplates = [
	"a3e_fnc_BuildComCenter3"
	,"a3e_fnc_BuildComCenter_VN_US1"
	,"a3e_fnc_BuildComCenter_VN_US2"
	];

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"vn_b_wheeled_m54_mg_01"
	,"vn_b_wheeled_m54_mg_03"
	,"vn_b_wheeled_m54_mg_02"
	,"vn_b_armor_m113_acav_01"
	,"vn_b_armor_m113_acav_04"
	,"vn_b_armor_m113_acav_05"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"vn_b_armor_m41_01_01"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"vn_b_army_static_m1919a4_high"
	,"vn_b_army_static_m2_high"
	,"vn_b_army_static_m60_high"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"vn_b_wheeled_m151_01"
	,"vn_b_wheeled_m151_02"
	,"vn_b_wheeled_m151_mg_02"
	,"vn_b_wheeled_m151_mg_03"
	,"vn_b_wheeled_m151_mg_04"
	,"vn_b_wheeled_m54_03"
	,"vn_b_wheeled_m54_repair"
	,"vn_b_wheeled_m54_fuel"
	,"vn_b_wheeled_m54_ammo"
	,"vn_b_wheeled_m54_mg_01"
	,"vn_b_wheeled_m54_mg_03"
	,"vn_b_wheeled_m54_mg_02"
	,"vn_b_wheeled_m54_01"
	,"vn_b_wheeled_m54_02"
	,"vn_b_wheeled_m54_01_sog"
	,"vn_b_wheeled_m54_02_sog"
	,"vn_b_armor_m113_01"
	,"vn_b_armor_m113_acav_06"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"vn_c_bicycle_01"
	,"vn_c_wheeled_m151_02"
	,"vn_c_wheeled_m151_01"
	,"vn_c_car_01_01"
	,"vn_c_car_02_01"
	,"vn_c_car_03_01"
	,"vn_c_car_04_01"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"vn_b_army_static_tow"
	,"vn_b_army_static_m40a1rr"
	,"vn_b_army_static_m1919a4_high"
	,"vn_b_army_static_m1919a4_low"
	,"vn_b_army_static_m1919a6"
	,"vn_b_army_static_m2_high"
	,"vn_b_army_static_m2_low"
	,"vn_b_army_static_m60_high"
	,"vn_b_army_static_m60_low"
	,"vn_b_army_static_mk18"
	,"vn_b_army_static_m45"
	,"vn_b_army_static_m45"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"vn_b_wheeled_m151_01"
	,"vn_b_wheeled_m151_02"
	,"vn_b_wheeled_m151_mg_02"
	,"vn_b_wheeled_m151_mg_03"
	,"vn_b_wheeled_m151_mg_04"
	,"vn_b_wheeled_m151_mg_05"
	,"vn_b_wheeled_m151_mg_06"
	,"vn_b_wheeled_m54_03"
	,"vn_b_wheeled_m54_repair"
	,"vn_b_wheeled_m54_fuel"
	,"vn_b_wheeled_m54_ammo"
	,"vn_b_wheeled_m54_mg_01"
	,"vn_b_wheeled_m54_mg_03"
	,"vn_b_wheeled_m54_mg_02"
	,"vn_b_wheeled_m54_01"
	,"vn_b_wheeled_m54_02"
	,"vn_b_wheeled_m54_01_sog"
	,"vn_b_wheeled_m54_02_sog"
	,"vn_b_armor_m113_acav_06"
	,"vn_b_armor_m113_acav_03"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"vn_b_air_ah1g_02"
	,"vn_b_air_ah1g_03"
	,"vn_b_air_ah1g_04"
	,"vn_b_air_ah1g_05"
	,"vn_b_air_ah1g_01"
	,"vn_b_air_ah1g_07"
	,"vn_b_air_ah1g_08"
	,"vn_b_air_ah1g_09"
	,"vn_b_air_ah1g_10"
	,"vn_b_air_ah1g_06"
	,"vn_b_air_oh6a_06"
	,"vn_b_air_oh6a_05"
	,"vn_b_air_oh6a_04"
	,"vn_b_air_oh6a_07"
	,"vn_b_air_uh1c_04_01"
	,"vn_b_air_uh1c_02_01"
	,"vn_b_air_uh1c_05_01"
	,"vn_b_air_uh1e_01_04"
	,"vn_b_air_uh1e_02_04"
	,"vn_b_air_ch34_04_02"
	,"vn_b_air_ch34_04_04"
	,"vn_b_air_ch34_04_01"];
a3e_arr_O_transport_heli = [
	"vn_b_air_uh1c_07_01"
	,"vn_b_air_uh1c_07_02"
	,"vn_b_air_uh1d_02_01"
	,"vn_b_air_uh1d_02_02"
	,"vn_b_air_oh6a_01"
	,"vn_b_air_ch34_03_01"
	,"vn_b_air_ch34_01_01"];
a3e_arr_O_pilots = [
	"vn_b_men_aircrew_05"];
a3e_arr_I_transport_heli = [
	"vn_i_air_ch34_02_01"
	,"vn_i_air_ch34_01_02"
	,"vn_i_air_ch34_02_02"
	,"vn_i_air_uh1d_01_01"
	,"vn_i_air_uh1d_02_01"];
a3e_arr_I_pilots = [
	"vn_i_men_aircrew_01"
	,"vn_i_men_aircrew_02"];

//////////////////////////////////////////////////////////////////
// fn_createAmmoDepots.sqf
// Array of templates to usefor ammo depots
//////////////////////////////////////////////////////////////////
A3E_AmmoDepotTemplates = [
	"A3E_fnc_AmmoDepot_VN_US1"
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
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_p38s", 50, 4, 8, ["vn_m10_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m1911", 50, 4, 8, ["vn_m1911_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m3a1", 50, 4, 8, ["vn_m3a1_t_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m16", 100, 2, 4, ["vn_m16_20_t_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m14", 100, 2, 4, ["vn_m14_mag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m60", 30, 2, 4, ["vn_m60_100_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m60_shorty", 10, 2, 4, ["vn_m60_100_mag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m1carbine", 50, 2, 4, ["vn_carbine_15_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m1carbine_gl", 50, 2, 4, ["vn_carbine_15_t_mag", "vn_22mm_m1a2_frag_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m79_p", 50, 2, 4, ["vn_40mm_m381_he_mag", "vn_40mm_m576_buck_mag"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m45", 30, 1, 3, ["vn_m45_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m1a1_tommy", 30, 1, 3, ["vn_m1a1_30_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["vn_m1_garand", 50, 2, 4, ["vn_m1_garand_mag"], 12];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m16_camo", 50, 2, 4, ["vn_m16_20_t_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_mk22", 50, 2, 4, ["vn_mk22_mag"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_welrod", 50, 2, 4, ["vn_welrod_mag"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_mx991_m1911", 50, 2, 4, ["vn_m1911_mag"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_mpu", 25, 1, 2, ["vn_mpu_t_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m10", 25, 1, 2, ["vn_m10_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m2carbine", 40, 2, 4, ["vn_carbine_30_mag", "vn_carbine_30_t_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m2carbine_gl", 30, 2, 4, ["vn_carbine_30_mag", "vn_22mm_m1a2_frag_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m1carbine_sniper", 20, 2, 4, ["vn_carbine_15_mag"], 10];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m3carbine", 10, 2, 4, ["vn_carbine_30_mag"], 5];
};
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m40a1", 20, 2, 4, ["vn_m40a1_t_mag"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m14_camo", 20, 2, 4, ["vn_m14_10_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m14a1", 20, 2, 4, ["vn_m14_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m21_sd", 20, 2, 4, ["vn_m14_10_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m40a1_sniper", 20, 2, 4, ["vn_m40a1_mag"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_xm177", 10, 2, 4, ["vn_m16_20_t_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m60_shorty_camo", 10, 2, 4, ["vn_m60_100_mag"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m1897", 50, 2, 4, ["vn_m1897_fl_mag","vn_m1897_buck_mag"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m16_xm148", 10, 2, 4, ["vn_m16_20_mag", "vn_40mm_m381_he_mag","vn_40mm_m583_flare_w_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m79", 40, 2, 4, ["vn_40mm_m381_he_mag", "vn_40mm_m576_buck_mag","vn_40mm_m661_flare_g_mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m63a", 30, 2, 4, ["vn_m63a_30_mag", "vn_m63a_30_t_mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m63a_lmg", 20, 1, 2, ["vn_m63a_100_mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m63a_cdo", 20, 1, 2, ["vn_m63a_150_t_mag"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_mc10", 10, 2, 4, ["vn_mc10_mag", "vn_mc10_t_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_sten_sd", 10, 2, 4, ["vn_sten_mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_mk1_udg", 10, 2, 4, ["vn_mk1_udg_mag"], 10];
// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m45_camo", 40, 2, 4, ["vn_m45_mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["vn_m1918", 25, 1, 2, ["vn_m1918_mag"], 10];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["vn_m72", 50, 3, 5, ["vn_m72_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["vn_m127", 70, 1, 2, ["vn_m127_mag", "vn_m128_mag", "vn_m129_mag"], 3];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["vn_rpg2", 10, 1, 2, ["vn_rpg2_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["vn_rpg7", 5, 1, 2, ["vn_rpg7_mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["vn_sa7", 15, 1, 2, ["vn_sa7_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["vn_sa7b", 10, 1, 2, ["vn_sa7b_mag"], 1];

// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["vn_mine_m112_remote_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 15, 1, 1, ["vn_mine_m14_mag","vn_mine_m15_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 15, 1, 1, ["vn_mine_m18_mag","vn_mine_m18_range_mag","vn_mine_m18_x3_range_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 15, 1, 1, ["vn_mine_m16_mag","vn_mine_tripwire_m16_02_mag","vn_mine_tripwire_m16_04_mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_m61_grenade_mag", "vn_m67_grenade_mag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["vn_22mm_m1a2_frag_mag","vn_22mm_m17_frag_mag","vn_22mm_m9_heat_mag"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_m18_yellow_mag", "vn_m18_purple_mag", "vn_m18_red_mag", "vn_m18_white_mag", "vn_m18_green_mag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["vn_m14_grenade_mag","vn_m14_early_grenade_mag"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["vn_m34_grenade_mag"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_40mm_m381_he_mag","vn_40mm_m583_flare_w_mag","vn_40mm_m680_smoke_w_mag"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["vn_22mm_lume_mag", "vn_40mm_m583_flare_w_mag", "vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m695_flare_y_mag"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["vn_22mm_m22_smoke_mag", "vn_22mm_m19_wp_mag", "vn_40mm_m680_smoke_w_mag", "vn_40mm_m682_smoke_r_mag","vn_40mm_m715_smoke_g_mag","vn_40mm_m716_smoke_y_mag","vn_40mm_m717_smoke_p_mag"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["vn_22mm_cs_mag", "vn_40mm_m651_cs_mag"], 5];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_b_item_toolkit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_b_item_medikit_01", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_b_item_firstaidkit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["vn_b_item_wiretap", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["vn_b_pack_01_02"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
//a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02_ghex_F", 10, 1, 2];
/*if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["O_NVGoggles_ghex_F", 10, 1, 3];
};*/
a3e_arr_AmmoDepotItems pushback ["vn_m19_binocs_grn", 30, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["vn_m19_binocs_grey", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["vn_mk21_binocs", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["vn_b_item_compass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["vn_b_item_compass_sog", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["vn_b_item_map", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["vn_b_item_radio_urc10", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["vn_b_item_watch", 50, 1, 10];
//a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
//a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["vn_b_carbine", 20, 1, 2]; //M1/M2/M3 bayonet
a3e_arr_AmmoDepotItems pushback ["vn_o_3x_m84", 30, 1, 2]; //M1/M2 scope
a3e_arr_AmmoDepotItems pushback ["vn_s_m14", 20, 1, 2]; //M14 silencer
a3e_arr_AmmoDepotItems pushback ["vn_b_m14", 20, 1, 2]; //M14 bayonet
a3e_arr_AmmoDepotItems pushback ["vn_o_9x_m14", 20, 1, 3]; //M14 scope
a3e_arr_AmmoDepotItems pushback ["vn_bipod_m14", 20, 1, 3]; //M14 bipod
a3e_arr_AmmoDepotItems pushback ["vn_b_camo_m14", 25, 1, 2]; //M14 camo
a3e_arr_AmmoDepotItems pushback ["vn_b_camo_m14a1", 25, 1, 2]; //M14a1 camo
a3e_arr_AmmoDepotItems pushback ["vn_b_m1_garand", 20, 1, 2]; //M1 Garand bayonet
a3e_arr_AmmoDepotItems pushback ["vn_o_3x_m84", 20, 1, 3]; //M1 Garand scope
a3e_arr_AmmoDepotItems pushback ["vn_b_camo_m1_garand", 25, 1, 2]; //M1 Garand camo
a3e_arr_AmmoDepotItems pushback ["vn_s_m16", 10, 1, 2]; //M16 silencer
a3e_arr_AmmoDepotItems pushback ["vn_b_m14", 20, 1, 2]; //M16 bayonet
a3e_arr_AmmoDepotItems pushback ["vn_o_9x_m16", 10, 1, 3]; //M16 scope
a3e_arr_AmmoDepotItems pushback ["vn_o_4x_m16", 20, 1, 3]; //M16 scope
a3e_arr_AmmoDepotItems pushback ["vn_o_1x_sp_m16", 20, 1, 3]; //M16 scope
a3e_arr_AmmoDepotItems pushback ["vn_bipod_m16", 20, 1, 3]; //M16 bipod
a3e_arr_AmmoDepotItems pushback ["vn_b_m1897", 25, 1, 2]; //shotgun bayonet
a3e_arr_AmmoDepotItems pushback ["vn_o_9x_m40a1", 25, 1, 2]; //M40 scope
a3e_arr_AmmoDepotItems pushback ["vn_b_camo_m40a1", 20, 1, 2]; //M40 camo
a3e_arr_AmmoDepotItems pushback ["vn_s_m14", 10, 1, 2]; //M14/M40 silencer
a3e_arr_AmmoDepotItems pushback ["vn_s_mk22", 50, 1, 3]; //Mk22 silencer
a3e_arr_AmmoDepotItems pushback ["vn_s_m1911", 50, 1, 3]; //1911 silencer
a3e_arr_AmmoDepotItems pushback ["vn_s_mc10", 50, 1, 3]; //Uzi silencer
a3e_arr_AmmoDepotItems pushback ["vn_s_mpu", 50, 1, 3]; //Uzi silencer
a3e_arr_AmmoDepotItems pushback ["vn_s_sten", 50, 1, 3]; //Sten silencer
a3e_arr_AmmoDepotItems pushback ["vn_s_m45", 20, 1, 3]; //M/45 silencer
a3e_arr_AmmoDepotItems pushback ["vn_s_m45_camo", 50, 1, 3]; //M/45 silencer
a3e_arr_AmmoDepotItems pushback ["vn_bipod_m1918", 50, 1, 3]; //BAR bipod
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["vn_o_anpvs2_m16", 10, 1, 1]; //M16 scope
	a3e_arr_AmmoDepotItems pushback ["vn_o_anpvs2_m14", 10, 1, 1]; //M14 scope
	a3e_arr_AmmoDepotItems pushback ["vn_o_anpvs2_m40a1", 10, 1, 1]; //M40 scope
	a3e_arr_AmmoDepotItems pushback ["vn_anpvs2_binoc", 10, 1, 2]; //NVG binos
};


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["vn_izh54_p", "vn_izh54_so_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["vn_izh54", "vn_izh54_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["vn_m1891", "vn_m1895_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["vn_m1891", "vn_m38_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["vn_rpg2", "vn_rpg2_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["vn_m38", "vn_m38_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["vn_vz54", "vn_m38_t_mag", 12];
a3e_arr_CivilianCarWeapons pushback ["vn_sa7", "vn_sa7_mag", 1];
a3e_arr_CivilianCarWeapons pushback ["vn_m712", "vn_m712_mag", 4];
a3e_arr_CivilianCarWeapons pushback ["vn_m1928_tommy", "vn_m1a1_30_t_mag", 4];
a3e_arr_CivilianCarWeapons pushback ["vn_vz61_p", "vn_vz61_mag", 5];
a3e_arr_CivilianCarWeapons pushback ["vn_k50m", "vn_ppsh41_35_mag", 7];
a3e_arr_CivilianCarWeapons pushback ["vn_m1a1_tommy_so", "vn_m1a1_20_mag", 8];
a3e_arr_CivilianCarWeapons pushback ["vn_f1_smg", "vn_f1_smg_mag", 8];
a3e_arr_CivilianCarWeapons pushback ["vn_tt33", "vn_tt33_mag", 4];
a3e_arr_CivilianCarWeapons pushback ["vn_b_item_trapkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_punji_01_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_punji_02_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_punji_03_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_f1_grenade_mag", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_tm57_mag", 1];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_tripwire_arty_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_tripwire_f1_02_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "vn_mine_tripwire_f1_04_mag", 2];

// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"vn_o_4x_m16"
	,"vn_o_1x_sp_m16"];
//	"optic_Aco"
//	"optic_ACO_grn"
//	,"optic_Arco"
//	,"optic_Hamr"
//	,"optic_MRCO"
//	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"vn_o_9x_m40a1"
	,"vn_o_9x_m16"
	,"vn_o_9x_m14"
	,"vn_o_3x_m84"];
a3e_arr_NightScopes = [
	"vn_o_anpvs2_m16"
	,"vn_o_anpvs2_m14"
	,"vn_o_anpvs2_m40a1"];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"vn_bipod_m16"
	,"vn_bipod_m1918"
	,"vn_bipod_m14"];

//////////////////////////////////////////////////////////////////
// revive/functions/revive/fn_Check_Revive_FAK.sqf and fn_HandleRevive
// additional types of FAKs or Medkits that should work for revives
// arrays have to be global, because check is performed on client
//////////////////////////////////////////////////////////////////
private _faks = [
	"FirstAidKit"
	,"vn_b_item_firstaidkit"
	,"vn_o_item_firstaidkit"];
missionNamespace setvariable ["a3e_arr_faks",_faks,true];
_medkits = [
	"Medikit"
	,"vn_b_item_medikit_01"];
missionNamespace setvariable ["a3e_arr_medkits",_medkits,true];

//////////////////////////////////////////////////////////////////
// ToDo
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
	];

//////////////////////////////////////////////////////////////////
// SelectExtractionZone.sqf
// Which type of extractions are supported/preferred by this unitclasses version?
// Only if supported by terrain, so if corresponding markers are placed
// Basic fallback is always Heli extraction
// Available types: a3e_arr_extractiontypes = ["air","land","sea"];
//////////////////////////////////////////////////////////////////
a3e_arr_extractiontypes = [
	"air"
	,"land"
	,"sea"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"vn_o_air_mi2_01_01"	//5
	,"vn_o_air_mi2_01_02"	//5
	,"vn_o_air_mi2_01_03"	//5
	//,"vn_o_air_mi2_02_01"	//4	ambulance
	//,"vn_o_air_mi2_02_02"	//4 ambulance
	];
a3e_arr_extraction_chopper_escort = [
	"vn_o_air_mi2_04_05"
	,"vn_o_air_mi2_04_06"
	,"vn_o_air_mi2_04_01"
	,"vn_o_air_mi2_04_02"
	,"vn_o_air_mi2_04_03"
	,"vn_o_air_mi2_04_04"
	,"vn_o_air_mi2_05_05"
	,"vn_o_air_mi2_05_06"
	,"vn_o_air_mi2_05_01"
	,"vn_o_air_mi2_05_02"
	,"vn_o_air_mi2_05_03"
	,"vn_o_air_mi2_05_04"
	,"vn_o_air_mi2_03_05"
	,"vn_o_air_mi2_03_06"
	,"vn_o_air_mi2_03_03"
	,"vn_o_air_mi2_03_04"
	];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"vn_o_boat_03_01"
	,"vn_o_boat_03_02"
	,"vn_o_boat_04_01"
	,"vn_o_boat_04_02"];
a3e_arr_extraction_boat_escort = [
	"vn_o_boat_03_01"
	,"vn_o_boat_03_02"
	,"vn_o_boat_04_01"
	,"vn_o_boat_04_02"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Cars/APCs that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"vn_o_wheeled_btr40_01",	//
	"vn_o_wheeled_btr40_02",	//ToDo
	"vn_o_wheeled_z157_01",	//
	"vn_o_wheeled_z157_02"];	//
a3e_arr_extraction_car_escort = [
	"vn_o_armor_type63_01_nva65",
	"vn_o_armor_type63_01"
	,"vn_o_armor_pt76a_01"
	,"vn_o_armor_pt76b_01"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"vn_b_air_uh1d_02_05"
	,"vn_b_air_uh1b_01_09"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"vn_i_air_uh1d_01_01"
	,"vn_i_air_uh1d_02_01"];
a3e_arr_searchChopperHard = [
	"vn_i_air_uh1c_07_01"];
a3e_arr_searchChopper_pilot = [
	"vn_i_men_aircrew_01"];
a3e_arr_searchChopper_crew = [
	"vn_i_men_aircrew_03"
	,"vn_i_men_aircrew_04"];

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
	"vn_b_boat_06_01"		//Nasty
	,"vn_b_boat_06_02"
	,"vn_b_boat_05_01"
	,"vn_b_boat_05_02"
	,"vn_b_boat_12_02"	//PBR
	,"vn_b_boat_12_04"
	,"vn_b_boat_12_01"
	,"vn_b_boat_12_03"
	,"vn_b_boat_13_02"
	,"vn_b_boat_13_04"
	,"vn_b_boat_13_01"
	,"vn_b_boat_13_03"
	,"vn_b_boat_10_01"	//STAB
	,"vn_b_boat_09_01"
	,"vn_b_boat_11_01"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "vn_b_ammobox_full_07";
a3e_additional_weapon_box_2 = "vn_b_ammobox_full_05";

//////////////////////////////////////////////////////////////////
// fn_createMortarSites.sqf
// Array of templates to usefor mortar sites
//////////////////////////////////////////////////////////////////
A3E_MortarSiteTemplates = [
	"A3E_fnc_MortarSite_vn_us1"
	];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"vn_b_sf_static_mortar_m2"
	,"vn_b_sf_static_mortar_m29"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"vn_b_air_f4b_navy_cas"
	,"vn_b_air_f4c_cas"
	,"vn_b_air_f4b_usmc_cas"
	,"vn_b_air_f4b_navy_hcas"
	,"vn_b_air_f4c_hcas"
	,"vn_b_air_f4b_usmc_hcas"
	,"vn_b_air_f100d_mr"
	,"vn_b_air_f100d_ehcas"];

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
	"vn_air_mi2_01_wreck"
	,"vn_air_mig19_01_wreck"];
a3e_arr_CrashSiteCrew = [
	"vn_o_men_aircrew_01"
	,"vn_o_men_aircrew_02"
	,"vn_o_men_aircrew_03"
	,"vn_o_men_aircrew_04"];
a3e_arr_CrashSiteWrecksCar = [
	"vn_armor_type63_wreck"
	,"vn_armor_pt76_wreck"];
a3e_arr_CrashSiteCrewCar = [
	"vn_o_men_nva_40"
	,"vn_o_men_nva_41"
	,"vn_o_men_nva_42"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["vn_rpg2", 20, 1, 2, ["vn_rpg2_mag"], 3];
a3e_arr_CrashSiteWeapons pushback ["vn_rpg7", 10, 1, 2, ["vn_rpg7_mag"], 2];
a3e_arr_CrashSiteWeapons pushback ["vn_sa7", 10, 1, 2, ["vn_sa7_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["vn_sa7b", 10, 1, 2, ["vn_sa7b_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["vn_rpd", 50, 2, 4, ["vn_rpd_100_mag"], 5];
a3e_arr_CrashSiteWeapons pushback ["vn_b_sks", 75, 2, 4, ["vn_sks_mag"], 10];
a3e_arr_CrashSiteWeapons pushback ["vn_type56", 30, 1, 2, ["vn_type56_mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["vn_ppsh41", 30, 1, 2, ["vn_ppsh41_35_mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["vn_vz61", 30, 1, 2, ["vn_vz61_mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["vn_ppsh41", 50, 1, 2, ["vn_ppsh41_71_t_mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["vn_m4956", 50, 1, 2, ["vn_m4956_10_t_mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["vn_m4956_gl", 50, 1, 2, ["vn_m4956_10_mag","vn_22mm_he_mag","vn_22mm_lume_mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["vn_m9130", 50, 1, 2, ["vn_m38_mag"], 12];
a3e_arr_CrashSiteWeapons pushback ["vn_dp28", 50, 1, 2, ["vn_dp28_mag"], 5];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["vn_o_3x_m9130", 20, 1, 3];	//SKS scope
a3e_arr_CrashSiteItems pushback ["vn_o_4x_m4956", 20, 1, 3]; //M49/65 scope
a3e_arr_CrashSiteItems pushback ["vn_o_3x_m9130", 20, 1, 3]; //M38 / SKS scope

//New stuff for VN

A3E_Trap_Classes = [["random","vn_mine_m18_range"],["roadside","vn_mine_m18_x3_range"],["random","vn_mine_m14"]];//,["roadcenter","vn_mine_tripwire_m16_04"],["roadcenter","vn_mine_tripwire_arty"],["roadside","vn_mine_tripwire_f1_02"]]; Classnames ofd traps and mines. String or array in form [classname, trigger range, scriptcode]
A3E_Trap_Pathes = ["TRACK", "TRAIL"]; //Classnames of roads and pathes for the traps to spawn


A3E_Var_AllowVanillaNightVision = false;

A3E_MapItemsUsedInMission = ["vn_b_item_map","vn_o_item_map"]; //MapItems that should be removed from guards and are allowed to be carried randomly by patrols
A3E_ItemsToBeRemoved = ["vn_b_item_watch","vn_b_item_compass_sog","vn_b_item_compass"]; //Items to randomly remove from units anmd to remove from guards