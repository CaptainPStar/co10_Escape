// SFP
// CSAT vs SFP


/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east; //CUP ION
A3E_VAR_Side_Opfor = west; //SFP Sweden 1990-2000 Snow
A3E_VAR_Side_Ind = resistance; //FFP - Finnish Forces Snow

A3E_VAR_Flag_Opfor = "\sfp_config\data\flag_sweden_co.paa";
A3E_VAR_Flag_Ind = "\ffp_config\data\flag_finland_co.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

//A3E_Var_AllowVanillaNightVision = true;

A3E_MapItemsUsedInMission = ["ItemMap"]; //MapItems that should be removed from guards and are allowed to be carried randomly by patrols
//A3E_ItemsToBeRemoved = ["gm_watch_kosei_80","gm_gc_compass_f73","gm_nsg66_oli"]; //Items to randomly remove from units and to remove from guards

//////////////////////////////////////////////////////////////////
// fn_createStartPos.sqf
// Array of templates to use for prisons
//////////////////////////////////////////////////////////////////
A3E_PrisonTemplates = [
	"a3e_fnc_BuildPrison"
	,"a3e_fnc_BuildPrison1"
	,"a3e_fnc_BuildPrison2"
	,"a3e_fnc_BuildPrison3"
	,"a3e_fnc_BuildPrison4"
	,"a3e_fnc_BuildPrison5"
	];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [		//SFP Police
	"sfp_police_modern"
	,"sfp_police_modern_refx"
	,"sfp_police_modern_submachinegun"
	,"sfp_police_modern_tactical"
	,"sfp_police_modern_tactical_shotgun"
	,"sfp_police_modern_tactical_submachinegun"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"B_AssaultPack_eaf_F"
	,"B_FieldPack_green_F"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["sfp_p226","sfp_15Rnd_9x19_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["sfp_p88","sfp_17Rnd_9x19_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ffp_pist2008","sfp_17Rnd_9x19_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["sfp_revolver58","sfp_6nd_9x29_Mag"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["sfp_kpistm45b","sfp_36Rnd_9mm_kpistm45"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_transport_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_transport_F"
	,"C_Truck_02_transport_F"
	,"C_Offroad_01_comms_F"
	,"C_Offroad_01_covered_F"
	,"C_Tractor_01_F"
	,"C_Tractor_01_F"
	,"sfp_van_hemglass"
	,"sfp_van_hemglass"
	,"sfp_dakota"
	,"sfp_dakota"
	,"sfp_dakota"
	,"sfp_dakota"
	,"sfp_wheelchair"
	//Supply Trucks
	,"C_Van_01_fuel_F"
	,"C_Van_01_box_F"
	,"C_Offroad_01_repair_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"];
	if(A3E_Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_service_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_transport_F";
	};

	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"sfp_bv206_winter"  //1
		,"sfp_tgb11"
		,"sfp_tgb1112"
		,"sfp_bv206_winter"  //2
		,"sfp_tgb11"
		,"sfp_tgb1112"
		//Supply Trucks  1 set
		,"sfp_tgb1314"
		,"sfp_tgb1317"
		,"sfp_tgb20"	
		//Armed Cars  1 set
		,"sfp_tgb1111_sog_ksp58"	//commMG
		,"sfp_tgb13_ksp58"
		,"sfp_tgb1111_sog_rbs56"	//commMG and AT
		,"sfp_tgb1111"				//SPG
		//Armed APC
		,"sfp_pbv302_snow"
		,"sfp_pbv302_mounted_snow"
		//Heavily Armed APCs or AA
		,"sfp_strf90c_snow"
		,"sfp_lvkv90c_snow"	//AA
		//Artillery
		,"sfp_robotbil15"	//rocket truck
		//Tanks
		,"sfp_ivk91_snow"
		,"sfp_strv102"
		,"sfp_strv103c"
		,"sfp_strv121_snow"
		,"sfp_strv122_snow"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs
		"sfp_police_offroad"
		,"sfp_police_suv"
		,"ffp_bv206"
		,"ffp_susi_sa420"
		,"ffp_susi_sa420"
		,"ffp_susi_sa420_covered"
		,"ffp_susi_sa420_covered"
		//Supply Trucks  1 set
		,"ffp_van_ambulance"
		,"ffp_susi8x8_ammo"
		,"ffp_susi_sa420_fuel"
		,"ffp_susi_sa420_repair"
		//MRAPS  1 set
		,"ffp_rg32m"
		,"ffp_rg32m"
		,"ffp_rg32m_gmg"
		//Heavily Armed APCs or AA  1 set
		,"ffp_bmp2"
		,"ffp_bmp2_atgm"
		,"ffp_cv9030"
		//Artillery  1 set
		,"ffp_rsrakh06"
		//Tanks  1 set
		,"ffp_leopard2a4"
		,"ffp_leopard2a6"];
    };
    case 2: {//Some (4-6)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"sfp_bv206_winter"  //1
		,"sfp_tgb11"
		,"sfp_tgb1112"
		,"sfp_bv206_winter"  //2
		,"sfp_tgb11"
		,"sfp_tgb1112"
		//Supply Trucks  1 set
		,"sfp_tgb1314"
		,"sfp_tgb1317"
		,"sfp_tgb20"	
		//Armed Cars  1 set
		,"sfp_tgb1111_sog_ksp58"	//commMG
		,"sfp_tgb13_ksp58"
		,"sfp_tgb1111_sog_rbs56"	//commMG and AT
		,"sfp_tgb1111"				//SPG
		//Armed APC
		,"sfp_pbv302_snow"
		,"sfp_pbv302_mounted_snow"
		//Heavily Armed APCs or AA
		,"sfp_strf90c_snow"
		,"sfp_lvkv90c_snow"	//AA
		//Artillery
		,"sfp_robotbil15"	//rocket truck
		//Tanks
		,"sfp_ivk91_snow"
		,"sfp_strv102"
		,"sfp_strv103c"
		,"sfp_strv121_snow"
		,"sfp_strv122_snow"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs
		"sfp_police_offroad"
		,"sfp_police_suv"
		,"ffp_bv206"
		,"ffp_susi_sa420"
		,"ffp_susi_sa420"
		,"ffp_susi_sa420_covered"
		,"ffp_susi_sa420_covered"
		//Supply Trucks  1 set
		,"ffp_van_ambulance"
		,"ffp_susi8x8_ammo"
		,"ffp_susi_sa420_fuel"
		,"ffp_susi_sa420_repair"
		//MRAPS  1 set
		,"ffp_rg32m"
		,"ffp_rg32m"
		,"ffp_rg32m_gmg"
		//Heavily Armed APCs or AA  1 set
		,"ffp_bmp2"
		,"ffp_bmp2_atgm"
		,"ffp_cv9030"
		//Artillery  1 set
		,"ffp_rsrakh06"
		//Tanks  1 set
		,"ffp_leopard2a4"
		,"ffp_leopard2a6"];
    };
    default {//A lot (7-8)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"sfp_bv206_winter"  //1
		,"sfp_tgb11"
		,"sfp_tgb1112"
		,"sfp_bv206_winter"  //2
		,"sfp_tgb11"
		,"sfp_tgb1112"
		//Supply Trucks  1 set
		,"sfp_tgb1314"
		,"sfp_tgb1317"
		,"sfp_tgb20"	
		//Armed Cars  1 set
		,"sfp_tgb1111_sog_ksp58"	//commMG
		,"sfp_tgb13_ksp58"
		,"sfp_tgb1111_sog_rbs56"	//commMG and AT
		,"sfp_tgb1111"				//SPG
		//Armed APC
		,"sfp_pbv302_snow"
		,"sfp_pbv302_mounted_snow"
		//Heavily Armed APCs or AA
		,"sfp_strf90c_snow"
		,"sfp_lvkv90c_snow"	//AA
		//Artillery
		,"sfp_robotbil15"	//rocket truck
		//Tanks
		,"sfp_ivk91_snow"
		,"sfp_strv102"
		,"sfp_strv103c"
		,"sfp_strv121_snow"
		,"sfp_strv122_snow"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs
		"sfp_police_offroad"
		,"sfp_police_suv"
		,"ffp_bv206"
		,"ffp_susi_sa420"
		,"ffp_susi_sa420"
		,"ffp_susi_sa420_covered"
		,"ffp_susi_sa420_covered"
		//Supply Trucks  1 set
		,"ffp_van_ambulance"
		,"ffp_susi8x8_ammo"
		,"ffp_susi_sa420_fuel"
		,"ffp_susi_sa420_repair"
		//MRAPS  1 set
		,"ffp_rg32m"
		,"ffp_rg32m"
		,"ffp_rg32m_gmg"
		//Heavily Armed APCs or AA  1 set
		,"ffp_bmp2"
		,"ffp_bmp2_atgm"
		,"ffp_cv9030"
		//Artillery  1 set
		,"ffp_rsrakh06"
		//Tanks  1 set
		,"ffp_leopard2a4"
		,"ffp_leopard2a6"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"sfp_m90s_engineer"
	,"sfp_m90s_engineer"
	,"sfp_m90s_engineer"
	,"sfp_m90s_medic"
	,"sfp_m90s_medic"
	,"sfp_m90s_medic"
	,"sfp_m90s_automaticrifleman_ksp90"
	,"sfp_m90s_automaticrifleman_ksp90"
	,"sfp_m90s_machinegunner_ksp58"
	,"sfp_m90s_machinegunner_ksp58"
	,"sfp_1990_m90s_marksman"
	,"sfp_1990_m90s_marksman"
	,"sfp_m90s_automaticrifleman_ksp90"
	,"sfp_m90s_automaticrifleman_ksp90"
	,"sfp_m90s_automaticrifleman_ksp90"
	,"sfp_m90s_at_specialist_pskott86"
	,"sfp_m90s_at_specialist_pskott86"
	,"sfp_m90s_explosive_specialist"
	,"sfp_m90s_rifleman_ak5"
	,"sfp_m90s_rifleman_ak5"
	,"sfp_m90s_rifleman_ak5"
	,"sfp_m90s_rifleman_ak4"
	,"sfp_m90s_rifleman_ak4"
	,"sfp_m90s_gr"
	,"sfp_m90s_gr"
	,"sfp_m90s_gr"
	,"sfp_m90s_gr"
	,"sfp_m90s_aa_specialist_rbs69"
	,"sfp_m90s_aa_specialist_rbs69"
	,"sfp_m90s_rifleman_rto"
	,"sfp_m90s_platoonleader"
	,"sfp_m90s_at_loader_grg86"
	,"sfp_m90s_at_specialist_grg86"
	,"sfp_m90s_at_specialist_grg86"
	,"sfp_m90s_mine_specialist"
	,"sfp_m90s_platoonleader"
	,"sfp_m90s_squadleader"
	,"sfp_m90s_teamleader"
	,"sfp_m90s_teamleader"
	,"sfp_m90s_sniper"
	,"sfp_m90s_sniper"
	,"sfp_m90s_rifleman_ag90"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"ffp_m05s_engineer"
	,"ffp_m05s_engineer"
	,"ffp_m05s_medic"
	,"ffp_m05s_medic"
	,"ffp_m05s_medic"
	,"ffp_m05s_rifleman_ito15"
	,"ffp_m05s_rifleman_ito15"
	,"ffp_m05s_rifleman_ito15"
	,"ffp_m05s_rifleman_ito15"
	,"ffp_m05s_rifleman_ito15"
	,"ffp_m05s_machinegunner_kk_pkm"
	,"ffp_m05s_machinegunner_kk_pkm"
	,"ffp_m05s_machinegunner_kk_pkm"
	,"ffp_m05s_at_specialist_nlaw"
	,"ffp_m05s_at_specialist_apilas"
	,"ffp_m05s_explosive_specialist"
	,"ffp_m05s_rifleman_rk95"
	,"ffp_m05s_rifleman_rk95"
	,"ffp_m05s_rifleman_rk95"
	,"ffp_m05s_rifleman_rk95"
	,"ffp_m05s_rifleman_jtac"
	,"ffp_m05s_at_specialist_kes88"
	,"ffp_m05s_at_specialist_kes88"
	,"ffp_m05s_marksman"
	,"ffp_m05s_marksman"
	,"ffp_m05s_marksman"
	,"ffp_m05s_platoonleader"
	,"ffp_m05s_rifleman_uav_op"
	,"ffp_m05s_rifleman_uav_op"
	,"ffp_m05s_rifleman_uav_op_assistant"
	,"ffp_m05s_mines_specialist"
	,"ffp_m05s_sniper_rstkiv2000"
	,"ffp_m05s_sniper"
	,"ffp_m05s_squadleader"
	,"ffp_m05s_teamleader"
	,"ffp_m05s_teamleader"];
