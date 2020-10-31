/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */
 
//NOTE "O_T_APC_Wheeled_02_rcws_ghex_F" does not have a proper first person view for driver, and has a commander's seat that shouldn't be there, so use "O_T_APC_Wheeled_02_rcws_v2_ghex_F" instead.

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;
A3E_VAR_Side_Opfor = east;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
A3E_VAR_Flag_Ind = "\a3\data_f_exp\flags\flag_synd_co.paa"; // Update 3: Placeholder for Syndikat flag.
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"I_C_Soldier_Bandit_3_F"
	,"I_C_Soldier_Para_4_F"
	,"I_C_Soldier_Bandit_6_F"
	,"I_C_Soldier_Para_6_F"
	,"I_C_Soldier_Bandit_5_F"
	,"I_C_Soldier_Para_1_F"
	,"I_C_Soldier_Bandit_4_F"
	,"I_C_Soldier_Para_7_F"
	,"I_C_Soldier_Para_2_F"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_01_F","10Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_01_F","10Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_01_F","10Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_01_F","10Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_01_F","10Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_snds_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_Yorris_F","6Rnd_45ACP_Cylinder"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["SMG_05_F","30Rnd_9x21_Mag_SMG_02"];


// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
   "C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
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
	,"C_Van_01_box_F"
	,"C_Van_01_box_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_transport_F"
	,"C_Truck_02_transport_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	//Supply Trucks
	,"C_Van_01_fuel_F"
	,"C_Offroad_01_repair_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"];
 	if(Param_UseDLCLaws==1) then {
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
		//Unarmed Cars/UAVs 2 sets
		"O_T_MRAP_02_ghex_F"  //1
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Truck_03_medical_ghex_F"
		,"O_T_Truck_03_transport_ghex_F"
		,"O_T_Truck_03_covered_ghex_F"
		,"O_T_Truck_02_medical_F"
		,"O_T_Truck_02_transport_F"
		,"O_T_Truck_02_F"
		,"O_T_UGV_01_ghex_F"
		,"O_T_MRAP_02_ghex_F"  //2
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Truck_03_medical_ghex_F"
		,"O_T_Truck_03_transport_ghex_F"
		,"O_T_Truck_03_covered_ghex_F"
		,"O_T_Truck_02_medical_F"
		,"O_T_Truck_02_transport_F"
		,"O_T_Truck_02_F"
		,"O_T_UGV_01_ghex_F"
		//Device Truck
		,"O_T_Truck_03_device_ghex_F"
		//Supply Trucks  1 set
		,"O_T_Truck_03_ammo_ghex_F"
		,"O_T_Truck_03_fuel_ghex_F"
		,"O_T_Truck_03_repair_ghex_F"
		,"O_T_Truck_02_Ammo_F"
		,"O_T_Truck_02_fuel_F"
		,"O_T_Truck_02_Box_F"
		//Armed Cars  1 set
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		//Armed UAVs  1 set
		,"O_T_UGV_01_rcws_ghex_F"
		,"O_T_UGV_01_rcws_ghex_F"
		//MRAPS  1 set
		,"O_T_MRAP_02_gmg_ghex_F"
		,"O_T_MRAP_02_gmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		//Heavily Armed APCs or AA  1 set
		,"O_T_APC_Wheeled_02_rcws_v2_ghex_F"
		,"O_T_APC_Tracked_02_AA_ghex_F"
		,"O_T_APC_Tracked_02_cannon_ghex_F"
		//Artillery  1 set
		,"O_T_MBT_02_arty_ghex_F"
		//Tanks  1 set
		,"O_T_MBT_02_cannon_ghex_F"];
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_command_F";
		};
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		 //Unarmed Cars  3 sets
		"I_C_Offroad_02_unarmed_F"  //1
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Offroad_02_unarmed_F"  //2
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Offroad_02_unarmed_F"  //3
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		//Armed Cars  1 set
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_AT_F"
		,"I_C_Offroad_02_AT_F"];
		if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
        };
	};
    case 2: {//Some (4-6)
         a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs
		"O_T_MRAP_02_ghex_F"  //1
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Truck_03_medical_ghex_F"
		,"O_T_Truck_03_transport_ghex_F"
		,"O_T_Truck_03_covered_ghex_F"
		,"O_T_Truck_02_medical_F"
		,"O_T_Truck_02_transport_F"
		,"O_T_Truck_02_F"
		,"O_T_UGV_01_ghex_F"
		,"O_T_MRAP_02_ghex_F"  //2
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Truck_03_medical_ghex_F"
		,"O_T_Truck_03_transport_ghex_F"
		,"O_T_Truck_03_covered_ghex_F"
		,"O_T_Truck_02_medical_F"
		,"O_T_Truck_02_transport_F"
		,"O_T_Truck_02_F"
		,"O_T_UGV_01_ghex_F"
		//Device Truck
		,"O_T_Truck_03_device_ghex_F"
		//Supply Trucks  1 set
		,"O_T_Truck_03_ammo_ghex_F"
		,"O_T_Truck_03_fuel_ghex_F"
		,"O_T_Truck_03_repair_ghex_F"
		,"O_T_Truck_02_Ammo_F"
		,"O_T_Truck_02_fuel_F"
		,"O_T_Truck_02_Box_F"
		//Armed Cars  2 sets
		,"O_LSV_02_armed_F"  //1
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_armed_F"  //2
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		//Armed UAVs  2 set
		,"O_T_UGV_01_rcws_ghex_F"  //1
		,"O_T_UGV_01_rcws_ghex_F"
		,"O_T_UGV_01_rcws_ghex_F"  //2
		,"O_T_UGV_01_rcws_ghex_F"
		//MRAPS  2 sets
		,"O_T_MRAP_02_gmg_ghex_F"  //1
		,"O_T_MRAP_02_gmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		,"O_T_MRAP_02_gmg_ghex_F"  //2
		,"O_T_MRAP_02_gmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		//Heavily Armed APCs or AA  1 set
		,"O_T_APC_Wheeled_02_rcws_v2_ghex_F"
		,"O_T_APC_Tracked_02_AA_ghex_F"
		,"O_T_APC_Tracked_02_cannon_ghex_F"
		//Artillery  1 set
		,"O_T_MBT_02_arty_ghex_F"
		//Tanks  1 set
		,"O_T_MBT_02_cannon_ghex_F"];
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_command_F";
		};
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
        //Unarmed Cars  3 sets
		"I_C_Offroad_02_unarmed_F"  //1
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Offroad_02_unarmed_F"  //1
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Offroad_02_unarmed_F"  //1
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		//Armed Cars  2 sets
		,"I_C_Offroad_02_LMG_F"  //1
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_AT_F"
		,"I_C_Offroad_02_AT_F"
		,"I_C_Offroad_02_LMG_F"  //2
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_AT_F"
		,"I_C_Offroad_02_AT_F"];
		if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
        };
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs
		"O_T_MRAP_02_ghex_F"  //1
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Truck_03_medical_ghex_F"
		,"O_T_Truck_03_transport_ghex_F"
		,"O_T_Truck_03_covered_ghex_F"
		,"O_T_Truck_02_medical_F"
		,"O_T_Truck_02_transport_F"
		,"O_T_Truck_02_F"
		,"O_T_UGV_01_ghex_F"
		,"O_T_MRAP_02_ghex_F"  //2
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_MRAP_02_ghex_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_LSV_02_unarmed_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Quadbike_01_ghex_F"
		,"O_T_Truck_03_medical_ghex_F"
		,"O_T_Truck_03_transport_ghex_F"
		,"O_T_Truck_03_covered_ghex_F"
		,"O_T_Truck_02_medical_F"
		,"O_T_Truck_02_transport_F"
		,"O_T_Truck_02_F"
		,"O_T_UGV_01_ghex_F"
		//Device Truck
		,"O_T_Truck_03_device_ghex_F"
		//Supply Trucks  1 set
		,"O_T_Truck_03_ammo_ghex_F"
		,"O_T_Truck_03_fuel_ghex_F"
		,"O_T_Truck_03_repair_ghex_F"
		,"O_T_Truck_02_Ammo_F"
		,"O_T_Truck_02_fuel_F"
		,"O_T_Truck_02_Box_F"
		//Armed Cars  2 sets
		,"O_LSV_02_armed_F"  //1
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_armed_F"  //2
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_armed_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		,"O_LSV_02_AT_F"
		//Armed UAVs  2 set
		,"O_T_UGV_01_rcws_ghex_F"  //1
		,"O_T_UGV_01_rcws_ghex_F"
		,"O_T_UGV_01_rcws_ghex_F"  //2
		,"O_T_UGV_01_rcws_ghex_F"
		//MRAPS  2 sets
		,"O_T_MRAP_02_gmg_ghex_F"  //1
		,"O_T_MRAP_02_gmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		,"O_T_MRAP_02_gmg_ghex_F"  //2
		,"O_T_MRAP_02_gmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		,"O_T_MRAP_02_hmg_ghex_F"
		//Heavily Armed APCs or AA  2 sets
		,"O_T_APC_Wheeled_02_rcws_v2_ghex_F"  //1
		,"O_T_APC_Tracked_02_AA_ghex_F"
		,"O_T_APC_Tracked_02_cannon_ghex_F"
		,"O_T_APC_Wheeled_02_rcws_v2_ghex_F"  //2
		,"O_T_APC_Tracked_02_AA_ghex_F"
		,"O_T_APC_Tracked_02_cannon_ghex_F"
		//Artillery  1 set
		,"O_T_MBT_02_arty_ghex_F"
		//Tanks  2 sets
		,"O_T_MBT_02_cannon_ghex_F"
		,"O_T_MBT_02_cannon_ghex_F"];
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_command_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_T_MBT_04_command_F";
		};
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
        //Unarmed Cars  3 sets
		"I_C_Offroad_02_unarmed_F"  //1
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Offroad_02_unarmed_F"  //1
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Offroad_02_unarmed_F"  //1
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Offroad_02_unarmed_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		,"I_C_Van_01_transport_F"
		//Armed Cars  2 sets
		,"I_C_Offroad_02_LMG_F"  //1
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_AT_F"
		,"I_C_Offroad_02_AT_F"
		,"I_C_Offroad_02_LMG_F"  //2
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_LMG_F"
		,"I_C_Offroad_02_AT_F"
		,"I_C_Offroad_02_AT_F"];
		if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_transport_F";
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_C_Van_02_vehicle_F";
        };
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
    //Rifleman
	"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Recon_F"
	,"O_T_Recon_F"
	//Ammo carrier Classes
	,"O_T_Soldier_A_F"
	,"O_T_Soldier_A_F"
	,"O_T_Soldier_A_F"
	,"O_T_Soldier_A_F"
	,"O_T_Soldier_AAR_F"
	,"O_T_Soldier_AAR_F"
	,"O_T_Soldier_AAA_F"
	,"O_T_Soldier_AAA_F"
	,"O_T_Soldier_AAT_F"
	,"O_T_Soldier_AHAT_F"
	//Machine gunners/Autoriflemen
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	//Grenadiers
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	//Buildable Weapon Classes
	,"O_T_Support_MG_F"
	,"O_T_Support_MG_F"
	,"O_T_Support_GMG_F"
	,"O_T_Support_GMG_F"
	,"O_T_Support_AMG_F"
	,"O_T_Support_AMG_F"
	,"O_T_Support_AMG_F"
	,"O_T_Support_AMG_F"
	//Buildable Mortar Classes
	,"O_T_Support_AMort_F"
	,"O_T_Support_Mort_F"
	//Classes with Medkit
	,"O_T_Medic_F"
	,"O_T_Medic_F"
	,"O_T_Medic_F"
	,"O_T_Recon_Medic_F"
	//Classes with Toolkit
	,"O_T_Engineer_F"
	,"O_T_Engineer_F"
	,"O_T_Soldier_Exp_F"
	,"O_T_Soldier_Exp_F"
	,"O_T_Soldier_Repair_F"
	,"O_T_Recon_Exp_F"
	//Squad Leaders
	,"O_T_Soldier_TL_F"
	,"O_T_Soldier_TL_F"
	,"O_T_Soldier_TL_F"
	,"O_T_Soldier_TL_F"
	,"O_T_Soldier_SL_F"
	,"O_T_Soldier_SL_F"
	,"O_T_Recon_JTAC_F"
	,"O_T_Recon_TL_F"
	//Light AT
	,"O_T_Soldier_LAT_F"
	,"O_T_Soldier_LAT_F"
	,"O_T_Soldier_LAT_F"
	,"O_T_Soldier_LAT_F"
	,"O_T_Soldier_LAT_F"
	,"O_T_Soldier_LAT_F"
	,"O_T_Recon_LAT_F"
	,"O_T_Recon_LAT_F"
	//Heavy AT
	,"O_T_Soldier_AT_F"
	,"O_T_Soldier_AT_F"
	,"O_T_Soldier_HAT_F"
	,"O_T_Soldier_HAT_F"
	//AA
	,"O_T_Soldier_AA_F"
	,"O_T_Soldier_AA_F"
	,"O_T_Soldier_AA_F"
	,"O_T_Soldier_AA_F"
	//Marksmen
	,"O_T_Soldier_M_F"
	,"O_T_Soldier_M_F"
	,"O_T_Soldier_M_F"
	,"O_T_Recon_M_F"
	//Snipers
	,"O_T_Sniper_F"
	,"O_T_ghillie_tna_F"
	,"O_T_Spotter_F"
	//UAV
	,"O_T_Soldier_UAV_F"
	//Officers
	,"O_T_Officer_F"];
	if(Param_UseDLCLaws==1) then {
		a3e_arr_Escape_InfantryTypes pushback "O_T_soldier_mine_F";
		a3e_arr_Escape_InfantryTypes pushback "O_T_soldier_UAV_06_F";
		a3e_arr_Escape_InfantryTypes pushback "O_T_soldier_UAV_06_medical_F";
	};
