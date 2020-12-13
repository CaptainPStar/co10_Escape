/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;	//CWR3 US Army
A3E_VAR_Side_Opfor = east;	//CWR3 Soviet Army
A3E_VAR_Side_Ind = resistance;	//CWR3 FIA

A3E_VAR_Flag_Opfor = "\cwr3\general\cwr3_flags\data\ussr.paa";
A3E_VAR_Flag_Ind = "\cwr3\general\cwr3_flags\data\fia.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"cwr3_i_militia_ak",
	"cwr3_i_militia_fal",
	"cwr3_i_militia_g3",
	"cwr3_i_soldier_hunter"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"cwr3_b_backpack_alice"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_m1911a1","cwr3_7rnd_m1911_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cup_hgun_hipower","cwr3_13rnd_hipower_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_cz75","cwr3_16rnd_cz75_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_glock17","cwr3_17rnd_glock17_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_m9","cwr3_15rnd_m9_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_mac10","cwr3_30rnd_mac10_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_makarov","cwr3_8rnd_makarov_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_microuzi","cwr3_30rnd_uzi_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_revolver","cwr3_6rnd_revolver_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_sa61","cwr3_10rnd_skorpion_m"];
a3e_arr_PrisonBackpackWeapons pushback ["cwr3_hgun_tokarev","cwr3_8rnd_tokarev_m"];

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
		//Unarmed Cars/UAVs 2 sets
		"cwr3_o_uaz"  //1
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_ural_open"
		,"cwr3_o_ural"
		,"cwr3_o_bmp2_mev"
		,"cwr3_o_uaz"  //2
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_ural_open"
		,"cwr3_o_ural"
		,"cwr3_o_bmp2_mev"
		//Supply Trucks  1 set
	    ,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		//MRAPs  1 set
		,"cwr3_o_brdm2um"
		,"cwr3_o_brdm2um"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_bmp2_hq"
		//armed cars  1 set
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_spg9"
		,"cwr3_o_uaz_spg9"
		//AA	1 set
		,"cwr3_o_uaz_aa"
		,"cwr3_o_ural_zu23"
		,"cwr3_o_bmp2_zu23"
		,"cwr3_o_zsu"
		//Heavily Armed APCs	1 set
		,"cwr3_o_btr60"
		,"cwr3_o_btr80"
		,"cwr3_o_bmp1"
		,"cwr3_o_bmp1p"
		,"cwr3_o_bmp2"
		//Artillery  1 set
		,"cwr3_o_bm21"
		,"cwr3_o_scud"
		//Tanks  1 set
		,"cwr3_o_t55"
		,"cwr3_o_t72a"
		,"cwr3_o_t72b1"];
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
		//Unarmed Cars/UAVs 2 sets
		"cwr3_o_uaz"  //1
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_ural_open"
		,"cwr3_o_ural"
		,"cwr3_o_bmp2_mev"
		,"cwr3_o_uaz"  //2
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_ural_open"
		,"cwr3_o_ural"
		,"cwr3_o_bmp2_mev"
		//Supply Trucks  1 set
	    ,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		//MRAPs  2 sets
		,"cwr3_o_brdm2um"	//1
		,"cwr3_o_brdm2um"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_bmp2_hq"
		,"cwr3_o_brdm2um"	//2
		,"cwr3_o_brdm2um"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_bmp2_hq"
		//armed cars  2 sets
		,"cwr3_o_uaz_ags30"	//1
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_spg9"
		,"cwr3_o_uaz_spg9"
		,"cwr3_o_uaz_ags30"	//2
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_spg9"
		,"cwr3_o_uaz_spg9"
		//AA	1 set
		,"cwr3_o_uaz_aa"
		,"cwr3_o_ural_zu23"
		,"cwr3_o_bmp2_zu23"
		,"cwr3_o_zsu"
		//Heavily Armed APCs	1 set
		,"cwr3_o_btr60"
		,"cwr3_o_btr80"
		,"cwr3_o_bmp1"
		,"cwr3_o_bmp1p"
		,"cwr3_o_bmp2"
		//Artillery  1 set
		,"cwr3_o_bm21"
		,"cwr3_o_scud"
		//Tanks  1 set
		,"cwr3_o_t55"
		,"cwr3_o_t72a"
		,"cwr3_o_t72b1"];
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
		//Unarmed Cars/UAVs 2 sets
		"cwr3_o_uaz"  //1
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_ural_open"
		,"cwr3_o_ural"
		,"cwr3_o_bmp2_mev"
		,"cwr3_o_uaz"  //2
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_ural_open"
		,"cwr3_o_ural"
		,"cwr3_o_bmp2_mev"
		//Supply Trucks  1 set
	    ,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		//MRAPs  2 sets
		,"cwr3_o_brdm2um"	//1
		,"cwr3_o_brdm2um"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_bmp2_hq"
		,"cwr3_o_brdm2um"	//2
		,"cwr3_o_brdm2um"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_brdm2_atgm"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_mtlb_pk"
		,"cwr3_o_bmp2_hq"
		//armed cars  2 sets
		,"cwr3_o_uaz_ags30"	//1
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_spg9"
		,"cwr3_o_uaz_spg9"
		,"cwr3_o_uaz_ags30"	//2
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_spg9"
		,"cwr3_o_uaz_spg9"
		//AA	1 set
		,"cwr3_o_uaz_aa"
		,"cwr3_o_ural_zu23"
		,"cwr3_o_bmp2_zu23"
		,"cwr3_o_zsu"
		//Heavily Armed APCs	2 sets
		,"cwr3_o_btr60"	//1
		,"cwr3_o_btr80"
		,"cwr3_o_bmp1"
		,"cwr3_o_bmp1p"
		,"cwr3_o_bmp2"
		,"cwr3_o_btr60"	//2
		,"cwr3_o_btr80"
		,"cwr3_o_bmp1"
		,"cwr3_o_bmp1p"
		,"cwr3_o_bmp2"
		//Artillery  1 set
		,"cwr3_o_bm21"
		,"cwr3_o_scud"
		//Tanks  2 sets
		,"cwr3_o_t55"	//1
		,"cwr3_o_t72a"
		,"cwr3_o_t72b1"
		,"cwr3_o_t55"	//2
		,"cwr3_o_t72a"
		,"cwr3_o_t72b1"];
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
	"cwr3_o_soldier_engineer"
	,"cwr3_o_soldier_medic"
	,"cwr3_o_soldier_medic"
	,"cwr3_o_soldier_medic"
	,"cwr3_o_soldier_backpack"
	,"cwr3_o_soldier_backpack"
	,"cwr3_o_soldier_backpack"
	,"cwr3_o_soldier_aa_igla"
	,"cwr3_o_soldier_aa_strela"
	,"cwr3_o_soldier_ar"
	,"cwr3_o_soldier_ar"
	,"cwr3_o_soldier_ar"
	,"cwr3_o_soldier_at_rpg7"
	,"cwr3_o_soldier_at_rpg7"
	,"cwr3_o_soldier_sapper"
	,"cwr3_o_soldier"
	,"cwr3_o_soldier"
	,"cwr3_o_soldier"
	,"cwr3_o_soldier"
	,"cwr3_o_soldier"
	,"cwr3_o_soldier_gl"
	,"cwr3_o_soldier_gl"
	,"cwr3_o_soldier_gl"
	,"cwr3_o_soldier_at_rpg18"
	,"cwr3_o_soldier_at_rpg18"
	,"cwr3_o_soldier_driver"
	,"cwr3_o_soldier_driver"
	,"cwr3_o_soldier_driver"
	,"cwr3_o_soldier_marksman"
	,"cwr3_o_soldier_marksman"
	,"cwr3_o_soldier_engineer"
	,"cwr3_o_officer"
	,"cwr3_o_officer_night"
	,"cwr3_o_soldier_amg"
	,"cwr3_o_soldier_aaa_igla"
	,"cwr3_o_soldier_aaa_strela"
	,"cwr3_o_soldier_aat_rpg7"
	,"cwr3_o_soldier_hg"
	,"cwr3_o_soldier_mg"
	,"cwr3_o_soldier_hg"
	,"cwr3_o_soldier_aat_at4"
	,"cwr3_o_soldier_at_at4"
	,"cwr3_o_soldier_sl"
	,"cwr3_o_soldier_tl"];
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
	"cwr3_o_spetsnaz_akms"
	,"cwr3_o_spetsnaz_akms_sd"
	,"cwr3_o_spetsnaz_bizon_sd"
	,"cwr3_o_spetsnaz_bizon"
	,"cwr3_o_spetsnaz_mountain"];
