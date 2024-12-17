/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;	//player side, WS SFIA
A3E_VAR_Side_Opfor = west;	//enemy side, WS NATO Desert
A3E_VAR_Side_Ind = resistance;	//EF MJTF Desert

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
A3E_VAR_Flag_Ind = "\ef\ef_data\data\Flag_29thMEU_CO.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"EF_B_Marine_Light_Des"
	,"EF_B_Marine_Officer_Des"
	,"EF_B_Marine_R_Des"
	,"EF_B_Marine_Light_Des"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_snds_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_P07_blk_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_P07_blk_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_P07_coy","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_P07_snds_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_P07_snds_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_Pistol_heavy_01_coy","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_Pistol_heavy_01_coy","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["ef_hgun_Pistol_heavy_01_coy","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_01_MRD_F","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_01_snds_F","11Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_Yorris_F","6Rnd_45ACP_Cylinder"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["hgun_PDW2000_F","30Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["SMG_03C_khaki","50Rnd_570x28_SMG_03"];
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_Glock19_Tan_RF","17Rnd_9x19_Mag_RF"];
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_Glock19_auto_Tan_RF","33Rnd_9x19_Red_Mag_RF"];
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_DEagle_bronze_RF","7Rnd_50AE_Mag_RF"];
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_DEagle_classic_RF","7Rnd_50AE_Mag_RF"];
	a3e_arr_PrisonBackpackWeapons pushback ["hgun_DEagle_camo_RF","7Rnd_50AE_Mag_RF"];
};

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_Quadbike_01_F"
	,"C_Quadbike_01_F"
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
	,"C_Truck_02_box_F"
	//Western Sahara
	,"C_IDAP_Offroad_lxWS"
	,"C_IDAP_Truck_02_cargo_lxWS"
	,"C_IDAP_Truck_02_flatbed_lxWS"
	,"C_IDAP_Truck_02_box_lxWS"
	,"C_Offroad_lxWS"
	,"C_Offroad_lxWS"
	,"C_Offroad_lxWS"
	,"C_Offroad_lxWS"
	,"C_Offroad_lxWS"
	,"C_Offroad_lxWS"
	,"C_Truck_02_cargo_lxWS"
	,"C_Truck_02_flatbed_lxWS"
	,"C_Truck_02_racing_lxWS"];
	if(A3E_Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_service_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Van_02_transport_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_IDAP_Truck_02_water_F";
	};
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Pickup_rf";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Pickup_covered_rf";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Pickup_repair_rf";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Truck_01_FFT_rf";	//HEMMT Firetruck
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Truck_03_water_rf";	//Tempest Water
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_IDAP_Pickup_rf";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_IDAP_Pickup_covered_rf";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_IDAP_Pickup_fuel_rf";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_IDAP_Pickup_water_rf";
	};
	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"B_D_MRAP_01_lxWS"  //1
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Truck_01_mover_lxWS"
		,"B_D_Truck_01_box_lxWS"
		,"B_D_Truck_01_cargo_lxWS"
		,"B_D_Truck_01_flatbed_lxWS"
		,"B_D_Truck_01_covered_lxWS"
		,"B_D_Truck_01_transport_lxWS"
		,"B_D_Truck_01_medical_lxWS"
		,"B_D_UGV_01_lxWS"
		,"B_D_MRAP_01_lxWS"  //2
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Truck_01_mover_lxWS"
		,"B_D_Truck_01_box_lxWS"
		,"B_D_Truck_01_cargo_lxWS"
		,"B_D_Truck_01_flatbed_lxWS"
		,"B_D_Truck_01_covered_lxWS"
		,"B_D_Truck_01_transport_lxWS"
		,"B_D_Truck_01_medical_lxWS"
		,"B_D_UGV_01_lxWS"
		//Supply Trucks  1 set
		,"B_D_Truck_01_ammo_lxWS"
		,"B_D_Truck_01_fuel_lxWS"
		,"B_D_Truck_01_Repair_lxWS"
		,"B_D_Truck_01_ammo_lxWS"
		,"B_D_Truck_01_fuel_lxWS"
		,"B_D_Truck_01_Repair_lxWS"		
		//Armed UAVs  1 set
		,"B_D_UGV_01_rcws_lxWS"
		,"B_D_UGV_01_rcws_lxWS"
		//MRAPs  1 set
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"EF_B_MRAP_01_FSV_NATO_Des"
		,"EF_B_MRAP_01_AT_NATO_Des"
		//Heavily Armed APCs or AA
		,"EF_B_MRAP_01_LAAD_NATO_Des"
		,"B_D_APC_Tracked_01_aa_lxWS"
		,"B_D_APC_Wheeled_01_cannon_lxWS"
		,"B_D_APC_Wheeled_01_atgm_lxWS"
		,"B_D_APC_Wheeled_01_command_lxWS"
		,"B_D_APC_Wheeled_01_mortar_lxWS"
		,"B_D_APC_Tracked_01_CRV_lxWS"
		,"B_D_APC_Tracked_01_rcws_lxWS"
		//Artillery
		,"B_D_MBT_01_arty_lxWS"
		,"B_D_MBT_01_mlrs_lxWS"
		//Tanks
		,"B_D_MBT_01_cannon_lxWS"
		,"B_D_MBT_01_TUSK_lxWS"];
		if(A3E_Param_UseDLCApex==1) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
		};
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_aat_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_Comms_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_mmg_rf";
		};
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  2 sets
		"EF_B_MRAP_01_MJTF_Des"  //1
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Truck_01_mover_MJTF_Des"
		,"EF_B_Truck_01_box_MJTF_Des"
		,"EF_B_Truck_01_covered_MJTF_Des"
		,"EF_B_Truck_01_transport_MJTF_Des"
		,"EF_B_Truck_01_medical_MJTF_Des"
		,"EF_B_UGV_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"  //2
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Truck_01_mover_MJTF_Des"
		,"EF_B_Truck_01_box_MJTF_Des"
		,"EF_B_Truck_01_covered_MJTF_Des"
		,"EF_B_Truck_01_transport_MJTF_Des"
		,"EF_B_Truck_01_medical_MJTF_Des"
		,"EF_B_UGV_01_MJTF_Des"
		//Supply Trucks  1 set
		,"EF_B_Truck_01_ammo_MJTF_Des"
		,"EF_B_Truck_01_fuel_MJTF_Des"
		,"EF_B_Truck_01_Repair_MJTF_Des"
		,"EF_B_Truck_01_ammo_MJTF_Des"
		,"EF_B_Truck_01_fuel_MJTF_Des"
		,"EF_B_Truck_01_Repair_MJTF_Des"		
		//Armed UAVs  1 set
		,"EF_B_UGV_01_rcws_MJTF_Des"
		,"EF_B_UGV_01_rcws_MJTF_Des"
		//MRAPs  1 set
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_AT_MJTF_Des"
		,"EF_B_MRAP_01_AT_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_FSV_MJTF_Des"
		,"EF_B_MRAP_01_FSV_MJTF_Des"
		//Heavily Armed APCs or AA
		,"EF_B_MRAP_01_LAAD_MJTF_Des"
		,"EF_B_MRAP_01_LAAD_MJTF_Des"
		,"EF_B_AAV9_MJTF_Des"
		,"EF_B_AAV9_50mm_MJTF_Des"
		//Artillery
		,"EF_B_MBT_01_mlrs_MJTF_Des"
		//Tanks
		,"EF_B_MBT_01_cannon_MJTF_Des"
		,"EF_B_MBT_01_TUSK_MJTF_Des"];
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_Comms_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_mmg_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_mmg_MJTF_Des";
		};
    };
    case 2: {//Some (4-6)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"B_D_MRAP_01_lxWS"  //1
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Truck_01_mover_lxWS"
		,"B_D_Truck_01_box_lxWS"
		,"B_D_Truck_01_cargo_lxWS"
		,"B_D_Truck_01_flatbed_lxWS"
		,"B_D_Truck_01_covered_lxWS"
		,"B_D_Truck_01_transport_lxWS"
		,"B_D_Truck_01_medical_lxWS"
		,"B_D_UGV_01_lxWS"
		,"B_D_MRAP_01_lxWS"  //2
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Truck_01_mover_lxWS"
		,"B_D_Truck_01_box_lxWS"
		,"B_D_Truck_01_cargo_lxWS"
		,"B_D_Truck_01_flatbed_lxWS"
		,"B_D_Truck_01_covered_lxWS"
		,"B_D_Truck_01_transport_lxWS"
		,"B_D_Truck_01_medical_lxWS"
		,"B_D_UGV_01_lxWS"
		//Supply Trucks  1 set
		,"B_D_Truck_01_ammo_lxWS"
		,"B_D_Truck_01_fuel_lxWS"
		,"B_D_Truck_01_Repair_lxWS"
		,"B_D_Truck_01_ammo_lxWS"
		,"B_D_Truck_01_fuel_lxWS"
		,"B_D_Truck_01_Repair_lxWS"		
		//Armed UAVs  2 sets
		,"B_D_UGV_01_rcws_lxWS"
		,"B_D_UGV_01_rcws_lxWS"
		,"B_D_UGV_01_rcws_lxWS"
		,"B_D_UGV_01_rcws_lxWS"
		//MRAPs  2 sets
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"EF_B_MRAP_01_FSV_NATO_Des"
		,"EF_B_MRAP_01_AT_NATO_Des"
		//Heavily Armed APCs or AA
		,"EF_B_MRAP_01_LAAD_NATO_Des"
		,"B_D_APC_Tracked_01_aa_lxWS"
		,"B_D_APC_Wheeled_01_cannon_lxWS"
		,"B_D_APC_Wheeled_01_atgm_lxWS"
		,"B_D_APC_Wheeled_01_command_lxWS"
		,"B_D_APC_Wheeled_01_mortar_lxWS"
		,"B_D_APC_Tracked_01_CRV_lxWS"
		,"B_D_APC_Tracked_01_rcws_lxWS"
		//Artillery
		,"B_D_MBT_01_arty_lxWS"
		,"B_D_MBT_01_mlrs_lxWS"
		//Tanks
		,"B_D_MBT_01_cannon_lxWS"
		,"B_D_MBT_01_TUSK_lxWS"];
		if(A3E_Param_UseDLCApex==1) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
		};
		if(A3E_Param_UseDLCTanks==1) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_AFV_Wheeled_01_cannon_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_AFV_Wheeled_01_up_cannon_F";
		};
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_aat_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_aat_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_Comms_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_mmg_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_mmg_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_mmg_rf";
		};
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  2 sets
		"EF_B_MRAP_01_MJTF_Des"  //1
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Truck_01_mover_MJTF_Des"
		,"EF_B_Truck_01_box_MJTF_Des"
		,"EF_B_Truck_01_covered_MJTF_Des"
		,"EF_B_Truck_01_transport_MJTF_Des"
		,"EF_B_Truck_01_medical_MJTF_Des"
		,"EF_B_UGV_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"  //2
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Truck_01_mover_MJTF_Des"
		,"EF_B_Truck_01_box_MJTF_Des"
		,"EF_B_Truck_01_covered_MJTF_Des"
		,"EF_B_Truck_01_transport_MJTF_Des"
		,"EF_B_Truck_01_medical_MJTF_Des"
		,"EF_B_UGV_01_MJTF_Des"
		//Supply Trucks  1 set
		,"EF_B_Truck_01_ammo_MJTF_Des"
		,"EF_B_Truck_01_fuel_MJTF_Des"
		,"EF_B_Truck_01_Repair_MJTF_Des"
		,"EF_B_Truck_01_ammo_MJTF_Des"
		,"EF_B_Truck_01_fuel_MJTF_Des"
		,"EF_B_Truck_01_Repair_MJTF_Des"		
		//Armed UAVs  2 sets
		,"EF_B_UGV_01_rcws_MJTF_Des"
		,"EF_B_UGV_01_rcws_MJTF_Des"
		,"EF_B_UGV_01_rcws_MJTF_Des"
		,"EF_B_UGV_01_rcws_MJTF_Des"
		//MRAPs  2 sets
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		//Heavily Armed APCs or AA
		,"EF_B_MRAP_01_LAAD_MJTF_Des"
		,"EF_B_MRAP_01_LAAD_MJTF_Des"
		,"EF_B_AAV9_MJTF_Des"
		,"EF_B_AAV9_50mm_MJTF_Des"
		,"EF_B_AAV9_50mm_MJTF_Des"
		//Artillery
		,"EF_B_MBT_01_mlrs_MJTF_Des"
		//Tanks
		,"EF_B_MBT_01_cannon_MJTF_Des"
		,"EF_B_MBT_01_TUSK_MJTF_Des"];
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_Comms_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_mmg_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_mmg_MJTF_Des";
		};
    };
    default {//A lot (7-8)
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs  2 sets
		"B_D_MRAP_01_lxWS"  //1
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Truck_01_mover_lxWS"
		,"B_D_Truck_01_box_lxWS"
		,"B_D_Truck_01_cargo_lxWS"
		,"B_D_Truck_01_flatbed_lxWS"
		,"B_D_Truck_01_covered_lxWS"
		,"B_D_Truck_01_transport_lxWS"
		,"B_D_Truck_01_medical_lxWS"
		,"B_D_UGV_01_lxWS"
		,"B_D_MRAP_01_lxWS"  //2
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_MRAP_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Quadbike_01_lxWS"
		,"B_D_Truck_01_mover_lxWS"
		,"B_D_Truck_01_box_lxWS"
		,"B_D_Truck_01_cargo_lxWS"
		,"B_D_Truck_01_flatbed_lxWS"
		,"B_D_Truck_01_covered_lxWS"
		,"B_D_Truck_01_transport_lxWS"
		,"B_D_Truck_01_medical_lxWS"
		,"B_D_UGV_01_lxWS"
		//Supply Trucks  1 set
		,"B_D_Truck_01_ammo_lxWS"
		,"B_D_Truck_01_fuel_lxWS"
		,"B_D_Truck_01_Repair_lxWS"
		,"B_D_Truck_01_ammo_lxWS"
		,"B_D_Truck_01_fuel_lxWS"
		,"B_D_Truck_01_Repair_lxWS"		
		//Armed UAVs  2 sets
		,"B_D_UGV_01_rcws_lxWS"
		,"B_D_UGV_01_rcws_lxWS"
		,"B_D_UGV_01_rcws_lxWS"
		,"B_D_UGV_01_rcws_lxWS"
		//MRAPs  2 sets
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_gmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"B_D_MRAP_01_hmg_lxWS"
		,"EF_B_MRAP_01_FSV_NATO_Des"
		,"EF_B_MRAP_01_AT_NATO_Des"
		//Heavily Armed APCs or AA 2 sets
		,"EF_B_MRAP_01_LAAD_NATO_Des"
		,"B_D_APC_Tracked_01_aa_lxWS"
		,"B_D_APC_Wheeled_01_cannon_lxWS"
		,"B_D_APC_Wheeled_01_atgm_lxWS"
		,"B_D_APC_Wheeled_01_command_lxWS"
		,"B_D_APC_Wheeled_01_mortar_lxWS"
		,"B_D_APC_Tracked_01_CRV_lxWS"
		,"B_D_APC_Tracked_01_rcws_lxWS"
		,"B_D_APC_Tracked_01_aa_lxWS"
		,"B_D_APC_Wheeled_01_cannon_lxWS"
		,"B_D_APC_Wheeled_01_atgm_lxWS"
		,"B_D_APC_Wheeled_01_command_lxWS"
		,"B_D_APC_Wheeled_01_mortar_lxWS"
		,"B_D_APC_Tracked_01_CRV_lxWS"
		,"B_D_APC_Tracked_01_rcws_lxWS"
		//Artillery
		,"B_D_MBT_01_arty_lxWS"
		//Tanks  2 sets
		,"B_D_MBT_01_cannon_lxWS"  //1
		,"B_D_MBT_01_TUSK_lxWS"
		,"B_D_MBT_01_cannon_lxWS"  //2
		,"B_D_MBT_01_TUSK_lxWS"];
		if(A3E_Param_UseDLCApex==1) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_unarmed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_armed_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_LSV_01_AT_F";
		};
		if(A3E_Param_UseDLCTanks==1) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_AFV_Wheeled_01_cannon_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_AFV_Wheeled_01_up_cannon_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_AFV_Wheeled_01_cannon_F";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_AFV_Wheeled_01_up_cannon_F";
		};
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_aat_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_aat_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_Comms_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_mmg_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_mmg_rf";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "B_Pickup_mmg_rf";
		};
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		//Unarmed Cars/UAVs  2 sets
		"EF_B_MRAP_01_MJTF_Des"  //1
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Truck_01_mover_MJTF_Des"
		,"EF_B_Truck_01_box_MJTF_Des"
		,"EF_B_Truck_01_covered_MJTF_Des"
		,"EF_B_Truck_01_transport_MJTF_Des"
		,"EF_B_Truck_01_medical_MJTF_Des"
		,"EF_B_UGV_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"  //2
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_MRAP_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Quadbike_01_MJTF_Des"
		,"EF_B_Truck_01_mover_MJTF_Des"
		,"EF_B_Truck_01_box_MJTF_Des"
		,"EF_B_Truck_01_covered_MJTF_Des"
		,"EF_B_Truck_01_transport_MJTF_Des"
		,"EF_B_Truck_01_medical_MJTF_Des"
		,"EF_B_UGV_01_MJTF_Des"
		//Supply Trucks  1 set
		,"EF_B_Truck_01_ammo_MJTF_Des"
		,"EF_B_Truck_01_fuel_MJTF_Des"
		,"EF_B_Truck_01_Repair_MJTF_Des"
		,"EF_B_Truck_01_ammo_MJTF_Des"
		,"EF_B_Truck_01_fuel_MJTF_Des"
		,"EF_B_Truck_01_Repair_MJTF_Des"		
		//Armed UAVs  2 sets
		,"EF_B_UGV_01_rcws_MJTF_Des"
		,"EF_B_UGV_01_rcws_MJTF_Des"
		,"EF_B_UGV_01_rcws_MJTF_Des"
		,"EF_B_UGV_01_rcws_MJTF_Des"
		//MRAPs  2 sets
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_gmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		,"EF_B_MRAP_01_hmg_MJTF_Des"
		//Heavily Armed APCs or AA  2 sets
		,"EF_B_MRAP_01_LAAD_MJTF_Des"
		,"EF_B_MRAP_01_LAAD_MJTF_Des"
		,"EF_B_AAV9_MJTF_Des"
		,"EF_B_AAV9_MJTF_Des"
		,"EF_B_AAV9_50mm_MJTF_Des"
		,"EF_B_AAV9_50mm_MJTF_Des"
		,"EF_B_AAV9_MJTF_Des"
		,"EF_B_AAV9_50mm_MJTF_Des"
		//Artillery
		,"B_MBT_01_arty_F"
		//Tanks  2 sets
		,"EF_B_MBT_01_cannon_MJTF_Des"  //1
		,"EF_B_MBT_01_TUSK_MJTF_Des"
		,"EF_B_MBT_01_cannon_MJTF_Des"  //2
		,"EF_B_MBT_01_TUSK_MJTF_Des"];
		if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_Comms_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_mmg_MJTF_Des";
			a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "EF_B_Pickup_mmg_MJTF_Des";
		};
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"B_D_engineer_lxWS"
	,"B_D_medic_lxWS"
	,"B_D_medic_lxWS"
	,"B_D_medic_lxWS"
	,"B_D_Soldier_A_lxWS"
	,"B_D_Soldier_A_lxWS"
	,"B_D_Soldier_A_lxWS"
	,"B_D_soldier_AA_lxWS"
	,"B_D_soldier_AA_lxWS"
	,"B_D_soldier_AA_lxWS"
	,"B_D_soldier_AA_lxWS"
	,"B_D_soldier_AR_lxWS"
	,"B_D_soldier_AR_lxWS"
	,"B_D_soldier_AR_lxWS"
	,"B_D_soldier_AT_lxWS"
	,"B_D_soldier_AT_lxWS"
	,"B_D_soldier_AT_lxWS"
	,"B_D_soldier_exp_lxWS"
	,"B_D_Soldier_lxWS"
	,"B_D_Soldier_lxWS"
	,"B_D_Soldier_lxWS"
	,"B_D_Soldier_GL_lxWS"
	,"B_D_Soldier_GL_lxWS"
	,"B_D_Soldier_GL_lxWS"
	,"B_D_Soldier_GL_lxWS"
	,"B_D_Soldier_GL_lxWS"
	,"B_D_Soldier_GL_lxWS"
	,"B_D_soldier_LAT_lxWS"
	,"B_D_soldier_LAT_lxWS"
	,"B_D_Soldier_lite_lxWS"
	,"B_D_Soldier_lite_lxWS"
	,"B_D_Soldier_lite_lxWS"
	,"B_D_soldier_PG_lxWS"
	,"B_D_soldier_PG_lxWS"
	,"B_D_soldier_M_lxWS"
	,"B_D_soldier_M_lxWS"
	,"B_D_soldier_M_lxWS"
	,"B_D_soldier_repair_lxWS"
	,"B_D_soldier_repair_lxWS"
	,"B_D_officer_lxWS"
	,"B_D_soldier_UAV01_lxWS"
	,"B_D_soldier_UAV01_lxWS"
	,"B_D_soldier_UAV02_lxWS"
	,"B_D_soldier_UAV02_lxWS"
	,"B_D_soldier_AAR_lxWS"
	,"B_D_support_AMG_lxWS"
	,"B_D_support_AMort_lxWS"
	,"B_D_soldier_AAA_lxWS"
	,"B_D_soldier_AAT_lxWS"
	,"B_D_support_GMG_lxWS"
	,"B_D_support_MG_lxWS"
	,"B_D_support_Mort_lxWS"
	,"B_D_Soldier_SL_lxWS"
	,"B_D_Soldier_TL_lxWS"
	,"B_D_soldier_LAT2_lxWS"
	,"B_D_soldier_LAT2_lxWS"];
	if(A3E_Param_UseDLCLaws==1) then {
		a3e_arr_Escape_InfantryTypes pushback "B_D_soldier_mine_lxWS";
	};
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_Escape_InfantryTypes pushback "B_support_CMort_RF";
	};