a3e_arr_Escape_InfantryTypes_Ind = [
	"I_C_Soldier_Bandit_8_F"
	,"I_C_Soldier_Para_8_F"
	,"I_C_Soldier_Bandit_7_F"
	,"I_C_Soldier_Bandit_7_F"
	,"I_C_Soldier_Bandit_7_F"
	,"I_C_Soldier_Bandit_7_F"
	,"I_C_Soldier_Para_7_F"
	,"I_C_Soldier_Para_7_F"
	,"I_C_Soldier_Para_2_F"
	,"I_C_Soldier_Para_2_F"
	,"I_C_Soldier_Para_1_F"
	,"I_C_Soldier_Para_1_F"
	,"I_C_Soldier_Bandit_5_F"
	,"I_C_Soldier_Bandit_5_F"
	,"I_C_Soldier_Bandit_4_F"
	,"I_C_Soldier_Bandit_4_F"
	,"I_C_Soldier_Bandit_4_F"
	,"I_C_Soldier_Bandit_1_F"
	,"I_C_Soldier_Para_3_F"
	,"I_C_Soldier_Bandit_2_F"
	,"I_C_Soldier_Bandit_2_F"
	,"I_C_Soldier_Para_5_F"
	,"I_C_Soldier_Para_5_F"
	,"I_C_Soldier_Bandit_3_F"
	,"I_C_Soldier_Bandit_3_F"
	,"I_C_Soldier_Para_4_F"
	,"I_C_Soldier_Para_4_F"
	,"I_C_Soldier_Bandit_6_F"
	,"I_C_Soldier_Bandit_6_F"
	,"I_C_Soldier_Para_6_F"
	,"I_C_Soldier_Para_6_F"];
