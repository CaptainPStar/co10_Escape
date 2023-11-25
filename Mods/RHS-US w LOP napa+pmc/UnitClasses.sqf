/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;


//Sides

A3E_VAR_Side_Blufor = east;
A3E_VAR_Side_Opfor = west;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_nato_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_green_CO.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"LOP_NAPA_Infantry_Rifleman"
	,"LOP_NAPA_Infantry_Prizrak"
	,"LOP_NAPA_Infantry_GL"
	,"LOP_NAPA_Infantry_AR"
	,"LOP_NAPA_Infantry_Rifleman"
	,"LOP_NAPA_Infantry_Rifleman"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pya","rhs_mag_9x19_17"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pya","rhs_mag_9x19_17"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_makarov_pmm","rhs_mag_9x18_12_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_glock17g4","rhsusf_mag_17Rnd_9x19_JHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_glock17g4","rhsusf_mag_17Rnd_9x19_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_PDW2000_F","30Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_JHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_P07_snds_F","30Rnd_9x21_Mag"];
a3e_arr_PrisonBackpackWeapons pushback ["hgun_Rook40_snds_F","30Rnd_9x21_Mag"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"C_Hatchback_01_F"
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
	,"C_Van_01_fuel_F"
	,"C_Van_01_fuel_F"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhsusf_m998_w_2dr"
		,"rhsusf_m998_w_2dr_halftop"
		,"rhsusf_m998_w_2dr_fulltop"
		,"rhsusf_m998_w_4dr"
		,"rhsusf_m998_w_4dr_halftop"
		,"rhsusf_m998_w_4dr_fulltop"
		,"rhsusf_m1025_w"
		,"rhsusf_m1025_w_m2"
		,"rhsusf_m1025_w_mk19"
		,"rhsusf_M1078A1P2_wd_fmtv_usarmy"
		,"rhsusf_M1078A1P2_wd_open_fmtv_usarmy"
		,"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_open_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M977A2_CPK_usarmy_wd"
		,"rhsusf_M978A2_usarmy_wd"
		,"rhsusf_M978A2_CPK_usarmy_wd"
		,"rhsusf_rg33_wd"
		,"rhsusf_rg33_m2_wd"
		,"rhsusf_m113_usarmy"
		,"rhsusf_m113_usarmy_M240"
		,"rhsusf_m113_usarmy_MK19"
		,"rhsusf_m113_usarmy_supply"
		,"rhsusf_m113_usarmy_MK19"
		,"RHS_M6_wd","RHS_M6_wd"
		,"RHS_M2A2_wd"
		,"RHS_M2A2_BUSKI_WD"
		,"RHS_M2A3_wd"
		,"RHS_M2A3_BUSKI_wd"
		,"rhsusf_m1a1aimwd_usarmy"
		,"rhsusf_m1a1aim_tuski_wd"
		,"rhsusf_m1a2sep1wd_usarmy"
		,"rhsusf_m1a2sep1tuskiwd_usarmy"
		,"rhsusf_m1a2sep1tuskiiwd_usarmy"
		,"rhsusf_m109_usarmy"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LOP_NAPA_Truck"
		,"LOP_NAPA_Offroad"
		,"LOP_NAPA_Offroad_M2"
		,"LOP_NAPA_Landrover"
		,"LOP_NAPA_Landrover_M2"
		,"LOP_PMC_Truck"
		,"LOP_PMC_Offroad"
		,"LOP_PMC_Offroad_M2"
		,"LOP_PMC_SUV"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhsusf_m998_w_2dr"
		,"rhsusf_m998_w_2dr_halftop"
		,"rhsusf_m998_w_2dr_fulltop"
		,"rhsusf_m998_w_4dr"
		,"rhsusf_m998_w_4dr_halftop"
		,"rhsusf_m998_w_4dr_fulltop"
		,"rhsusf_m1025_w"
		,"rhsusf_m1025_w_m2"
		,"rhsusf_m1025_w_mk19"
		,"rhsusf_M1078A1P2_wd_fmtv_usarmy"
		,"rhsusf_M1078A1P2_wd_open_fmtv_usarmy"
		,"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_open_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M977A2_CPK_usarmy_wd"
		,"rhsusf_M978A2_usarmy_wd"
		,"rhsusf_M978A2_CPK_usarmy_wd"
		,"rhsusf_rg33_wd"
		,"rhsusf_rg33_m2_wd"
		,"rhsusf_m113_usarmy"
		,"rhsusf_m113_usarmy_M240"
		,"rhsusf_m113_usarmy_MK19"
		,"rhsusf_m113_usarmy_supply"
		,"rhsusf_m113_usarmy_MK19"
		,"RHS_M6_wd"
		,"RHS_M6_wd"
		,"RHS_M2A2_wd"
		,"RHS_M2A2_BUSKI_WD"
		,"RHS_M2A3_wd"
		,"RHS_M2A3_BUSKI_wd"
		,"rhsusf_m1a1aimwd_usarmy"
		,"rhsusf_m1a1aim_tuski_wd"
		,"rhsusf_m1a2sep1wd_usarmy"
		,"rhsusf_m1a2sep1tuskiwd_usarmy"
		,"rhsusf_m1a2sep1tuskiiwd_usarmy"
		,"rhsusf_m109_usarmy"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LOP_NAPA_Truck"
		,"LOP_NAPA_Offroad"
		,"LOP_NAPA_Offroad_M2"
		,"LOP_NAPA_Landrover"
		,"LOP_NAPA_Landrover_M2"
		,"LOP_PMC_Truck"
		,"LOP_PMC_Offroad"
		,"LOP_PMC_Offroad_M2"
		,"LOP_PMC_SUV"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhsusf_m998_w_2dr"
		,"rhsusf_m998_w_2dr_halftop"
		,"rhsusf_m998_w_2dr_fulltop"
		,"rhsusf_m998_w_4dr"
		,"rhsusf_m998_w_4dr_halftop"
		,"rhsusf_m998_w_4dr_fulltop"
		,"rhsusf_m1025_w"
		,"rhsusf_m1025_w_m2"
		,"rhsusf_m1025_w_mk19"
		,"rhsusf_M1078A1P2_wd_fmtv_usarmy"
		,"rhsusf_M1078A1P2_wd_open_fmtv_usarmy"
		,"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_open_fmtv_usarmy"
		,"rhsusf_M1083A1P2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy"
		,"rhsusf_M977A2_CPK_usarmy_wd"
		,"rhsusf_M978A2_usarmy_wd"
		,"rhsusf_M978A2_CPK_usarmy_wd"
		,"rhsusf_rg33_wd"
		,"rhsusf_rg33_m2_wd"
		,"rhsusf_m113_usarmy"
		,"rhsusf_m113_usarmy_M240"
		,"rhsusf_m113_usarmy_MK19"
		,"rhsusf_m113_usarmy_supply"
		,"rhsusf_m113_usarmy_MK19"
		,"RHS_M6_wd"
		,"RHS_M6_wd"
		,"RHS_M2A2_wd"
		,"RHS_M2A2_BUSKI_WD"
		,"RHS_M2A3_wd"
		,"RHS_M2A3_BUSKI_wd"
		,"rhsusf_m1a1aimwd_usarmy"
		,"rhsusf_m1a1aim_tuski_wd"
		,"rhsusf_m1a2sep1wd_usarmy"
		,"rhsusf_m1a2sep1tuskiwd_usarmy"
		,"rhsusf_m1a2sep1tuskiiwd_usarmy"
		,"rhsusf_m109_usarmy"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"LOP_NAPA_Truck"
		,"LOP_NAPA_Offroad"
		,"LOP_NAPA_Offroad_M2"
		,"LOP_NAPA_Landrover"
		,"LOP_NAPA_Landrover_M2"
		,"LOP_PMC_Truck"
		,"LOP_PMC_Offroad"
		,"LOP_PMC_Offroad_M2"
		,"LOP_PMC_SUV"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"rhsusf_army_ocp_officer"
	,"rhsusf_army_ocp_squadleader"
	,"rhsusf_army_ocp_teamleader"
	,"rhsusf_army_ocp_engineer"
	,"rhsusf_army_ocp_engineer"
	,"rhsusf_army_ocp_medic"
	,"rhsusf_army_ocp_medic"
	,"rhsusf_army_ocp_rifleman"
	,"rhsusf_army_ocp_riflemanl"
	,"rhsusf_army_ocp_grenadier"
	,"rhsusf_army_ocp_machinegunner"
	,"rhsusf_army_ocp_machinegunnera"
	,"rhsusf_army_ocp_riflemanat"
	,"rhsusf_army_ocp_explosives"
	,"rhsusf_army_ocp_marksman"
	,"rhsusf_army_ocp_aa"
	,"rhsusf_army_ocp_javelin"
	,"rhsusf_army_ocp_autorifleman"
	,"rhsusf_army_ocp_autoriflemana"
	,"rhsusf_army_ocp_rifleman_m4"
	,"rhsusf_army_ocp_rifleman_m16"
	,"rhsusf_army_ocp_rifleman_m590"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"LOP_NAPA_Infantry_TL"
	,"LOP_NAPA_Infantry_SL"
	,"LOP_NAPA_Infantry_Rifleman"
	,"LOP_NAPA_Infantry_Prizrak"
	,"LOP_NAPA_Infantry_AR"
	,"LOP_NAPA_Infantry_AT"
	,"LOP_NAPA_Infantry_Marksman"
	,"LOP_NAPA_Infantry_GL"
	,"LOP_NAPA_Infantry_Corpsman"
	,"LOP_NAPA_Infantry_Engineer"
	,"LOP_NAPA_Infantry_Corpsman"
	,"LOP_NAPA_Infantry_Engineer"];