a3e_arr_recon_InfantryTypes = [
	"sfp_1990_m90w_bassak_ksp90"
	,"sfp_1990_m90w_bassak_at_specialist_grg"
	,"sfp_1990_m90w_bassak_at_specialist"
	,"sfp_1990_m90w_bassak_explosive_specialist"
	,"sfp_1990_m90w_bassak_marksman"
	,"sfp_1990_m90w_bassak_medic"
	,"sfp_1990_m90w_bassak_machinegunner_ksp58"
	,"sfp_1990_m90w_bassak_teamleader"
	,"sfp_1990_m90w_bassak_ak5"
	,"sfp_1990_m90w_bassak_ak5"
	,"sfp_1990_m90w_bassak_ak5"
	,"sfp_1990_m90w_bassak_ag90"];
a3e_arr_recon_I_InfantryTypes = [
	"ffp_m04d_sog_rk95"
	,"ffp_m04d_sog_at_specialist_nlaw"
	,"ffp_m04d_sog_explosive_specialist"
	,"ffp_m04d_sog_jtac"
	,"ffp_m04d_sog_machinegunner_pkm"
	,"ffp_m04d_sog_medic"
	,"ffp_m04d_sog_rstkiv2000"
	,"ffp_m04d_sog_rk95_sd"
	,"ffp_m04d_sog_teamleader"
	,"ffp_m04d_sog_uav_op_assistant"
	,"ffp_m04d_sog_uav_op"];

