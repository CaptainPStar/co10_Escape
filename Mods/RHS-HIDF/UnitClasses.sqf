/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = east; // playerside, RHS AFRF, Russian VDV mflora
A3E_VAR_Side_Opfor = west; // RHS Horizon Islands Defence Force
A3E_VAR_Side_Ind = resistance; // RHS Tanoan Liberation Army

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_us_CO.paa";
A3E_VAR_Flag_Ind = "\rhssaf\addons\rhssaf_main\data\flags\flag_serbia_co.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"rhsgref_tla_g_rifleman"
	,"rhsgref_tla_g_rifleman_akms"
	,"rhsgref_tla_g_rifleman_l1a1"
	,"rhsgref_tla_g_rifleman_m1"
	,"rhsgref_tla_g_crew"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pb_6p9","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pb_6p9","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pya","rhs_mag_9x19_17"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pya","rhs_mag_9x19_17"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pp2000_folded","rhs_mag_9x19mm_7n21_20"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_pp2000_folded","rhs_mag_9x19mm_7n31_44"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_savz61_folded","rhsgref_20rnd_765x17_vz61"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_savz61_folded","rhsgref_10rnd_765x17_vz61"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_tt33","rhs_mag_762x25_8"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_tt33","rhs_mag_762x25_8"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_6p53","rhs_18rnd_9x21mm_7N28"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_6p53","rhs_18rnd_9x21mm_7N29"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_type94_new","rhs_mag_6x8mm_mhp"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_Izh18","rhsgref_1Rnd_00Buck"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_cz99","rhssaf_mag_15Rnd_9x19_FMJ"];

