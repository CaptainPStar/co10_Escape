/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;
A3E_VAR_Side_Opfor = west;		//Expeditionary Forces: MJTF Woodland
A3E_VAR_Side_Ind = resistance;	//AAF

A3E_VAR_Flag_Opfor = "\ef\ef_data\data\Flag_29thMEU_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\flag_AAF_CO.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"I_G_Soldier_AR_F",
	"I_G_Soldier_GL_F",
	"I_G_Soldier_F",
	"I_G_Soldier_F",
	"I_G_Soldier_lite_F",
	"I_G_Soldier_lite_F"];
	if(A3E_Param_UseDLCContact==1) then {
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_L_Criminal_SG_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_L_Criminal_SMG_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_L_Hunter_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_L_Looter_Rifle_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_L_Looter_Pistol_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_L_Looter_SG_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_L_Looter_SMG_F";
	};

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_snds_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_P07_snds_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_P07_snds_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_Pistol_heavy_01_coy","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_01_MRD_F","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_01_snds_F","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_Yorris_F","6Rnd_45ACP_Cylinder"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["hgun_PDW2000_F","30Rnd_9x21_Mag"];
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_Glock19_RF","17Rnd_9x19_Mag_RF"];
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_Glock19_auto_RF","33Rnd_9x19_Red_Mag_RF"];
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_DEagle_bronze_RF","7Rnd_50AE_Mag_RF"];
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_DEagle_classic_RF","7Rnd_50AE_Mag_RF"];
};

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_Quadbike_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_transport_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_transport_F"
	,"C_Truck_02_transport_F"
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
	if(A3E_Param_UseDLCContact==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_comms_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_01_covered_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Tractor_01_F";
	};
	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"EF_B_MRAP_01_MJTF_Wdl"  //1
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Truck_01_mover_MJTF_Wdl"
		,"EF_B_Truck_01_box_MJTF_Wdl"
		,"EF_B_Truck_01_covered_MJTF_Wdl"
		,"EF_B_Truck_01_transport_MJTF_Wdl"
		,"EF_B_Truck_01_medical_MJTF_Wdl"
		,"EF_B_UGV_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"  //2
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Truck_01_mover_MJTF_Wdl"
		,"EF_B_Truck_01_box_MJTF_Wdl"
		,"EF_B_Truck_01_covered_MJTF_Wdl"
		,"EF_B_Truck_01_transport_MJTF_Wdl"
		,"EF_B_Truck_01_medical_MJTF_Wdl"
		,"EF_B_UGV_01_MJTF_Wdl"
		//Supply Trucks  1 set
		,"EF_B_Truck_01_ammo_MJTF_Wdl"
		,"EF_B_Truck_01_fuel_MJTF_Wdl"
		,"EF_B_Truck_01_Repair_MJTF_Wdl"
		,"EF_B_Truck_01_ammo_MJTF_Wdl"
		,"EF_B_Truck_01_fuel_MJTF_Wdl"
		,"EF_B_Truck_01_Repair_MJTF_Wdl"		
		//Armed UAVs  1 set
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		//MRAPs  1 set
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_AT_MJTF_Wdl"
		,"EF_B_MRAP_01_AT_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_FSV_MJTF_Wdl"
		,"EF_B_MRAP_01_FSV_MJTF_Wdl"
		//Heavily Armed APCs or AA
		,"EF_B_MRAP_01_LAAD_MJTF_Wdl"
		,"EF_B_MRAP_01_LAAD_MJTF_Wdl"
		,"EF_B_AAV9_MJTF_Wdl"
		,"EF_B_AAV9_50mm_MJTF_Wdl"
		//Artillery
		,"EF_B_MBT_01_mlrs_MJTF_Wdl"
		//Tanks
		,"EF_B_MBT_01_cannon_MJTF_Wdl"
		,"EF_B_MBT_01_TUSK_MJTF_Wdl"];
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_Comms_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_mmg_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_mmg_MJTF_Wdl";
		};
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  3 sets
		"I_Quadbike_01_F"  //1
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		,"I_Quadbike_01_F"  //2
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		,"I_Quadbike_01_F"  //3
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		//Supply Trucks  1 set
		,"I_Truck_02_ammo_F"
		,"I_Truck_02_fuel_F"
		,"I_Truck_02_box_F"
		,"I_G_Van_01_fuel_F"
		,"I_G_Offroad_01_repair_F"
		//Armed Cars  1 set
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		//Armed UAVs  1 set
		,"I_UGV_01_rcws_F"
		,"I_UGV_01_rcws_F"
		//MRAPS  1 set
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		//Heavily Armed APCs or AA  1 set
		,"I_APC_Wheeled_03_cannon_F"
		,"I_APC_tracked_03_cannon_F"
		//Artillery  1 set
		,"I_Truck_02_MRL_F"
		//Tanks  1 set
		,"I_MBT_03_cannon_F"];
		if(A3E_Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		};
		if(A3E_Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
	    };
    };
    case 2: {//Some (4-6)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"EF_B_MRAP_01_MJTF_Wdl"  //1
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Truck_01_mover_MJTF_Wdl"
		,"EF_B_Truck_01_box_MJTF_Wdl"
		,"EF_B_Truck_01_covered_MJTF_Wdl"
		,"EF_B_Truck_01_transport_MJTF_Wdl"
		,"EF_B_Truck_01_medical_MJTF_Wdl"
		,"EF_B_UGV_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"  //2
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Truck_01_mover_MJTF_Wdl"
		,"EF_B_Truck_01_box_MJTF_Wdl"
		,"EF_B_Truck_01_covered_MJTF_Wdl"
		,"EF_B_Truck_01_transport_MJTF_Wdl"
		,"EF_B_Truck_01_medical_MJTF_Wdl"
		,"EF_B_UGV_01_MJTF_Wdl"
		//Supply Trucks  1 set
		,"EF_B_Truck_01_ammo_MJTF_Wdl"
		,"EF_B_Truck_01_fuel_MJTF_Wdl"
		,"EF_B_Truck_01_Repair_MJTF_Wdl"
		,"EF_B_Truck_01_ammo_MJTF_Wdl"
		,"EF_B_Truck_01_fuel_MJTF_Wdl"
		,"EF_B_Truck_01_Repair_MJTF_Wdl"		
		//Armed UAVs  2 sets
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		//MRAPs  2 sets
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		//Heavily Armed APCs or AA
		,"EF_B_MRAP_01_LAAD_MJTF_Wdl"
		,"EF_B_MRAP_01_LAAD_MJTF_Wdl"
		,"EF_B_AAV9_MJTF_Wdl"
		,"EF_B_AAV9_50mm_MJTF_Wdl"
		,"EF_B_AAV9_50mm_MJTF_Wdl"
		//Artillery
		,"EF_B_MBT_01_mlrs_MJTF_Wdl"
		//Tanks
		,"EF_B_MBT_01_cannon_MJTF_Wdl"
		,"EF_B_MBT_01_TUSK_MJTF_Wdl"];
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_Comms_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_mmg_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_mmg_MJTF_Wdl";
		};
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  3 sets
		"I_Quadbike_01_F"  //1
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		,"I_Quadbike_01_F"  //2
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		,"I_Quadbike_01_F"  //3
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		//Supply Trucks  1 set
		,"I_Truck_02_ammo_F"
		,"I_Truck_02_fuel_F"
		,"I_Truck_02_box_F"
		,"I_G_Van_01_fuel_F"
		,"I_G_Offroad_01_repair_F"
		//Armed Cars  2 sets
		,"I_G_Offroad_01_AT_F"  //1
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_AT_F"  //2
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		//Armed UAVs  2 sets
		,"I_UGV_01_rcws_F"  //1
		,"I_UGV_01_rcws_F"
		,"I_UGV_01_rcws_F"  //2
		,"I_UGV_01_rcws_F"
		//MRAPS  1 set
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		//Heavily Armed APCs or AA  1 set
		,"I_APC_Wheeled_03_cannon_F"
		,"I_APC_tracked_03_cannon_F"
		//Artillery  1 set
		,"I_Truck_02_MRL_F"
		//Tanks  1 set
		,"I_MBT_03_cannon_F"];
		if(A3E_Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		};
		if(A3E_Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_transport_F";
	    a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_vehicle_F";
	    };
    };
    default {//A lot (7-8)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"EF_B_MRAP_01_MJTF_Wdl"  //1
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Truck_01_mover_MJTF_Wdl"
		,"EF_B_Truck_01_box_MJTF_Wdl"
		,"EF_B_Truck_01_covered_MJTF_Wdl"
		,"EF_B_Truck_01_transport_MJTF_Wdl"
		,"EF_B_Truck_01_medical_MJTF_Wdl"
		,"EF_B_UGV_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"  //2
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_MRAP_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Quadbike_01_MJTF_Wdl"
		,"EF_B_Truck_01_mover_MJTF_Wdl"
		,"EF_B_Truck_01_box_MJTF_Wdl"
		,"EF_B_Truck_01_covered_MJTF_Wdl"
		,"EF_B_Truck_01_transport_MJTF_Wdl"
		,"EF_B_Truck_01_medical_MJTF_Wdl"
		,"EF_B_UGV_01_MJTF_Wdl"
		//Supply Trucks  1 set
		,"EF_B_Truck_01_ammo_MJTF_Wdl"
		,"EF_B_Truck_01_fuel_MJTF_Wdl"
		,"EF_B_Truck_01_Repair_MJTF_Wdl"
		,"EF_B_Truck_01_ammo_MJTF_Wdl"
		,"EF_B_Truck_01_fuel_MJTF_Wdl"
		,"EF_B_Truck_01_Repair_MJTF_Wdl"		
		//Armed UAVs  2 sets
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		,"EF_B_UGV_01_rcws_MJTF_Wdl"
		//MRAPs  2 sets
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_gmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		,"EF_B_MRAP_01_hmg_MJTF_Wdl"
		//Heavily Armed APCs or AA  2 sets
		,"EF_B_MRAP_01_LAAD_MJTF_Wdl"
		,"EF_B_MRAP_01_LAAD_MJTF_Wdl"
		,"EF_B_AAV9_MJTF_Wdl"
		,"EF_B_AAV9_MJTF_Wdl"
		,"EF_B_AAV9_50mm_MJTF_Wdl"
		,"EF_B_AAV9_50mm_MJTF_Wdl"
		,"EF_B_AAV9_MJTF_Wdl"
		,"EF_B_AAV9_50mm_MJTF_Wdl"
		//Artillery
		,"B_MBT_01_arty_F"
		//Tanks  2 sets
		,"EF_B_MBT_01_cannon_MJTF_Wdl"  //1
		,"EF_B_MBT_01_TUSK_MJTF_Wdl"
		,"EF_B_MBT_01_cannon_MJTF_Wdl"  //2
		,"EF_B_MBT_01_TUSK_MJTF_Wdl"];
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_Comms_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_mmg_MJTF_Wdl";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "EF_B_Pickup_mmg_MJTF_Wdl";
		};
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  3 sets
		"I_Quadbike_01_F"  //1
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		,"I_Quadbike_01_F"  //2
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		,"I_Quadbike_01_F"  //3
		,"I_MRAP_03_F"
		,"I_Truck_02_medical_F"
		,"I_Truck_02_transport_F"
		,"I_Truck_02_covered_F"
		,"I_G_Offroad_01_F"
		,"I_G_Quadbike_01_F"
		,"I_G_Van_01_transport_F"
		,"I_UGV_01_F"
		//Supply Trucks  1 set
		,"I_Truck_02_ammo_F"
		,"I_Truck_02_fuel_F"
		,"I_Truck_02_box_F"
		,"I_G_Van_01_fuel_F"
		,"I_G_Offroad_01_repair_F"
		//Armed Cars  2 sets
		,"I_G_Offroad_01_AT_F"  //1
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_AT_F"  //2
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_AT_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		,"I_G_Offroad_01_armed_F"
		//Armed UAVs  2 sets
		,"I_UGV_01_rcws_F"  //1
		,"I_UGV_01_rcws_F"
		,"I_UGV_01_rcws_F"  //2
		,"I_UGV_01_rcws_F"
		//MRAPS  1 set
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		//Heavily Armed APCs or AA  2 sets
		,"I_APC_Wheeled_03_cannon_F"
		,"I_APC_tracked_03_cannon_F"
		,"I_APC_Wheeled_03_cannon_F"
		,"I_APC_tracked_03_cannon_F"
		//Artillery  1 set
		,"I_Truck_02_MRL_F"
		//Tanks  2 sets
		,"I_MBT_03_cannon_F"
		,"I_MBT_03_cannon_F"];
		if(A3E_Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		};
		if(A3E_Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_transport_F";
	    a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "I_G_Van_02_vehicle_F";
	    };
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"EF_B_Marine_Eng_Wdl"
	,"EF_B_Marine_Medic_Wdl"
	,"EF_B_Marine_Medic_Wdl"
	,"EF_B_Marine_Medic_Wdl"
	,"EF_B_Marine_AA_Wdl"
	,"EF_B_Marine_AA_Wdl"
	,"EF_B_Marine_AR_Wdl"
	,"EF_B_Marine_AR_Wdl"
	,"EF_B_Marine_AR_Wdl"
	,"EF_B_Marine_AT_Wdl"
	,"EF_B_Marine_AT_Wdl"
	,"EF_B_Marine_Exp_Wdl"
	,"EF_B_Marine_R_Wdl"
	,"EF_B_Marine_R_Wdl"
	,"EF_B_Marine_R_Wdl"
	,"EF_B_Marine_GL_Wdl"
	,"EF_B_Marine_GL_Wdl"
	,"EF_B_Marine_GL_Wdl"
	,"EF_B_Marine_GL_Wdl"
	,"EF_B_Marine_LAT_Wdl"
	,"EF_B_Marine_LAT_Wdl"
	,"EF_B_Marine_Light_Wdl"
	,"EF_B_Marine_Light_Wdl"
	,"EF_B_Marine_Light_Wdl"
	,"EF_B_Marine_Mark_Wdl"
	,"EF_B_Marine_Mark_Wdl"
	,"EF_B_Marine_Mark_Wdl"
	,"EF_B_Marine_Repair_Wdl"
	,"EF_B_Marine_Repair_Wdl"
	,"EF_B_Marine_Officer_Wdl"
	,"EF_B_Marine_UAV_Wdl"
	,"EF_B_Marine_UAV_Wdl"
	,"EF_B_Marine_JTAC_Wdl"
	,"EF_B_Marine_AMG_Wdl"
	,"EF_B_Marine_AMort_Wdl"
	,"EF_B_Marine_AAA_Wdl"
	,"EF_B_Marine_AAT_Wdl"
	,"EF_B_Marine_GMG_Wdl"
	,"EF_B_Marine_HMG_Wdl"
	,"EF_B_Marine_Mort_Wdl"
	,"EF_B_Marine_SL_Wdl"
	,"EF_B_Marine_TL_Wdl"
	,"EF_B_Marine_LAT2_Wdl"
	,"EF_B_Marine_LAT2_Wdl"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"I_engineer_F"
	,"I_medic_F"
	,"I_medic_F"
	,"I_medic_F"
	,"I_Soldier_A_F"
	,"I_Soldier_A_F"
	,"I_Soldier_A_F"
	,"I_Soldier_AA_F"
	,"I_Soldier_AA_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AT_F"
	,"I_Soldier_exp_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_LAT_F"
	,"I_Soldier_LAT_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_M_F"
	,"I_Soldier_M_F"
	,"I_Soldier_M_F"
	,"I_Soldier_repair_F"
	,"I_officer_F"
	,"I_soldier_UAV_F"
	,"I_soldier_UAV_F"
	,"I_Soldier_AAR_F"
	,"I_support_AMG_F"
	,"I_support_AMort_F"
	,"I_Soldier_AAA_F"
	,"I_Soldier_AAT_F"
	,"I_support_GMG_F"
	,"I_support_MG_F"
	,"I_support_Mort_F"
	,"I_Soldier_LAT2_F"
	,"I_Soldier_LAT2_F"
	,"I_Spotter_F"
	,"I_Sniper_F"
	,"I_Soldier_SL_F"
	,"I_Soldier_TL_F"];
	if(A3E_Param_UseDLCLaws==1) then {
		a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_mine_F";
		a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_UAV_06_F";
		a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_UAV_06_medical_F";
	};
