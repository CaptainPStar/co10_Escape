/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;	//CWR3 Soviet Army
A3E_VAR_Side_Opfor = west;	//CWR3 US Army
A3E_VAR_Side_Ind = resistance;	//CWR3 FIA

A3E_VAR_Flag_Opfor = "\cwr3\general\cwr3_flags\data\usa.paa";
A3E_VAR_Flag_Ind = "\cwr3\general\cwr3_flags\data\fia.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"cwr3_i_commander"
	,"cwr3_i_soldier_fal"
	,"cwr3_i_soldier_sks"
	,"cwr3_i_soldier_hunter"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"cwr3_o_backpack_rd54"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Browning_HP","CUP_13Rnd_9x19_Browning_HP"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_CZ75","CUP_16Rnd_9x19_cz75"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Glock17","CUP_17Rnd_9x19_glock17"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_M9","CUP_15Rnd_9x19_M9"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Mac10","CUP_30Rnd_45ACP_MAC10_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_Makarov","CUP_8Rnd_9x18_Makarov_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_MicroUzi","CUP_30Rnd_9x19_UZI"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TaurusTracker455","CUP_6Rnd_45ACP_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_SA61","CUP_10Rnd_B_765x17_Ball_M"];
a3e_arr_PrisonBackpackWeapons pushback ["CUP_hgun_TT","CUP_8Rnd_762x25_TT"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"cwr3_c_bicycle"
	,"cwr3_c_jawa"
	,"cwr3_c_skoda"
	,"cwr3_c_skoda"
	,"cwr3_c_skoda"
	,"cwr3_c_s1203"
	,"cwr3_c_s1203"
	,"cwr3_c_s1203_ambulance"
	,"cwr3_c_s1203_police"
	,"cwr3_c_bus"
	,"cwr3_c_gaz24"
	,"cwr3_c_gaz24"
	,"cwr3_c_gaz24"
	,"cwr3_c_lada"
	,"cwr3_c_lada"
	,"cwr3_c_lada"
	,"cwr3_c_lada_police"
	,"cwr3_c_v3s_blue"
	,"cwr3_c_v3s_green"
	,"cwr3_c_v3s_yellow"
	,"cwr3_c_trabant"
	,"cwr3_c_trabant"
	,"cwr3_c_tractor"
	,"cwr3_c_tractor_old"
	,"cwr3_c_ural_blue"
	,"cwr3_c_ural_yellow"];
	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"cwr3_b_hmmwv"  //1
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m939"
		,"cwr3_b_m939"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_empty"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3_mev"
		,"cwr3_b_m113a3_hq"
		,"cwr3_b_m151_m2"
		,"cwr3_b_hmmwv"  //2
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m939"
		,"cwr3_b_m939"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_empty"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3_mev"
		,"cwr3_b_m113a3_hq"
		,"cwr3_b_m151_m2"
		//Supply Trucks  1 set
		,"cwr3_b_m939_reammo"
		,"cwr3_b_m939_refuel"
		,"cwr3_b_m939_repair"
		,"cwr3_b_m939_reammo"
		,"cwr3_b_m939_refuel"
		,"cwr3_b_m939_repair"
		//armed HMMWVs
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		//Heavily Armed APCs or AA
		,"cwr3_b_m163"
		,"cwr3_b_m163"
		,"cwr3_b_m2a2"
		,"cwr3_b_m2a2"
		//Tanks
		,"cwr3_b_m60a3"
		,"cwr3_b_m60a3_tts"
		,"cwr3_b_m1a1"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  3 sets
		"cwr3_i_m151"  //1
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		,"cwr3_i_m151"  //2
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		,"cwr3_i_m151"  //3
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		//Supply Trucks  1 set
		,"cwr3_i_v3s_reammo"
		,"cwr3_i_v3s_refuel"
		,"cwr3_i_v3s_repair"
		//Armed Cars  1 set
		,"cwr3_i_uaz_spg9"
		,"cwr3_i_uaz_spg9"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_btr40_dshkm"
		,"cwr3_i_btr40_dshkm"
		//Armed UAVs  1 set
		,"cwr3_i_uaz_aa"
		,"cwr3_i_uaz_aa"
		,"cwr3_i_bmp2_hq"
		,"cwr3_i_brdm2um"
		//MRAPS  1 set
		,"cwr3_i_brdm2_atgm"
		,"cwr3_i_brdm2_atgm"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		//Heavily Armed APCs or AA  1 set
		,"cwr3_i_bmp2_zu23"
		,"cwr3_i_bmp1"
		,"cwr3_i_bmp2"
		,"cwr3_i_btr60"
		//Tanks  1 set
		,"cwr3_i_t34"
		,"cwr3_i_t55"
		,"cwr3_i_t72a"
		,"cwr3_i_t72b1"];
    };
    case 2: {//Some (4-6)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"cwr3_b_hmmwv"  //1
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m939"
		,"cwr3_b_m939"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_empty"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3_mev"
		,"cwr3_b_m113a3_hq"
		,"cwr3_b_m151_m2"
		,"cwr3_b_hmmwv"  //2
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m939"
		,"cwr3_b_m939"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_empty"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3_mev"
		,"cwr3_b_m113a3_hq"
		,"cwr3_b_m151_m2"
		//Supply Trucks  1 set
		,"cwr3_b_m939_reammo"
		,"cwr3_b_m939_refuel"
		,"cwr3_b_m939_repair"
		,"cwr3_b_m939_reammo"
		,"cwr3_b_m939_refuel"
		,"cwr3_b_m939_repair"
		//armed HMMWVs	2 sets
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		//Heavily Armed APCs or AA
		,"cwr3_b_m163"
		,"cwr3_b_m163"
		,"cwr3_b_m2a2"
		,"cwr3_b_m2a2"
		//Tanks
		,"cwr3_b_m60a3"
		,"cwr3_b_m60a3_tts"
		,"cwr3_b_m1a1"];
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  3 sets
		"cwr3_i_m151"  //1
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		,"cwr3_i_m151"  //2
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		,"cwr3_i_m151"  //3
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		//Supply Trucks  1 set
		,"cwr3_i_v3s_reammo"
		,"cwr3_i_v3s_refuel"
		,"cwr3_i_v3s_repair"
		//Armed Cars  2 sets
		,"cwr3_i_uaz_spg9"	//1
		,"cwr3_i_uaz_spg9"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_btr40_dshkm"
		,"cwr3_i_btr40_dshkm"
		,"cwr3_i_uaz_spg9"	//2
		,"cwr3_i_uaz_spg9"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_btr40_dshkm"
		,"cwr3_i_btr40_dshkm"
		//Armed UAVs  2 sets
		,"cwr3_i_uaz_aa"
		,"cwr3_i_uaz_aa"
		,"cwr3_i_bmp2_hq"
		,"cwr3_i_brdm2um"
		,"cwr3_i_uaz_aa"
		,"cwr3_i_uaz_aa"
		,"cwr3_i_bmp2_hq"
		,"cwr3_i_brdm2um"
		//MRAPS  1 set
		,"cwr3_i_brdm2_atgm"
		,"cwr3_i_brdm2_atgm"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		//Heavily Armed APCs or AA  1 set
		,"cwr3_i_bmp2_zu23"
		,"cwr3_i_bmp1"
		,"cwr3_i_bmp2"
		,"cwr3_i_btr60"
		//Tanks  1 set
		,"cwr3_i_t34"
		,"cwr3_i_t55"
		,"cwr3_i_t72a"
		,"cwr3_i_t72b1"];
    };
    default {//A lot (7-8)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"cwr3_b_hmmwv"  //1
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m939"
		,"cwr3_b_m939"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_empty"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3_mev"
		,"cwr3_b_m113a3_hq"
		,"cwr3_b_m151_m2"
		,"cwr3_b_hmmwv"  //2
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_hmmwv"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m151"
		,"cwr3_b_m939"
		,"cwr3_b_m939"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_open"
		,"cwr3_b_m939_empty"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3"
		,"cwr3_b_m113a3_mev"
		,"cwr3_b_m113a3_hq"
		,"cwr3_b_m151_m2"
		//Supply Trucks  1 set
		,"cwr3_b_m939_reammo"
		,"cwr3_b_m939_refuel"
		,"cwr3_b_m939_repair"
		,"cwr3_b_m939_reammo"
		,"cwr3_b_m939_refuel"
		,"cwr3_b_m939_repair"
		//armed HMMWVs	2 sets
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_tow"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_m2"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		,"cwr3_b_hmmwv_mk19"
		//Heavily Armed APCs or AA  2 sets
		,"cwr3_b_m163"
		,"cwr3_b_m163"
		,"cwr3_b_m2a2"
		,"cwr3_b_m2a2"
		,"cwr3_b_m163"
		,"cwr3_b_m163"
		,"cwr3_b_m2a2"
		,"cwr3_b_m2a2"
		//Tanks	2 sets
		,"cwr3_b_m60a3"
		,"cwr3_b_m60a3_tts"
		,"cwr3_b_m1a1"
		,"cwr3_b_m60a3"
		,"cwr3_b_m60a3_tts"
		,"cwr3_b_m1a1"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  3 sets
		"cwr3_i_m151"  //1
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		,"cwr3_i_m151"  //2
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		,"cwr3_i_m151"  //3
		,"cwr3_i_uaz"
		,"cwr3_i_uaz_mev"
		,"cwr3_i_v3s_open"
		,"cwr3_i_v3s"
		,"cwr3_i_uaz_open"
		,"cwr3_i_btr40"
		//Supply Trucks  1 set
		,"cwr3_i_v3s_reammo"
		,"cwr3_i_v3s_refuel"
		,"cwr3_i_v3s_repair"
		//Armed Cars  2 sets
		,"cwr3_i_uaz_spg9"	//1
		,"cwr3_i_uaz_spg9"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_btr40_dshkm"
		,"cwr3_i_btr40_dshkm"
		,"cwr3_i_uaz_spg9"	//2
		,"cwr3_i_uaz_spg9"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_ags30"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_uaz_dshkm"
		,"cwr3_i_btr40_dshkm"
		,"cwr3_i_btr40_dshkm"
		//Armed UAVs  2 sets
		,"cwr3_i_uaz_aa"
		,"cwr3_i_uaz_aa"
		,"cwr3_i_bmp2_hq"
		,"cwr3_i_brdm2um"
		,"cwr3_i_uaz_aa"
		,"cwr3_i_uaz_aa"
		,"cwr3_i_bmp2_hq"
		,"cwr3_i_brdm2um"
		//MRAPS  1 set
		,"cwr3_i_brdm2_atgm"
		,"cwr3_i_brdm2_atgm"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		,"cwr3_i_brdm2"
		//Heavily Armed APCs or AA  2 sets
		,"cwr3_i_bmp2_zu23"	//1
		,"cwr3_i_bmp1"
		,"cwr3_i_bmp2"
		,"cwr3_i_btr60"
		,"cwr3_i_bmp2_zu23"	//2
		,"cwr3_i_bmp1"
		,"cwr3_i_bmp2"
		,"cwr3_i_btr60"
		//Tanks  2 sets
		,"cwr3_i_t34"	//1
		,"cwr3_i_t55"
		,"cwr3_i_t72a"
		,"cwr3_i_t72b1"
		,"cwr3_i_t34"	//2
		,"cwr3_i_t55"
		,"cwr3_i_t72a"
		,"cwr3_i_t72b1"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"cwr3_b_soldier_sapper"
	,"cwr3_b_soldier_medic"
	,"cwr3_b_soldier_medic"
	,"cwr3_b_soldier_medic"
	,"cwr3_b_soldier_backpack"
	,"cwr3_b_soldier_backpack"
	,"cwr3_b_soldier_backpack"
	,"cwr3_b_soldier_aa_stinger"
	,"cwr3_b_soldier_aa_stinger"
	,"cwr3_b_soldier_ar"
	,"cwr3_b_soldier_ar"
	,"cwr3_b_soldier_ar"
	,"cwr3_b_soldier_aat_carlgustaf"
	,"cwr3_b_soldier_aat_carlgustaf"
	,"cwr3_b_soldier_sapper"
	,"cwr3_b_soldier"
	,"cwr3_b_soldier"
	,"cwr3_b_soldier"
	,"cwr3_b_soldier_gl"
	,"cwr3_b_soldier_gl"
	,"cwr3_b_soldier_gl"
	,"cwr3_b_soldier_gl"
	,"cwr3_b_soldier_gl"
	,"cwr3_b_soldier_gl"
	,"cwr3_b_soldier_at_m47"
	,"cwr3_b_soldier_at_m47"
	,"cwr3_b_soldier_mg"
	,"cwr3_b_soldier_mg"
	,"cwr3_b_soldier_mg"
	,"cwr3_b_soldier_marksman"
	,"cwr3_b_soldier_marksman"
	,"cwr3_b_soldier_marksman"
	,"cwr3_b_soldier_hg"
	,"cwr3_b_soldier_hg"
	,"cwr3_b_officer"
	,"cwr3_b_soldier_g36"
	,"cwr3_b_soldier_g36"
	,"cwr3_b_soldier_aar"
	,"cwr3_b_soldier_amg"
	,"cwr3_b_soldier_m14"
	,"cwr3_b_soldier_m14"
	,"cwr3_b_soldier_aaa_stinger"
	,"cwr3_b_soldier_aat_carlgustaf"
	,"cwr3_b_soldier_aat_m47"
	,"cwr3_b_soldier_amg"
	,"cwr3_b_soldier_steyr"
	,"cwr3_b_soldier_steyr"
	,"cwr3_b_soldier_xms"
	,"cwr3_b_soldier_xms"
	,"cwr3_b_soldier_sl"
	,"cwr3_b_soldier_tl"
	,"cwr3_b_soldier_at_law"
	,"cwr3_b_soldier_at_law"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"cwr3_i_soldier_engineer"
	,"cwr3_i_soldier_medic"
	,"cwr3_i_soldier_medic"
	,"cwr3_i_soldier_medic"
	,"cwr3_i_soldier_backpack"
	,"cwr3_i_soldier_backpack"
	,"cwr3_i_soldier_backpack"
	,"cwr3_i_soldier_aa_strela"
	,"cwr3_i_soldier_aa_strela"
	,"cwr3_i_soldier_ar"
	,"cwr3_i_soldier_ar"
	,"cwr3_i_soldier_ar"
	,"cwr3_i_soldier_at_rpg7"
	,"cwr3_i_soldier_scout"
	,"cwr3_i_soldier"
	,"cwr3_i_soldier"
	,"cwr3_i_soldier"
	,"cwr3_i_soldier"
	,"cwr3_i_soldier"
	,"cwr3_i_soldier_gl"
	,"cwr3_i_soldier_gl"
	,"cwr3_i_soldier_gl"
	,"cwr3_i_soldier_at_at4"
	,"cwr3_i_soldier_at_at4"
	,"cwr3_i_soldier_mg"
	,"cwr3_i_soldier_mg"
	,"cwr3_i_soldier_mg"
	,"cwr3_i_soldier_marksman"
	,"cwr3_i_soldier_marksman"
	,"cwr3_i_soldier_marksman"
	,"cwr3_i_soldier_sapper"
	,"cwr3_i_commander"
	,"cwr3_i_officer"
	,"cwr3_i_officer_night"
	,"cwr3_i_soldier_aar"
	,"cwr3_i_soldier_amg"
	,"cwr3_i_soldier_fal"
	,"cwr3_i_soldier_fal"
	,"cwr3_i_soldier_aaa_strela"
	,"cwr3_i_soldier_aat_at4"
	,"cwr3_i_soldier_aat_rpg7"
	,"cwr3_i_soldier_g3"
	,"cwr3_i_soldier_g3"
	,"cwr3_i_soldier_hg"
	,"cwr3_i_soldier_hg"
	,"cwr3_i_soldier_sks"
	,"cwr3_i_soldier_sks"
	,"cwr3_i_soldier_at_rpg75"
	,"cwr3_i_soldier_at_rpg75"
	,"cwr3_i_soldier_spotter"
	,"cwr3_i_soldier_sniper"
	,"cwr3_i_soldier_sl"
	,"cwr3_i_soldier_tl"];