/* US pistols
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_JHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m9","rhsusf_mag_15Rnd_9x19_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_m1911a1","rhsusf_mag_7x45acp_MHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_glock17g4","rhsusf_mag_17Rnd_9x19_JHP"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_glock17g4","rhsusf_mag_17Rnd_9x19_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["rhsusf_weap_MP7A2","rhsusf_mag_40Rnd_46x30_FMJ"];
a3e_arr_PrisonBackpackWeapons pushback ["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG"];

*/

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
	,"C_Truck_02_covered_F"
	,"C_Offroad_01_repair_F"
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
		"rhsgref_hidf_M998_2dr"
		,"rhsgref_hidf_M998_2dr_halftop"
		,"rhsgref_hidf_M998_2dr_fulltop"
		,"rhsgref_hidf_m998_4dr"
		,"rhsgref_hidf_M998_4dr_halftop"
		,"rhsgref_hidf_M998_4dr_fulltop"
		,"rhsgref_hidf_m1025"
		,"rhsgref_hidf_m1025_m2"
		,"rhsgref_hidf_m1025_mk19"
		,"rhsgref_hidf_m113a3_unarmed"
		,"rhsgref_hidf_m113a3_m2"
		,"rhsgref_hidf_m113a3_mk19"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhsgref_tla_g_offroad"
		,"rhsgref_tla_g_offroad_armed"
		,"rhsgref_tla_g_offroad_at"
		,"rhsgref_tla_g_kraz255b1_cargo_open"
		,"rhsgref_tla_g_btr60"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhsgref_hidf_M998_2dr"
		,"rhsgref_hidf_M998_2dr_halftop"
		,"rhsgref_hidf_M998_2dr_fulltop"
		,"rhsgref_hidf_m998_4dr"
		,"rhsgref_hidf_M998_4dr_halftop"
		,"rhsgref_hidf_M998_4dr_fulltop"
		,"rhsgref_hidf_m1025"
		,"rhsgref_hidf_m1025_m2"
		,"rhsgref_hidf_m1025_mk19"
		,"rhsgref_hidf_m113a3_unarmed"
		,"rhsgref_hidf_m113a3_m2"
		,"rhsgref_hidf_m113a3_mk19"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhsgref_tla_g_offroad"
		,"rhsgref_tla_g_offroad_armed"
		,"rhsgref_tla_g_offroad_at"
		,"rhsgref_tla_g_kraz255b1_cargo_open"
		,"rhsgref_tla_g_btr60"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhsgref_hidf_M998_2dr"
		,"rhsgref_hidf_M998_2dr_halftop"
		,"rhsgref_hidf_M998_2dr_fulltop"
		,"rhsgref_hidf_m998_4dr"
		,"rhsgref_hidf_M998_4dr_halftop"
		,"rhsgref_hidf_M998_4dr_fulltop"
		,"rhsgref_hidf_m1025"
		,"rhsgref_hidf_m1025_m2"
		,"rhsgref_hidf_m1025_mk19"
		,"rhsgref_hidf_m113a3_unarmed"
		,"rhsgref_hidf_m113a3_m2"
		,"rhsgref_hidf_m113a3_mk19"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhsgref_tla_g_offroad"
		,"rhsgref_tla_g_offroad_armed"
		,"rhsgref_tla_g_offroad_at"
		,"rhsgref_tla_g_kraz255b1_cargo_open"
		,"rhsgref_tla_g_btr60"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"rhsgref_hidf_squadleader"
	,"rhsgref_hidf_teamleader"
	,"rhsgref_hidf_autorifleman"
	,"rhsgref_hidf_autorifleman"
	,"rhsgref_hidf_autorifleman_assist"
	,"rhsgref_hidf_medic"
	,"rhsgref_hidf_medic"
	,"rhsgref_hidf_boat_driver"
	,"rhsgref_hidf_grenadier"
	,"rhsgref_hidf_grenadier"
	,"rhsgref_hidf_grenadier_m79"
	,"rhsgref_hidf_machinegunner"
	,"rhsgref_hidf_machinegunner_assist"
	,"rhsgref_hidf_marksman"
	,"rhsgref_hidf_rifleman"
	,"rhsgref_hidf_rifleman"
	,"rhsgref_hidf_rifleman"
	,"rhsgref_hidf_rifleman_m72"
	,"rhsgref_hidf_rifleman_m72"
	,"rhsgref_hidf_sniper"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"rhsgref_tla_g_squadleader"
	,"rhsgref_tla_g_specialist_at"
	,"rhsgref_tla_g_grenadier"
	,"rhsgref_tla_g_grenadier_m79"
	,"rhsgref_tla_g_rifleman"
	,"rhsgref_tla_g_rifleman_akms"
	,"rhsgref_tla_g_rifleman_l1a1"
	,"rhsgref_tla_g_rifleman_m1"
	,"rhsgref_tla_g_rifleman_m14"
	,"rhsgref_tla_g_rifleman_M16"
	,"rhsgref_tla_g_rifleman_pm63"
	,"rhsgref_tla_g_rifleman_rpg75"
	,"rhsgref_tla_g_rifleman_vz58"
	,"rhsgref_tla_g_machinegunner"
	,"rhsgref_tla_g_machinegunner_mg42"
	,"rhsgref_tla_g_marksman_m14"
	,"rhsgref_tla_g_mechanic"
	,"rhsgref_tla_g_mechanic"
	,"rhsgref_tla_g_medic"
	,"rhsgref_tla_g_medic"
	,"rhsgref_tla_g_saboteur"
	,"rhsgref_tla_g_warlord"];
a3e_arr_recon_InfantryTypes = [
	"rhsgref_hidf_squadleader"
	,"rhsgref_hidf_teamleader"
	,"rhsgref_hidf_autorifleman"
	,"rhsgref_hidf_autorifleman"
	,"rhsgref_hidf_autorifleman_assist"
	,"rhsgref_hidf_medic"
	,"rhsgref_hidf_medic"
	,"rhsgref_hidf_boat_driver"
	,"rhsgref_hidf_grenadier"
	,"rhsgref_hidf_grenadier"
	,"rhsgref_hidf_grenadier_m79"
	,"rhsgref_hidf_machinegunner"
	,"rhsgref_hidf_machinegunner_assist"
	,"rhsgref_hidf_marksman"
	,"rhsgref_hidf_rifleman"
	,"rhsgref_hidf_rifleman"
	,"rhsgref_hidf_rifleman"
	,"rhsgref_hidf_rifleman_m72"
	,"rhsgref_hidf_rifleman_m72"
	,"rhsgref_hidf_sniper"];