a3e_arr_recon_InfantryTypes = [
	"EF_B_Marine_Recon_Exp_Wdl"
	,"EF_B_Marine_Recon_JTAC_Wdl"
	,"EF_B_Marine_Recon_M_Wdl"
	,"EF_B_Marine_Recon_Medic_Wdl"
	,"EF_B_Marine_Recon_Wdl"
	,"EF_B_Marine_Recon_Wdl"
	,"EF_B_Marine_Recon_Wdl"
	,"EF_B_Marine_Recon_LAT_Wdl"
	,"EF_B_Marine_Recon_TL_Wdl"];
a3e_arr_recon_I_InfantryTypes = [
	"I_G_Soldier_A_F"
	,"I_G_Soldier_LAT_F"
	,"I_G_Soldier_M_F"
	,"I_G_Soldier_GL_F"
	,"I_G_Soldier_exp_F"
	,"I_G_engineer_F"
	,"I_G_medic_F"
	,"I_G_Soldier_AR_F"
	,"I_G_Soldier_TL_F"
	,"I_G_Soldier_SL_F"
	,"I_G_Soldier_lite_F"
	,"I_G_Soldier_F"
	,"I_G_Soldier_LAT2_F"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"EF_B_MRAP_01_hmg_MJTF_Wdl"
	,"EF_B_MRAP_01_hmg_MJTF_Wdl"
	,"EF_B_MRAP_01_gmg_MJTF_Wdl"
	,"EF_B_MRAP_01_AT_MJTF_Wdl"
	,"EF_B_MRAP_01_FSV_MJTF_Wdl"
	,"EF_B_UGV_01_rcws_MJTF_Wdl"];
	
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"I_MRAP_03_hmg_F"
	,"I_MRAP_03_hmg_F"
	,"I_MRAP_03_gmg_F"
	,"I_UGV_01_rcws_F"];
	if(A3E_Param_UseDLCTanks==1) then {
		a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_LT_01_AT_F";
		a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_LT_01_cannon_F";	
	};

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"EF_B_Truck_01_transport_MJTF_Wdl"
	,"EF_B_Truck_01_covered_MJTF_Wdl"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"I_Truck_02_transport_F"
	,"I_Truck_02_covered"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"EF_B_MRAP_01_FSV_MJTF_Wdl"
	,"EF_B_UGV_01_rcws_MJTF_Wdl"
	,"EF_B_AAV9_MJTF_Wdl"];


// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"EF_B_AAV9_MJTF_Wdl"
	,"EF_B_AAV9_MJTF_Wdl"
	,"EF_B_AAV9_50mm_MJTF_Wdl"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"EF_B_MBT_01_TUSK_MJTF_Wdl"
	,"EF_B_MRAP_01_LAAD_MJTF_Wdl"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"EF_B_HMG_01_high_MJTF_Wdl"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"EF_B_MRAP_01_MJTF_Wdl"
	,"EF_B_MRAP_01_MJTF_Wdl"
	,"EF_B_Quadbike_01_MJTF_Wdl"
	,"EF_B_Quadbike_01_MJTF_Wdl"
	,"EF_B_Quadbike_01_MJTF_Wdl"
	,"EF_B_MRAP_01_gmg_MJTF_Wdl"
	,"EF_B_MRAP_01_hmg_MJTF_Wdl"
	,"EF_B_Truck_01_transport_MJTF_Wdl"
	,"EF_B_Truck_01_covered_MJTF_Wdl"
	,"EF_B_Truck_01_ammo_MJTF_Wdl"
	,"EF_B_Truck_01_fuel_MJTF_Wdl"
	,"EF_B_Truck_01_medical_MJTF_Wdl"
	,"EF_B_Truck_01_Repair_MJTF_Wdl"
	,"EF_B_Truck_01_box_MJTF_Wdl"
	,"EF_B_Truck_01_mover_MJTF_Wdl"
	,"EF_B_MRAP_01_FSV_MJTF_Wdl"
	,"EF_B_MRAP_01_AT_MJTF_Wdl"
	,"EF_B_MRAP_01_LAAD_MJTF_Wdl"
	,"EF_B_UGV_01_rcws_MJTF_Wdl"];
	
// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_SUV_01_F"
	,"C_Truck_02_covered_F"];
	if(A3E_Param_UseDLCApex==1) then {
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};
	if(A3E_Param_UseDLCContact==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_01_covered_F";
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"EF_B_HMG_01_high_MJTF_Wdl"
	,"EF_B_GMG_01_MJTF_Wdl"
	,"EF_B_HMG_01_MJTF_Wdl"
	,"EF_B_Static_AT_MJTF_Wdl"
	,"EF_B_Static_AA_MJTF_Wdl"];
	
	
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"EF_B_Heli_Attack_01_dynamicLoadout_MJTF_Wdl"
	,"EF_B_AH99J_MJTF_Wdl"
	,"EF_B_AH99J_MJTF_Wdl"];
a3e_arr_O_transport_heli = [
	"EF_B_Heli_Transport_01_MJTF_Wdl"];
a3e_arr_O_pilots = [
	"B_Helipilot_F"];
a3e_arr_I_transport_heli = [
	"I_Heli_Transport_02_F"];
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
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_hgun_P07_coy", 50, 4, 8, ["16Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_01_F", 10, 4, 8, ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mxar_coy", 100, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mx_coy", 100, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mxc_coy", 50, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag","EF_30Rnd_65x39_caseless_coy_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_MXC_Black_F", 50, 2, 4, ["30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_black_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mx_gl_coy", 75, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag", "EF_30Rnd_65x39_caseless_coy_mag_Tracer", "1Rnd_HE_Grenade_shell"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mxar_gl_coy", 75, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag", "3Rnd_HE_Grenade_shell"], 4];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_PDW2000_F", 20, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_ACPC2_F", 20, 4, 8, ["9Rnd_45ACP_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20_F", 50, 2, 4, ["30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20_GL_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20C_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_TRG20_F", 10, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_TRG21_F", 10, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_TRG21_GL_F", 10, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mxm_coy", 50, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag", "EF_30Rnd_65x39_caseless_coy_mag_Tracer"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mxm_MBS_LP_BI", 50, 2, 4, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mx_sw_coy", 50, 2, 4, ["EF_100Rnd_65x39_caseless_coy_mag","EF_100Rnd_65x39_caseless_coy_mag_Tracer"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mxar_black", 50, 2, 4, ["EF_100Rnd_65x39_caseless_coy_mag"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_LRR_camo_LRPS_F", 10, 1, 1, ["7Rnd_408_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_LRR_LRPS_F", 10, 1, 1, ["7Rnd_408_Mag"], 9];
if(A3E_Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_02_sand_F", 10, 2, 4, ["130Rnd_338_Mag"], 6];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_02_camo_F", 10, 2, 4, ["130Rnd_338_Mag"], 6];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_02_black_F", 10, 2, 4, ["130Rnd_338_Mag"], 6];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_02_camo_AMS_LP_F", 30, 2, 4, ["10Rnd_338_Mag"], 10];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_02_sniper_AMS_LP_S_F", 10, 2, 4, ["10Rnd_338_Mag"], 10];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_03_AMS_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 12];
};
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_Mk200_F", 20, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_EBR_MRCO_LP_BI_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 9];
if(A3E_Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_06_camo_khs_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 10];
};


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_NLAW_F", 50, 3, 5, ["NLAW_F"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["EF_launch_B_Titan_Coy", 50, 1, 1, ["Titan_AA"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_short_F", 50, 1, 1, ["Titan_AP", "Titan_AT"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_MRAWS_sand_F", 50, 1, 1, ["MRAWS_HEAT_F", "MRAWS_HE_F"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_NLAW_F", 50, 3, 5, ["NLAW_F"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_MRAWS_olive_rail_F", 50, 1, 1, ["MRAWS_HEAT_F", "MRAWS_HE_F"], 2];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["EF_launch_B_Titan_Coy", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_TacticalPack_mcamo"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG_Tan", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG_T_Tan", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG_T", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 5, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight_pistol", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["EF_acc_pointer_IR_coy", 25, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_acp", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 1, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ef_snds_mxar", 1, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ef_snds_mxar_coy", 1, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ef_snds_mxar_sand", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ef_snds_mxar_khk", 0, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_L", 1, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_M", 1, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Aco", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Aco_smg", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn", 2, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn_smg", 2, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Arco", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_remote", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_coy", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_remote_coy", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_sand", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_remote_sand", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_khk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_remote_khk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_Holosight_smg_coy", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_Holosight_coy", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_coy", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_khk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_sand", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Hamr", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_MRCO", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_NVS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_SOS", 1, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Yorris", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_pistol_coy", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_pistol", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_pistol_khk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_pistol_sand", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_LRPS", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_AMS", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_snd", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 1, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_oli", 1, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["ef_hgun_P07_coy", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_P07_snds_F", "30Rnd_9x21_Mag", 11];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_snds_F", "30Rnd_9x21_Mag", 9];
a3e_arr_CivilianCarWeapons pushback ["hgun_ACPC2_F", "9Rnd_45ACP_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["arifle_MXM_Hamr_pointer_F", "EF_30Rnd_65x39_caseless_coy_mag_Tracer", 8];
a3e_arr_CivilianCarWeapons pushback ["arifle_MX_Hamr_pointer_F", "EF_30Rnd_65x39_caseless_coy_mag_Tracer", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_MXM_SOS_pointer_F", "EF_30Rnd_65x39_caseless_coy_mag_Tracer", 7];
a3e_arr_CivilianCarWeapons pushback ["arifle_TRG21_F", "30Rnd_556x45_Stanag", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_Mk20_GL_ACO_F", "UGL_FlareWhite_F", 8];
a3e_arr_CivilianCarWeapons pushback ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5];
if(A3E_Param_UseDLCMarksmen==1) then {
	a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
};
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_CivilianCarWeapons pushback ["hgun_DEagle_RF", "7Rnd_50AE_Mag_RF", 4];
	a3e_arr_CivilianCarWeapons pushback ["hgun_DEagle_gold_RF", "7Rnd_50AE_Mag_RF", 4];
	a3e_arr_CivilianCarWeapons pushback ["srifle_h6_gold_rf", "20Rnd_556x45_AP_Stanag_Tan_RF", 8];
};
a3e_arr_CivilianCarWeapons pushback ["launch_MRAWS_sand_F", "MRAWS_HEAT_F", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"ef_optic_Holosight_coy"
	,"ef_optic_Holosight_coy"
	,"ef_optic_Holosight_coy"
	,"ef_optic_microsight_coy"
	,"ef_optic_microsight_coy"
	,"ef_optic_microsight_coy"
	,"ef_optic_mbs_coy"
	,"ef_optic_mbs_coy"
	,"ef_optic_mbs_coy"
	,"optic_Aco"
	,"optic_ACO_grn"
	,"optic_Arco"
	,"optic_Hamr"
	,"optic_MRCO"
	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [
	"ef_optic_Holosight_smg_coy"
	,"optic_Holosight_smg"];
a3e_arr_Scopes_Sniper = [
	"optic_SOS"
	,"optic_DMS"
	,"optic_LRPS"
	,"optic_AMS"
	,"optic_AMS_khk"
	,"ef_optic_mbs_remote_coy"
	,"ef_optic_mbs_remote_coy"
	,"ef_optic_mbs_remote_coy"
	,"optic_KHS_blk"
	,"optic_KHS_old"];
a3e_arr_NightScopes = [
	"optic_NVS"];
a3e_arr_TWSScopes = [
	"optic_Nightstalker"
	,"optic_tws"
	,"optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"bipod_02_F_blk"
	,"bipod_02_F_tan"
	,"bipod_03_F_blk"];

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
    "O_Heli_Attack_02_dynamicLoadout_F"
    ,"O_Heli_Attack_02_dynamicLoadout_F"];
	if(A3E_Param_UseDLCHelis==1) then {
	a3e_arr_extraction_chopper pushback "O_Heli_Transport_04_bench_F";
	};
a3e_arr_extraction_chopper_escort = [
	"O_Heli_Attack_02_dynamicLoadout_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"EF_O_CombatBoat_Unarmed_OPF"
	,"EF_O_CombatBoat_HMG_OPF"];
a3e_arr_extraction_boat_escort = [
	"EF_O_CombatBoat_HMG_OPF"
	,"EF_O_CombatBoat_AT_OPF"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"O_Truck_03_transport_F",	//13
	"O_Truck_03_covered_F",	//13
	"O_APC_Tracked_02_cannon_F",	//8
	"O_APC_Wheeled_02_rcws_v2_F"];	//8
	if(A3E_Param_UseDLCApex==1) then {
	a3e_arr_extraction_car pushback "O_LSV_02_unarmed_F";	//6
	};
a3e_arr_extraction_car_escort = [
	"O_APC_Tracked_02_AA_F",
	"O_APC_Wheeled_02_rcws_v2_F",
	"O_MBT_02_cannon_F",
	"O_MBT_02_cannon_F"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"EF_B_UAV_01_MJTF_Wdl"
	,"EF_B_UAV_02_dynamicLoadout_MJTF_Wdl"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"I_Heli_light_03_unarmed_F"];
a3e_arr_searchChopperHard = [
	"I_Heli_light_03_F"];
a3e_arr_searchChopper_pilot = [
	"I_helipilot_F"];
a3e_arr_searchChopper_crew = [
	"I_helicrew_F"];

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
	"EF_B_Boat_Armed_01_minigun_MJTF_Wdl"
	,"EF_B_CombatBoat_HMG_MJTF_Wdl"
	,"EF_B_CombatBoat_AT_MJTF_Wdl"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "EF_B_supplyCrate_MJTF";
a3e_additional_weapon_box_2 = "Box_NATO_WpsSpecial_F";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"EF_B_Mortar_01_MJTF_Wdl"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"B_Plane_CAS_01_dynamicLoadout_F"
	,"I_Plane_Fighter_03_CAS_F"
	,"B_Plane_CAS_01_Cluster_F"
	,"B_Plane_Fighter_01_Cluster_F"
	,"I_Plane_Fighter_04_Cluster_F"
	,"I_Plane_Fighter_03_Cluster_F"];

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
	"Land_Wreck_Heli_Attack_02_F"
	,"Land_Wreck_Heli_02_Wreck_01_F"];
a3e_arr_CrashSiteCrew = [
	"O_helipilot_F"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_MBT_04_F"];
a3e_arr_CrashSiteCrewCar = [
	"O_crew_F"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["SMG_02_ACO_F", 50, 1, 2, ["30Rnd_9x21_Mag_SMG_02"], 8];
a3e_arr_CrashSiteWeapons pushback ["launch_RPG32_F", 25, 1, 2, ["RPG32_F","RPG32_HE_F"], 3];
a3e_arr_CrashSiteWeapons pushback ["launch_O_Vorona_brown_F", 10, 1, 1, ["Vorona_HEAT","Vorona_HE"], 2];
a3e_arr_CrashSiteWeapons pushback ["arifle_Katiba_C_F", 75, 2, 4, ["30Rnd_65x39_caseless_green"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_Katiba_F", 75, 2, 4, ["30Rnd_65x39_caseless_green"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_Katiba_GL_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "1Rnd_HE_Grenade_shell"], 4];
a3e_arr_CrashSiteWeapons pushback ["LMG_Zafir_F", 60, 1, 3, ["150Rnd_762x54_Box_Tracer"], 4];
a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_01_DMS_F", 40, 1, 2, ["10Rnd_762x54_Mag"], 8];
if(A3E_Param_UseDLCMarksmen==1) then {
	a3e_arr_CrashSiteWeapons pushback ["MMG_01_hex_F", 30, 2, 4, ["150Rnd_93x64_Mag"], 6];
	a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_04_DMS_F", 10, 2, 4, ["10Rnd_127x54_Mag"], 12];
	a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_05_KHS_LP_F", 10, 2, 4, ["10Rnd_93x64_DMR_05_Mag"], 12];
};
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["optic_Hamr", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Aco", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Aco_smg", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Holosight", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_SOS", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["muzzle_snds_H", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["O_UavTerminal", 50, 1, 1];