a3e_arr_recon_I_InfantryTypes = [
	"cwr3_i_soldier_saboteur"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"cwr3_o_uaz_dshkm"
	,"cwr3_o_uaz_dshkm"
	,"cwr3_o_uaz_ags30"
	,"cwr3_o_uaz_spg9"
	,"cwr3_o_brdm2um"
	,"cwr3_o_brdm2"
	,"cwr3_o_brdm2_atgm"
	,"cwr3_o_mtlb_pk"
	,"cwr3_o_ural_zu23"
	,"cwr3_o_btr60"];
	
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
	"cwr3_o_ural"
	,"cwr3_o_ural"
	,"cwr3_o_ural_open"
	,"cwr3_o_bmp2_hq"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"cwr3_i_mtlb_pk"
	,"cwr3_i_v3s"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"cwr3_o_brdm2"
	,"cwr3_o_btr60"
	,"cwr3_o_btr80"
	,"cwr3_o_bmp1"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"cwr3_o_btr60"
	,"cwr3_o_bmp2_zu23"
	,"cwr3_o_bmp2"
	,"cwr3_o_zsu"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"cwr3_o_t55"
	,"cwr3_o_t72a"
	,"cwr3_o_t72b1"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"cwr3_o_nsv_high"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
		"cwr3_o_uaz"
		,"cwr3_o_uaz"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_uaz_mev"
		,"cwr3_o_uaz_open"
		,"cwr3_o_uaz_open"
		,"cwr3_o_ural"
		,"cwr3_o_ural_empty"
		,"cwr3_o_ural_open"
		,"cwr3_o_ural"
		,"cwr3_o_ural_empty"
		,"cwr3_o_ural_open"
		//Supply Trucks
	    ,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		,"cwr3_o_ural_reammo"
		,"cwr3_o_ural_refuel"
		,"cwr3_o_ural_repair"
		//Armed Cars
		,"cwr3_o_uaz_dshkm"
		,"cwr3_o_uaz_ags30"
		,"cwr3_o_uaz_spg9"
		//MRAPS
		,"cwr3_o_brdm2um"
		,"cwr3_o_mtlb_pk"];

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
	"cwr3_o_nsv_high"
	,"cwr3_o_nsv_low"
	,"cwr3_o_ags30"
	,"cwr3_o_spg9"
	,"cwr3_o_zu23"];

// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"cwr3_o_mi24d"
	,"cwr3_o_mi24p"
	,"cwr3_o_mi24v"
	,"cwr3_o_v80"];
a3e_arr_O_transport_heli = [
	"cwr3_o_mi8_amt"
	,"cwr3_o_mi8_mev"];
a3e_arr_O_pilots = [
	"cwr3_o_soldier_pilot"];
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
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_hgun_makarov", 50, 4, 8, ["cwr3_8rnd_makarov_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_hgun_tokarev", 30, 4, 8, ["cwr3_8rnd_tokarev_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_hgun_sa61", 20, 4, 8, ["cwr3_10rnd_skorpion_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_ak74", 100, 2, 4, ["cwr3_30rnd_ak74_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_aks74u", 50, 2, 4, ["cwr3_30rnd_ak74_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_ak74_gl", 75, 2, 4, ["cwr3_30rnd_ak74_plum_m", "CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M", "CUP_IlumFlareWhite_GP25_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_aks74", 25, 2, 4, ["cwr3_30rnd_ak74_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_aks74_gl", 25, 2, 4, ["cwr3_30rnd_ak74_plum_m", "CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SMOKE_GP25_M", "CUP_IlumFlareWhite_GP25_M"], 4];

// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_smg_uzi", 20, 4, 8, ["cwr3_30rnd_uzi_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_hgun_cz75", 20, 4, 8, ["cwr3_16rnd_cz75_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_akm", 50, 2, 4, ["cwr3_30rnd_akm_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_akm_gl", 50, 2, 4, ["cwr3_30rnd_akm_m", "CUP_1Rnd_HE_GP25_M"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_akms", 50, 2, 4, ["cwr3_30rnd_akm_m"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_aks74u", 25, 2, 4, ["cwr3_30rnd_ak74_m"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_fnfal", 25, 2, 4, ["cwr3_20rnd_fal_m"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_g3a3", 25, 2, 4, ["cwr3_20rnd_g3_m"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["cwr3_arifle_sks", 25, 2, 4, ["cwr3_10rnd_sks_m"], 12];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_arifle_rpk74", 50, 2, 4, ["cwr3_45rnd_rpk74_gt_m"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_srifle_svd", 30, 1, 2, ["cwr3_10rnd_svd_m"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_glaunch_6g30", 20, 1, 2, ["cwr3_6rnd_6g30_m"], 9]; 
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_lmg_pkm", 50, 2, 4, ["cwr3_100rnd_pkm_gt_m"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_smg_bizon_sd", 20, 2, 4, ["cwr3_64rnd_bizon_m"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_smg_bizon", 20, 2, 4, ["cwr3_6rnd_6g30_m"], 6];

// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_arifle_rpk", 20, 2, 4, ["cwr3_75rnd_rpk_gt_m"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_lmg_pkm", 20, 2, 4, ["cwr3_100rnd_pkm_gt_m"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_glaunch_6g30", 10, 2, 4, ["cwr3_6rnd_6g30_m"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_srifle_cz550", 10, 2, 4, ["cwr3_5rnd_cz550_m"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["cwr3_srifle_svd", 10, 2, 4, ["cwr3_10rnd_svd_m"], 12];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_rpg7v", 50, 3, 5, ["cwr3_og7_m", "cwr3_pg7vl_m"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_igla", 40, 1, 1, ["cwr3_igla_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_strela", 40, 1, 1, ["cwr3_strela_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_at4", 40, 1, 1, ["cwr3_at4_heat_m", "cwr3_at4_thermobaric_m"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_rpg18", 50, 1, 1, ["cwr3_rpg18_m"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_rpg7v", 10, 3, 5, ["cwr3_pg7v_m","cwr3_pg7vm_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_rpg7v", 10, 1, 2, ["cwr3_pg7vl_m","cwr3_pg7vr_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_rpg7v", 10, 1, 2, ["cwr3_og7_m","cwr3_tbg7v_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_at4", 10, 1, 1, ["cwr3_at4_heat_m", "cwr3_at4_thermobaric_m"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_strela", 10, 1, 1, ["cwr3_strela_m"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["cwr3_launch_rpg75", 25, 1, 1, ["objNull"], 0];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_PipeBomb_M", "CUP_TimeBomb_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["CUP_MineE_M"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_HandGrenade_RGD5"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["CUP_1Rnd_HE_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CUP_1Rnd_SMOKE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M", "CUP_1Rnd_SmokeGreen_GP25_M", "CUP_1Rnd_SmokeYellow_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CUP_FlareWhite_GP25_M", "CUP_FlareGreen_GP25_M", "CUP_FlareRed_GP25_M", "CUP_FlareYellow_GP25_M"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["CUP_IlumFlareWhite_GP25_M", "CUP_IlumFlareRed_GP25_M", "CUP_IlumFlareGreen_GP25_M"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["cwr3_o_backpack_rd54"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["CUP_SOFLAM", 10, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_NVG_PVS7", 20, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["cwr3_nvgoggles_npo1", 20, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["cwr3_rangefinder_1d13", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_PBS4", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_TGPA", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_muzzle_Bizon", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PGO7V", 50, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["CUP_optic_NSPU", 25, 1, 1];
};
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1_AK", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["CUP_optic_PSO_1", 40, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["cwr3_hgun_revolver", "cwr3_6rnd_revolver_m", 6];
a3e_arr_CivilianCarWeapons pushback ["cwr3_hgun_sa61", "cwr3_10rnd_skorpion_m", 6];
a3e_arr_CivilianCarWeapons pushback ["cwr3_hgun_cz75", "cwr3_16rnd_cz75_m", 6];
a3e_arr_CivilianCarWeapons pushback ["cwr3_hgun_microuzi", "cwr3_30rnd_uzi_m", 6];
a3e_arr_CivilianCarWeapons pushback ["cwr3_sgun_kozlice", "CUP_1Rnd_762x51_CZ584", 36];
a3e_arr_CivilianCarWeapons pushback ["cwr3_smg_uzi_sd", "cwr3_30rnd_uzi_m", 6];
a3e_arr_CivilianCarWeapons pushback ["cwr3_srifle_enfield", "cwr3_10rnd_enfield_m", 12];
a3e_arr_CivilianCarWeapons pushback ["cwr3_arifle_m16a1", "cwr3_20rnd_m16_m", 8];
a3e_arr_CivilianCarWeapons pushback ["cwr3_arifle_m16a1_gl", "CUP_1Rnd_HE_M203", 8];
a3e_arr_CivilianCarWeapons pushback ["cwr3_30rnd_sa58_m", "cwr3_30rnd_sa58_m", 8];
a3e_arr_CivilianCarWeapons pushback ["cwr3_lmg_uk59", "cwr3_50rnd_uk59_m", 6];
a3e_arr_CivilianCarWeapons pushback ["cwr3_arifle_xr47", "cwr3_30rnd_akm_m", 5];
a3e_arr_CivilianCarWeapons pushback ["cwr3_launch_rpg75", "objNull", 0];
a3e_arr_CivilianCarWeapons pushback ["CUP_NVG_PVS7", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_PipeBomb_M", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "CUP_HandGrenade_RGD5", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"CUP_optic_PSO_1"
	,"CUP_optic_PSO_1_AK"];