a3e_arr_recon_InfantryTypes = [
	"rhsusf_socom_marsoc_teamleader"
	,"rhsusf_socom_marsoc_teamchief"
	,"rhsusf_socom_marsoc_elementleader"
	,"rhsusf_socom_marsoc_cso_mechanic"
	,"rhsusf_socom_marsoc_marksman"
	,"rhsusf_socom_marsoc_cso_cqb"
	,"rhsusf_socom_marsoc_cso_breacher"
	,"rhsusf_socom_marsoc_cso_light"
	,"rhsusf_socom_marsoc_cso"
	,"rhsusf_navy_marpat_wd_medic"];
a3e_arr_recon_I_InfantryTypes = [
	"LOP_PMC_Infantry_TL"
	,"LOP_PMC_Infantry_SL"
	,"LOP_PMC_Infantry_Rifleman"
	,"LOP_PMC_Infantry_AT"
	,"LOP_PMC_Infantry_AT_Asst"
	,"LOP_PMC_Infantry_MG_Asst"
	,"LOP_PMC_Infantry_Marksman"
	,"LOP_PMC_Infantry_GL"
	,"LOP_PMC_Infantry_Engineer"
	,"LOP_PMC_Infantry_Corpsman"
	,"LOP_PMC_Infantry_Engineer"
	,"LOP_PMC_Infantry_Corpsman"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"rhsusf_m1025_w_m2"
	,"rhsusf_m1025_w_mk19"
	,"rhsusf_m113_usarmy"
	,"RHS_M2StaticMG_D"
	,"RHS_M2StaticMG_MiniTripod_D"
	,"RHS_MK19_TriPod_WD"
	,"RHS_TOW_TriPod_WD"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"LOP_NAPA_Offroad_M2"
	,"LOP_NAPA_Landrover_M2"
	,"LOP_PMC_Offroad_M2"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"rhsusf_m998_w_2dr_halftop"
	,"rhsusf_rg33_wd"
	,"rhsusf_rg33_m2_wd"
	,"rhsusf_M1078A1P2_wd_fmtv_usarmy"
	,"rhsusf_M1078A1P2_wd_open_fmtv_usarmy"
	,"rhsusf_M1083A1P2_wd_fmtv_usarmy"
	,"rhsusf_M1083A1P2_wd_open_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"LOP_NAPA_Landrover"
	,"LOP_NAPA_Truck"
	,"LOP_PMC_Truck"];




// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"rhsusf_m1025_w"
	,"rhsusf_m1025_w_m2"
	,"rhsusf_m1025_w_mk19"
	,"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy"
	,"rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy"
	,"rhsusf_m113_usarmy","RHS_M2A2_wd"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"rhsusf_m113_usarmy"
	,"RHS_M6_wd"
	,"RHS_M6_wd"
	,"RHS_M2A2_wd"
	,"RHS_M2A2_BUSKI_WD"
	,"RHS_M2A3_wd"
	,"RHS_M2A3_BUSKI_wd"
	,"rhsusf_m1025_w_m2"
	,"rhsusf_m1025_w_mk19"
	,"rhsusf_rg33_m2_wd"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"rhsusf_m1a1aimwd_usarmy"
	,"rhsusf_m1a1aim_tuski_wd"
	,"rhsusf_m1a2sep1wd_usarmy"
	,"rhsusf_m1a2sep1tuskiwd_usarmy"
	,"rhsusf_m1a2sep1tuskiiwd_usarmy"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"RHS_M2StaticMG_D"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"I_G_Offroad_01_repair_F"
	,"rhsusf_m113_usarmy"
	,"rhsusf_rg33_wd"
	,"rhsusf_M1078A1P2_wd_fmtv_usarmy"
	,"rhsusf_M1078A1P2_wd_open_fmtv_usarmy"
	,"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy"
	,"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy"
	,"rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy"
	,"rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy"
	,"rhsusf_m1025_w"
	,"rhsusf_m1025_w_m2"
	,"rhsusf_m1025_w_mk19"
	,"B_Truck_01_medical_F"
	,"B_Truck_01_fuel_F"
	,"B_Truck_01_ammo_F"
	,"B_Truck_01_Repair_F"
	,"I_G_Offroad_01_F"
	,"I_G_Offroad_01_armed_F"
	,"I_G_Offroad_01_armed_F"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_box_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"RHS_M2StaticMG_D"
	,"RHS_M2StaticMG_MiniTripod_D"
	,"RHS_MK19_TriPod_WD"
	,"RHS_TOW_TriPod_WD"
	,"RHS_Stinger_AA_pod_WD"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"RHS_AH64D_wd"
	,"RHS_AH64D_wd_GS"
	,"RHS_AH64D_wd_CS"
	,"RHS_AH64D_wd_AA"
	,"RHS_AH1Z_wd"
	,"RHS_AH1Z_wd_GS"
	,"RHS_AH1Z_wd_CS"];
