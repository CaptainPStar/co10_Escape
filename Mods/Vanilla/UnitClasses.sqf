/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */
 
//NOTE "O_APC_Wheeled_02_rcws_F" does not have a proper first person view for driver, and has a commander's seat that shouldn't be there so use "O_APC_Wheeled_02_rcws_v2_F" instead.

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;
A3E_VAR_Side_Opfor = east;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_AAF_CO.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"I_Soldier_AR_F",
	"I_Soldier_GL_F",
	"I_Soldier_F",
	"I_Soldier_lite_F"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
//Pistols
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_ACPC2_snds_F","9Rnd_45ACP_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_snds_F","16Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_Yorris_F","6Rnd_45ACP_Cylinder"];
//SMGs
a3e_arr_PrisonBackpackWeapons pushback ["hgun_PDW2000_F","30Rnd_9x21_Mag"];


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
	//Supply Trucks
	,"C_Van_01_fuel_F"
	,"C_Offroad_01_repair_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"];
	if(Param_UseDLCApex==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Offroad_02_unarmed_F";
	};
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
		//Unarmed Cars/UAVs 3 sets
		"O_MRAP_02_F"  //1
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Truck_03_medical_F"
		,"O_Truck_03_transport_F"
		,"O_Truck_03_covered_F"
		,"O_Truck_02_medical_F"
		,"O_Truck_02_transport_F"
		,"O_Truck_02_covered_F"
		,"O_UGV_01_F"
		,"O_MRAP_02_F"  //2
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Truck_03_medical_F"
		,"O_Truck_03_transport_F"
		,"O_Truck_03_covered_F"
		,"O_Truck_02_medical_F"
		,"O_Truck_02_transport_F"
		,"O_Truck_02_covered_F"
		,"O_UGV_01_F"
        //Device Truck
		,"O_Truck_03_device_F"
		//Supply Trucks  1 set
	    ,"O_Truck_03_ammo_F"
		,"O_Truck_03_fuel_F"
		,"O_Truck_03_repair_F"
		,"O_Truck_02_ammo_F"
		,"O_Truck_02_fuel_F"
		,"O_Truck_02_box_F"
		//Armed UAVs  1 set
		,"O_UGV_01_rcws_F"
		,"O_UGV_01_rcws_F"
		//MRAPS  1 set
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		//Heavily Armed APCs or AA  1 set
		,"O_APC_Wheeled_02_rcws_v2_F"
		,"O_APC_Tracked_02_AA_F"
		,"O_APC_Tracked_02_cannon_F"
		//Artillery  1 set
		,"O_MBT_02_arty_F"
		//Tanks  1 set
		,"O_MBT_02_cannon_F"];
		if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		};
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_MBT_04_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_MBT_04_command_F";
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
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		};
		if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
	    };
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//RATIO OF UNARKMED VEHICLES TO ARMED MRAPS/UAVS TO HEAVILY ARMED APCS TO ARTILLERY TO TANKS IS CURRENTLY
		//35 to 16 to 3 to 1  OR    63.6% 29.1%  .05.4%  .018
	
		//Unarmed Cars/UAVs 2 sets
		"O_MRAP_02_F"  //1
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Truck_03_medical_F"
		,"O_Truck_03_transport_F"
		,"O_Truck_03_covered_F"
		,"O_Truck_02_medical_F"
		,"O_Truck_02_transport_F"
		,"O_Truck_02_covered_F"
		,"O_UGV_01_F"
		,"O_MRAP_02_F"  //2
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Truck_03_medical_F"
		,"O_Truck_03_transport_F"
		,"O_Truck_03_covered_F"
		,"O_Truck_02_medical_F"
		,"O_Truck_02_transport_F"
		,"O_Truck_02_covered_F"
		,"O_UGV_01_F"
		//Device Truck
		,"O_Truck_03_device_F"
		//Supply Trucks  1 set
	    ,"O_Truck_03_ammo_F"
		,"O_Truck_03_fuel_F"
		,"O_Truck_03_repair_F"
		,"O_Truck_02_ammo_F"
		,"O_Truck_02_fuel_F"
		,"O_Truck_02_box_F"
		//Armed UAVs  2 sets
		,"O_UGV_01_rcws_F"  //1
		,"O_UGV_01_rcws_F"
		,"O_UGV_01_rcws_F"  //2
		,"O_UGV_01_rcws_F"
		//MRAPS  2 sets
		,"O_MRAP_02_gmg_F"  //1
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_gmg_F"  //2
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		//Heavily Armed APCs or AA  1 set
		,"O_APC_Wheeled_02_rcws_v2_F"
		,"O_APC_Tracked_02_AA_F"
		,"O_APC_Tracked_02_cannon_F"
		//Artillery  1 set
		,"O_MBT_02_arty_F"
		//Tanks  1 set
		,"O_MBT_02_cannon_F"];
		if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		};
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_MBT_04_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_MBT_04_command_F";
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
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		};
		if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
	    };
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		//Unarmed Cars/UAVs 2 sets
		"O_MRAP_02_F"  //1
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Truck_03_medical_F"
		,"O_Truck_03_transport_F"
		,"O_Truck_03_covered_F"
		,"O_Truck_02_medical_F"
		,"O_Truck_02_transport_F"
		,"O_Truck_02_covered_F"
		,"O_UGV_01_F"
		,"O_MRAP_02_F"  //2
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Truck_03_medical_F"
		,"O_Truck_03_transport_F"
		,"O_Truck_03_covered_F"
		,"O_Truck_02_medical_F"
		,"O_Truck_02_transport_F"
		,"O_Truck_02_covered_F"
		,"O_UGV_01_F"
		//Device Truck
		,"O_Truck_03_device_F"
		//Supply Trucks  1 set
	    ,"O_Truck_03_ammo_F"
		,"O_Truck_03_fuel_F"
		,"O_Truck_03_repair_F"
		,"O_Truck_02_ammo_F"
		,"O_Truck_02_fuel_F"
		,"O_Truck_02_box_F"
		//Armed UAVs  2 sets
		,"O_UGV_01_rcws_F"  //1
		,"O_UGV_01_rcws_F"
		,"O_UGV_01_rcws_F"  //2
		,"O_UGV_01_rcws_F"
		//MRAPS  2 sets
		,"O_MRAP_02_gmg_F"  //1
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_gmg_F"  //2
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		,"O_MRAP_02_hmg_F"
		//Heavily Armed APCs or AA  2 sets
		,"O_APC_Wheeled_02_rcws_v2_F"
		,"O_APC_Tracked_02_AA_F"
		,"O_APC_Tracked_02_cannon_F"
		,"O_APC_Wheeled_02_rcws_v2_F"
		,"O_APC_Tracked_02_AA_F"
		,"O_APC_Tracked_02_cannon_F"
		//Artillery  1 set
		,"O_MBT_02_arty_F"
		//Tanks  2 sets
		,"O_MBT_02_cannon_F"
		,"O_MBT_02_cannon_F"];
		if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_unarmed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_armed_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_LSV_02_AT_F";
		};
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_MBT_04_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses pushback "O_MBT_04_command_F";
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
		//MRAPS  2 sets
		,"I_MRAP_03_gmg_F"  //1
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_gmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"
		,"I_MRAP_03_hmg_F"  //2
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
		if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AA_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_AT_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_scout_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_LT_01_cannon_F";
		};
		if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_transport_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
		a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND pushback "I_G_Van_02_vehicle_F";
	    };
    };
};


// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
    //Rifleman
	"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_soldier_F"
	,"O_Soldier_lite_F"
	,"O_Soldier_lite_F"
	,"O_Soldier_lite_F"
	,"O_Soldier_lite_F"
	,"O_Soldier_lite_F"
	,"O_Soldier_lite_F"
	,"O_Soldier_lite_F"
	,"O_Soldier_lite_F"
	//Ammo carrier Classes
	,"O_Soldier_A_F"
	,"O_Soldier_A_F"
	,"O_Soldier_A_F"
	,"O_Soldier_A_F"
	,"O_Soldier_AAR_F"
	,"O_Soldier_AAR_F"
	,"O_Soldier_AAA_F"
	,"O_Soldier_AAA_F"
	,"O_Soldier_AAT_F"
	,"O_Soldier_AAT_F"
	,"O_Soldier_AHAT_F"
	,"O_Soldier_AHAT_F"
	//Machine gunners/Autoriflemen
	,"O_Soldier_AR_F"
	,"O_Soldier_AR_F"
	,"O_Soldier_AR_F"
	,"O_Soldier_AR_F"
	,"O_Soldier_AR_F"
	,"O_Soldier_AR_F"
	,"O_Soldier_AR_F"
	,"O_Soldier_AR_F"
	//Grenadiers
	,"O_Soldier_GL_F"
	,"O_Soldier_GL_F"
	,"O_Soldier_GL_F"
	,"O_Soldier_GL_F"
	,"O_Soldier_GL_F"
	,"O_Soldier_GL_F"
	,"O_Soldier_GL_F"
	,"O_Soldier_GL_F"
	//Buildable Weapon Classes
	,"O_support_MG_F"
	,"O_support_MG_F"
	,"O_support_GMG_F"
	,"O_support_GMG_F"
	,"O_support_AMG_F"
	,"O_support_AMG_F"
	,"O_support_AMG_F"
	,"O_support_AMG_F"
	//Buildable Mortar Classes
	,"O_support_AMort_F"
	,"O_support_Mort_F"
	//Classes with Medkit
	,"O_medic_F"
	,"O_medic_F"
	,"O_medic_F"
	,"O_medic_F"
	//Classes with Toolkit
	,"O_engineer_F"
	,"O_engineer_F"
	,"O_Soldier_exp_F"
	,"O_Soldier_exp_F"
	,"O_Soldier_repair_F"
	,"O_Soldier_repair_F"
	//Squad Leaders
	,"O_Soldier_SL_F"
	,"O_Soldier_SL_F"
	,"O_Soldier_SL_F"
	,"O_Soldier_SL_F"
	,"O_Soldier_TL_F"
	,"O_Soldier_TL_F"
	,"O_Soldier_TL_F"
	,"O_Soldier_TL_F"
	//Light AT
	,"O_Soldier_LAT_F"
	,"O_Soldier_LAT_F"
	,"O_Soldier_LAT_F"
	,"O_Soldier_LAT_F"
	,"O_Soldier_LAT_F"
	,"O_Soldier_LAT_F"
	,"O_Soldier_LAT_F"
	,"O_Soldier_LAT_F"
	//Heavy AT
	,"O_Soldier_AT_F"
	,"O_Soldier_AT_F"
	,"O_Soldier_HAT_F"
	,"O_Soldier_HAT_F"
	//AA
	,"O_Soldier_AA_F"
	,"O_Soldier_AA_F"
	,"O_Soldier_AA_F"
	,"O_Soldier_AA_F"
	//Marksmen
	,"O_Soldier_M_F"
	,"O_Soldier_M_F"
	,"O_Soldier_M_F"
	,"O_Soldier_M_F"
	//Snipers
	,"O_sniper_F"
	,"O_ghillie_ard_F"
	,"O_ghillie_lsh_F"
	,"O_ghillie_sard_F"
	,"O_spotter_F"
	//UAV
	,"O_soldier_UAV_F"
	,"O_soldier_UAV_F"
	,"O_soldier_UAV_F"
	//Officers
	,"O_officer_F"];
	if(Param_UseDLCMarksmen==1) then {
		a3e_arr_Escape_InfantryTypes pushback "O_HeavyGunner_F";
		a3e_arr_Escape_InfantryTypes pushback "O_HeavyGunner_F";
		a3e_arr_Escape_InfantryTypes pushback "O_Sharpshooter_F";
		a3e_arr_Escape_InfantryTypes pushback "O_Sharpshooter_F";
	};
	if(Param_UseDLCLaws==1) then {
		a3e_arr_Escape_InfantryTypes pushback "O_soldier_mine_F";
		a3e_arr_Escape_InfantryTypes pushback "O_soldier_UAV_06_F";
		a3e_arr_Escape_InfantryTypes pushback "O_soldier_UAV_06_medical_F";
	};