a3e_arr_recon_InfantryTypes = [
	"cwr3_b_blackop_day"
	,"cwr3_b_blackop_day_mp5a5"
	,"cwr3_b_blackop_day_uzi"
	,"cwr3_b_blackop_day_xms"
	,"cwr3_b_blackop"
	,"cwr3_b_blackop_laser"
	,"cwr3_b_blackop_mp5a5"
	,"cwr3_b_blackop_uzi"];
a3e_arr_recon_I_InfantryTypes = [
	"cwr3_i_soldier_saboteur"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"cwr3_b_m151_m2"
	,"cwr3_b_hmmwv_m2"
	,"cwr3_b_hmmwv_mk19"
	,"cwr3_b_hmmwv_tow"
	,"cwr3_b_m113a3"
	,"cwr3_b_m163"];
	
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"cwr3_i_uaz_dshkm"
	,"cwr3_i_uaz_dshkm"
	,"cwr3_i_uaz_ags30"
	,"cwr3_i_uaz_spg9"
	,"cwr3_i_btr40_dshkm"
	,"cwr3_i_brdm2"
	,"cwr3_i_brdm2um"
	,"cwr3_i_brdm2_atgm"
	,"cwr3_i_bmp2_zu23"
	,"cwr3_i_mtlb_pk"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"cwr3_b_m939"
	,"cwr3_b_m939_open"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"cwr3_i_mtlb_pk"
	,"cwr3_i_v3s"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"cwr3_b_m113a3"
	,"cwr3_b_m113a3"
	,"cwr3_b_m2a2"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"cwr3_b_m113a3"
	,"cwr3_b_m163"
	,"cwr3_b_m2a2"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"cwr3_b_m60a3"
	,"cwr3_b_m1a1"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"cwr3_b_m2hb_high"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"cwr3_b_hmmwv"
	,"cwr3_b_hmmwv"
	,"cwr3_b_hmmwv_transport"
	,"cwr3_b_hmmwv_transport"
	,"cwr3_b_hmmwv_mev"
	,"cwr3_b_hmmwv_mk19"
	,"cwr3_b_hmmwv_m2"
	,"cwr3_b_hmmwv_tow"
	,"cwr3_b_m939"
	,"cwr3_b_m939_open"
	,"cwr3_b_m939_reammo"
	,"cwr3_b_m939_refuel"
	,"cwr3_b_m939_repair"
	,"cwr3_b_m151"
	,"cwr3_b_m151_m2"
	,"cwr3_b_m113a3_mev"
	,"cwr3_b_m113a3_hq"];
	
// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"cwr3_c_skoda"
	,"cwr3_c_s1203"
	,"cwr3_c_s1203_ambulance"
	,"cwr3_c_s1203_police"
	,"cwr3_c_gaz24"
	,"cwr3_c_lada"
	,"cwr3_c_lada_police"
	,"cwr3_c_trabant"
	,"cwr3_c_ural_blue"
	,"cwr3_c_v3s_green"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"cwr3_b_m2hb_high"
	,"cwr3_b_m2hb_low"
	,"cwr3_b_mk19"
	,"cwr3_b_tow"];
	
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"cwr3_b_ah1f"
	,"cwr3_b_ah1f"
	,"cwr3_b_ah64"
	,"cwr3_b_ah64_hellfire"
	,"cwr3_b_uh1_gunship"];
a3e_arr_O_transport_heli = [
	"cwr3_b_ch47"
	,"cwr3_b_uh1"
	,"cwr3_b_uh1_slick"
	,"cwr3_b_uh60_unarmed_ffv"
	,"cwr3_b_uh60_ffv"];
a3e_arr_O_pilots = [
	"cwr3_b_soldier_pilot"];
a3e_arr_I_transport_heli = [
	"cwr3_i_mi8_amt"];
a3e_arr_I_pilots = [
	"cwr3_i_soldier_pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_Colt1911", 50, 4, 8, ["CUP_7Rnd_45ACP_1911"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_M9", 50, 4, 8, ["CUP_15Rnd_9x19_M9"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_M3A1", 30, 1, 3, ["CUP_30Rnd_45ACP_M3A1_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2", 100, 2, 4, ["CUP_30Rnd_556x45_Stanag"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_srifle_M14", 30, 2, 4, ["CUP_20Rnd_762x51_DMR"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_smg_MP5A5", 30, 2, 4, ["CUP_30Rnd_9x19_MP5"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_smg_uzi", 30, 2, 4, ["CUP_30Rnd_9x19_UZI"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_M16A2_GL", 75, 2, 4, ["CUP_30Rnd_556x45_Stanag", "CUP_1Rnd_HE_M203"], 4];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_smg_uzi", 20, 4, 8, ["CUP_30Rnd_9x19_UZI"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_hgun_CZ75", 20, 4, 8, ["CUP_16Rnd_9x19_cz75"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKM_Early", 50, 2, 4, ["CUP_30Rnd_762x39_AK47_bakelite_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKM_GL_Early", 50, 2, 4, ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_1Rnd_HE_GP25_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKMS", 50, 2, 4, ["CUP_30Rnd_762x39_AK47_bakelite_M"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_AKS74U", 25, 2, 4, ["CUP_30Rnd_545x39_AK_M"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_FNFAL5061_wooden", 25, 2, 4, ["CUP_20Rnd_762x51_FNFAL_M"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_arifle_G3A3_ris", 25, 2, 4, ["CUP_20Rnd_762x51_G3"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["CUP_SKS", 25, 2, 4, ["CUP_10Rnd_762x39_SKS_M"], 12];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_smg_MP5SD6", 20, 2, 4, ["CUP_30Rnd_9x19_MP5"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_arifle_xm177e2", 20, 2, 4, ["CUP_30Rnd_556x45_Stanag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_M249_E1", 50, 2, 4, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_glaunch_mm1", 50, 2, 4, ["cwr3_12rnd_mm1_m"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_M60", 50, 1, 1, ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_M21", 30, 1, 1, ["CUP_20Rnd_762x51_DMR"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_G36E", 30, 1, 1, ["CUP_30Rnd_556x45_G36"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_AUG_A1", 30, 1, 1, ["CUP_30Rnd_556x45_AUG"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_arifle_xms", 30, 1, 1, ["CUP_30Rnd_556x45_Stanag"], 9];

// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_arifle_RPK74", 20, 2, 4, ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_lmg_PKMN", 20, 2, 4, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_glaunch_6G30", 10, 2, 4, ["CUP_6Rnd_HE_GP25_M"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_CZ550", 10, 2, 4, ["CUP_5x_22_LR_17_HMR_M"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["CUP_srifle_SVD", 10, 2, 4, ["CUP_10Rnd_762x54_SVD_M"], 12];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M47", 30, 3, 5, ["CUP_Dragon_EP1_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_FIM92Stinger", 50, 1, 1, [objNull], 3];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_carlgustaf", 40, 1, 1, ["cwr3_carlgustaf_heat_m", "cwr3_carlgustaf_hedp_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_M72A6", 50, 1, 1, [objNull], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 10, 3, 5, ["CUP_PG7V_M","CUP_PG7VM_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 10, 1, 2, ["CUP_PG7VL_M","CUP_PG7VR_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_RPG7V", 10, 1, 2, ["CUP_OG7_M","CUP_TBG7V_M"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_at4", 10, 1, 1, ["cwr3_at4_heat_m", "cwr3_at4_thermobaric_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["CUP_launch_9K32Strela", 10, 1, 1, [objNull], 3];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_rpg75", 25, 1, 1, [objNull], 0];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_PipeBomb_M", "CUP_TimeBomb_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_Mine_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_M67"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_RGD5"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CUP_1Rnd_HE_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["CUP_1Rnd_SMOKE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M", "CUP_1Rnd_SmokeGreen_GP25_M", "CUP_1Rnd_SmokeYellow_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["CUP_FlareWhite_GP25_M", "CUP_FlareGreen_GP25_M", "CUP_FlareRed_GP25_M", "CUP_FlareYellow_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["CUP_IlumFlareWhite_GP25_M", "CUP_IlumFlareRed_GP25_M", "CUP_IlumFlareGreen_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_StarCluster_Green_M203", "CUP_1Rnd_StarCluster_Red_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CUP_1Rnd_StarFlare_White_M203", "CUP_1Rnd_StarFlare_Red_M203", "CUP_1Rnd_StarFlare_Green_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CUP_1Rnd_Smoke_M203", "CUP_1Rnd_SmokeRed_M203", "CUP_1Rnd_SmokeGreen_M203", "CUP_1Rnd_SmokeYellow_M203"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["cwr3_i_backpack"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["CUP_SOFLAM", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_NVG_PVS7", 20, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["cwr3_nvgoggles_npo1", 20, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["cwr3_rangefinder_1d13", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["CUP_acc_Flashlight_MP5SD", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_MicroUzi", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_Bizon", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_snds_M14", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_MAAWS_Scope", 50, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_NSPU", 25, 1, 1];
};
a3e_arr_AmmoDepotItems pushback ["cwr3_optic_xms", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_G36Optics", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_artel_m14", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_AK", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_Bipod_G36", 25, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_bipod_Harris_1A2_L_BLK", 25, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_TaurusTracker455", "CUP_6Rnd_45ACP_M", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_SA61", "CUP_10Rnd_B_765x17_Ball_M", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_CZ75", "CUP_16Rnd_9x19_cz75", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_hgun_MicroUzi", "CUP_30Rnd_9x19_UZI", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_sgun_CZ584", "CUP_1Rnd_762x51_CZ584", 36];
a3e_arr_CivilianCarWeapons pushback ["cwr3_smg_uzi_sd", "CUP_30Rnd_9x19_UZI", 6];
a3e_arr_CivilianCarWeapons pushback ["CUP_srifle_LeeEnfield", "CUP_10x_303_M", 12];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_M16A1", "CUP_20Rnd_556x45_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_arifle_M16A1GL_USA", "CUP_1Rnd_HE_M203", 8];
a3e_arr_CivilianCarWeapons pushback ["CUP_lmg_mg3", "CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 5];
a3e_arr_CivilianCarWeapons pushback ["cwr3_arifle_xr47", "CUP_30Rnd_762x39_AK47_bakelite_M", 5];
a3e_arr_CivilianCarWeapons pushback ["cwr3_launch_rpg75", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["CUP_NVG_PVS7", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_PipeBomb_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_HandGrenade_M67", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"CUP_optic_PSO_1"
	,"CUP_optic_PSO_1_AK"
	,"cwr3_optic_xms"
	,"CUP_optic_G36Optics"
	,"CUP_optic_artel_m14"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"CUP_optic_PSO_1"
	,"CUP_optic_PSO_1_AK"
	,"cwr3_optic_xms"
	,"CUP_optic_G36Optics"
	,"CUP_optic_artel_m14"];
a3e_arr_NightScopes = [
	"CUP_optic_NSPU"];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"CUP_Bipod_G36"];

//////////////////////////////////////////////////////////////////
// SelectExtractionZone.sqf
// Which type of extractions are supported/preferred by this unitclasses version?
// Only if supported by terrain, so if corresponding markers are placed
// Basic fallback is always Heli extraction
// Available types: a3e_arr_extractiontypes = ["air","land","sea"];
//////////////////////////////////////////////////////////////////
a3e_arr_extractiontypes = [
	"air",
	"land",
	"sea"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
    "cwr3_o_mi8_amt"
    ,"cwr3_o_mi8_mev"
	,"cwr3_o_mi8_mtv3"];
a3e_arr_extraction_chopper_escort = [
	"cwr3_o_mi24d"
	,"cwr3_o_mi24p"
	,"cwr3_o_mi24v"
	,"cwr3_o_v80"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"cwr3_o_boat"];
a3e_arr_extraction_boat_escort = [
	"cwr3_o_boat"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"cwr3_o_ural"	//14
	,"cwr3_o_ural_open"	//14
	,"cwr3_o_mtlb_pk"	//8
	,"cwr3_o_bmp1"	//12
	,"cwr3_o_bmp2"	//11
	,"cwr3_o_btr60"	//14
	,"cwr3_o_btr80"];	//15
a3e_arr_extraction_car_escort = [
	"cwr3_o_btr80"
	,"cwr3_o_t55"
	,"cwr3_o_t72a"
	,"cwr3_o_t72b1"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"cwr3_b_camel"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"cwr3_i_mi8_amt"];
a3e_arr_searchChopperHard = [
	"cwr3_i_mi8_mtv3"];
a3e_arr_searchChopper_pilot = [
	"cwr3_i_soldier_pilot"];
a3e_arr_searchChopper_crew = [
	"cwr3_i_soldier_pilot"];

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
	"cwr3_b_boat"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "cwr3_crate_basicweapons_us";
a3e_additional_weapon_box_2 = "cwr3_crate_specialweapons_us";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"cwr3_b_m252"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"cwr3_b_a10_cas"
	,"cwr3_b_a10_cas"
	,"cwr3_b_a10_cas"
	,"cwr3_b_a10"
	,"cwr3_b_a10_lgb"];

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
	"Land_Mi8_wreck_F"];
a3e_arr_CrashSiteCrew = [
	"cwr3_o_soldier_pilot"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_BMP2_F"
	,"Land_Wreck_BRDM2_F"
	,"Land_Wreck_UAZ_F"
	,"Land_Wreck_Ural_F"];
a3e_arr_CrashSiteCrewCar = [
	"cwr3_o_soldier_crew"
	,"cwr3_o_soldier_crew_apc"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["cwr3_smg_bizon_sd", 50, 1, 2, ["CUP_64Rnd_9x19_Bizon_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["cwr3_launch_rpg18", 30, 1, 2, [objNull], 2];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_RPG7V", 25, 1, 1, ["CUP_PG7V_M","CUP_PG7VL_M"], 2];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74", 75, 2, 4, ["CUP_30Rnd_545x39_AK_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_RPK74_45", 75, 2, 4, ["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AK74_GL", 75, 2, 4, ["CUP_30Rnd_545x39_AK_M", "CUP_1Rnd_HE_GP25_M"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_PKMN", 60, 1, 3, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_SVD", 40, 1, 2, ["CUP_10Rnd_762x54_SVD_M"], 10];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_1_AK", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_1", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_Bizon", 20, 1, 3];