a3e_arr_recon_InfantryTypes = [
	"O_V_Soldier_Exp_ghex_F"
	,"O_V_Soldier_JTAC_ghex_F"
	,"O_V_Soldier_M_ghex_F"
	,"O_V_Soldier_ghex_F"
	,"O_V_Soldier_Medic_ghex_F"
	,"O_V_Soldier_LAT_ghex_F"
	,"O_V_Soldier_TL_ghex_F"];
a3e_arr_recon_I_InfantryTypes = [
	"I_C_Soldier_Para_1_F"
	,"I_C_Soldier_Para_2_F"
	,"I_C_Soldier_Para_3_F"
	,"I_C_Soldier_Para_4_F"
	,"I_C_Soldier_Para_5_F"
	,"I_C_Soldier_Para_6_F"
	,"I_C_Soldier_Para_7_F"
	,"I_C_Soldier_Para_8_F"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_MRAP_02_gmg_ghex_F"
	,"O_T_LSV_02_armed_F"
	,"O_T_LSV_02_AT_F"
	,"O_T_UGV_01_rcws_ghex_F"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"I_C_Offroad_02_LMG_F"
	,"I_C_Offroad_02_AT_F"];


// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"O_T_Truck_03_transport_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	,"O_T_Truck_02_transport_F"
	,"O_T_Truck_02_F"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"I_C_Van_01_transport_F"
	,"I_C_Van_01_transport_F"
	,"I_C_Van_O1_transport_F"];
	if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind pushback "I_C_Van_02_vehicle_F";
		a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind pushback "I_C_Van_02_transport_F"
	};


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"O_T_APC_Wheeled_02_rcws_v2_ghex_F"
	,"O_T_APC_Wheeled_02_rcws_v2_ghex_F"
	,"O_T_APC_Tracked_02_cannon_ghex_F"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"O_T_MRAP_02_gmg_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"
	,"O_T_APC_Wheeled_02_rcws_v2_ghex_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"O_T_MBT_02_cannon_ghex_F"
	,"O_T_APC_Tracked_02_AA_ghex_F"];
	if(Param_UseDLCTanks==1) then {
		a3e_arr_ComCenDefence_heavyArmorClasses pushback "O_T_MBT_04_command_F";
	};

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"O_HMG_01_high_F"
	,"O_HMG_01_high_F"
	,"O_GMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
    //Unarmed Cars
    "O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_MRAP_02_ghex_F"
	,"O_T_Quadbike_01_ghex_F"
	,"O_T_Quadbike_01_ghex_F"
	,"O_T_Quadbike_01_ghex_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_LSV_02_unarmed_F"
	,"O_T_Truck_02_medical_F"
	,"O_T_Truck_02_transport_F"
	,"O_T_Truck_02_F"
	,"O_T_Truck_03_medical_ghex_F"
	,"O_T_Truck_03_covered_ghex_F"
	,"O_T_Truck_03_transport_ghex_F"
	//Supply Trucks
	,"O_T_Truck_03_fuel_ghex_F"
	,"O_T_Truck_03_ammo_ghex_F"
	,"O_T_Truck_03_repair_ghex_F"
	,"O_T_Truck_02_fuel_F"
	,"O_T_Truck_02_Ammo_F"
	,"O_T_Truck_02_Box_F"
	//Armed Cars
	,"O_LSV_02_armed_F"
	,"O_LSV_02_armed_F"
	,"O_LSV_02_AT_F"
	,"O_LSV_02_AT_F"
	//MRAPS
	,"O_T_MRAP_02_gmg_ghex_F"
	,"O_T_MRAP_02_hmg_ghex_F"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
    "C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_SUV_01_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_covered_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"
	,"C_Offroad_02_unarmed_F"];
	if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	    a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	    a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};


// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"O_HMG_01_high_F"
	,"O_GMG_01_high_F"
	,"O_HMG_01_high_F"
	,"O_static_AT_F"
	,"O_static_AA_F"];
	
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"O_Heli_Attack_02_black_F"
	,"O_T_VTOL_02_infantry_F"];
a3e_arr_O_transport_heli = [
	"O_Heli_Light_02_unarmed_F"];
	if(Param_UseDLCHelis==1) then {
	    a3e_arr_O_transport_heli pushback "O_Heli_Transport_04_bench_black_F";
	    a3e_arr_O_transport_heli pushback "O_Heli_Transport_04_covered_black_F";
	};
a3e_arr_O_pilots = [
	"O_T_Helipilot_F"
	,"O_T_Helicrew_F"];
a3e_arr_I_transport_heli = [
	"I_C_Heli_Light_01_civil_F"];
a3e_arr_I_pilots = [
	"I_C_Helipilot_F"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Rook40_F", 50, 4, 8, ["16Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Pistol_heavy_02_F", 10, 4, 8, ["6Rnd_45ACP_Cylinder"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_02_F", 50, 4, 8, ["30Rnd_9x21_Mag", "30Rnd_9x21_Mag_SMG_02_Tracer_Red", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_CTAR_blk_F", 100, 2, 4, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_CTAR_ghex_F", 100, 2, 4, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_CTAR_GL_blk_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_CTAR_GL_ghex_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Pistol_01_F", 20, 4, 8, ["10Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_05_F", 20, 4, 8, ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Red", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_AKM_F", 100, 2, 4, ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_F", "30Rnd_762x39_Mag_Tracer_Green_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_AKS_F", 100, 2, 4, ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_F", "30Rnd_545x39_Mag_Tracer_Green_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_AK12_F", 75, 2, 4, ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_AK12_F", 50, 2, 4, ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], 3];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_AK12_GL_F", 75, 2, 4, ["30Rnd_762x39_AK12_Mag_F", "30Rnd_762x39_AK12_Mag_Tracer_F", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTARS_blk_F", 50, 2, 4, ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTARS_ghex_F", 50, 2, 4, ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_07_blk_DMS_F", 50, 2, 4, ["20Rnd_650x39_Cased_Mag_F"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_07_ghex_F", 50, 2, 4, ["20Rnd_650x39_Cased_Mag_F"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_ARX_ghex_F", 50, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_ARX_blk_F", 50, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_GM6_ghex_LRPS_F", 10, 1, 2, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], 9]; 
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_GM6_LRPS_F", 10, 1, 2, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], 9]; 
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_01_hex_F", 30, 2, 4, ["150Rnd_93x64_Mag"], 3];  //Navid 9.3mm
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_04_DMS_F", 50, 2, 4, ["10Rnd_127x54_Mag"], 12];  //ASP-1 Kir
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_05_KHS_LP_F", 50, 2, 4, ["10Rnd_93x64_DMR_05_Mag"], 8];  //Cyrus
    };
// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_03_F", 20, 2, 4, ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Red_F", "200Rnd_556x45_Box_Tracer_F", "200Rnd_556x45_Box_Tracer_Red_F"], 6];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_06_olive_F", 20, 2, 4, ["20Rnd_762x51_Mag"], 5];
    };

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_RPG32_ghex_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Titan_ghex_F", 50, 1, 2, ["Titan_AA"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Titan_short_ghex_F", 50, 1, 2, ["Titan_AP", "Titan_AT"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Vorona_green_F", 50, 1, 2, ["Vorona_HEAT", "Vorona_HE"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_RPG7_F", 100, 2, 3, ["RPG7_F"], 6];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag", "ATMine_Range_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];
if(Param_UseDLCLaws==1) then {
    a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMineDispenser_Mag"], 2];
	};

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 25];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_ViperHarness_ghex_F"];


// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02_ghex_F", 10, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["O_NVGoggles_ghex_F", 10, 1, 3];
    };
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_L", 10, 1, 3];  //9mm generic
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_58_blk_F", 10, 1, 3];  //5.8mm
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_58_ghex_F", 10, 1, 3];  //5.8mm
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_65_TI_blk_F", 10, 1, 3];  //6.5mm CMR-76 and Type 115
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_65_TI_ghex_F", 10, 1, 3];  //6.5mm CMR-76 and Type 115
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 3];  //7.62mm generic and CMR-76
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_AmmoDepotItems pushback ["muzzle_snds_93mmg", 10, 1, 3];  //Cyrus (DMR_05) and Navid (MMG_01)	
	};
