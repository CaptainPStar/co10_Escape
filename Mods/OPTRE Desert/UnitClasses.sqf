/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;
A3E_VAR_Side_Opfor = west;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_AAF_CO.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"OPTRE_UNSC_Army_Soldier_Grenadier_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_Light_DES"
	,"OPTRE_UNSC_Army_Soldier_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["OPTRE_M6C","OPTRE_12Rnd_127x40_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["OPTRE_M7","OPTRE_60Rnd_5x23mm_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["OPTRE_M7_Folded","OPTRE_60Rnd_5x23mm_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["OPTRE_MA5K","OPTRE_32Rnd_762x51_Mag"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"OPTRE_M12_CIV"
	,"OPTRE_M12_CIV"
	,"OPTRE_M12_CIV"
	,"OPTRE_Genet"
	,"OPTRE_Genet"
	,"OPTRE_Genet"
	,"OPTRE_forklift"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_box_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"
	,"C_Truck_02_covered_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"
	,"C_Truck_02_transport_F"];
	if(Param_UseDLCApex==1) then {
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
		"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M914_RV_tan"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_cart"
		,"OPTRE_cart_green"
		,"OPTRE_cart_grey"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M313_UNSC"
		,"OPTRE_M850_UNSC"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M914_RV_tan"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_cart"
		,"OPTRE_cart_green"
		,"OPTRE_cart_grey"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M313_UNSC"
		,"OPTRE_M850_UNSC"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M914_RV_tan"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_cart"
		,"OPTRE_cart_green"
		,"OPTRE_cart_grey"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M313_UNSC"
		,"OPTRE_M850_UNSC"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M914_RV_tan"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_cart"
		,"OPTRE_cart_green"
		,"OPTRE_cart_grey"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M313_UNSC"
		,"OPTRE_M850_UNSC"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M914_RV_tan"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_cart"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M313_UNSC"
		,"OPTRE_M850_UNSC"
		,"OPTRE_M850_UNSC"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
	    "OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M12_FAV_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M813_TT_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12A1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12G1_LRV_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M12R_AA_tan"
		,"OPTRE_M914_RV_tan"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_M274_ATV"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_mover"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_medical"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_refuel"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_repair"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_m1087_stallion_unsc_resupply"
		,"OPTRE_cart"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M412_IFV_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M413_MGS_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M808B_UNSC_tan"
		,"OPTRE_M313_UNSC"
		,"OPTRE_M850_UNSC"
		,"OPTRE_M850_UNSC"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"OPTRE_UNSC_Army_Soldier_Engineer_DES"
	,"OPTRE_UNSC_Army_Soldier_Engineer_DES"
	,"OPTRE_UNSC_Army_Soldier_Engineer_DES"
	,"OPTRE_UNSC_Army_Soldier_Medic_DES"
	,"OPTRE_UNSC_Army_Soldier_Medic_DES"
	,"OPTRE_UNSC_Army_Soldier_Medic_DES"
	,"B_soldier_AA_F"
	,"B_soldier_AA_F"
	,"OPTRE_UNSC_Army_Soldier_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_AT_Specialist_DES"
	,"OPTRE_UNSC_Army_Soldier_AT_Specialist_DES"
	,"OPTRE_UNSC_Army_Soldier_Demolitions_DES"
	,"OPTRE_UNSC_Army_Soldier_Demolitions_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Grenadier_DES"
	,"OPTRE_UNSC_Army_Soldier_Grenadier_DES"
	,"OPTRE_UNSC_Army_Soldier_Grenadier_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AT_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AT_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_Light_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_Light_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_Light_DES"
	,"OPTRE_UNSC_Army_Soldier_Marksman_DES"
	,"OPTRE_UNSC_Army_Soldier_Marksman_DES"
	,"OPTRE_UNSC_Army_Soldier_Marksman_DES"
	,"OPTRE_UNSC_Army_Soldier_UAV_Op_DES"
	,"OPTRE_UNSC_Army_Soldier_UAV_Op_DES"
	,"OPTRE_UNSC_Army_Soldier_Assist_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Assist_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_BR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_BR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_BR_DES"
	,"OPTRE_UNSC_Army_Soldier_ForwardObserver_DES"
	,"OPTRE_UNSC_Army_Soldier_ForwardObserver_DES"
	,"OPTRE_UNSC_Army_Soldier_Radioman_DES"
	,"OPTRE_UNSC_Army_Soldier_Radioman_DES"
	,"OPTRE_UNSC_Army_Soldier_SquadLead_DES"
	,"OPTRE_UNSC_Army_Soldier_TeamLead_DES"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"OPTRE_UNSC_Army_Soldier_Engineer_DES"
	,"OPTRE_UNSC_Army_Soldier_Engineer_DES"
	,"OPTRE_UNSC_Army_Soldier_Engineer_DES"
	,"OPTRE_UNSC_Army_Soldier_Medic_DES"
	,"OPTRE_UNSC_Army_Soldier_Medic_DES"
	,"OPTRE_UNSC_Army_Soldier_Medic_DES"
	,"B_soldier_AA_F"
	,"B_soldier_AA_F"
	,"OPTRE_UNSC_Army_Soldier_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_AT_Specialist_DES"
	,"OPTRE_UNSC_Army_Soldier_AT_Specialist_DES"
	,"OPTRE_UNSC_Army_Soldier_Demolitions_DES"
	,"OPTRE_UNSC_Army_Soldier_Demolitions_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AR_DES"
	,"OPTRE_UNSC_Army_Soldier_Grenadier_DES"
	,"OPTRE_UNSC_Army_Soldier_Grenadier_DES"
	,"OPTRE_UNSC_Army_Soldier_Grenadier_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AT_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_AT_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_Light_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_Light_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_Light_DES"
	,"OPTRE_UNSC_Army_Soldier_Marksman_DES"
	,"OPTRE_UNSC_Army_Soldier_Marksman_DES"
	,"OPTRE_UNSC_Army_Soldier_Marksman_DES"
	,"OPTRE_UNSC_Army_Soldier_UAV_Op_DES"
	,"OPTRE_UNSC_Army_Soldier_UAV_Op_DES"
	,"OPTRE_UNSC_Army_Soldier_Assist_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Assist_Autorifleman_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_BR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_BR_DES"
	,"OPTRE_UNSC_Army_Soldier_Rifleman_BR_DES"
	,"OPTRE_UNSC_Army_Soldier_ForwardObserver_DES"
	,"OPTRE_UNSC_Army_Soldier_ForwardObserver_DES"
	,"OPTRE_UNSC_Army_Soldier_Radioman_DES"
	,"OPTRE_UNSC_Army_Soldier_Radioman_DES"
	,"OPTRE_UNSC_Army_Soldier_SquadLead_DES"
	,"OPTRE_UNSC_Army_Soldier_TeamLead_DES"];
a3e_arr_recon_InfantryTypes = [
	"OPTRE_Spartan2_Soldier_Automatic_Rifleman"
	,"OPTRE_Spartan2_Soldier_Engineer"
	,"OPTRE_Spartan2_Soldier_Marksman"
	,"OPTRE_Spartan2_Soldier_Corpsman"
	,"OPTRE_Spartan2_Soldier_Rifleman_AT"
	,"OPTRE_Spartan2_Soldier_Rifleman_BR"
	,"OPTRE_Spartan2_Soldier_Rifleman_AR"
	,"OPTRE_Spartan2_Soldier_Scout"
	,"OPTRE_Spartan2_Soldier_Scout_Sniper"
	,"OPTRE_Spartan2_Soldier_TeamLeader"
	,"OPTRE_Spartan3_Soldier_Automatic_Rifleman"
	,"OPTRE_Spartan3_Soldier_Engineer"
	,"OPTRE_Spartan3_Soldier_Marksman"
	,"OPTRE_Spartan3_Soldier_Corpsman"
	,"OPTRE_Spartan3_Soldier_Rifleman_AT"
	,"OPTRE_Spartan3_Soldier_Rifleman_BR"
	,"OPTRE_Spartan3_Soldier_Rifleman_AR"
	,"OPTRE_Spartan3_Soldier_Scout"
	,"OPTRE_Spartan3_Soldier_Scout_Sniper"
	,"OPTRE_Spartan3_Soldier_TeamLeader"];
a3e_arr_recon_I_InfantryTypes = [
	"OPTRE_UNSC_ODST_Soldier_Automatic_Rifleman"
	,"OPTRE_UNSC_ODST_Soldier_Bullfrog"
	,"OPTRE_UNSC_ODST_Soldier_DemolitionsExpert"
	,"OPTRE_UNSC_ODST_Soldier_Marksman"
	,"OPTRE_UNSC_ODST_Soldier_Paramedic"
	,"OPTRE_UNSC_ODST_Soldier_Rifleman_AT"
	,"OPTRE_UNSC_ODST_Soldier_Rifleman_BR"
	,"OPTRE_UNSC_ODST_Soldier_Rifleman_AR"
	,"OPTRE_UNSC_ODST_Soldier_Scout"
	,"OPTRE_UNSC_ODST_Soldier_Scout_AT"
	,"OPTRE_UNSC_ODST_Soldier_Scout_Sniper"
	,"OPTRE_UNSC_ODST_Soldier_TeamLeader"
	,"OPTRE_UNSC_ONI_Soldier_Operative"];

	
// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"OPTRE_M12_LRV_tan"
	,"OPTRE_M12_LRV_tan"
	,"OPTRE_M12A1_LRV_tan"
	,"OPTRE_M12G1_LRV_tan"
	,"OPTRE_Static_M41"
	,"OPTRE_Static_M41"
	,"OPTRE_Static_ATGM"
	,"OPTRE_Static_Gauss"
	,"OPTRE_LAU65D_pod"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"OPTRE_M12_LRV_tan"
	,"OPTRE_M12_LRV_tan"
	,"OPTRE_M12A1_LRV_tan"
	,"OPTRE_M12G1_LRV_tan"
	,"OPTRE_Static_M41"
	,"OPTRE_Static_M41"
	,"OPTRE_Static_ATGM"
	,"OPTRE_Static_Gauss"
	,"OPTRE_LAU65D_pod"];

	
// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"OPTRE_m1087_stallion_unsc"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"OPTRE_m1087_stallion_unsc"];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"OPTRE_M412_IFV_UNSC_tan"
	,"OPTRE_M412_IFV_UNSC_tan"
	,"OPTRE_M413_MGS_UNSC_tan"
	,"OPTRE_M313_UNSC_tan"];


// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"OPTRE_M412_IFV_UNSC_tan"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"OPTRE_M808B_UNSC_tan"
	,"OPTRE_M808B_UNSC_tan"
	,"OPTRE_M850_UNSC"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"OPTRE_Static_M247H_Shielded_Tripod"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"OPTRE_m1087_stallion_unsc"
	,"OPTRE_m1087_stallion_unsc_mover"
	,"OPTRE_m1087_stallion_unsc_medical"
	,"OPTRE_m1087_stallion_unsc_refuel"
	,"OPTRE_m1087_stallion_unsc_repair"
	,"OPTRE_m1087_stallion_unsc_resupply"
	,"OPTRE_M12_FAV_tan"
	,"OPTRE_M12_FAV_tan"
	,"OPTRE_M813_TT_tan"
	,"OPTRE_M813_TT_tan"
	,"OPTRE_M12_LRV_tan"
	,"OPTRE_M12_LRV_tan"
	,"OPTRE_M12A1_LRV_tan"
	,"OPTRE_M12G1_LRV_tan"
	,"OPTRE_M12R_AA_tan"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"OPTRE_M12_CIV"
	,"OPTRE_Genet"
	,"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_box_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"];
	if(Param_UseDLCApex==1) then {
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(Param_UseDLCLaws==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_service_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"OPTRE_Static_M41"
	,"OPTRE_Static_M41"
	,"OPTRE_Static_ATGM"
	,"OPTRE_Static_Gauss"
	,"OPTRE_Static_AA"
	,"OPTRE_LAU65D_pod"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"OPTRE_M813_TT_tan"
	,"OPTRE_M914_RV_tan"
	,"OPTRE_M12_FAV_tan"
	,"OPTRE_M12A1_LRV_tan"
	,"OPTRE_M12_LRV_tan"
	,"OPTRE_M12_LRV_tan"
	,"OPTRE_M12G1_LRV_tan"
	,"OPTRE_M12R_AA_tan"
	,"OPTRE_m1087_stallion_unsc"
	,"OPTRE_m1087_stallion_unsc_mover"
	,"OPTRE_m1087_stallion_unsc_medical"
	,"OPTRE_m1087_stallion_unsc_refuel"
	,"OPTRE_m1087_stallion_unsc_repair"
	,"OPTRE_m1087_stallion_unsc_resupply"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"OPTRE_UNSC_hornet"
	,"OPTRE_UNSC_hornet_CAP"
	,"OPTRE_UNSC_hornet_CAS"];
a3e_arr_O_transport_heli = [
	"OPTRE_Pelican_unarmed_tan"];
a3e_arr_O_pilots = [
	"OPTRE_UNSC_Airforce_Soldier_Airman"];
a3e_arr_I_transport_heli = [
	"OPTRE_Pelican_unarmed_tan"];
a3e_arr_I_pilots = [
	"OPTRE_UNSC_Airforce_Soldier_Airman"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_M6G", 50, 4, 8, ["OPTRE_8Rnd_127x40_Mag", "OPTRE_8Rnd_127x40_AP_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_M7", 50, 4, 8, ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_Mag_tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA5B", 100, 2, 4, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA5K", 50, 2, 4, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA5BGL", 75, 2, 4, ["OPTRE_60Rnd_762x51_Mag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA5C", 50, 2, 4, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA5CGL", 50, 2, 4, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA37", 50, 2, 4, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA37GL", 50, 2, 4, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_BR55HB", 50, 2, 4, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_BR55", 50, 2, 4, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_M6C", 50, 4, 8, ["OPTRE_12Rnd_127x40_Mag", "OPTRE_16Rnd_127x40_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_M7_Folded", 50, 4, 8, ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_Mag_tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA5A", 10, 2, 4, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["OPTRE_MA5AGL", 50, 2, 4, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M392_DMR", 10, 2, 4, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M393_DMR", 10, 2, 4, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M393S_DMR", 10, 2, 4, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_SRS99D_SC_LS", 10, 2, 4, ["OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_HVAP_Mag","OPTRE_4Rnd_145x114_HEDP_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_SRS99C_SC_LS", 10, 2, 4, ["OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_HVAP_Mag","OPTRE_4Rnd_145x114_HEDP_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M247", 50, 2, 4, ["OPTRE_100Rnd_762x51_Box","OPTRE_100Rnd_762x51_Box_Tracer"], 3];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M73", 50, 2, 4, ["OPTRE_200Rnd_95x40_Box","OPTRE_200Rnd_95x40_Box_Tracer"], 3];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M45", 10, 2, 4, ["OPTRE_6Rnd_8Gauge_Pellets","OPTRE_6Rnd_8Gauge_Slugs"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M45A", 10, 2, 4, ["OPTRE_6Rnd_8Gauge_Pellets","OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Pellets","OPTRE_12Rnd_8Gauge_Slugs"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M45E", 10, 2, 4, ["OPTRE_6Rnd_8Gauge_Pellets","OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Pellets","OPTRE_12Rnd_8Gauge_Slugs"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M90A", 10, 2, 4, ["OPTRE_6Rnd_8Gauge_Pellets","OPTRE_6Rnd_8Gauge_Slugs"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_HMG38", 10, 2, 4, ["OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer", "3Rnd_UGL_FlareWhite_F", "3Rnd_HE_Grenade_shell", "3Rnd_Smoke_Grenade_shell"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["OPTRE_M319", 10, 2, 4, ["OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer", "3Rnd_UGL_FlareWhite_F", "3Rnd_HE_Grenade_shell", "3Rnd_Smoke_Grenade_shell"], 9];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["OPTRE_M41_SSR", 50, 1, 1, ["OPTRE_M41_Twin_HEAT", "OPTRE_M41_Twin_HEAP"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["OPTRE_M41_SSR_G", 50, 1, 1, ["OPTRE_M41_Twin_HEAT_G"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_F", 50, 1, 1, ["Titan_AA"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["C7_Remote_Mag", "C12_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["M168_Remote_Mag", "UNSCMine_Range_Mag"], 2];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["OPTRE_M9_Frag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["OPTRE_M2_Smoke", "OPTRE_M2_Smoke_Yellow", "OPTRE_M2_Smoke_Red", "OPTRE_M2_Smoke_Green", "OPTRE_M2_Smoke_Purple", "OPTRE_M2_Smoke_Blue", "OPTRE_M2_Smoke_Orange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5];

a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["OPTRE_MedKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["OPTRE_Biofoam", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["O_UAV_01_backpack_F"];
a3e_arr_AmmoDepotVehicleBackpacks = ["OPTRE_S12_SOLA_Jetpack"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["OPTRE_Smartfinder", 10, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["OPTRE_NVG", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["OPTRE_Binoculars", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["OPTRE_Smartfinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M393_Suppressor", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["OPTRE_SRS99D_Suppressor", 10, 1, 1];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M7_Silencer", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M6_Silencer", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M6C_compensator", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M393_EOTECH", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M7_Sight", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M6C_Scope", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["OPTRE_M6G_Scope", 50, 1, 2];
a3e_arr_AmmoDepotItems pushback ["OPTRE_HMG38_CarryHandle", 50, 1, 2];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["OPTRE_BR55HB_Scope", 50, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["OPTRE_M393_Scope", 50, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["OPTRE_M392_Scope", 50, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["OPTRE_M73_SmartLink", 50, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["OPTRE_SRS99C_Scope", 10, 1, 2];
    a3e_arr_AmmoDepotItems pushback ["OPTRE_SRS99_Scope", 10, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["OPTRE_MA5_SmartLink", 50, 1, 2];
    a3e_arr_AmmoDepotItems pushback ["OPTRE_MA5C_SmartLink", 50, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["OPTRE_M393_ACOG", 50, 1, 2];
};
a3e_arr_AmmoDepotItems pushback ["B_UavTerminal", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_M6G", "OPTRE_8Rnd_127x40_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_M6C", "OPTRE_12Rnd_127x40_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_M7_Folded", "OPTRE_48Rnd_5x23mm_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_MA37", 50, 2, 4, ["OPTRE_32Rnd_762x51_Mag"], 6];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_MA5A", "OPTRE_60Rnd_762x51_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_MA5C", "OPTRE_32Rnd_762x51_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_MA5AGLF", "UGL_FlareWhite_F", 5];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_M7", "OPTRE_60Rnd_5x23mm_Mag", 5];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_M392_DMR", "OPTRE_15Rnd_762x51_Mag", 8];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_M41_SSR", "OPTRE_M41_Twin_HEAT", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["OPTRE_MedKit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["OPTRE_Binoculars", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "C12_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "OPTRE_M9_Frag", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "OPTRE_M2_Smoke", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"OPTRE_M393_EOTECH"
	,"OPTRE_M393_ACOG"];
a3e_arr_Scopes_SMG = [
	"OPTRE_M7_Sight"
	,"optic_Holosight_smg"];
a3e_arr_Scopes_Sniper = [
	"OPTRE_M393_ACOG"];
a3e_arr_NightScopes = [
	"OPTRE_BR55HB_Scope"
	,"OPTRE_M392_Scope"
	,"OPTRE_M393_Scope"];
a3e_arr_TWSScopes = [
	"OPTRE_BR55HB_Scope"
	,"OPTRE_M392_Scope"
	,"OPTRE_M393_Scope"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"bipod_01_F_blk"
	,"bipod_02_F_blk"
	,"bipod_03_F_blk"];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"OPTRE_Pelican_armed_ins"];
a3e_arr_extraction_chopper_escort = [
	"OPTRE_UNSC_hornet_ins"];
	
//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"O_T_Boat_Armed_01_hmg_F"];
a3e_arr_extraction_boat_escort = [
	"O_T_Boat_Armed_01_hmg_F"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"B_UAV_01_F"
	,"B_UAV_02_dynamicLoadout_F"
	,"B_UAV_05_F"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"OPTRE_UNSC_falcon_unarmed"];
a3e_arr_searchChopperHard = [
	"OPTRE_UNSC_falcon_tan"];
a3e_arr_searchChopper_pilot = [
	"OPTRE_UNSC_Airforce_Soldier_Airman"];
a3e_arr_searchChopper_crew = [
	"OPTRE_UNSC_Airforce_Soldier_Airman"];

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
	"B_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "OPTRE_Ammo_Rack_Weapons";
a3e_additional_weapon_box_2 = "OPTRE_Ammo_Rack_Ammo";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"B_Mortar_01_F"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"B_Plane_CAS_01_dynamicLoadout_F"
	,"B_Plane_Fighter_01_Cluster_F"];

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
	"OPTRE_Objects_Wreck_Pelican_Static1"
	,"OPTRE_Objects_Wreck_Pelican_Static2"
	,"OPTRE_Objects_Wreck_Falcon"];
a3e_arr_CrashSiteCrew = [
	"OPTRE_UNSC_Airforce_Soldier_Airman"];
a3e_arr_CrashSiteWrecksCar = [
	"OPTRE_Objects_Wreck_EscapePod"];
a3e_arr_CrashSiteCrewCar = [
	"OPTRE_UNSC_Airforce_Soldier_Airman"];

// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_M41_SSR_G", 10, 1, 2, ["OPTRE_M41_Twin_HEAT_G"], 3];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_M392_DMR", 10, 1, 2, ["20Rnd_762x51_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_BR55HB", 10, 1, 2, ["OPTRE_36Rnd_95x40_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_SRS99D_SC_LS", 10, 1, 2, ["OPTRE_4Rnd_145x114_APFSDS_Mag", "OPTRE_4Rnd_145x114_HVAP_Mag", "OPTRE_4Rnd_145x114_HEDP_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_MA5B", 75, 2, 4, ["OPTRE_60Rnd_762x51_Mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_MA5BGL", 50, 2, 4, ["30Rnd_65x39_caseless_mag", "1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], 6];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_M73", 20, 1, 2, ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box_Tracer", "OPTRE_200Rnd_95x40_Box", "OPTRE_200Rnd_95x40_Box_Tracer"], 6];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_MA5K", 10, 1, 2, ["OPTRE_32Rnd_762x51_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_M7", 10, 1, 2, ["OPTRE_60Rnd_5x23mm_Mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["OPTRE_HMG38", 10, 2, 4, ["OPTRE_40Rnd_30x06_Mag","OPTRE_40Rnd_30x06_Mag_Tracer"], 9];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["OPTRE_BR55HB_Scope", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["OPTRE_M393_EOTECH", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["OPTRE_M393_Scope", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["OPTRE_M392_Scope", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["OPTRE_M7_Sight", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["OPTRE_SRS99_Scope", 10, 1, 1];
a3e_arr_CrashSiteItems pushback ["OPTRE_M393_ACOG", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["muzzle_snds_B", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["OPTRE_HMG38_CarryHandle", 10, 1, 2];