a3e_arr_Escape_InfantryTypes_Ind = [
	"EF_B_Marine_Eng_Des"
	,"EF_B_Marine_Medic_Des"
	,"EF_B_Marine_Medic_Des"
	,"EF_B_Marine_Medic_Des"
	,"EF_B_Marine_AA_Des"
	,"EF_B_Marine_AA_Des"
	,"EF_B_Marine_AR_Des"
	,"EF_B_Marine_AR_Des"
	,"EF_B_Marine_AR_Des"
	,"EF_B_Marine_AT_Des"
	,"EF_B_Marine_AT_Des"
	,"EF_B_Marine_Exp_Des"
	,"EF_B_Marine_R_Des"
	,"EF_B_Marine_R_Des"
	,"EF_B_Marine_R_Des"
	,"EF_B_Marine_GL_Des"
	,"EF_B_Marine_GL_Des"
	,"EF_B_Marine_GL_Des"
	,"EF_B_Marine_GL_Des"
	,"EF_B_Marine_LAT_Des"
	,"EF_B_Marine_LAT_Des"
	,"EF_B_Marine_Light_Des"
	,"EF_B_Marine_Light_Des"
	,"EF_B_Marine_Light_Des"
	,"EF_B_Marine_Mark_Des"
	,"EF_B_Marine_Mark_Des"
	,"EF_B_Marine_Mark_Des"
	,"EF_B_Marine_Repair_Des"
	,"EF_B_Marine_Repair_Des"
	,"EF_B_Marine_Officer_Des"
	,"EF_B_Marine_UAV_Des"
	,"EF_B_Marine_UAV_Des"
	,"EF_B_Marine_JTAC_Des"
	,"EF_B_Marine_AMG_Des"
	,"EF_B_Marine_AMort_Des"
	,"EF_B_Marine_AAA_Des"
	,"EF_B_Marine_AAT_Des"
	,"EF_B_Marine_GMG_Des"
	,"EF_B_Marine_HMG_Des"
	,"EF_B_Marine_Mort_Des"
	,"EF_B_Marine_SL_Des"
	,"EF_B_Marine_TL_Des"
	,"EF_B_Marine_LAT2_Des"
	,"EF_B_Marine_LAT2_Des"];