a3e_arr_recon_I_InfantryTypes = [
	"rhsgref_tla_g_squadleader"
	,"rhsgref_tla_g_specialist_at"
	,"rhsgref_tla_g_grenadier"
	,"rhsgref_tla_g_grenadier_m79"
	,"rhsgref_tla_g_rifleman"
	,"rhsgref_tla_g_rifleman_akms"
	,"rhsgref_tla_g_rifleman_l1a1"
	,"rhsgref_tla_g_rifleman_m1"
	,"rhsgref_tla_g_rifleman_m14"
	,"rhsgref_tla_g_rifleman_M16"
	,"rhsgref_tla_g_rifleman_pm63"
	,"rhsgref_tla_g_rifleman_rpg75"
	,"rhsgref_tla_g_rifleman_vz58"
	,"rhsgref_tla_g_machinegunner"
	,"rhsgref_tla_g_machinegunner_mg42"
	,"rhsgref_tla_g_marksman_m14"
	,"rhsgref_tla_g_mechanic"
	,"rhsgref_tla_g_mechanic"
	,"rhsgref_tla_g_medic"
	,"rhsgref_tla_g_medic"
	,"rhsgref_tla_g_saboteur"
	,"rhsgref_tla_g_warlord"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"rhsgref_hidf_m1025_m2"
	,"rhsgref_hidf_m1025_m2"
	,"rhsgref_hidf_m1025_mk19"
	,"rhsgref_hidf_m113a3_m2"
	,"rhsgref_hidf_m113a3_m2"
	,"rhsgref_hidf_m113a3_mk19"
	,"rhsgref_hidf_m2_static"
	,"rhsgref_hidf_m2_static_minitripod"
	,"rhsgref_hidf_mk19_static"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"rhsgref_tla_g_offroad_armed"
	,"rhsgref_tla_g_offroad_armed"
	,"rhsgref_tla_g_offroad_at"
	,"rhsgref_tla_g_btr60"
	,"rhsgref_tla_g_DSHKM"
	,"rhsgref_tla_g_DSHKM_Mini_TriPod"
	,"rhsgref_tla_g_SPG9"
	,"rhsgref_tla_g_ZU23"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"rhsgref_hidf_M998_2dr_halftop"
	,"rhsgref_hidf_m113a3_unarmed"
	,"rhsgref_hidf_m113a3_m2"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"rhsgref_tla_g_kraz255b1_cargo_open"
	,"rhsgref_tla_g_kraz255b1_cargo_open"
	,"rhsgref_tla_g_kraz255b1_cargo_open"
	,"rhsgref_tla_g_offroad"];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"rhsgref_hidf_m113a3_unarmed"
	,"rhsgref_hidf_m113a3_m2"
	,"rhsgref_hidf_m113a3_mk19"
	,"rhsgref_tla_g_btr60"];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"rhsgref_hidf_m113a3_m2"
	,"rhsgref_hidf_m113a3_m2"
	,"rhsgref_hidf_m113a3_mk19"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"rhsgref_hidf_m113a3_m2"
	,"rhsgref_hidf_m113a3_mk19"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"rhsgref_hidf_m2_static"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"I_G_Offroad_01_repair_F"
	,"rhsgref_hidf_m113a3_unarmed"
	,"rhsgref_hidf_m1025"
	,"rhsgref_hidf_M998_2dr_fulltop"
	,"rhsgref_hidf_M998_2dr_halftop"
	,"rhsgref_hidf_M998_2dr"
	,"rhsgref_hidf_M998_4dr_fulltop"
	,"rhsgref_hidf_M998_4dr_halftop"
	,"rhsgref_hidf_m998_4dr"
	,"rhsgref_tla_g_offroad_at"
	,"rhsgref_tla_g_kraz255b1_cargo_open"
	,"rhsgref_tla_g_offroad_armed
	","rhsgref_tla_g_offroad_armed"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"C_Hatchback_01_F"
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_01_F"
	,"C_Quadbike_01_F"
	,"C_SUV_01_F"
	,"C_Van_01_box_F"
	,"C_Van_01_transport_F"
	,"C_Van_01_fuel_F"
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"
	,"C_Truck_02_transport_F"
	,"C_Truck_02_covered_F"];
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

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"rhsgref_hidf_m2_static"
	,"rhsgref_hidf_m2_static_minitripod"
	,"rhsgref_hidf_mk19_static"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"rhs_uh1h_hidf_gunship"];
a3e_arr_O_transport_heli = [
	"rhs_uh1h_hidf_unarmed"
	,"rhs_uh1h_hidf"];
a3e_arr_O_pilots = [
	"rhsgref_hidf_helipilot"];
a3e_arr_I_transport_heli = [
	"rhsgref_cdf_reg_Mi8amt"];