a3e_arr_Escape_InfantryTypes_Ind = [
    //Rifleman
	"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_soldier_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	,"I_Soldier_lite_F"
	//Ammo carrier Classes
	,"I_Soldier_A_F"
	,"I_Soldier_A_F"
	,"I_Soldier_A_F"
	,"I_Soldier_A_F"
	,"I_Soldier_AAR_F"
	,"I_Soldier_AAR_F"
	,"I_Soldier_AAA_F"
	,"I_Soldier_AAA_F"
	,"I_Soldier_AAT_F"
	,"I_Soldier_AAT_F"
	//Machine gunners/Autoriflemen
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	,"I_Soldier_AR_F"
	//Grenadiers
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	,"I_Soldier_GL_F"
	//Buildable Weapon Classes
	,"I_support_MG_F"
	,"I_support_MG_F"
	,"I_support_GMG_F"
	,"I_support_GMG_F"
	,"I_support_AMG_F"
	,"I_support_AMG_F"
	,"I_support_AMG_F"
	,"I_support_AMG_F"
	//Buildable Mortar Classes
	,"I_support_Mort_F"
	,"I_support_AMort_F"
	//Classes with Medkit
	,"I_medic_F"
	,"I_medic_F"
	,"I_medic_F"
	,"I_medic_F"
	//Classes with Toolkit
	,"I_engineer_F"
	,"I_engineer_F"
	,"I_Soldier_exp_F"
	,"I_Soldier_exp_F"
	,"I_Soldier_repair_F"
	,"I_Soldier_repair_F"
	//Squad Leaders
	,"I_Soldier_SL_F"
	,"I_Soldier_SL_F"
	,"I_Soldier_SL_F"
	,"I_Soldier_SL_F"
	,"I_Soldier_TL_F"
	,"I_Soldier_TL_F"
	,"I_Soldier_TL_F"
	,"I_Soldier_TL_F"
	//Light AT
	,"I_Soldier_LAT_F"
	,"I_Soldier_LAT_F"
	,"I_Soldier_LAT_F"
	,"I_Soldier_LAT_F"
	,"I_Soldier_LAT2_F"
	,"I_Soldier_LAT2_F"
	,"I_Soldier_LAT2_F"
	,"I_Soldier_LAT2_F"
	//Heavy AT
	,"I_Soldier_AT_F"
	,"I_Soldier_AT_F"
	,"I_Soldier_AT_F"
	,"I_Soldier_AT_F"
	//AA
	,"I_Soldier_AA_F"
	,"I_Soldier_AA_F"
	,"I_Soldier_AA_F"
	,"I_Soldier_AA_F"
	//Marksmen
	,"I_Soldier_M_F"
	,"I_Soldier_M_F"
	,"I_Soldier_M_F"
	,"I_Soldier_M_F"
	//Snipers
	,"I_Spotter_F"
	,"I_Sniper_F"
	,"I_ghillie_ard_F"
	,"I_ghillie_Ish_F"
	,"I_ghillie_sard_F"
	//UAV
	,"I_soldier_UAV_F"
	,"I_soldier_UAV_F"
	,"I_soldier_UAV_F"
	//Officers
	,"I_officer_F"];
	if(Param_UseDLCLaws==1) then {
		a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_mine_F";
		a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_UAV_06_F";
		a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_UAV_06_medical_F";
	    };