a3e_arr_NightScopes = [
	"CUP_optic_NSPU"];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [];

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
	"cwr3_b_uh1"
	,"cwr3_b_uh1_armed"
	,"cwr3_b_uh1_mev"
	,"cwr3_b_uh60_unarmed_ffv"
	,"cwr3_b_uh60_ffv"
	,"cwr3_b_uh60_mev"
	,"cwr3_b_ch47"];
a3e_arr_extraction_chopper_escort = [
	"cwr3_b_ah1f"
	,"cwr3_b_ah64"
	,"cwr3_b_ah64_hellfire"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"cwr3_b_boat"];
a3e_arr_extraction_boat_escort = [
	"cwr3_b_boat"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"cwr3_b_m939",	//14
	"cwr3_b_m939_open",	//14
	"cwr3_b_m113a3",	//10
	"cwr3_b_m113a3"];	//10
a3e_arr_extraction_car_escort = [
	"cwr3_b_m60a3",
	"cwr3_b_m60a3_tts",
	"cwr3_b_m1a1"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"cwr3_o_camel"
	,"cwr3_o_camel"
	,"cwr3_o_an2"];

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
	"cwr3_o_boat"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "cwr3_crate_basicweapons_ru";
a3e_additional_weapon_box_2 = "cwr3_crate_specialweapons_ru";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"cwr3_o_2b14"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"cwr3_o_su25"
	,"cwr3_o_su25_lgb"];

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
	"cwr3_ah1f_crashed"
	,"cwr3_ah1f_wreck"
	,"BlackhawkWreck"];