a3e_arr_AmmoDepotItems pushback ["optic_Yorris", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn_smg", 50, 1, 3];  //CSAT AND AAF
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn", 50, 1, 3];  //CSAT AND AAF
a3e_arr_AmmoDepotItems pushback ["optic_Arco_blk_F", 25, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["optic_Arco_ghex_F", 25, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 15, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["optic_DMS_ghex_F", 15, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["optic_NVS", 10, 1, 2];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 10, 1, 3];  //Cyrus (DMR_05) and Navid (MMG_01)
	};
a3e_arr_AmmoDepotItems pushback ["optic_LRPS_ghex_F", 10, 1, 1];  //CSAT
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 25, 2, 4];



// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_F", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_F", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_snds_F", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["arifle_AKM_F", "30Rnd_762x39_Mag_F", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_AKS_F", "30Rnd_545x39_Mag_F", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_AK12_F", "30Rnd_762x39_Mag_F", 6];
a3e_arr_CivilianCarWeapons pushback ["SMG_05_F", "30Rnd_9x21_Mag_SMG_02", 6];
a3e_arr_CivilianCarWeapons pushback ["SMG_02_F", "30Rnd_9x21_Mag", 6];
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 6];
    };
a3e_arr_CivilianCarWeapons pushback ["launch_RPG7_F", "RPG7_F", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];

// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"optic_ACO_grn"
	,"optic_Arco_blk_F"];
a3e_arr_Scopes_SMG = [
	"optic_ACO_grn_smg"];
a3e_arr_Scopes_Sniper = [
	"optic_DMS"
	,"optic_LRPS_ghex_F"];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_Scopes_Sniper pushback "optic_KHS_blk";
	a3e_arr_Scopes_Sniper pushback "optic_KHS_old";
    };
a3e_arr_NightScopes = [
	"optic_NVS"];
a3e_arr_TWSScopes = [
	"optic_Nightstalker"
	,"optic_tws"
	,"optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"bipod_02_F_blk"];

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
	"B_Heli_Transport_01_F"];
	 if(Param_UseDLCHelis==1) then {
	a3e_arr_O_transport_heli pushback "B_Heli_Transport_03_F";
	};
a3e_arr_extraction_chopper_escort = [
	"B_Heli_Attack_01_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"B_T_Boat_Armed_01_minigun_F"];
a3e_arr_extraction_boat_escort = [
	"B_T_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"B_T_Truck_01_transport_F",	//17
	"B_T_Truck_01_covered_F",	//17
	"B_T_APC_Tracked_01_rcws_F",	//8
	"B_T_APC_Wheeled_01_cannon_F",	//8
	"B_T_LSV_01_unarmed_F"];	//6
a3e_arr_extraction_car_escort = [
	"B_T_APC_Tracked_01_AA_F",
	"B_T_APC_Wheeled_01_cannon_F",
	"B_T_MBT_01_cannon_F",
	"B_T_MBT_01_TUSK_F"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"O_UAV_01_F"
	,"O_T_UAV_04_CAS_F"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"I_C_Heli_Light_01_civil_F"];
a3e_arr_searchChopperHard = [
	"O_Heli_Light_02_v2_F"];
a3e_arr_searchChopper_pilot = [
	"O_T_Helipilot_F"];
a3e_arr_searchChopper_crew = [
	"O_T_Helicrew_F"];

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
	"O_T_Boat_Armed_01_hmg_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "Box_T_East_Wps_F";
a3e_additional_weapon_box_2 = "Box_T_East_WpsSpecial_F";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"O_Mortar_01_F"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"O_Plane_CAS_02_F"
	,"O_Plane_Fighter_02_Cluster_F"
	,"O_Plane_CAS_02_Cluster_F"];

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
	"Land_UWreck_MV22_F"
	,"Land_Wreck_Plane_Transport_01_F"
	,"Land_Wreck_Heli_Attack_01_F"];