a3e_arr_recon_InfantryTypes = [
	"O_recon_exp_F"
	,"O_recon_JTAC_F"
	,"O_recon_M_F"
	,"O_recon_medic_F"
	,"O_recon_F"
	,"O_recon_LAT_F"
	,"O_recon_TL_F"];
	if(Param_UseDLCMarksmen==1) then {
		a3e_arr_Escape_InfantryTypes pushback "O_Pathfinder_F";
	};
	if(Param_UseDLCApex==1) then {
	    a3e_arr_Escape_InfantryTypes_Ind pushback "O_V_Soldier_Exp_hex_F";
	    a3e_arr_Escape_InfantryTypes_Ind pushback "O_V_Soldier_JTAC_hex_F";
	    a3e_arr_Escape_InfantryTypes_Ind pushback "O_V_Soldier_M_hex_F";
	    a3e_arr_Escape_InfantryTypes_Ind pushback "O_V_Soldier_hex_F";
	    a3e_arr_Escape_InfantryTypes_Ind pushback "O_V_Soldier_Medic_hex_F";
	    a3e_arr_Escape_InfantryTypes_Ind pushback "O_V_Soldier_LAT_hex_F";
	    a3e_arr_Escape_InfantryTypes_Ind pushback "O_V_Soldier_TL_hex_F";
		};
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
	"O_MRAP_02_hmg_F"
	,"O_MRAP_02_hmg_F"
	,"O_MRAP_02_gmg_F"
	,"O_UGV_01_rcws_F"];
	if(Param_UseDLCApex==1) then {
	    a3e_arr_Escape_RoadBlock_MannedVehicleTypes pushback "O_LSV_02_armed_F";
	    a3e_arr_Escape_RoadBlock_MannedVehicleTypes pushback "O_LSV_02_AT_F";
		};
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"I_MRAP_03_hmg_F"
	,"I_MRAP_03_hmg_F"
	,"I_MRAP_03_gmg_F"
	,"I_UGV_01_rcws_F"];
	if(Param_UseDLCTanks==1) then {
		a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_LT_01_AT_F";
		a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_LT_01_cannon_F";
		a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind pushback "I_LT_01_AA_F";
	};


// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"O_Truck_02_covered_F"
	,"O_Truck_02_transport_F"
	,"O_Truck_03_transport_F"
	,"O_Truck_03_covered_F"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"I_Truck_02_transport_F"
	,"I_Truck_02_covered"];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"O_APC_Wheeled_02_rcws_v2_F"
	,"O_APC_Wheeled_02_rcws_v2_F"
	,"O_APC_Tracked_02_cannon_F"];


// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"O_MRAP_02_gmg_F"
	,"O_MRAP_02_hmg_F"
	,"O_APC_Wheeled_02_rcws_v2_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"O_MBT_02_cannon_F"
	,"O_APC_Tracked_02_AA_F"];
	if(Param_UseDLCTanks==1) then {
		a3e_arr_ComCenDefence_heavyArmorClasses pushback "O_MBT_04_command_F";
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
		"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_MRAP_02_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Quadbike_01_F"
		,"O_Truck_03_medical_F"
		,"O_Truck_03_transport_F"
		,"O_Truck_03_covered_F"
		,"O_Truck_02_medical_F"
		,"O_Truck_02_transport_F"
		,"O_Truck_02_covered_F"
		//Supply Trucks
	    ,"O_Truck_03_ammo_F"
		,"O_Truck_03_fuel_F"
		,"O_Truck_03_repair_F"
		,"O_Truck_02_ammo_F"
		,"O_Truck_02_fuel_F"
		,"O_Truck_02_box_F"
		//MRAPS
		,"O_MRAP_02_gmg_F"
		,"O_MRAP_02_hmg_F"];
		if(Param_UseDLCApex==1) then {
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_unarmed_F";
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_unarmed_F";
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_unarmed_F";
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_unarmed_F";
		};
		if(Param_UseDLCApex==1) then {
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_armed_F";
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_armed_F";
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_AT_F";
		    a3e_arr_ComCenParkedVehicles pushback "O_LSV_02_AT_F";
	    };

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
	,"C_Truck_02_covered_F"];
	if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(Param_UseDLCLaws==1) then {
	    a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	    a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	    a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};


// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"O_HMG_01_high_F"
	,"O_HMG_01_high_F"
	,"O_GMG_01_high_F"
	,"O_static_AT_F"
	,"O_static_AA_F"];

// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;


//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"O_Heli_Attack_02_F"
	,"O_Heli_Attack_02_black_F"];
	if(Param_UseDLCApex==1) then {
	a3e_arr_O_attack_heli pushback "O_T_VTOL_02_infantry_hex_F";
	};
a3e_arr_O_transport_heli = [
	"O_Heli_Light_02_unarmed_F"];
	if(Param_UseDLCHelis==1) then {
	    a3e_arr_O_transport_heli pushback "O_Heli_Transport_04_bench_F";
	    a3e_arr_O_transport_heli pushback "O_Heli_Transport_04_covered_F";
	};