a3e_arr_recon_InfantryTypes = [
	"B_D_recon_exp_lxWS"
	,"B_D_recon_JTAC_lxWS"
	,"B_D_recon_M_lxWS"
	,"B_D_recon_medic_lxWS"
	,"B_D_recon_lxWS"
	,"B_D_recon_LAT_lxWS"
	,"B_D_recon_TL_lxWS"];
a3e_arr_recon_I_InfantryTypes = [
	"EF_B_Marine_Recon_Exp_Des"
	,"EF_B_Marine_Recon_JTAC_Des"
	,"EF_B_Marine_Recon_M_Des"
	,"EF_B_Marine_Recon_Medic_Des"
	,"EF_B_Marine_Recon_Des"
	,"EF_B_Marine_Recon_Des"
	,"EF_B_Marine_Recon_Des"
	,"EF_B_Marine_Recon_LAT_Des"
	,"EF_B_Marine_Recon_TL_Des"];

a3e_units_civilian_InfantryTypes = [
	"C_Djella_01_lxWS"
	,"C_Djella_02_lxWS"
	,"C_Djella_03_lxWS"
	,"C_Djella_04_lxWS"
	,"C_Djella_05_lxWS"
	,"C_Tak_02_A_lxWS"
	,"C_Tak_02_B_lxWS"
	,"C_Tak_02_C_lxWS"
	,"C_Tak_03_A_lxWS"
	,"C_Tak_03_B_lxWS"
	,"C_Tak_03_C_lxWS"
	,"C_Tak_01_A_lxWS"
	,"C_Tak_01_B_lxWS"
	,"C_Tak_01_C_lxWS"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"B_D_MRAP_01_hmg_lxWS"
	,"B_D_MRAP_01_hmg_lxWS"
	,"B_D_MRAP_01_gmg_lxWS"
	,"B_D_APC_Wheeled_01_command_lxWS"
	,"B_D_APC_Wheeled_01_atgm_lxWS"
	,"B_D_UGV_01_rcws_lxWS"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_Escape_RoadBlock_MannedVehicleTypes pushback "B_Pickup_mmg_rf";
	};
	
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"EF_B_MRAP_01_hmg_MJTF_Des"
	,"EF_B_MRAP_01_hmg_MJTF_Des"
	,"EF_B_MRAP_01_gmg_MJTF_Des"
	,"EF_B_MRAP_01_AT_MJTF_Des"
	,"EF_B_MRAP_01_FSV_MJTF_Des"
	,"EF_B_UGV_01_rcws_MJTF_Des"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"B_D_Truck_01_transport_lxWS"
	,"B_D_Truck_01_covered_lxWS"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_Escape_ReinforcementTruck_vehicleClasses pushback "B_Pickup_rf";
		a3e_arr_Escape_ReinforcementTruck_vehicleClasses pushback "B_Pickup_Comms_rf";
	};
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"EF_B_Truck_01_transport_MJTF_Des"
	,"EF_B_Truck_01_covered_MJTF_Des"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"B_D_APC_Wheeled_01_cannon_lxWS"
	,"B_D_APC_Wheeled_01_cannon_lxWS"
	,"B_D_APC_Wheeled_01_atgm_lxWS"
	,"B_D_APC_Wheeled_01_command_lxWS"
	,"B_D_APC_Tracked_01_rcws_lxWS"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"B_D_MRAP_01_gmg_lxWS"
	,"B_D_MRAP_01_hmg_lxWS"
	,"B_D_APC_Wheeled_01_cannon_lxWS"
	,"B_D_APC_Wheeled_01_atgm_lxWS"
	,"B_D_APC_Wheeled_01_command_lxWS"
	,"B_D_APC_Wheeled_01_mortar_lxWS"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"B_D_MBT_01_cannon_lxWS"
	,"B_D_MBT_01_cannon_lxWS"
	,"B_D_MBT_01_TUSK_lxWS"
	,"B_D_APC_Tracked_01_aa_lxWS"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"B_HMG_01_high_F"
	,"B_HMG_01_high_F"
	,"B_GMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"B_D_MRAP_01_lxWS"
	,"B_D_MRAP_01_lxWS"
	,"B_D_Quadbike_01_lxWS"
	,"B_D_Quadbike_01_lxWS"
	,"B_D_Quadbike_01_lxWS"
	,"B_D_MRAP_01_gmg_lxWS"
	,"B_D_MRAP_01_hmg_lxWS"
	,"B_D_Truck_01_transport_lxWS"
	,"B_D_Truck_01_covered_lxWS"
	,"B_D_Truck_01_ammo_lxWS"
	,"B_D_Truck_01_fuel_lxWS"
	,"B_D_Truck_01_medical_lxWS"
	,"B_D_Truck_01_Repair_lxWS"
	,"B_D_Truck_01_box_lxWS"
	,"B_D_Truck_01_mover_lxWS"
	,"B_D_Truck_01_cargo_lxWS"
	,"B_D_Truck_01_flatbed_lxWS"
	,"B_D_UGV_01_rcws_lxWS"];
	if(A3E_Param_UseDLCApex==1) then {
		a3e_arr_ComCenParkedVehicles pushback "B_LSV_01_unarmed_F";
		a3e_arr_ComCenParkedVehicles pushback "B_LSV_01_armed_F";
		a3e_arr_ComCenParkedVehicles pushback "B_LSV_01_AT_F";
	};
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_ComCenParkedVehicles pushback "B_Pickup_rf";
		a3e_arr_ComCenParkedVehicles pushback "B_Pickup_Comms_rf";
		a3e_arr_ComCenParkedVehicles pushback "B_Pickup_mmg_rf";
		a3e_arr_ComCenParkedVehicles pushback "B_Pickup_aat_rf";
	};
	
// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"C_Hatchback_01_F"
	,"C_Offroad_lxWS"
	,"C_Offroad_lxWS"
	,"C_Offroad_lxWS"
	,"C_SUV_01_F"
	,"C_Truck_02_covered_F"];
	if(A3E_Param_UseDLCApex==1) then {
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Pickup_covered_rf";
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"B_HMG_01_high_F"
	,"B_GMG_01_high_F"
	,"B_HMG_01_high_F"
	,"B_D_static_AT_lxWS"
	,"B_D_static_AA_lxWS"];
	
	
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"B_D_Heli_Attack_01_dynamicLoadout_lxWS"
	,"EF_B_AH99J_NATO_Des"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_O_attack_heli pushback "B_Heli_EC_03_RF";
	};
a3e_arr_O_transport_heli = [
	"B_D_Heli_Transport_01_lxWS"
	,"B_D_Heli_Light_01_lxWS"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_O_transport_heli pushback "B_Heli_EC_04_military_RF";
	};
a3e_arr_O_pilots = [
	"B_D_HeliPilot_lxWS"];
a3e_arr_I_transport_heli = [
	"EF_B_Heli_Transport_01_MJTF_Des"];
a3e_arr_I_pilots = [
	"B_Helipilot_F"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_MX_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_MXC_F", 50, 2, 4, ["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_MX_GL_F", 75, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "1Rnd_HE_Grenade_shell"], 4];
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Glock19_Tan_RF", 30, 1, 2, ["17Rnd_9x19_Mag_RF"], 4];
	a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Glock19_auto_Tan_RF", 20, 1, 2, ["33Rnd_9x19_Mag_Tan_RF"], 4];
};
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_PDW2000_F", 20, 4, 8, ["30Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_03C_TR_black", 20, 4, 8, ["50Rnd_570x28_SMG_03"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mxar_coy", 50, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mx_coy", 50, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mxc_coy", 30, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag","EF_30Rnd_65x39_caseless_coy_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mx_gl_coy", 30, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag", "EF_30Rnd_65x39_caseless_coy_mag_Tracer", "1Rnd_HE_Grenade_shell"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["ef_arifle_mxar_gl_coy", 30, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag", "3Rnd_HE_Grenade_shell"], 4];

a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_XMS_Camo_lxWS", 10, 2, 4, ["30Rnd_556x45_Stanag_camo_lxWS", "30Rnd_556x45_Stanag_Tracer_Red_camo_lxWS"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_XMS_GL_Gray_lxWS", 10, 2, 4, ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_XMS_Base_Sand_lxWS", 10, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_XMS_Shot_Camo_lxWS", 10, 2, 4, ["30Rnd_556x45_Stanag_camo_lxWS", "6rnd_HE_Mag_lxWS", "6Rnd_12Gauge_Pellets", "6rnd_Smoke_Mag_lxWS", "6Rnd_12Gauge_Slug"], 6];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_MXM_Hamr_LP_BI_F", 50, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_MX_SW_F", 50, 2, 4, ["100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_LRR_camo_LRPS_F", 10, 1, 1, ["7Rnd_408_Mag"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sgun_aa40_snake_lxWS", 10, 1, 2, ["20Rnd_12Gauge_AA40_Pellets_Snake_lxWS","20Rnd_12Gauge_AA40_Slug_Snake_lxWS","20Rnd_12Gauge_AA40_Smoke_Snake_lxWS","20Rnd_12Gauge_AA40_HE_Snake_lxWS"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["sgun_aa40_snake_lxWS", 10, 1, 2, ["8Rnd_12Gauge_AA40_Pellets_Snake_lxWS","8Rnd_12Gauge_AA40_Slug_Snake_lxWS","8Rnd_12Gauge_AA40_Smoke_Snake_lxWS","8Rnd_12Gauge_AA40_HE_Snake_lxWS"], 7];
a3e_arr_AmmoDepotSpecialWeapons pushback ["glaunch_GLX_snake_lxWS", 10, 1, 2, ["1Rnd_HE_Grenade_shell","1Rnd_Pellet_Grenade_shell_lxWS","3Rnd_HE_Grenade_shell","3Rnd_UGL_FlareWhite_F","3Rnd_Smoke_Grenade_shell"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_S77_Compact_Snakeskin_lxWS", 10, 1, 2, ["100Rnd_762x51_S77_Red_lxWS","3Rnd_HE_Grenade_shell"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_VelkoR5_GL_snake_lxWS", 10, 1, 2, ["35Rnd_556x45_Velko_snake_reload_tracer_red_lxWS","1Rnd_HE_Grenade_shell"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_VelkoR5_snake_lxWS", 15, 1, 3, ["35Rnd_556x45_Velko_snake_reload_tracer_red_lxWS"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_VelkoR5_snake_lxWS", 10, 1, 3, ["50Rnd_556x45_Velko_snake_reload_tracer_red_lxWS"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_EBR_snake_lxWS", 10, 1, 1, ["20Rnd_762x51_Mag_snake_lxWS"], 8];
if(A3E_Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_02_sand_F", 10, 2, 4, ["130Rnd_338_Mag"], 6];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_02_black_F", 10, 2, 4, ["130Rnd_338_Mag"], 6];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_02_sniper_AMS_LP_S_F", 10, 2, 4, ["10Rnd_338_Mag"], 10];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_03_AMS_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 12];
};
if(A3E_Param_UseDLCApex==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_SPAR_01_snd_F", 10, 1, 1, ["30Rnd_556x45_Stanag_Sand"], 9];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_SPAR_01_GL_snd_F", 10, 1, 1, ["30Rnd_556x45_Stanag_Sand","1Rnd_HE_Grenade_shell"], 9];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_SPAR_02_snd_F", 10, 1, 1, ["150Rnd_556x45_Drum_Sand_Mag_F"], 9];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_SPAR_03_snd_F", 10, 1, 1, ["20Rnd_762x51_Mag"], 9];
};
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_h6_tan_rf", 50, 2, 4, ["10Rnd_556x45_AP_Stanag_RF"], 12];
};
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mxm_coy", 50, 2, 4, ["EF_30Rnd_65x39_caseless_coy_mag", "EF_30Rnd_65x39_caseless_coy_mag_Tracer"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mxm_MBS_LP_BI", 50, 2, 4, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mx_sw_coy", 50, 2, 4, ["EF_100Rnd_65x39_caseless_coy_mag","EF_100Rnd_65x39_caseless_coy_mag_Tracer"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["ef_arifle_mxar_black", 50, 2, 4, ["EF_100Rnd_65x39_caseless_coy_mag"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_Mk200_black_F", 10, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_XMS_GL_Sand_lxWS", 10, 2, 4, ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_XMS_M_lxWS", 10, 2, 4, ["75Rnd_556x45_Stanag_green_lxWS", "75Rnd_556x45_Stanag_red_lxWS"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_XMS_M_Sand_lxWS", 10, 2, 4, ["75Rnd_556x45_Stanag_green_lxWS", "75Rnd_556x45_Stanag_red_lxWS"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_XMS_Shot_Sand_lxWS", 10, 2, 4, ["30Rnd_556x45_Stanag", "6rnd_HE_Mag_lxWS", "6Rnd_12Gauge_Pellets", "6rnd_Smoke_Mag_lxWS", "6Rnd_12Gauge_Slug"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_EBR_blk_tws_bpd_blk_lxWS", 10, 2, 4, ["20Rnd_762x51_Mag"], 9];
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
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_AmmoDepotLaunchers pushback ["launch_PSRL1_PWS_sand_RF", 5, 2, 4, ["PSRL1_AT_RF"], 2];
	a3e_arr_AmmoDepotLaunchers pushback ["launch_PSRL1_PWS_black_RF", 10, 2, 4, ["PSRL1_HEAT_RF"], 3];
	a3e_arr_AmmoDepotLaunchers pushback ["launch_PSRL1_PWS_black_RF", 5, 2, 4, ["PSRL1_HE_RF"], 4];
};


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
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["1Rnd_Pellet_Grenade_shell_lxWS"], 25];
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["1Rnd_RC40_shell_RF", "1Rnd_RC40_HE_shell_RF", "1Rnd_RC40_SmokeWhite_shell_RF","1Rnd_RC40_SmokeBlue_shell_RF","1Rnd_RC40_SmokeRed_shell_RF","1Rnd_RC40_SmokeGreen_shell_R","1Rnd_RC40_SmokeOrange_shell_R"], 25];
};
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_Kitbag_desert_lxWS"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG_Tan", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG_T_Tan", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG", 5, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["EF_LPNVG_T", 5, 1, 3];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_AmmoDepotItems pushback ["TiGoggles_tan_RF", 10, 1, 3];
	};
};
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Camera_lxWS", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMotionSensor_lxWS", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 10, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight_pistol", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["EF_acc_pointer_IR_coy", 25, 1, 3];
a3e_arr_AmmoDepotItems pushback ["saber_light_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["saber_light_arid_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["saber_light_sand_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["saber_light_snake_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["saber_light_ir_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["saber_light_ir_arid_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["saber_light_ir_sand_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["saber_light_ir_snake_lxWS", 20, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR_arid_lxWS", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR_sand_lxWS", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR_snake_lxWS", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_acp", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_H_snd_F", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_H", 5, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_H_MG", 5, 1, 3];
a3e_arr_AmmoDepotItems pushback ["suppressor_h_lxWS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["suppressor_h_arid_lxWS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["suppressor_h_sand_lxWS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["suppressor_h_snake_lxWS", 15, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_L", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["suppressor_l_camo_lxWS", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_M", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_12Gauge_lxWS", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_12Gauge_snake_lxWS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ef_snds_mxar_coy", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Aco", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Aco_smg", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn", 5, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_ACO_camo_lxWS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Arco", 5, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Hamr", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Hamr_snake_lxWS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_high_lxWS", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_high_arid_lxWS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_high_sand_lxWS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_high_snake_lxWS", 15, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_low_lxWS", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_low_arid_lxWS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_low_sand_lxWS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_r1_low_snake_lxWS", 15, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_Holosight_smg_coy", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_Holosight_coy", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Holosight_snake_lxWS", 15, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_Holosight_smg_snake_lxWS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_coy", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_remote_coy", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_sand", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_mbs_remote_sand", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_coy", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ef_optic_microsight_pistol_coy", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_MRCO", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_NVS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_SOS", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
};
a3e_arr_AmmoDepotItems pushback ["B_UavTerminal", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 25, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_LRPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_AMS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_KHS_tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_snd", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_arid", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_tan", 10, 1, 2];
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_AmmoDepotItems pushback ["optic_VRCO_tan_RF", 20, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["optic_MRD_tan_RF", 20, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_rds_RF", 20, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_VRCO_pistol_RF", 20, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR_pistol_RF", 20, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["acc_flashlight_IR_pistol_RF", 20, 1, 2];
};


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["ef_hgun_P07_coy", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_P07_snds_F", "30Rnd_9x21_Mag", 11];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_snds_F", "30Rnd_9x21_Mag", 9];
a3e_arr_CivilianCarWeapons pushback ["hgun_ACPC2_F", "9Rnd_45ACP_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["arifle_MXM_Hamr_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 8];
a3e_arr_CivilianCarWeapons pushback ["arifle_MX_Hamr_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_MXM_SOS_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 7];
a3e_arr_CivilianCarWeapons pushback ["arifle_Galat_worn_lxWS", "30Rnd_762x39_Mag_worn_lxWS", 8];
a3e_arr_CivilianCarWeapons pushback ["arifle_SLR_D_lxWS", "20Rnd_762x51_slr_lxWS_desert", 8];
a3e_arr_CivilianCarWeapons pushback ["arifle_Velko_lxWS", "50Rnd_556x45_Velko_lxWS", 5];
if(A3E_Param_UseDLCMarksmen==1) then {
	a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
};
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_CivilianCarWeapons pushback ["hgun_DEagle_RF", "7Rnd_50AE_Mag_RF", 4];
	a3e_arr_CivilianCarWeapons pushback ["hgun_DEagle_gold_RF", "7Rnd_50AE_Mag_RF", 4];
	a3e_arr_CivilianCarWeapons pushback ["srifle_h6_gold_rf", "20Rnd_556x45_AP_Stanag_Tan_RF", 8];
	a3e_arr_CivilianCarWeapons pushback ["launch_PSRL1_black_RF", "PSRL1_AT_RF", 2];
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
	,"ef_optic_microsight_sand"
	,"ef_optic_microsight_sand"
	,"ef_optic_microsight_sand"
	,"ef_optic_mbs_sand"
	,"ef_optic_mbs_sand"
	,"ef_optic_mbs_sand"
	,"optic_Hamr"
	,"optic_Hamr_snake_lxWS"
	,"optic_MRCO"
	,"optic_MRCO"
	,"optic_Holosight"
	,"optic_r1_high_lxWS"
	,"optic_r1_low_lxWS"
	,"optic_r1_high_arid_lxWS"
	,"optic_r1_low_arid_lxWS"
	,"optic_r1_high_sand_lxWS"
	,"optic_r1_low_sand_lxWS"
	,"optic_r1_high_snake_lxWS"
	,"optic_r1_low_snake_lxWS"
	,"optic_Hamr_arid_lxWS"
	,"optic_Hamr_sand_lxWS"
	,"optic_Holosight_snake_lxWS"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_Scopes pushback "optic_VRCO_tan_RF";
	a3e_arr_Scopes pushback "optic_VRCO_tan_RF";
	a3e_arr_Scopes pushback "optic_VRCO_tan_RF";
	};
a3e_arr_Scopes_SMG = [
	"optic_Aco_smg"
	,"ef_optic_Holosight_smg_coy"
	,"optic_Holosight_smg_snake_lxWS"];
a3e_arr_Scopes_Sniper = [
	"optic_SOS"
	,"optic_DMS"
	,"optic_LRPS"
	,"optic_AMS_snd"
	,"optic_KHS_blk"
	,"ef_optic_mbs_remote_sand"
	,"ef_optic_mbs_remote_sand"
	,"ef_optic_mbs_remote_sand"
	,"optic_KHS_old"
	,"optic_KHS_tan"];
a3e_arr_NightScopes = [
	"optic_NVS"];
a3e_arr_TWSScopes = [
	"optic_Nightstalker"
	,"optic_tws"
	,"optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"bipod_01_F_snd"
	,"bipod_01_F_blk"
	,"bipod_02_F_tan"];

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
    "O_SFIA_Heli_Attack_02_dynamicLoadout_lxWS"
    ,"O_SFIA_Heli_Attack_02_dynamicLoadout_lxWS"];
a3e_arr_extraction_chopper_escort = [
	"O_SFIA_Heli_Attack_02_dynamicLoadout_lxWS"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_extraction_chopper_escort pushback "O_SFIA_Heli_EC_02_RF";
	};

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"O_Boat_Armed_01_hmg_F"];
a3e_arr_extraction_boat_escort = [
	"EF_O_CombatBoat_HMG_OPF"
	,"EF_O_CombatBoat_AT_OPF"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"O_SFIA_Truck_02_transport_lxWS",	//13
	"O_SFIA_Truck_02_covered_lxWS",	//13
	"O_SFIA_APC_Tracked_02_cannon_lxWS",	//8
	"O_SFIA_APC_Wheeled_02_hmg_lxWS",
	"O_SFIA_APC_Wheeled_02_unarmed_lxWS"];
a3e_arr_extraction_car_escort = [
	"O_SFIA_APC_Tracked_02_AA_lxWS",
	"O_SFIA_APC_Tracked_02_30mm_lxWS",
	"O_SFIA_MBT_02_cannon_lxWS",
	"O_SFIA_MBT_02_cannon_lxWS"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"B_UAV_02_lxWS"
	,"B_UAV_02_lxWS"
	,"B_UAV_01_F"
	,"B_UAV_02_dynamicLoadout_F"
	,"B_UAV_05_F"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_searchdrone pushback "B_UAV_RC40_HE_RF";
		a3e_arr_searchdrone pushback "B_UAV_RC40_SENSOR_RF";
		a3e_arr_searchdrone pushback "B_UAV_RC40_SmokeRed_RF";
		a3e_arr_searchdrone pushback "B_UAV_RC40_SmokeOrange_RF";
	};
//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"B_ION_Heli_Light_02_unarmed_lxWS"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_searchChopperEasy pushback "B_ION_Heli_EC_01_RF";
	};
a3e_arr_searchChopperHard = [
	"EF_B_Heli_Transport_01_MJTF_Des"];
a3e_arr_searchChopper_pilot = [
	"B_Helipilot_F"];
a3e_arr_searchChopper_crew = [
	"B_Helipilot_F"];

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
	"EF_O_CombatBoat_Unarmed_OPF"
	,"EF_O_CombatBoat_HMG_OPF"
	,"EF_O_CombatBoat_AT_OPF"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "Box_NATO_Wps_F";
a3e_additional_weapon_box_2 = "EF_B_supplyCrate_MJTF";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"B_D_Mortar_01_lxWS"];
	if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
		a3e_arr_MortarSite pushback "B_CommandoMortar_RF";
	};

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"B_D_Plane_CAS_01_dynamicLoadout_lxWS"];

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
	"Land_Wreck_Heli_Attack_02_F"];