a3e_arr_CrashSiteCrew = [
	"B_T_Helipilot_F"
	,"B_T_Helicrew_F"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_HMMWV_F"
	,"Land_Wreck_Hunter_F"
	,"Land_Wreck_Slammer_F"
	,"Land_Wreck_AFV_Wheeled_01_F"];
a3e_arr_CrashSiteCrewCar = [
	"B_T_Crew_F"
	,"B_T_Soldier_F"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["launch_NLAW_F", 10, 1, 2, ["NLAW_F"], 3];
a3e_arr_CrashSiteWeapons pushback ["launch_MRAWS_green_F", 10, 1, 2, ["MRAWS_HEAT_F","MRAWS_HE_F"], 2];
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_02_camo_AMS_LP_F", 10, 1, 2, ["10Rnd_338_Mag"], 8]; //MAR-10
	a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_03_AMS_F", 10, 1, 2, ["20Rnd_762x51_Mag"], 8]; //Mk-1 EMR
	a3e_arr_CrashSiteWeapons pushback ["MMG_02_black_F", 10, 1, 2, ["130Rnd_338_Mag"], 4];  //SPMG
};
a3e_arr_CrashSiteWeapons pushback ["SMG_01_F", 50, 1, 2, ["30Rnd_45ACP_Mag_SMG_01"], 8];
a3e_arr_CrashSiteWeapons pushback ["arifle_MX_khk_F", 75, 2, 4, ["30Rnd_65x39_caseless_mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_SPAR_01_blk_F", 25, 2, 4, ["30Rnd_556x45_Stanag"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_MX_GL_khk_F", 50, 2, 4, ["30Rnd_65x39_caseless_mag", "1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_SPAR_01_GL_blk_F", 20, 2, 4, ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_MX_SW_khk_F", 20, 1, 2, ["100Rnd_65x39_caseless_mag_Tracer"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_SPAR_02_blk_F", 20, 1, 2, ["150Rnd_556x45_Drum_Mag_F"], 4];
a3e_arr_CrashSiteWeapons pushback ["arifle_MXM_khk_MOS_Pointer_Bipod_F", 10, 1, 2, ["30Rnd_65x39_caseless_mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["arifle_SPAR_03_blk_MOS_Pointer_Bipod_F", 10, 1, 2, ["20Rnd_762x51_Mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["srifle_LRR_tna_LRPS_F", 10, 1, 2, ["7Rnd_408_Mag"], 8];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["optic_Aco_smg", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Holosight_smg_khk_F", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Aco", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Holosight_khk_F", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Hamr_khk_F", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_ERCO_blk_F", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_SOS_khk_F", 10, 1, 3];
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_CrashSiteItems pushback ["optic_AMS", 10, 1, 3];
    };
a3e_arr_CrashSiteItems pushback ["muzzle_snds_H_khk_F", 10, 1, 3];  //6.5mm Katiba and MX
a3e_arr_CrashSiteItems pushback ["muzzle_snds_H_MG_khk_F", 10, 1, 3]; //6.5mm MX SW, Mk200, and LIM-85 TAN
a3e_arr_CrashSiteItems pushback ["muzzle_snds_M", 10, 1, 3];  //5.56mm generic
a3e_arr_CrashSiteItems pushback ["muzzle_snds_B", 10, 1, 3];  //7.62mm generic
a3e_arr_CrashSiteItems pushback ["muzzle_snds_acp", 10, 1, 3];  //.45 generic
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_CrashSiteItems pushback ["muzzle_snds_338_black", 10, 1, 3];  //.338 MAR-10 and SPMG
	};
a3e_arr_CrashSiteItems pushback ["bipod_01_F_blk", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["bipod_01_F_khk", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["B_UavTerminal", 75, 1, 1];