a3e_arr_O_pilots = [
	"O_Pilot_F"
	,"O_helicrew_F"];
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
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Rook40_F", 50, 4, 8, ["16Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_Pistol_heavy_02_F", 10, 4, 8, ["6Rnd_45ACP_Cylinder"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_02_F", 50, 4, 8, ["30Rnd_9x21_Mag", "30Rnd_9x21_Mag_SMG_02_Tracer_Red", "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Katiba_F", 100, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Katiba_C_F", 50, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Katiba_GL_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];

// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_PDW2000_F", 50, 4, 8, ["30Rnd_9x21_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["hgun_ACPC2_F", 50, 4, 8, ["9Rnd_45ACP_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20_F", 50, 2, 4, ["30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20_plain_F", 50, 2, 4, ["30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "30Rnd_556x45_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20_GL_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20_GL_plain_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20C_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_Mk20C_plain_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_TRG20_F", 25, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_TRG21_F", 25, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["arifle_TRG21_GL_F", 25, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_01_DMS_BI_F", 50, 2, 4, ["10Rnd_762x54_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_Zafir_F", 50, 2, 4, ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_GM6_camo_LRPS_F", 10, 1, 2, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], 9]; 
if(Param_UseDLCApex==1) then {
    a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTAR_blk_F", 15, 2, 4, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], 6];
    a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTAR_hex_F", 15, 2, 4, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], 6];
    a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTAR_GL_blk_F", 15, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];
    a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTAR_GL_hex_F", 15, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTARS_blk_F", 15, 2, 4, ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], 5];
    a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_CTARS_hex_F", 15, 2, 4, ["100Rnd_580x42_ghex_Mag_F", "100Rnd_580x42_ghex_Mag_Tracer_F"], 5];
    a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_07_blk_DMS_F", 15, 2, 4, ["20Rnd_650x39_Cased_Mag_F"], 5];
    a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_07_ghex_F", 15, 2, 4, ["20Rnd_650x39_Cased_Mag_F"], 5];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_ARX_hex_F", 10, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"], 6];
    a3e_arr_AmmoDepotSpecialWeapons pushback ["arifle_ARX_blk_F", 10, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"], 6];
    };
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_01_hex_F", 15, 2, 4, ["150Rnd_93x64_Mag"], 3];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["MMG_01_tan_F", 15, 2, 4, ["150Rnd_93x64_Mag"], 3];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_04_DMS_F", 25, 1, 2, ["10Rnd_127x54_Mag"], 8];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_04_Tan_F", 25, 1, 2, ["10Rnd_127x54_Mag"], 8];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_05_KHS_LP_F", 20, 1, 2, ["10Rnd_93x64_DMR_05_Mag"], 8];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_05_hex_F", 20, 1, 2, ["10Rnd_93x64_DMR_05_Mag"], 8];
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_05_tan_f", 20, 1, 2, ["10Rnd_93x64_DMR_05_Mag"], 8];
    };
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["LMG_Mk200_F", 20, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_EBR_MRCO_LP_BI_F", 20, 2, 4, ["20Rnd_762x51_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_GM6_LRPS_F", 10, 1, 2, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], 9];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotSpecialWeapons pushback ["srifle_DMR_06_camo_khs_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 10];
};

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_RPG32_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Titan_F", 25, 1, 2, ["Titan_AA"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Titan_short_F", 25, 1, 2, ["Titan_AP", "Titan_AT"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_O_Vorona_brown_F", 50, 1, 2, ["Vorona_HEAT", "Vorona_HE"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["launch_NLAW_F", 50, 3, 5, ["NLAW_F"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_MRAWS_green_rail_F", 25, 1, 3, ["MRAWS_HEAT_F", "MRAWS_HE_F"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["launch_MRAWS_olive_rail_F", 25, 1, 3, ["MRAWS_HEAT_F", "MRAWS_HE_F"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["launch_MRAWS_sand_rail_F", 25, 1, 3, ["MRAWS_HEAT_F", "MRAWS_HE_F"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_F", 25, 1, 2, ["Titan_AA"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_short_F", 25, 1, 2, ["Titan_AP", "Titan_AT"], 3];


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
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_Carryall_ocamo"];


// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02", 10, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles_OPFOR", 10, 1, 3];
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
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_acp", 10, 1, 3];  //.45 generic
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_M", 10, 1, 3];  //5.56mm generic
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_h", 10, 1, 3];  //6.5mm Katiba and MX
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_65_TI_blk_F", 10, 1, 3];  //6.5mm CMR-76 and Type 115
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_65_TI_hex_F", 10, 1, 3];  //6.5mm CMR-76 and Type 115
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 3];  //7.62mm generic
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_AmmoDepotItems pushback ["muzzle_snds_93mmg", 10, 1, 3];  //Cyrus (DMR_05) and Navid (MMG_01)
	a3e_arr_AmmoDepotItems pushback ["muzzle_snds_93mmg_tan", 10, 1, 3];  //Cyrus (DMR_05) and Navid (MMG_01)
	};
a3e_arr_AmmoDepotItems pushback ["optic_Yorris", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn_smg", 20, 1, 3];  //CSAT AND AAF
a3e_arr_AmmoDepotItems pushback ["optic_ACO_grn", 20, 1, 3];  //CSAT AND AAF
a3e_arr_AmmoDepotItems pushback ["optic_Arco", 10, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["optic_Arco_blk", 10, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["optic_MRCO", 10, 1, 2];  //AAF and FIA
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 10, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["optic_NVS", 10, 1, 2];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 10, 1, 1];  //CSAT
	a3e_arr_AmmoDepotItems pushback ["optic_KHS_hex", 10, 1, 1];  //CSAT
	a3e_arr_AmmoDepotItems pushback ["optic_KHS_tan", 10, 1, 1];  //CSAT
	};
a3e_arr_AmmoDepotItems pushback ["optic_LRPS", 10, 1, 2];  //CSAT, NATO, AND AAF
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
    };
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 10, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_tan", 10, 1, 2];  //CSAT
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];  //AAF
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_oli", 10, 1, 2];  //AAF


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_F", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_F", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_Rook40_snds_F", "16Rnd_9x21_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_ACPC2_F", "9Rnd_45ACP_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["hgun_ACPC2_snds_F", "9Rnd_45ACP_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["arifle_TRG20_F", "30Rnd_556x45_Stanag", 6];
a3e_arr_CivilianCarWeapons pushback ["arifle_TRG21_F", "30Rnd_556x45_Stanag", 6];
a3e_arr_CivilianCarWeapons pushback ["SMG_02_F", "30Rnd_9x21_Mag", 6];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
    };
if(Param_UseDLCApex==1) then {
    a3e_arr_CivilianCarWeapons pushback ["launch_RPG7_F", "RPG7_F", 2];
	a3e_arr_CivilianCarWeapons pushback ["arifle_AKM_F", "30Rnd_762x39_Mag_F", 6];
    a3e_arr_CivilianCarWeapons pushback ["arifle_AKS_F", "30Rnd_545x39_Mag_F", 6];
    a3e_arr_CivilianCarWeapons pushback ["arifle_AK12_F", "30Rnd_762x39_Mag_F", 6];
    };
a3e_arr_CivilianCarWeapons pushback ["launch_RPG32_F", "RPG32_F", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"optic_ACO_grn"
	,"optic_Arco_blk_F"
	,"optic_MRCO"];
a3e_arr_Scopes_SMG = [
	"optic_ACO_grn_smg"];
a3e_arr_Scopes_Sniper = [
	"optic_DMS"
	,"optic_LRPS"];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_Scopes_Sniper pushback "optic_KHS_blk";
	a3e_arr_Scopes_Sniper pushback "optic_KHS_hex";
	a3e_arr_Scopes_Sniper pushback "optic_KHS_old";
	a3e_arr_Scopes_Sniper pushback "optic_KHS_tan";
    };
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
	,"bipod_02_F_hex"
	,"bipod_03_F_blk"
	,"bipod_03_F_oli"];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"B_Heli_Transport_01_F"];
	if(Param_UseDLCHelis==1) then {
	a3e_arr_extraction_chopper pushback "B_Heli_Transport_03_F";
	};