a3e_arr_O_transport_heli = [
	"RHS_CH_47F"
	,"RHS_CH_47F_10"
	,"RHS_CH_47F_light"
	,"RHS_UH60M"
	,"RHS_UH60M_MEV"
	,"RHS_UH60M_MEV2"
	,"RHS_UH1Y"
	,"RHS_UH1Y_FFAR"
	,"RHS_UH1Y_UNARMED"
	,"rhsusf_CH53E_USMC"];
a3e_arr_O_pilots = [
	"rhsusf_army_ocp_helipilot"];
a3e_arr_I_transport_heli = [
	"LOP_PMC_MH9"
	,"LOP_PMC_Mi8AMT"
	,"LOP_PMC_M900"];
a3e_arr_I_pilots = [
	"LOP_PMC_Infantry_Pilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["rhsusf_weap_m1911a1", 50, 2, 5, ["rhsusf_mag_7x45acp_MHP"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["SMG_01_F", 10, 1, 2, ["30Rnd_45ACP_Mag_SMG_01"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4a1", 100, 3, 5, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4a1_carryhandle_grip2", 50, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4a1_m320", 75, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_M441_HE"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m240B", 20, 1, 2, ["rhsusf_100Rnd_762x51"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_XM2010_wd", 10, 1, 2, ["rhsusf_5Rnd_300winmag_xm2010"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_XM2010_wd_leu", 10, 1, 2, ["rhsusf_5Rnd_300winmag_xm2010"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m249_pip", 50, 2, 4, ["rhsusf_100Rnd_556x45_soft_pouch"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m16a4_grip", 50, 1, 3, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m16a4_carryhandle_M203", 50, 1, 3, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_M441_HE"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak103_dtk", 10, 1, 2, ["rhs_30Rnd_762x39mm_tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m14ebrri_leu", 10, 1, 2, ["rhsusf_20Rnd_762x51_m118_special_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m", 10, 1, 2, ["rhs_30Rnd_545x39_AK"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak74m_gp25", 10, 1, 2, ["rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK_green","rhs_VOG25","rhs_VG40OP_white","rhs_VG40OP_green"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4_grip", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_mk18_KAC", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_svd_pso1", 10, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_ak103_dtk", 10, 1, 2, ["rhs_30Rnd_762x39mm_tracer"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_M590_8RD", 10, 1, 2, ["rhsusf_8Rnd_00Buck","rhsusf_8Rnd_Slug"], 10];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_sr25", 50, 2, 4, ["rhsusf_20Rnd_762x51_m118_special_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_svds", 10, 2, 4, ["rhs_10Rnd_762x54mmR_7N1"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m27iar", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_XM2010_wd", 50, 2, 4, ["rhsusf_5Rnd_300winmag_xm2010"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m240B_CAP", 50, 1, 3, ["rhsusf_50Rnd_762x51_m80a1epr","rhsusf_100Rnd_762x51"], 3];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_pkm", 10, 2, 4, ["rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green"], 3];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m249_pip", 50, 1, 2, ["rhsusf_100Rnd_556x45_soft_pouch"], 4];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg7", 10, 1, 2, ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag", "rhs_rpg7_OG7V_mag", "rhs_rpg7_TBG7V_mag"], 6];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg26", 10, 1, 3, ["rhs_rpg26_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rshg2", 10, 1, 3, ["rhs_rshg2_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_igla", 10, 1, 2, ["rhs_mag_9k38_rocket"], 3];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_fgm148", 30, 1, 2, ["rhs_fgm148_magazine_AT"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_smaw_green", 30, 1, 2, ["rhs_mag_smaw_HEAA","rhs_mag_smaw_HEDP"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_M136", 50, 1, 3, ["rhs_m136_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_M136_hedp", 50, 1, 3, ["rhs_m136_hedp_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_M136_hp", 50, 1, 3, ["rhs_m136_hp_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_fim92", 50, 1, 2, ["rhs_fim92_mag"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_mag_M433_HEDP", "rhs_mag_M714_white", "rhs_mag_M716_yellow", "rhs_mag_M713_red", "rhs_mag_M585_white", "rhs_mag_M661_green"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["rhs_VOG25"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["rhs_mag_zarya2"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["B_rhsusf_B_BACKPACK"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["NVGoggles", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["lerca_1200_black", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Leupold_Mk4", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpeq15_light", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpeq15side", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pbs1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_tgpa", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_tgpv", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_muzzleFlash_dtk", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtk1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4_2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p63", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pkas", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG_USMC", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG2_USMC", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG3", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pso1m2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p29", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p78", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_EOTECH", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_SF3P556", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_SFMB556", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_rotex5_grey", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_HAMR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ELCAN", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_M2010S", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_SR25S", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_compm4", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_eotech_552", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG3", 10, 1, 3];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhs_acc_1pn93_2", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_DMS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_Yorris", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_LRPS", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["optic_AMS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["optic_KHS_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_01_F_mtp", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_02_F_hex", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["bipod_03_F_oli", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_harris_bipod", 20, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhs_bipod", 10, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_makarov_pmm", "rhs_mag_9x18_12_57N181S", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak74m_2mag_camo_npz", "rhs_30Rnd_545x39_AK", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_5RD", "rhsusf_5Rnd_00Buck", 11];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_8RD", "rhsusf_8Rnd_00Buck", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_mk18_grip2_eotech_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m4a1_blockII_grip2_acog2_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M320", "rhs_mag_M433_HEDP", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_ak74m_plummag_npz", "rhs_30Rnd_545x39_AK", 7];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m240b_usmc", "rhsusf_100Rnd_762x51", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m16a4_grip_acog_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_XM2010_wd_leu", "rhsusf_5Rnd_300winmag_xm2010", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_sr25_sup_marsoc", "rhsusf_20Rnd_762x51_m118_special_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_rshg2","rhs_rshg2_mag", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["Binocular", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "SatchelCharge_Remote_Mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "HandGrenade", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "SmokeShell", 5];


// Here is a list of scopes:
a3e_arr_Scopes = [
	"rhsusf_acc_compm4"
	,"rhsusf_acc_eotech_552"
	,"rhsusf_acc_LEUPOLDMK4"
	,"rhsusf_acc_ACOG"
	,"rhsusf_acc_ACOG2"
	,"rhsusf_acc_ACOG3"
	,"rhsusf_acc_ACOG_USMC"
	,"rhsusf_acc_ACOG2_USMC"
	,"rhsusf_acc_ACOG3_USMC"
	,"rhsusf_acc_LEUPOLDMK4_2"
	,"rhsusf_acc_EOTECH"
	,"rhsusf_acc_EOTECH"
	,"rhsusf_acc_eotech_552"
	,"rhsusf_acc_compm4"
	,"rhsusf_acc_EOTECH"
	,"rhsusf_acc_eotech_552"
	,"rhsusf_acc_compm4"
	,"rhsusf_acc_EOTECH"
	,"rhsusf_acc_eotech_552"
	,"rhsusf_acc_compm4"];
a3e_arr_Scopes_SMG = [
	"rhsusf_acc_EOTECH"
	,"rhsusf_acc_eotech_552"
	,"rhs_m4_compm4"];
a3e_arr_Scopes_Sniper = [
	"rhsusf_acc_LEUPOLDMK4"
	,"rhsusf_acc_LEUPOLDMK4_2"];
a3e_arr_NightScopes = [
	"optic_NVS"];
a3e_arr_TWSScopes = [
	"optic_Nightstalker"
	,"optic_tws"
	,"optic_tws_mg"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"rhs_bipod"
	,"rhsusf_acc_harris_bipod"
	,"bipod_01_F_snd"
	,"bipod_01_F_blk"
	,"bipod_01_F_mtp"
	,"bipod_02_F_blk"
	,"bipod_02_F_tan"
	,"bipod_02_F_hex"
	,"bipod_03_F_blk"
	,"bipod_03_F_oli"];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"rhs_ka60_c"
	,"RHS_Mi8mt_vvs"];
a3e_arr_extraction_chopper_escort = [
	"RHS_Ka52_vvs"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"B_UAV_02_F"
	,"B_UAV_02_CAS_F"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"LOP_PMC_Mi8AMT"
	,"LOP_PMC_MH9_armed"];
a3e_arr_searchChopperHard = [
	"LOP_PMC_Mi8AMT"
	,"LOP_PMC_MH9_armed"
	,"RHS_UH1Y"
	,"RHS_UH1Y_FFAR"];
a3e_arr_searchChopper_pilot = [
	"LOP_PMC_Infantry_Pilot"];
a3e_arr_searchChopper_crew = [
	"LOP_PMC_Infantry_Pilot"];

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
	"B_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "rhsusf_weapons_crate";
a3e_additional_weapon_box_2 = "rhsusf_ammo_crate";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"RHS_M252_WD"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"RHS_A10"
	,"RHS_A10"
	,"rhsusf_f22"];

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
	"rhs_pilot_combat_heli"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_ak74m_gp25_1p63", 50, 2, 5, ["rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK_green","rhs_VOG25"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_rpg26", 10, 1, 2, ["rhs_rpg26_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_ak74m_2mag_camo", 100, 3, 5, ["rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK_green"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_pkm", 10, 1, 2, ["rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green"], 3];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_akms", 75, 2, 4, ["rhs_30Rnd_545x39_7N10_AK","rhs_45Rnd_545x39_7N10_AK"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_svdp_npz", 20, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_svd_pso1", 10, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_pkp_pkas", 10, 1, 2, ["rhs_100Rnd_762x54mmR"], 6];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["rhs_acc_pbs1", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_dtk4long", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_npz", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_pkas", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_pso1m2", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_1p78", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_1p63", 10, 1, 3];