a3e_arr_I_pilots = [
	"rhsgref_tla_g_crew"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m3a1", 50, 1, 2, ["rhsgref_30rnd_1143x23_M1911B_SMG"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_l1a1", 100, 3, 5, ["rhs_mag_20Rnd_762x51_m80_fnfal","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m1garand_sa43", 50, 2, 4, ["rhsgref_8Rnd_762x63_M2B_M1rifle"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m16a4_carryhandle_M203", 75, 2, 4, ["rhs_mag_30Rnd_556x45_M855_Stanag","rhs_mag_M585_white","rhs_mag_M441_HE"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_l1a1_suit", 20, 1, 2, ["rhs_mag_20Rnd_762x51_m61_fnfal","rhs_mag_20Rnd_762x51_m62_fnfal"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_tt33", 50, 2, 5, ["rhs_mag_762x25_8"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_pkm", 50, 2, 4, ["rhs_100Rnd_762x54mmR"], 5];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_akm", 10, 1, 3, ["rhs_30Rnd_762x39mm_89"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_akms_gp25", 75, 1, 3, ["rhs_30Rnd_762x39mm_89","rhs_VOG25"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_akms", 30, 1, 2, ["rhs_30Rnd_762x39mm_89"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_akms", 50, 1, 2, ["rhs_75Rnd_762x39mm_89"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_l1a1_wood", 50, 1, 2, ["rhs_mag_20Rnd_762x51_m80_fnfal"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m1garand_sa43", 10, 1, 2, ["rhsgref_8Rnd_762x63_M2B_M1rifle"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_pm63", 30, 1, 2, ["rhs_30Rnd_762x39mm_89"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_savz58p", 30, 1, 2, ["rhs_30Rnd_762x39mm_Savz58"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_savz61", 40, 1, 2, ["rhsgref_20rnd_765x17_vz61"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_aks74u", 40, 1, 2, ["rhs_30Rnd_545x39_7N6_AK"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m3a1", 30, 1, 2, ["rhsgref_30rnd_1143x23_M1911B_2mag_SMG"], 8];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m249", 50, 1, 2, ["rhsusf_200rnd_556x45_M855_mixed_box"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m79", 30, 2, 4, ["rhs_mag_M441_HE"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m24sws_blk_leu", 40, 2, 4, ["rhsusf_5Rnd_762x51_m118_special_Mag","rhsusf_5Rnd_762x51_m62_Mag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_fnmag", 50, 1, 3, ["rhsusf_100Rnd_762x51"], 6];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m79", 30, 2, 4, ["rhs_mag_M433_HEDP","rhs_mag_M441_HE"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m14", 50, 1, 2, ["rhsusf_20Rnd_762x51_m80_Mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m16a4_carryhandle", 35, 1, 2, ["rhs_mag_20Rnd_556x45_M193_2MAG_Stanag"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_mg42", 35, 1, 2, ["rhsgref_50Rnd_792x57_SmE_drum","rhsgref_296Rnd_792x57_SmE_belt"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m14_bipod_M8541", 25, 1, 2, ["rhsusf_20Rnd_762x51_m80_Mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m3a1_specops", 25, 1, 2, ["rhsgref_30rnd_1143x23_M1911B_SMG"], 10];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_m72a7", 75, 1, 3, ["rhs_m72a7_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_fim92", 30, 1, 2, ["rhs_fim92_mag"], 1];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_rpg7", 75, 1, 3, ["rhs_rpg7_PG7V_mag","rhs_rpg7_type69_airburst_mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_panzerfaust60", 50, 1, 3, ["rhs_rpg7_PG7V_mag"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_igla", 30, 1, 2, ["rhs_mag_9k38_rocket"], 1];

// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["rhs_charge_M2tet_x2_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["Laserbatteries"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_mag_m67"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_mag_rgd5", "rhs_mag_f1"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["rhs_mag_an_m8hc", "rhs_mag_m18_red", "rhs_mag_rdg2_white", "rhs_mag_rdg2_black"], 50];
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
a3e_arr_AmmoDepotVehicleBackpacks = ["rhsgref_hidf_alicepack"];

// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.
a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["Laserdesignator", 10, 1, 2];
if(Param_NoNightvision==0) then {
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
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pbs1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_tgpa", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_tgpv", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_muzzleFlash_dtk", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_mrds", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_nt4_black", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4_2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p63", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pkas", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_ekp1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pso1m2", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_1p29", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_2dpZenit", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_dtkakm", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pgs64_74u", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsgref_acc_falMuzzle_l1a1", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_m24_silencer_wd", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4_wd", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsgref_acc_l1a1_l2a2", 30, 1, 3];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["rhsgref_acc_l1a1_anpvs2", 20, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_acc_pgo7v", 25, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_grip1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_grip2", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_grip2_wd", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_grip3", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_rvg_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_tacsac_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_tacsac_blue", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_tdstubby_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_harris_swivel", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_m14_bipod", 30, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_makarov_pmm", "rhs_mag_9x18_12_57N181S", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m3a1_specops", "rhsgref_30rnd_1143x23_M1911B_2mag_SMG", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_5RD", "rhsusf_5Rnd_00Buck", 11];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_8RD", "rhsusf_8Rnd_00Buck", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_mk18_grip2_eotech_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m4a1_blockII_KAC_SU230", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M320", "rhs_mag_M433_HEDP", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_MP44", "rhsgref_30Rnd_792x33_SmE_StG", 7];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m240b_usmc", "rhsusf_100Rnd_762x51", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m16a4_grip_acog_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_XM2010_wd_leu", "rhsusf_5Rnd_300winmag_xm2010", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_sr25_sup_marsoc", "rhsusf_20Rnd_762x51_m118_special_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_rshg2","rhs_rshg2_mag", 2];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_kar98k", "rhsgref_5Rnd_792x57_kar98k", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m1garand_sa43", "rhsgref_8Rnd_762x63_M2B_M1rifle", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m38", "rhsgref_5Rnd_762x54_m38", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_mosin_sbr", "rhsgref_5Rnd_762x54_m38", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_Izh18", "rhsgref_1Rnd_00Buck", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_Izh18", "rhsgref_1Rnd_Slug", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_MP44", "rhsgref_30Rnd_792x33_SmE_StG", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_panzerfaust60", objNull, 0];
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
	,"rhsusf_acc_T1_high"
	,"rhsusf_acc_g33_T1"
	,"rhsusf_acc_T1_low"
	,"rhsusf_acc_LEUPOLDMK4_2"
	,"rhsusf_acc_eotech_xps3"
	,"rhsusf_acc_eotech_xps3"
	,"rhsusf_acc_eotech_552"
	,"rhsusf_acc_RM05"
	,"rhsusf_acc_eotech_xps3"
	,"rhsusf_acc_eotech_552_wd"
	,"rhsusf_acc_compm4"
	,"rhsusf_acc_eotech_xps3"
	,"rhsusf_acc_eotech_552_wd"
	,"rhsusf_acc_compm4"];
a3e_arr_Scopes_SMG = [
	"rhsusf_acc_eotech_xps3"
	,"rhsusf_acc_eotech_552"
	,"rhsusf_acc_eotech_552_wd"
	,"rhs_m4_compm4"
	,"rhsusf_acc_RM05"];
a3e_arr_Scopes_Sniper = [
	"rhsusf_acc_LEUPOLDMK4"
	,"rhsusf_acc_LEUPOLDMK4_2"];
a3e_arr_NightScopes = [
	"rhsusf_acc_anpvs27"
	,"rhsusf_acc_ACOG_anpvs27"
	,"rhsusf_acc_premier_anpvs27"];
a3e_arr_TWSScopes = [
	"rhsusf_acc_anpas13gv1"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"rhs_bipod"
	,"rhsusf_acc_harris_bipod"
	,"rhsusf_acc_harris_bipod"
	,"rhsusf_acc_harris_bipod"
	,"rhsusf_acc_grip1"
	,"rhsusf_acc_grip2"
	,"rhsusf_acc_grip2_wd"
	,"rhsusf_acc_grip3"
	,"rhsusf_acc_rvg_blk"
	,"rhsusf_acc_tdstubby_blk"
	,"rhsusf_acc_tacsac_blk"];

//////////////////////////////////////////////////////////////////
// SelectExtractionZone.sqf
// Which type of extractions are supported/preferred by this unitclasses version?
// Only if supported by terrain, so if corresponding markers are placed
// Basic fallback is always Heli extraction
// Available types: a3e_arr_extractiontypes = ["air","land","sea"];
//////////////////////////////////////////////////////////////////
a3e_arr_extractiontypes = [
	"air"
	,"land"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"rhs_ka60_grey"
	,"RHS_Mi8mt_vvs"
	,"RHS_Mi8MTV3_vvs"];
a3e_arr_extraction_chopper_escort = [
	"RHS_Ka52_vvs"
	,"rhs_mi28n_vvs"
	,"RHS_Mi24P_vvs"
	,"RHS_Mi24V_vvs"];
//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"O_Boat_Armed_01_hmg_F"];
a3e_arr_extraction_boat_escort = [
	"O_Boat_Armed_01_hmg_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"rhsusf_M1078A1P2_B_WD_fmtv_usarmy"	//14
	,"rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy"	//13
	,"rhsusf_M1083A1P2_B_WD_fmtv_usarmy"	//14
	,"rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy"	//13
	,"rhsusf_m998_w_s_2dr_fulltop"	//7
	,"rhsusf_M1232_MC_M2_usmc_wd"	//10
	,"rhsusf_M1232_MC_M2_usmc_wd"];	//10
a3e_arr_extraction_car_escort = [
	"rhsusf_M1117_W"	//6
	,"rhsusf_M1220_M153_M2_usarmy_wd"	//8
	,"rhsusf_stryker_m1126_m2_wd"	//9
	,"rhsusf_stryker_m1126_mk19_wd"
	,"rhsusf_stryker_m1132_m2_np_wd"
	,"rhsusf_stryker_m1132_m2_wd"
	,"rhsusf_m1a1fep_wd"
	,"rhsusf_m1a1fep_od"
	,"rhsusf_m1a1hc_wd"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"rhsgred_hidf_cessna_o3a"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"rhs_uh1h_hidf_unarmed"];
a3e_arr_searchChopperHard = [
	"rhs_uh1h_hidf"
	,"rhs_uh1h_hidf_gunship"];
a3e_arr_searchChopper_pilot = [
	"rhsusf_usmc_marpat_wd_helipilot"];
a3e_arr_searchChopper_crew = [
	"rhsusf_usmc_marpat_wd_helicrew"];

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
	"rhsgref_hidf_rhib"
	,"rhsgref_hidf_rhib"
	,"rhsgref_hidf_assault_boat"
	,"rhsgref_hidf_assault_boat"
	,"rhsgref_hidf_canoe"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "rhsusf_weapon_crate";
a3e_additional_weapon_box_2 = "rhsusf_mags_crate";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"rhsgref_tla_g_2b14"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"RHSGREF_A29B_HIDF"];

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
	,"Land_rhs_mi28_wreck"
	,"Land_rhs_mi28_wreck2"
	,"Land_rhs_tu95_wreck"
	,"Mi8Wreck"];
a3e_arr_CrashSiteCrew = [
	"rhs_pilot_combat_heli"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_BMP2_F"
	,"Land_Wreck_BRDM2_F"
	,"Land_Wreck_T72_hull_F"];
a3e_arr_CrashSiteCrewCar = [
	"rhs_vdv_flora_crew"
	,"rhs_vdv_flora_armoredcrew"
	,"rhs_vdv_flora_combatcrew"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_ak74m_gp25_1p63", 50, 2, 5, ["rhs_30Rnd_545x39_7N6M_green_AK","rhs_30Rnd_545x39_7N10_2mag_plum_AK","rhs_VOG25"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_rpg26", 10, 1, 2, ["rhs_rpg26_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_ak74_3", 100, 3, 5, ["rhs_30Rnd_545x39_7N6_green_AK","rhs_30Rnd_545x39_7N10_2mag_plum_AK"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_pkm", 10, 1, 2, ["rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green"], 3];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_akms", 75, 2, 4, ["rhs_30Rnd_545x39_7N10_AK","rhs_45Rnd_545x39_7N10_AK"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_svdp_wd_npz", 20, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_asval_grip_npz", 20, 1, 2, ["rhs_20rnd_9x39mm_SP6"], 12];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_svd_pso1", 10, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 8];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_pkp_pkas", 10, 1, 2, ["rhs_100Rnd_762x54mmR"], 6];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["rhs_acc_ekp1", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_ekp8_02", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_npz", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_pkas", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_pso1m2", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_1p78", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_1p63", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_nita", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_2dpZenit", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_perst1ik", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["hlc_muzzle_545SUP_AK", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_pbs1", 10, 1, 3];
a3e_arr_CrashSiteItems pushback ["rhs_acc_tgpv", 10, 1, 3];