a3e_arr_extraction_chopper_escort = [
	"B_Heli_Attack_01_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"B_Boat_Armed_01_minigun_F"];
a3e_arr_extraction_boat_escort = [
	"B_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"O_UAV_01_F"
	,"O_UAV_01_F"
	,"O_UAV_02_CAS_F"
	,"O_UAV_02_F"];

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
	"O_Boat_Armed_01_hmg_F"
	,"I_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "Box_East_Wps_F";
a3e_additional_weapon_box_2 = "Box_East_WpsSpecial_F";

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
	,"I_Plane_Fighter_03_CAS_F"
	,"O_Plane_Fighter_02_Cluster_F"
	,"O_Plane_CAS_02_Cluster_F"
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
	"Land_UWreck_MV22_F"
	,"Land_Wreck_Plane_Transport_01_F"
	,"Land_Wreck_Heli_Attack_01_F"];
a3e_arr_CrashSiteCrew = [
	"B_Pilot_F"
	,"B_helicrew_F"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_Hunter_F"
	,"Land_Wreck_Slammer_F"
	,"Land_Wreck_AFV_Wheeled_01_F"];
a3e_arr_CrashSiteCrewCar = [
	"B_crew_F"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["launch_NLAW_F", 10, 1, 2, ["NLAW_F"], 3];
a3e_arr_CrashSiteWeapons pushback ["launch_MRAWS_sand_F", 10, 1, 2, ["MRAWS_HEAT_F","MRAWS_HE_F"], 2];
a3e_arr_CrashSiteWeapons pushback ["srifle_EBR_Hamr_pointer_F", 10, 1, 2, ["20Rnd_762x51_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["srifle_LRR_LRPS_F", 10, 1, 2, ["7Rnd_408_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["arifle_MX_F", 75, 2, 4, ["30Rnd_65x39_caseless_mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_MX_GL_F", 50, 2, 4, ["30Rnd_65x39_caseless_mag", "1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_MX_SW_F", 20, 1, 2, ["100Rnd_65x39_caseless_mag_Tracer"], 6];
a3e_arr_CrashSiteWeapons pushback ["arifle_MXM_F", 10, 1, 2, ["30Rnd_65x39_caseless_mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["SMG_01_Holo_F", 50, 1, 2, ["30Rnd_45ACP_Mag_SMG_01"], 8];
if(Param_UseDLCMarksmen==1) then {
	a3e_arr_CrashSiteWeapons pushback ["MMG_02_black_F", 10, 2, 4, ["130Rnd_338_Mag"], 6];
	a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_02_camo_AMS_LP_F", 10, 2, 4, ["10Rnd_338_Mag"], 10];
	a3e_arr_CrashSiteWeapons pushback ["srifle_DMR_03_AMS_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 12];
};
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["optic_Aco_smg", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Holosight_smg", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Aco", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_Holosight", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["optic_hamr", 10, 1, 3];  
a3e_arr_CrashSiteItems pushback ["optic_SOS", 10, 1, 3];
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_CrashSiteItems pushback ["optic_AMS", 10, 1, 3];
    };
a3e_arr_CrashSiteItems pushback ["muzzle_snds_H", 10, 1, 3];  //6.5mm Katiba and MX
a3e_arr_CrashSiteItems pushback ["muzzle_snds_H_MG", 10, 1, 3];  //6.5mm MX SW, Mk200, and LIM-85 TAN

a3e_arr_CrashSiteItems pushback ["muzzle_snds_acp", 10, 1, 3];  //.45 generic
if(Param_UseDLCMarksmen==1) then {
    a3e_arr_CrashSiteItems pushback ["muzzle_snds_338_black", 10, 1, 3];  //.338 MAR-10 and SPMG
	a3e_arr_CrashSiteItems pushback ["muzzle_snds_B", 10, 1, 3];  //7.62mm generic not DLC but no other 7.62 weapons spawn unless DLC is on
	};
a3e_arr_CrashSiteItems pushback ["bipod_01_F_blk", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["bipod_01_F_mtp", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["bipod_01_F_snd", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["B_UavTerminal", 75, 1, 1];