a3e_units_civilian_InfantryTypes = [
	"C_man_p_beggar_F_euro"
	,"C_Man_casual_4_v2_F_euro"
	,"C_Man_casual_5_v2_F_euro"
	,"C_Man_casual_6_v2_F_euro"
	,"C_Man_casual_7_F_euro"
	,"C_Man_casual_8_F_euro"
	,"C_Man_casual_9_F_euro"
	,"C_Man_formal_1_F_euro"
	,"C_Man_formal_2_F_euro"
	,"C_Man_formal_3_F_euro"
	,"C_Man_formal_4_F_euro"
	,"C_Man_smart_casual_1_F_euro"
	,"C_Man_smart_casual_2_F_euro"
	,"C_man_polo_1_F_euro"
	,"C_man_polo_2_F_euro"
	,"C_man_polo_3_F_euro"
	,"C_man_polo_4_F_euro"
	,"C_man_polo_5_F_euro"
	,"C_man_polo_6_F_euro"
	,"C_man_shorts_1_F_euro"
	,"C_man_p_fugitive_F_euro"
	,"C_man_p_shorts_1_F_euro"
	,"C_man_shorts_2_F_euro"
	,"C_man_shorts_3_F_euro"
	,"C_man_shorts_4_F_euro"
	,"C_Man_Messenger_01_F"
	,"C_Man_UtilityWorker_01_F"
	,"C_Man_Fisherman_01_F"
	,"C_scientist_01_formal_F"
	,"C_scientist_02_formal_F"
	,"C_scientist_01_informal_F"
	,"C_scientist_02_informal_F"
	,"C_Man_1_enoch_F"
	,"C_Man_2_enoch_F"
	,"C_Man_3_enoch_F"
	,"C_Man_4_enoch_F"
	,"C_Man_5_enoch_F"
	,"C_Man_6_enoch_F"
	,"C_Farmer_01_enoch_F"
	,"sfp_civ_tourist"
	,"sfp_civ_tourist"
	,"sfp_civ_tourist_hat"
	,"sfp_civ_tourist_hat"];