a3e_arr_CrashSiteCrew = [
	"O_SFIA_pilot_lxWS"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_MBT_04_F"];
a3e_arr_CrashSiteCrewCar = [
	"O_SFIA_crew_lxWS"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["SMG_02_ACO_F", 50, 1, 2, ["30Rnd_9x21_Mag_SMG_02"], 8];
a3e_arr_CrashSiteWeapons pushback ["launch_RPG32_green_F", 40, 1, 2, ["RPG32_F","RPG32_HE_F"], 2];
a3e_arr_CrashSiteWeapons pushback ["launch_O_Vorona_brown_F", 20, 1, 1, ["Vorona_HEAT","Vorona_HE"], 2];
a3e_arr_CrashSiteWeapons pushback ["arifle_Galat_lxWS", 75, 2, 4, ["30Rnd_762x39_Mag_F"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_SLR_D_lxWS", 75, 2, 4, ["20Rnd_762x51_slr_lxWS"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_SLR_GL_lxWS", 75, 2, 4, ["20Rnd_762x51_slr_lxWS", "1Rnd_40mm_HE_lxWS", "1Rnd_58mm_AT_lxWS", "1Rnd_50mm_Smoke_lxWS"], 4];
a3e_arr_CrashSiteWeapons pushback ["arifle_Galat_lxWS", 60, 1, 3, ["75Rnd_762x39_Mag_F"], 4];
a3e_arr_CrashSiteWeapons pushback ["arifle_Velko_lxWS", 40, 1, 3, ["50Rnd_556x45_Velko_lxWS"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_SLR_D_KHS_old_lxWS", 40, 1, 2, ["20Rnd_762x51_slr_lxWS_desert"], 8];
if(A3E_Param_UseDLCMarksmen==1) then {
	a3e_arr_CrashSiteWeapons pushback ["MMG_01_tan_F", 30, 2, 4, ["150Rnd_93x64_Mag"], 6];
	a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_04_Tan_F", 10, 2, 4, ["10Rnd_127x54_Mag"], 12];
	a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_05_tan_f", 10, 2, 4, ["10Rnd_93x64_DMR_05_Mag"], 12];
};
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_CrashSiteWeapons pushback ["arifle_ash12_LR_desert_RF", 10, 2, 4, ["20Rnd_127x55_Mag_desert_RF"], 10];
	a3e_arr_CrashSiteWeapons pushback ["arifle_ash12_desert_RF", 10, 2, 4, ["20Rnd_127x55_Mag_desert_RF"], 10];
	a3e_arr_CrashSiteWeapons pushback ["arifle_ash12_GL_desert_RF", 10, 2, 4, ["10Rnd_127x55_Mag_desert_RF","1Rnd_HE_Grenade_shell","1Rnd_RC40_shell_RF","1Rnd_RC40_HE_shell_RF"], 10];
};
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["optic_Arco_arid_F", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Arco_hex_lxWS", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_ACO_grn", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_ACO_grn_camo_lxWS", 10, 1, 1];
a3e_arr_CrashSiteItems pushback ["optic_Aco_grn_smg", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Holosight", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_KHS", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_KHS_old", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["muzzle_snds_B", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["suppressor_h_arid_lxWS", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["suppressor_h_sand_lxWS", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["O_UavTerminal", 50, 1, 1];
if(isClass(configFile >> "CfgPatches" >> "rf_vehicles")) then {
	a3e_arr_CrashSiteItems pushback ["optic_ACO_grn_desert_RF", 10, 1, 1];
	a3e_arr_CrashSiteItems pushback ["optic_VRCO_tan_RF", 10, 1, 1];
	a3e_arr_CrashSiteItems pushback ["optic_MRD_tan_RF", 10, 1, 1];
	a3e_arr_CrashSiteItems pushback ["optic_rds_RF", 10, 1, 1];
	a3e_arr_CrashSiteItems pushback ["optic_VRCO_pistol_RF", 10, 1, 1];
	a3e_arr_CrashSiteItems pushback ["suppressor_127x55_big_desert_RF", 10, 1, 1];
	a3e_arr_CrashSiteItems pushback ["suppressor_127x55_small_desert_RF", 10, 1, 1];
};