a3e_arr_CrashSiteCrew = [
	"cwr3_b_soldier_pilot"];
a3e_arr_CrashSiteWrecksCar = [
	"M113Wreck"
	,"JeepWreck1"
	,"JeepWreck2"
	,"JeepWreck3"
	,"Land_Wreck_HMMWV_F"];
a3e_arr_CrashSiteCrewCar = [
	"cwr3_b_soldier_crew"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["cwr3_launch_m72", 50, 1, 2, ["cwr3_m72_m"], 2];
a3e_arr_CrashSiteWeapons pushback ["cwr3_launch_carlgustaf", 30, 1, 2, ["cwr3_carlgustaf_heat_m","cwr3_carlgustaf_hedp_m"], 2];
a3e_arr_CrashSiteWeapons pushback ["cwr3_srifle_m21", 10, 1, 2, ["cwr3_20rnd_m14_m"], 10];
a3e_arr_CrashSiteWeapons pushback ["cwr3_arifle_g36", 10, 1, 2, ["cwr3_30rnd_g36_m"], 8];
a3e_arr_CrashSiteWeapons pushback ["cwr3_arifle_steyr", 10, 1, 2, ["cwr3_30rnd_steyr_m"], 8];
a3e_arr_CrashSiteWeapons pushback ["cwr3_arifle_m553", 50, 2, 4, ["cwr3_30rnd_m16_m"], 10];
a3e_arr_CrashSiteWeapons pushback ["cwr3_arifle_m553_gl", 40, 2, 4, ["cwr3_30rnd_m16_m", "CUP_1Rnd_HE_M203", "CUP_1Rnd_StarCluster_White_M203"], 6];
a3e_arr_CrashSiteWeapons pushback ["cwr3_lmg_m60", 30, 1, 2, ["cwr3_100rnd_m60_wt_m"], 6];
a3e_arr_CrashSiteWeapons pushback ["cwr3_arifle_xms", 20, 1, 2, ["cwr3_30rnd_m16_m"], 8];
a3e_arr_CrashSiteWeapons pushback ["cwr3_smg_mp5sd6", 50, 1, 2, ["cwr3_30rnd_mp5_m"], 8];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["cwr3_optic_xms", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_G36Optics", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_artel_m14", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_bipod_Harris_1A2_L_BLK", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_Bipod_G36", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_acc_Flashlight_MP5SD", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_muzzle_snds_M14", 50, 1, 1];