//////////////////////////////////////////////////////////////////
// fn_RoadBlocks.sqf
// Array of templates to use for roadblocks
//////////////////////////////////////////////////////////////////
A3E_RoadblockTemplates = [
	"rb_bis_rb1"
	,"rb_bis_rb2"
	,"rb_bis_rb3"
	,"rb_bis_rb4"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"sfp_tgb1111_sog_ksp58"
	,"sfp_tgb13_ksp58"
	,"sfp_tgb1111"
	,"sfp_tgb1111_sog_rbs56"
	,"sfp_pbv302_snow"
	,"sfp_pbv302_snow"];
	
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"ffp_rg32m_gmg"
	,"ffp_rg32m_gmg"
	,"ffp_rg32m_gmg"
	,"ffp_bmp2"
	,"ffp_cv9030"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"ffp_bv206"					//12+
	,"ffp_susi_sa420"			//12+
	,"ffp_susi_sa420_covered"];	//12+
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"sfp_tgb11"					//6
	,"sfp_tgb13_ksp58"			//5
	,"sfp_tgb20"];	//12+


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"sfp_pbv302_snow"
	,"sfp_pbv302_mounted_snow"
	,"sfp_strf90c_snow"];


// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"sfp_pbv302_mounted_snow"
	,"sfp_ivk91_snow"
	,"sfp_strv102"
	,"sfp_strv103c"
	,"sfp_strf90c_snow"
	,"sfp_lvkv90c_snow"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"sfp_strv121_snow"
	,"sfp_strv122_snow"
	,"sfp_strv122_snow"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"B_G_HMG_02_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"sfp_cykel42"
	,"sfp_bv206_winter"
	,"sfp_tgb11"
	,"sfp_pbv302_snow"
	,"sfp_tgb13_ksp58"
	,"sfp_tgb1111"
	,"sfp_tgb1111_sog_rbs56"
	,"sfp_tgb1111_sog_ksp58"
	,"sfp_tgb1314"
	,"sfp_tgb1317"
	,"sfp_tgb20"
	,"sfp_strv102"
	,"sfp_strv103c"];
	
// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_SUV_01_F"
	,"C_Truck_02_covered_F"
	,"sfp_van_hemglass"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"B_G_HMG_02_high_F"
	,"sfp_ksp88"
	,"sfp_ksp88"
	,"sfp_ksp88"
	,"sfp_grsp"
	,"sfp_rbs55"
	,"sfp_rbs56"
	,"sfp_rbs70"
	,"sfp_rbs70"
	,"sfp_75mm_m57"];
	
	
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"sfp_hkp9_rb55"];
a3e_arr_O_transport_heli = [
	"sfp_hkp9"
	,"sfp_hkp6"
	,"sfp_hkp4"];
a3e_arr_O_pilots = [
	"sfp_m90s_pilot"];
a3e_arr_I_transport_heli = [
	"ffp_md500"
	,"ffp_md500"
	,"sfp_bell429_police"];
a3e_arr_I_pilots = [
	"ffp_helipilot"];

//Ammo Depot Crates
// classnames to be used for the crates that are placed at an ammo depot
a3e_arr_AmmoDepotCrate_Basic = ["Box_T_NATO_Wps_F"];
a3e_arr_AmmoDepotCrate_Special = ["Box_T_NATO_WpsSpecial_F"];
a3e_arr_AmmoDepotCrate_Launchers = ["Box_NATO_WpsLaunch_F"];
a3e_arr_AmmoDepotCrate_Ordnance = ["Box_NATO_AmmoOrd_F"];
a3e_arr_AmmoDepotCrate_Vehicle = ["B_supplyCrate_F","Box_NATO_AmmoVeh_F"];
a3e_arr_AmmoDepotCrate_Items = ["Box_NATO_Support_F","Box_NATO_Equip_F"];
a3e_arr_AmmoDepotCrate_Random = ["Box_FIA_Wps_F"];
a3e_arr_AmmoDepotCrate_RandomInf = ["Box_FIA_Support_F"];
a3e_arr_AmmoDepotCrate_Car = ["Box_FIA_Support_F"];
a3e_arr_AmmoDepotCrate_CrashSite = ["Box_T_East_Wps_F"];
a3e_arr_AmmoDepotCrate_Extra1 = ["Box_FIA_Wps_F"];
a3e_arr_AmmoDepotCrate_Extra2 = ["Box_FIA_Ammo_F"];

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
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_p226", 25, 1, 2, ["sfp_15Rnd_9x19_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_p88", 25, 1, 2, ["sfp_17Rnd_9x19_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_signpist50", 50, 2, 4, ["sfp_1rnd_lyspatron7_mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_cbj_ms", 10, 1, 2, ["sfp_30Rnd_650x25mag", "sfp_30Rnd_650x25mag_subsonic"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_ak4", 30, 1, 3, ["sfp_20Rnd_762x51_ak4","sfp_20Rnd_762x51_ak4_ap","sfp_riflegrenade_smoke_ak4"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_ak4_m203", 30, 1, 2, ["sfp_20Rnd_762x51_ak4","1Rnd_HE_Grenade_shell","UGL_FlareGreen_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_ak5_snow", 100, 2, 4, ["sfp_30Rnd_556x45_Stanag_plastic"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_ak5_m203", 30, 1, 2, ["sfp_30Rnd_556x45_Stanag_plastic","1Rnd_HE_Grenade_shell","UGL_FlareGreen_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_ak5d", 20, 1, 2, ["sfp_30Rnd_556x45_Stanag_plastic","sfp_30Rnd_556x45_Stanag_tracer_plastic"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_ak5b", 20, 1, 2, ["sfp_30Rnd_556x45_Stanag_plastic"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_ak5dmk2", 20, 1, 2, ["sfp_30Rnd_556x45_Stanag_plastic","sfp_30Rnd_556x45_Stanag_tracer_plastic"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_mp5", 20, 1, 3, ["sfp_30Rnd_9mm_mp5_JHP"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_kpistm45", 10, 1, 2, ["sfp_36Rnd_9mm_kpistm45"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["sfp_kpistm45b", 10, 1, 2, ["sfp_36Rnd_9mm_kpistm45"], 8];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["ffp_pist2008", 30, 1, 2, ["sfp_17Rnd_9x19_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ffp_rk62", 50, 1, 3, ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ffp_rk95", 50, 1, 3, ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], 8];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["sfp_g36c", 30, 1, 2, ["sfp_30Rnd_556x45_Stanag_g36"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sfp_psg90", 50, 1, 2, ["sfp_9Rnd_762x51_psg90_prick", "sfp_9Rnd_762x51_psg90"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sfp_ksp58a", 20, 1, 2, ["sfp_50Rnd_655x55_ksp58"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sfp_ksp58", 40, 1, 2, ["sfp_50Rnd_762x51_ksp58"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sfp_ksp90b", 20, 1, 2, ["sfp_200Rnd_556x45_ksp90"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sfp_remington870", 50, 1, 2, ["sfp_12Gauge_8rd_Pellets", "sfp_12Gauge_8rd_Slug"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sfp_ag90", 20, 1, 1, ["sfp_10Rnd_127x99_ag90"], 12];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["ffp_KVKK", 20, 1, 2, ["ffp_100Rnd_KVKK_mag", "ffp_100Rnd_KVKK_mag_Tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ffp_kk_pkm", 20, 1, 2, ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ffp_TKiv2000_scope", 20, 1, 2, ["ffp_5Rnd_TKiv2000_mag"], 16];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["sfp_pskott68", 10, 1, 1, [objNull], 0];
a3e_arr_AmmoDepotLaunchers pushback ["sfp_pskott86", 10, 1, 1, [objNull], 0];
a3e_arr_AmmoDepotLaunchers pushback ["sfp_rb57", 20, 3, 5, ["sfp_rb57_mag"], 2];	//NLAW
a3e_arr_AmmoDepotLaunchers pushback ["sfp_rbs69", 30, 1, 1, ["sfp_rbs69_mag"], 3];			//Stinger
a3e_arr_AmmoDepotLaunchers pushback ["sfp_grg48", 30, 1, 1, ["sfp_grg_heat_mag", "sfp_grg_he_mag", "sfp_grg_illum_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["sfp_grg86", 30, 1, 1, ["sfp_grg_heat_66_mag", "sfp_grg_smoke_mag", "sfp_grg_illum_mag"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["ffp_nlaw", 20, 3, 5, ["ffp_nlaw_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["ffp_Apilas", 20, 1, 1, [objNull], 0];
a3e_arr_AmmoDepotLaunchers pushback ["ffp_66kes12", 10, 1, 1, [objNull], 0];
a3e_arr_AmmoDepotLaunchers pushback ["ffp_66kes12_rak", 10, 1, 1, [objNull], 0];
a3e_arr_AmmoDepotLaunchers pushback ["ffp_kes88", 10, 1, 1, [objNull], 0];
a3e_arr_AmmoDepotLaunchers pushback ["ffp_ito15", 40, 1, 1, ["ffp_ito15_mag"], 3];	//Stinger


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["sfp_sprdeg46_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ffp_sm_65_98_mag", "sfp_strvm5_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["sfp_frdnmina13_mag", "ffp_vp10_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["sfp_strvm6_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 20, 1, 1, ["ffp_telamiina_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["sfp_handgrenade_shgr56", "sfp_handgrenade_shgr2000"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["sfp_handgrenade_shgr07"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["sfp_FlashBang"], 30];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["ffp_smoke_blue", "ffp_smoke_green", "ffp_smoke_red", "ffp_smoke_white"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 20, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["sfp_riflegrenade_smoke_ak4"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["sfp_bandage", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["sfp_backpack_stridssack08","sfp_backpack_stridssack2000","sfp_backpack_lk35"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator_03", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["sfp_dbal2", 40, 1, 3];
a3e_arr_AmmoDepotItems pushback ["sfp_tlr2", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight_pistol", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_L", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_338_black", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["sfp_muzzle_snds_cbj", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_M", 10, 1, 3];//AK5
//a3e_arr_AmmoDepotItems pushback ["sfp_optic_aimpoint", 30, 1, 2];
//a3e_arr_AmmoDepotItems pushback ["sfp_optic_aimpoint_t1", 30, 1, 2];
//a3e_arr_AmmoDepotItems pushback ["sfp_optic_3x_aimpoint", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["sfp_optic_kikarsikte09_4x", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["sfp_optic_susat_4x", 20, 1, 2];
//a3e_arr_AmmoDepotItems pushback ["sfp_optic_hensoldt_4x", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["sfp_optic_kikarsikte90b_10x", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ffp_optic_TKiv2000", 20, 1, 2];
//a3e_arr_AmmoDepotItems pushback ["ffp_pp04", 30, 1, 2];
//a3e_arr_AmmoDepotItems pushback ["ffp_pp09", 30, 1, 2];
//a3e_arr_AmmoDepotItems pushback ["ffp_ta11_3d", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ffp_vv2000_sidemount", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["sfp_ksp58_snow_support", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["sfp_p226", "sfp_15Rnd_9x19_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["sfp_revolver58", "sfp_6nd_9x29_Mag", 6];
a3e_arr_CivilianCarWeapons pushback ["sfp_signpist50", "sfp_1rnd_lyspatron7_mag", 9];
a3e_arr_CivilianCarWeapons pushback ["sfp_kpistm45b", "sfp_36Rnd_9mm_kpistm45", 8];
a3e_arr_CivilianCarWeapons pushback ["sfp_remington870_wood_blue", "sfp_12Gauge_8rd_Pellets", 12];
a3e_arr_CivilianCarWeapons pushback ["sfp_remington870_wood_chrome", "sfp_12Gauge_8rd_Slug", 12];
a3e_arr_CivilianCarWeapons pushback ["sfp_cga5p", "sfp_30Rnd_556x45_Stanag_plastic", 7];
a3e_arr_CivilianCarWeapons pushback ["sfp_mp5", "sfp_30Rnd_9mm_mp5", 6];
a3e_arr_CivilianCarWeapons pushback ["sfp_ak5c_m203_blk", "UGL_FlareWhite_F", 8];
a3e_arr_CivilianCarWeapons pushback ["sfp_cbj_ms", "sfp_30Rnd_650x25mag", 8];
a3e_arr_CivilianCarWeapons pushback ["ffp_kes88", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["sfp_flashlight", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["sfp_imgint_1010", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "sfp_sprdeg46_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "sfp_handgrenade_shgr07", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "ffp_smoke_white", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"sfp_optic_kikarsikte09_4x"
	,"sfp_optic_susat_4x"
	,"sfp_optic_susat_4x"
	,"sfp_optic_susat_4x"
	,"sfp_optic_kikarsikte90b_10x"
	,"sfp_optic_hensoldt_4x"];
a3e_arr_Scopes_SMG = [
	"optic_Aco_smg"
	,"optic_Holosight_smg"];
a3e_arr_Scopes_Sniper = [
	"ffp_optic_TKiv2000"
	,"sfp_optic_kikarsikte90b_10x"];
a3e_arr_NightScopes = [];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"sfp_ksp58_snow_support"
	,"bipod_01_F_blk"
	,"bipod_01_F_blk"];

//////////////////////////////////////////////////////////////////
// revive/functions/revive/fn_Check_Revive_FAK.sqf and fn_HandleRevive
// additional types of FAKs or Medkits that should work for revives
// arrays have to be global, because check is performed on client
//////////////////////////////////////////////////////////////////
private _faks = [
	"FirstAidKit"
	,"sfp_bandage"];
missionNamespace setvariable ["a3e_arr_faks",_faks,true];
_medkits = [
	"Medikit"];
missionNamespace setvariable ["a3e_arr_medkits",_medkits,true];

//////////////////////////////////////////////////////////////////
// fn_addIntel.sqf
// types of intel items you can find on enemies
//////////////////////////////////////////////////////////////////
A3E_IntelItems = [
	"Files"
	,"FileTopSecret"
	,"FilesSecret"
	,"FlashDisk"
	,"DocumentsSecret"
	,"Wallet_ID"
	,"FileNetworkStructure"
	,"MobilePhone"
	,"SmartPhone"
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
	"land",
	"sea"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
    "CUP_I_412_Mil_Transport_PMC"
	,"CUP_I_Ka60_Blk_ION"
	,"CUP_I_Merlin_HC3_PMC_Transport_black"
	,"CUP_I_Merlin_HC3_PMC_Lux_black"];
a3e_arr_extraction_chopper_escort = [
	"CUP_I_Mi24_D_Dynamic_ION"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"O_T_Boat_Armed_01_hmg_F"];
a3e_arr_extraction_boat_escort = [
	"O_T_Boat_Armed_01_hmg_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Cars/APCs that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"CUP_I_nM1038_DF_ION_WIN",	//7
	"CUP_I_SUV_ION",	//
	"CUP_I_SUV_Armored_ION"];	//
a3e_arr_extraction_car_escort = [
	"CUP_I_BTR80_ION"
	,"CUP_I_BTR80A_ION"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"sfp_uav03"
	,"ffp_orbiter"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"sfp_bell429_police"
	,"ffp_md500"];
a3e_arr_searchChopperHard = [
	"sfp_hkp9"];
a3e_arr_searchChopper_pilot = [
	"ffp_helipilot"];
a3e_arr_searchChopper_crew = [
	"ffp_helipilot"];

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
	"sfp_90s_gruppbat"
	,"sfp_90s_gruppbat"
	,"sfp_90s_gruppbat"
	,"sfp_90s_gruppbat"
	,"sfp_strb90"
	,"sfp_strb90"
	,"sfp_strb90"
	,"sfp_strb90"
	,"sfp_strb90"
	,"sfp_rbb_norrkoping"
	,"sfp_neptun"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "sfp_ammobox_container_2015";
a3e_additional_weapon_box_2 = "sfp_ammobox_container_1990";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"sfp_grk84"
	,"sfp_grk84"
	,"sfp_grk84"
	,"sfp_fh77"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"sfp_jas39"];

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
	"CUP_I_PMC_Winter_Pilot"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_Ural_F"
	,"Land_V3S_wreck_F"
	,"Land_Wreck_BMP2_F"
	,"Land_Wreck_BRDM2_F"
	,"Land_Wreck_T72_hull_F"];
a3e_arr_CrashSiteCrewCar = [
	"CUP_I_PMC_Winter_Crew"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["CUP_smg_Mac10", 30, 1, 2, ["CUP_30Rnd_45ACP_MAC10_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_SR3M_Vikhr_VFG", 30, 1, 2, ["CUP_30Rnd_9x39_SP5_VIKHR_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_RPG18", 80, 1, 4, [objNull], 0];
a3e_arr_CrashSiteWeapons pushback ["CUP_launch_FIM92Stinger", 40, 1, 1, ["CUP_Stinger_M"], 1];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_FNFAL", 75, 2, 4, ["CUP_20Rnd_762x51_FNFAL_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_hgun_BallisticShield_Armed_M9", 40, 2, 4, ["CUP_15Rnd_9x19_M9"], 6];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_M4A1_standard_winter", 75, 2, 4, ["CUP_30Rnd_556x45_Stanag"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_arifle_AUG_A1", 50, 2, 4, ["CUP_30Rnd_556x45_AUG"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_lmg_PKM", 60, 1, 3, ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], 4];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_ksvk_PSO3", 20, 1, 2, ["CUP_5Rnd_127x108_KSVK_M"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_M107_Snow", 40, 1, 2, ["CUP_10Rnd_127x99_M107"], 8];
a3e_arr_CrashSiteWeapons pushback ["CUP_srifle_AS50_SBPMII", 20, 1, 2, ["CUP_5Rnd_127x99_as50_M"], 8];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["CUP_optic_CompM2_low", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_LeupoldMk4_25x50_LRT_SNOW", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_optic_PSO_3", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["muzzle_snds_B", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["CUP_Vector21Nite", 50, 1, 1];


//Mines and traps, fn_initTraps
A3E_Trap_Classes = [["roadcenter","sfp_strvm6"],["roadcenter","ffp_telamiina"],["roadside","ffp_sm_65_98"],["random","sfp_strvm5"]];// Classnames ofd traps and mines. String or array in form [classname, trigger range, scriptcode]
A3E_Trap_Pathes = ["TRACK"]; //Classnames of roads and pathes for the traps to spawn. "HIDE", "TRAIL", "TRACK", "ROAD", "MAIN ROAD"
/*
sfp_frdnmina13_mag		claymore			sfp_frdnmina13_ammo
sfp_strvm5_mag			ap					sfp_strvm5_ammo
sfp_strvm6_mag			AT					sfp_strvm6_ammo
ffp_sm_65_98_mag		ap					ffp_sm_65_98_ammo
ffp_telamiina_mag		AT					ffp_telamiina_ammo
ffp_vp10_mag			claymore			ffp_vp10_ammo
*/