/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

//Sides

A3E_VAR_Side_Blufor = east;//Player side RHS AFRF, VDV desert
A3E_VAR_Side_Opfor = west;//RHS USAF, USMC-D and US Army-D
A3E_VAR_Side_Ind = resistance;//RHS SAF, UN Peacekeepers desert

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_us_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_uno_CO.paa";

A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison.
a3e_arr_Escape_StartPositionGuardTypes = [
	"rhssaf_un_m10_digital_desert_rifleman_m21"
	,"rhssaf_un_m10_digital_desert_rifleman_m70"
	,"rhssaf_un_m10_digital_desert_gl"
	,"rhssaf_un_m10_digital_desert_crew"];

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
		"rhsusf_m998_d_s_2dr"//USMC
		,"rhsusf_m998_d_s_2dr_halftop"//USMC
		,"rhsusf_m998_d_s_2dr_fulltop"//USMC
		,"rhsusf_m998_d_s_4dr"//USMC
		,"rhsusf_m998_d_s_4dr_halftop"//USMC
		,"rhsusf_m998_d_s_4dr_fulltop"//USMC
		,"rhsusf_m1025_d_s"//USMC
		,"rhsusf_m1025_d_s_m2"//USMC
		,"rhsusf_m1025_d_s_Mk19"//USMC
		,"rhsusf_m1043_d_s"//USMC
		,"rhsusf_m1043_d_s_m2"//USMC
		,"rhsusf_m1043_d_s_mk19"//USMC
		,"rhsusf_m1045_d_s"//USMC
		,"rhsusf_M1117_D"
		,"rhsusf_M1220_usarmy_d"
		,"rhsusf_M1220_M153_M2_usarmy_d"
		,"rhsusf_M1220_M2_usarmy_d"
		,"rhsusf_M1220_MK19_usarmy_d"
		,"rhsusf_M1230_M2_usarmy_d"
		,"rhsusf_M1230_MK19_usarmy_d"
		,"rhsusf_M1230a1_usarmy_d"
		,"rhsusf_M1232_usarmy_d"
		,"rhsusf_M1232_M2_usarmy_d"
		,"rhsusf_M1232_MK19_usarmy_d"
		,"rhsusf_M1237_M2_usarmy_d"
		,"rhsusf_M1237_MK19_usarmy_d"
		,"rhsusf_M1078A1P2_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy"
		,"rhsusf_M1083A1P2_D_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M977A4_usarmy_d"
		,"rhsusf_M977A4_BKIT_usarmy_d"
		,"rhsusf_M977A4_BKIT_M2_usarmy_d"
		,"rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy"
		,"rhsusf_M977A4_AMMO_usarmy_d"
		,"rhsusf_M977A4_REPAIR_usarmy_d"
		,"rhsusf_M977A4_AMMO_BKIT_usarmy_d"
		,"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d"
		,"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d"
		,"rhsusf_M977A4_REPAIR_BKIT_usarmy_d"
		,"rhsusf_M978A4_usarmy_d"
		,"rhsusf_M978A4_BKIT_usarmy_d"
		,"rhsusf_CGRCAT1A2_usmc_d"
		,"rhsusf_CGRCAT1A2_M2_usmc_d"
		,"rhsusf_CGRCAT1A2_Mk19_usmc_d"
		,"rhsusf_M1232_MC_M2_usmc_d"
		,"rhsusf_M1232_MC_MK19_usmc_d"
		,"rhsusf_m113d_usarmy_supply"
		,"rhsusf_m113d_usarmy"
		,"rhsusf_m113d_usarmy_M240"
		,"rhsusf_m113d_usarmy_MK19"
		,"rhsusf_m113d_usarmy_unarmed"
		,"rhsusf_m113d_usarmy_medical"
		,"rhsusf_rg33_usmc_d"//USMC
		,"rhsusf_rg33_m2_usmc_d"//USMC
		,"RHS_M2A2"
		,"RHS_M2A2_BUSKI"
		,"RHS_M2A3"
		,"RHS_M2A3_BUSKI"
		,"RHS_M2A3_BUSKIII"
		,"RHS_M6"
		,"RHS_M6"
		,"rhsusf_m1a1fep_d"//USMC
		,"rhsusf_m1a1aimd_usarmy"
		,"rhsusf_m1a1aim_tuski_d"
		,"rhsusf_m1a2sep1d_usarmy"
		,"rhsusf_m1a2sep1tuskid_usarmy"
		,"rhsusf_m1a2sep1tuskiid_usarmy"
		,"rhsusf_m109d_usarmy"
		,"rhsusf_M142_usarmy_D"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhssaf_un_uaz"
		,"rhssaf_un_uaz_open"
		,"rhssaf_un_ural"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhsusf_m998_d_s_2dr"//USMC
		,"rhsusf_m998_d_s_2dr_halftop"//USMC
		,"rhsusf_m998_d_s_2dr_fulltop"//USMC
		,"rhsusf_m998_d_s_4dr"//USMC
		,"rhsusf_m998_d_s_4dr_halftop"//USMC
		,"rhsusf_m998_d_s_4dr_fulltop"//USMC
		,"rhsusf_m1025_d_s"//USMC
		,"rhsusf_m1025_d_s_m2"//USMC
		,"rhsusf_m1025_d_s_Mk19"//USMC
		,"rhsusf_m1043_d_s"//USMC
		,"rhsusf_m1043_d_s_m2"//USMC
		,"rhsusf_m1043_d_s_mk19"//USMC
		,"rhsusf_m1045_d_s"//USMC
		,"rhsusf_M1117_D"
		,"rhsusf_M1220_usarmy_d"
		,"rhsusf_M1220_M153_M2_usarmy_d"
		,"rhsusf_M1220_M2_usarmy_d"
		,"rhsusf_M1220_MK19_usarmy_d"
		,"rhsusf_M1230_M2_usarmy_d"
		,"rhsusf_M1230_MK19_usarmy_d"
		,"rhsusf_M1230a1_usarmy_d"
		,"rhsusf_M1232_usarmy_d"
		,"rhsusf_M1232_M2_usarmy_d"
		,"rhsusf_M1232_MK19_usarmy_d"
		,"rhsusf_M1237_M2_usarmy_d"
		,"rhsusf_M1237_MK19_usarmy_d"
		,"rhsusf_M1078A1P2_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy"
		,"rhsusf_M1083A1P2_D_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M977A4_usarmy_d"
		,"rhsusf_M977A4_BKIT_usarmy_d"
		,"rhsusf_M977A4_BKIT_M2_usarmy_d"
		,"rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy"
		,"rhsusf_M977A4_AMMO_usarmy_d"
		,"rhsusf_M977A4_REPAIR_usarmy_d"
		,"rhsusf_M977A4_AMMO_BKIT_usarmy_d"
		,"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d"
		,"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d"
		,"rhsusf_M977A4_REPAIR_BKIT_usarmy_d"
		,"rhsusf_M978A4_usarmy_d"
		,"rhsusf_M978A4_BKIT_usarmy_d"
		,"rhsusf_CGRCAT1A2_usmc_d"
		,"rhsusf_CGRCAT1A2_M2_usmc_d"
		,"rhsusf_CGRCAT1A2_Mk19_usmc_d"
		,"rhsusf_M1232_MC_M2_usmc_d"
		,"rhsusf_M1232_MC_MK19_usmc_d"
		,"rhsusf_m113d_usarmy_supply"
		,"rhsusf_m113d_usarmy"
		,"rhsusf_m113d_usarmy_M240"
		,"rhsusf_m113d_usarmy_MK19"
		,"rhsusf_m113d_usarmy_unarmed"
		,"rhsusf_m113d_usarmy_medical"
		,"rhsusf_rg33_usmc_d"//USMC
		,"rhsusf_rg33_m2_usmc_d"//USMC
		,"RHS_M2A2"
		,"RHS_M2A2_BUSKI"
		,"RHS_M2A3"
		,"RHS_M2A3_BUSKI"
		,"RHS_M2A3_BUSKIII"
		,"RHS_M6"
		,"RHS_M6"
		,"rhsusf_m1a1fep_d"//USMC
		,"rhsusf_m1a1aimd_usarmy"
		,"rhsusf_m1a1aim_tuski_d"
		,"rhsusf_m1a2sep1d_usarmy"
		,"rhsusf_m1a2sep1tuskid_usarmy"
		,"rhsusf_m1a2sep1tuskiid_usarmy"
		,"rhsusf_m109d_usarmy"
		,"rhsusf_M142_usarmy_D"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhssaf_un_uaz"
		,"rhssaf_un_uaz_open"
		,"rhssaf_un_ural"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"rhsusf_m998_d_s_2dr"//USMC
		,"rhsusf_m998_d_s_2dr_halftop"//USMC
		,"rhsusf_m998_d_s_2dr_fulltop"//USMC
		,"rhsusf_m998_d_s_4dr"//USMC
		,"rhsusf_m998_d_s_4dr_halftop"//USMC
		,"rhsusf_m998_d_s_4dr_fulltop"//USMC
		,"rhsusf_m1025_d_s"//USMC
		,"rhsusf_m1025_d_s_m2"//USMC
		,"rhsusf_m1025_d_s_Mk19"//USMC
		,"rhsusf_m1043_d_s"//USMC
		,"rhsusf_m1043_d_s_m2"//USMC
		,"rhsusf_m1043_d_s_mk19"//USMC
		,"rhsusf_m1045_d_s"//USMC
		,"rhsusf_M1117_D"
		,"rhsusf_M1220_usarmy_d"
		,"rhsusf_M1220_M153_M2_usarmy_d"
		,"rhsusf_M1220_M2_usarmy_d"
		,"rhsusf_M1220_MK19_usarmy_d"
		,"rhsusf_M1230_M2_usarmy_d"
		,"rhsusf_M1230_MK19_usarmy_d"
		,"rhsusf_M1230a1_usarmy_d"
		,"rhsusf_M1232_usarmy_d"
		,"rhsusf_M1232_M2_usarmy_d"
		,"rhsusf_M1232_MK19_usarmy_d"
		,"rhsusf_M1237_M2_usarmy_d"
		,"rhsusf_M1237_MK19_usarmy_d"
		,"rhsusf_M1078A1P2_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy"
		,"rhsusf_M1083A1P2_D_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_B_D_fmtv_usarmy"
		,"rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy"
		,"rhsusf_M977A4_usarmy_d"
		,"rhsusf_M977A4_BKIT_usarmy_d"
		,"rhsusf_M977A4_BKIT_M2_usarmy_d"
		,"rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy"
		,"rhsusf_M977A4_AMMO_usarmy_d"
		,"rhsusf_M977A4_REPAIR_usarmy_d"
		,"rhsusf_M977A4_AMMO_BKIT_usarmy_d"
		,"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d"
		,"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d"
		,"rhsusf_M977A4_REPAIR_BKIT_usarmy_d"
		,"rhsusf_M978A4_usarmy_d"
		,"rhsusf_M978A4_BKIT_usarmy_d"
		,"rhsusf_CGRCAT1A2_usmc_d"
		,"rhsusf_CGRCAT1A2_M2_usmc_d"
		,"rhsusf_CGRCAT1A2_Mk19_usmc_d"
		,"rhsusf_M1232_MC_M2_usmc_d"
		,"rhsusf_M1232_MC_MK19_usmc_d"
		,"rhsusf_m113d_usarmy_supply"
		,"rhsusf_m113d_usarmy"
		,"rhsusf_m113d_usarmy_M240"
		,"rhsusf_m113d_usarmy_MK19"
		,"rhsusf_m113d_usarmy_unarmed"
		,"rhsusf_m113d_usarmy_medical"
		,"rhsusf_rg33_usmc_d"//USMC
		,"rhsusf_rg33_m2_usmc_d"//USMC
		,"RHS_M2A2"
		,"RHS_M2A2_BUSKI"
		,"RHS_M2A3"
		,"RHS_M2A3_BUSKI"
		,"RHS_M2A3_BUSKIII"
		,"RHS_M6"
		,"RHS_M6"
		,"rhsusf_m1a1fep_d"//USMC
		,"rhsusf_m1a1aimd_usarmy"
		,"rhsusf_m1a1aim_tuski_d"
		,"rhsusf_m1a2sep1d_usarmy"
		,"rhsusf_m1a2sep1tuskid_usarmy"
		,"rhsusf_m1a2sep1tuskiid_usarmy"
		,"rhsusf_m109d_usarmy"
		,"rhsusf_M142_usarmy_D"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"rhssaf_un_uaz"
		,"rhssaf_un_uaz_open"
		,"rhssaf_un_ural"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
a3e_arr_Escape_InfantryTypes = [
	"rhsusf_usmc_marpat_d_officer"
	,"rhsusf_usmc_marpat_d_squadleader"
	,"rhsusf_usmc_marpat_d_teamleader"
	,"rhsusf_usmc_marpat_d_rifleman"
	,"rhsusf_usmc_marpat_d_rifleman_light"
	,"rhsusf_usmc_marpat_d_riflemanat"
	,"rhsusf_usmc_marpat_d_rifleman_m4"
	,"rhsusf_usmc_marpat_d_rifleman_law"
	,"rhsusf_usmc_marpat_d_rifleman_m590"
	,"rhsusf_usmc_marpat_d_grenadier"
	,"rhsusf_usmc_marpat_d_grenadier_m32"
	,"rhsusf_usmc_marpat_d_stinger"
	,"rhsusf_usmc_marpat_d_smaw"
	,"rhsusf_usmc_marpat_d_javelin"
	,"rhsusf_usmc_marpat_d_javelin_assistant"
	,"rhsusf_usmc_marpat_d_machinegunner"
	,"rhsusf_usmc_marpat_d_machinegunner_ass"
	,"rhsusf_usmc_marpat_d_autorifleman"
	,"rhsusf_usmc_marpat_d_autorifleman_m249"
	,"rhsusf_usmc_marpat_d_autorifleman_m249_ass"
	,"rhsusf_usmc_marpat_d_explosives"
	,"rhsusf_usmc_marpat_d_engineer"
	,"rhsusf_usmc_marpat_d_engineer"
	,"rhsusf_navy_marpat_d_medic"
	,"rhsusf_navy_marpat_d_medic"
	,"rhsusf_usmc_marpat_d_marksman"
	,"rhsusf_usmc_marpat_d_fso"
	,"rhsusf_usmc_marpat_d_jfo"
	,"rhsusf_usmc_marpat_d_sniper"
	,"rhsusf_usmc_marpat_d_sniper_m110"
	,"rhsusf_usmc_marpat_d_sniper_m107"
	,"rhsusf_usmc_marpat_d_spotter"
	,"rhsusf_usmc_marpat_d_uav"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"rhssaf_un_m10_digital_desert_officer"
	,"rhssaf_un_m10_digital_desert_sq_lead"
	,"rhssaf_un_m10_digital_desert_ft_lead"
	,"rhssaf_un_m10_digital_desert_rifleman_m21"
	,"rhssaf_un_m10_digital_desert_rifleman_m70"
	,"rhssaf_un_m10_digital_desert_rifleman_ammo"
	,"rhssaf_un_m10_digital_desert_rifleman_at"
	,"rhssaf_un_m10_digital_desert_spec_at"
	,"rhssaf_un_m10_digital_desert_asst_spec_at"
	,"rhssaf_un_m10_digital_desert_spec_aa"
	,"rhssaf_un_m10_digital_desert_asst_spec_aa"
	,"rhssaf_un_m10_digital_desert_gl"
	,"rhssaf_un_m10_digital_desert_exp"
	,"rhssaf_un_m10_digital_desert_engineer"
	,"rhssaf_un_m10_digital_desert_repair"
	,"rhssaf_un_m10_digital_desert_medic"
	,"rhssaf_un_m10_digital_desert_mgun_m84"
	,"rhssaf_un_m10_digital_desert_asst_mgun"
	,"rhssaf_un_m10_digital_desert_sniper_m76"
	,"rhssaf_un_m10_digital_desert_spotter"];
a3e_arr_recon_InfantryTypes = [
	"rhsusf_usmc_recon_marpat_d_officer"
	,"rhsusf_usmc_recon_marpat_d_teamleader_fast"
	,"rhsusf_usmc_recon_marpat_d_marksman_fast"
	,"rhsusf_usmc_recon_marpat_d_machinegunner"
	,"rhsusf_usmc_recon_marpat_d_machinegunner_m249_fast"
	,"rhsusf_usmc_recon_marpat_d_autorifleman_fast"
	,"rhsusf_usmc_recon_marpat_d_rifleman_fast"
	,"rhsusf_usmc_recon_marpat_d_rifleman_at_fast"
	,"rhsusf_usmc_recon_marpat_d_grenadier_m32"
	,"rhsusf_usmc_recon_marpat_d_sniper_M107"
	,"rhsusf_navy_sarc_d_fast"];
a3e_arr_recon_I_InfantryTypes = [
	"rhssaf_un_m10_digital_desert_officer"
	,"rhssaf_un_m10_digital_desert_sq_lead"
	,"rhssaf_un_m10_digital_desert_ft_lead"
	,"rhssaf_un_m10_digital_desert_rifleman_m21"
	,"rhssaf_un_m10_digital_desert_rifleman_m70"
	,"rhssaf_un_m10_digital_desert_rifleman_ammo"
	,"rhssaf_un_m10_digital_desert_rifleman_at"
	,"rhssaf_un_m10_digital_desert_spec_at"
	,"rhssaf_un_m10_digital_desert_asst_spec_at"
	,"rhssaf_un_m10_digital_desert_spec_aa"
	,"rhssaf_un_m10_digital_desert_asst_spec_aa"
	,"rhssaf_un_m10_digital_desert_gl"
	,"rhssaf_un_m10_digital_desert_exp"
	,"rhssaf_un_m10_digital_desert_engineer"
	,"rhssaf_un_m10_digital_desert_repair"
	,"rhssaf_un_m10_digital_desert_medic"
	,"rhssaf_un_m10_digital_desert_mgun_m84"
	,"rhssaf_un_m10_digital_desert_asst_mgun"
	,"rhssaf_un_m10_digital_desert_sniper_m76"
	,"rhssaf_un_m10_digital_desert_spotter"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"rhsusf_m1025_d_s_m2"
	,"rhsusf_m1025_d_s_Mk19"
	,"rhsusf_CGRCAT1A2_M2_usmc_d"
	,"RHS_M2StaticMG_USMC_D"
	,"RHS_M2StaticMG_MiniTripod_USMC_D"
	,"RHS_MK19_TriPod_USMC_D"
	,"RHS_TOW_TriPod_USMC_D"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"RHS_TOW_TriPod_USMC_D"
	,"RHS_MK19_TriPod_USMC_D"
	,"RHS_M2StaticMG_MiniTripod_USMC_D"
	,"RHS_M2StaticMG_USMC_D"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"rhsusf_m998_d_s_2dr_halftop"
	,"rhsusf_CGRCAT1A2_usmc_d"
	,"rhsusf_CGRCAT1A2_M2_usmc_d"
	,"rhsusf_M1078A1P2_D_fmtv_usarmy"
	,"rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_D_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy"
	,"rhsusf_mrzr4_d_mud"];//SOCOM
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"rhssaf_un_uaz"
	,"rhssaf_un_uaz_open"
	,"rhssaf_un_ural"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"rhsusf_mrzr4_d_mud"//SOCOM
	,"rhsusf_m1025_d_s"
	,"rhsusf_m1025_d_s_m2"
	,"rhsusf_m1025_d_s_Mk19"
	,"rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy"
	,"rhsusf_M1078A1P2_B_M2_D_flatbed_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy"
	,"rhsusf_m113d_usarmy"
	,"RHS_M2A2"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"rhsusf_m113d_usarmy"
	,"RHS_M6"
	,"RHS_M6"
	,"RHS_M2A2"
	,"RHS_M2A2_BUSKI"
	,"RHS_M2A3"
	,"RHS_M2A3_BUSKI"
	,"rhsusf_m1025_d_s_m2"
	,"rhsusf_m1025_d_s_Mk19"
	,"rhsusf_CGRCAT1A2_M2_usmc_d"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"rhsusf_m1a1fep_d"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"RHS_M2StaticMG_USMC_D"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"rhsusf_M1117_D"
	,"rhsusf_m113d_usarmy"
	,"rhsusf_CGRCAT1A2_usmc_d"
	,"rhsusf_M1078A1P2_D_fmtv_usarmy"
	,"rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy"
	,"rhsusf_M1078A1P2_B_D_fmtv_usarmy"
	,"rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"
	,"rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy"
	,"rhsusf_m1025_d_s"
	,"rhsusf_m1025_d_s_m2"
	,"rhsusf_m1025_d_s_Mk19"
	,"rhsusf_m113d_usarmy_medical"
	,"rhsusf_M978A4_usarmy_d"
	,"rhsusf_M977A4_AMMO_BKIT_usarmy_d"
	,"rhsusf_M977A4_REPAIR_BKIT_usarmy_d"
	,"rhsusf_m998_d_s_2dr"
	,"rhsusf_m998_d_s_4dr_halftop"
	,"rhsusf_M1230_M2_usarmy_d"];

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
	if(A3E_Param_UseDLCApex==1) then {
		a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Offroad_02_unarmed_F";
	};
	if(A3E_Param_UseDLCLaws==1) then {
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_medevac_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_vehicle_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_service_F";
	a3e_arr_Escape_EnemyCivilianCarTypes pushback "C_Van_02_transport_F";
	};

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"RHS_M2StaticMG_USMC_D"
	,"RHS_M2StaticMG_MiniTripod_USMC_D"
	,"RHS_MK19_TriPod_USMC_D"
	,"RHS_TOW_TriPod_USMC_D"
	,"RHS_Stinger_AA_pod_USMC_D"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = a3e_arr_ComCenParkedVehicles;

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"RHS_AH64DGrey"
	,"RHS_AH1Z"];
a3e_arr_O_transport_heli = [
	"rhsusf_CH53E_USMC_D"
	,"RHS_UH1Y_FFAR_d"
	,"RHS_UH1Y_d"
	,"RHS_UH1Y_UNARMED_d"
	,"RHS_CH_47F_light"];
a3e_arr_O_pilots = [
	"rhsusf_usmc_marpat_d_helipilot"];
a3e_arr_I_transport_heli = [
	"RHS_UH1Y"
	,"RHS_UH1Y_FFAR"
	,"RHS_UH1Y_UNARMED"];
a3e_arr_I_pilots = [
	"rhsusf_usmc_marpat_wd_helipilot"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["rhsusf_weap_MP7A2_aor1", 50, 1, 2, ["rhsusf_mag_40Rnd_46x30_FMJ"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4a1_d", 100, 3, 5, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4a1_blockII_grip2_d", 50, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4a1_blockII_M203_d", 75, 2, 4, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_M441_HE"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m240B", 20, 1, 2, ["rhsusf_100Rnd_762x51"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_XM2010_d", 10, 1, 2, ["rhsusf_5Rnd_300winmag_xm2010"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_M107_d", 10, 1, 2, ["rhsusf_mag_10Rnd_STD_50BMG_M33"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_cz99", 40, 2, 4, ["rhssaf_mag_15Rnd_9x19_FMJ"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m249_pip", 50, 2, 4, ["rhsusf_100Rnd_556x45_soft_pouch"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m16a4_grip", 50, 1, 3, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m16a4_carryhandle_M203", 50, 1, 3, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_M441_HE"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_g36c", 30, 1, 2, ["rhssaf_30rnd_556x45_Tracers_G36"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m14ebrri_leu", 10, 1, 2, ["rhsusf_20Rnd_762x51_m118_special_Mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_g36kv", 50, 1, 2, ["rhssaf_30rnd_556x45_Tracers_G36"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_hk416d10_m320", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_M441_HE"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m4_grip", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_mk18_KAC_d", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_scorpion", 40, 1, 2, ["rhsgref_20rnd_765x17_vz61"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m21a_pr", 40, 1, 2, ["rhsgref_30rnd_556x45_m21"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_m70ab2", 40, 1, 2, ["rhssaf_30Rnd_762x39mm_M67"], 8];
a3e_arr_AmmoDepotBasicWeapons pushback ["rhs_weap_M590_8RD", 10, 1, 2, ["rhsusf_8Rnd_00Buck","rhsusf_8Rnd_Slug"], 10];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_sr25_ec_d", 20, 2, 4, ["rhsusf_20Rnd_762x51_m118_special_Mag"], 9];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m40a5_d", 30, 2, 4, ["rhsusf_10Rnd_762x51_m118_special_Mag"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_hk416d145_d", 10, 1, 2, ["rhs_mag_30Rnd_556x45_M855A1_Stanag"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_XM2010_d_leu", 30, 2, 4, ["rhsusf_5Rnd_300winmag_xm2010"], 10];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m240B_CAP", 50, 1, 3, ["rhsusf_50Rnd_762x51_m80a1epr","rhsusf_100Rnd_762x51"], 3];
// non-CAST weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m32_usmc", 10, 2, 4, ["rhsusf_mag_6Rnd_M433_HEDP","rhsusf_mag_6Rnd_M576_Buckshot","rhsusf_mag_6Rnd_M713_red"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m249_pip", 30, 1, 2, ["rhsusf_100Rnd_556x45_soft_pouch"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m84", 50, 1, 2, ["rhs_100Rnd_762x54mmR"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m70b1n", 35, 1, 2, ["rhssaf_30Rnd_762x39mm_M67"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m70b3n", 35, 1, 2, ["rhssaf_30Rnd_762x39mm_M67"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["rhs_weap_m82a1", 10, 1, 2, ["rhsusf_mag_10Rnd_STD_50BMG_M33","rhsusf_mag_10Rnd_STD_50BMG_mk211"], 4];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_m72a7", 10, 1, 2, ["rhs_m72a7_mag"], 1];
//a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_mk40_sraw", 10, 1, 3, ["rhs_fgm172a_magazine_AT"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_M136_hedp", 10, 1, 3, ["rhs_m136_hedp_mag"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_maaws", 10, 1, 2, ["rhs_mag_maaws_HEAT","rhs_mag_maaws_HEDP","rhs_mag_maaws_HE"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_fgm148", 30, 1, 2, ["rhs_fgm148_magazine_AT"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["rhs_weap_smaw", 30, 1, 2, ["rhs_mag_smaw_HEAA","rhs_mag_smaw_HEDP"], 2];
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
a3e_arr_AmmoDepotVehicleBackpacks = ["rhsusf_assault_eagleaiii_coy"];

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
a3e_arr_AmmoDepotItems pushback ["lerca_1200_tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Leupold_Mk4", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["Binocular", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpeq15side", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpeq15_wmx", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpeq15", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpeq16a", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_wmx", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_mrds_c", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_nt4_tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_rotex5_tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_SF3P556", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_SFMB556", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_T1_high", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_T1_low", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_T1_low_fwd", 30, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_EOTECH", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_g33_T1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_g33_xps3_tan", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ELCAN", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ELCAN_ard", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG_USMC", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG2_USMC", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG3_USMC", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_eotech_552_d", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_compm4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_RM05", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_RX01", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_SpecterDR_D", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG_d", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_M8541_low_d", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_premier", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_LEUPOLDMK4_2_d", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_SR25S", 10, 1, 3];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpas13gv1", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_anpvs27", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_ACOG_anpvs27", 10, 1, 3];
	a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_premier_anpvs27", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["O_UavTerminal", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["rhs_weap_optic_smaw", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhs_optic_maaws", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_grip1", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_grip2_tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_grip3_tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_tacsac_tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_tacsac_blue", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_tdstubby_tan", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["rhsusf_acc_harris_bipod", 10, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_makarov_pm", "rhs_mag_9x18_8_57N181S", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m3a1", "rhsgref_30rnd_1143x23_M1911B_SMG", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_5RD", "rhsusf_5Rnd_00Buck", 11];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M590_8RD", "rhsusf_8Rnd_00Buck", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_mk18_grip2_eotech_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 9];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m4a1_blockII_KAC_SU230", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_M320", "rhs_mag_M433_HEDP", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_MP44", "rhsgref_30Rnd_792x33_SmE_StG", 7];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m240b_usmc", "rhsusf_100Rnd_762x51", 5];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m16a4_grip_acog_usmc", "rhs_mag_30Rnd_556x45_Mk318_Stanag", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_XM2010_d_leu", "rhsusf_5Rnd_300winmag_xm2010", 10];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_sr25_sup_marsoc", "rhsusf_20Rnd_762x51_m118_special_Mag", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_rshg2","rhs_rshg2_mag", 2];
a3e_arr_CivilianCarWeapons pushback ["rhsusf_weap_MP7A2_aor1", "rhsusf_mag_40Rnd_46x30_AP", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m38", "rhsgref_5Rnd_762x54_m38", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_m38_rail", "rhsgref_5Rnd_762x54_m38", 12];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_savz58p_rail", "rhs_30Rnd_762x39mm_Savz58_tracer", 8];
a3e_arr_CivilianCarWeapons pushback ["rhs_weap_kar98k", "rhsgref_5Rnd_792x57_kar98k", 12];
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
	"rhsusf_acc_T1_high"
	,"rhsusf_acc_T1_low"
	,"rhsusf_acc_EOTECH"
	,"rhsusf_acc_g33_T1"
	,"rhsusf_acc_g33_xps3_tan"
	,"rhsusf_acc_ELCAN"
	,"rhsusf_acc_ELCAN_ard"
	,"rhsusf_acc_ACOG_USMC"
	,"rhsusf_acc_ACOG2_USMC"
	,"rhsusf_acc_ACOG3_USMC"
	,"rhsusf_acc_eotech_552_d"
	,"rhsusf_acc_compm4"
	,"rhsusf_acc_RM05"
	,"rhsusf_acc_RX01"
	,"rhsusf_acc_SpecterDR_D"
	,"rhsusf_acc_ACOG_d"
	,"rhsusf_acc_M8541_low_d"
	,"rhsusf_acc_EOTECH"
	,"rhsusf_acc_eotech_552"
	,"rhsusf_acc_compm4"];
a3e_arr_Scopes_SMG = [
	"rhsusf_acc_EOTECH"
	,"rhsusf_acc_eotech_552_d"
	,"rhsusf_acc_T1_low"
	,"rhsusf_acc_RM05"];
a3e_arr_Scopes_Sniper = [
	"rhsusf_acc_M8541_low_d"
	,"rhsusf_acc_LEUPOLDMK4_2_d"];
a3e_arr_NightScopes = [
	"rhsusf_acc_anpvs27"
	,"rhsusf_acc_ACOG_anpvs27"
	,"rhsusf_acc_premier_anpvs27"];
a3e_arr_TWSScopes = [
	"rhsusf_acc_anpas13gv1"];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"rhsusf_acc_harris_bipod"
	,"rhsusf_acc_harris_bipod"
	,"rhsusf_acc_harris_bipod"
	,"rhsusf_acc_grip2_tan"
	,"rhsusf_acc_grip1"
	,"rhsusf_acc_grip3_tan"
	,"rhsusf_acc_tacsac_tan"
	,"rhsusf_acc_tdstubby_tan"];

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
	"B_UAV_02_F"
	,"B_UAV_02_CAS_F"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"RHS_MELB_H6M"
	,"RHS_UH1Y_UNARMED_d"
	,"rhsusf_CH53E_USMC_D"];
a3e_arr_searchChopperHard = [
	"RHS_UH1Y_d"
	,"RHS_UH1Y_FFAR_d"
	,"RHS_MELB_AH6M"
	,"RHS_UH60M_d"];
a3e_arr_searchChopper_pilot = [
	"rhsusf_usmc_marpat_d_helipilot"];
a3e_arr_searchChopper_crew = [
	"rhsusf_usmc_marpat_d_helicrew"];

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
	"rhsusf_mkvsoc"];

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
	"RHS_M252_USMC_D"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"RHS_A10"
	,"RHS_A10"
	,"rhsusf_f22"
	,"rhssaf_airforce_l_18"];

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
	"rhs_pilot_tan"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_BMP2_F"
	,"Land_Wreck_BRDM2_F"
	,"Land_Wreck_T72_hull_F"];
a3e_arr_CrashSiteCrewCar = [
	"rhs_vdv_des_driver"
	,"rhs_vdv_des_driver_armored"
	,"rhs_vdv_des_crew"
	,"rhs_vdv_des_armoredcrew"
	,"rhs_vdv_des_combatcrew"
	,"rhs_vdv_des_crew_commander"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_ak74m_gp25_1p63", 50, 2, 5, ["rhs_30Rnd_545x39_7N22_desert_AK","rhs_30Rnd_545x39_7N10_desert_AK","rhs_VOG25"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_rpg26", 10, 1, 2, ["rhs_rpg26_mag"], 1];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_ak74m_desert_npz", 100, 3, 5, ["rhs_30Rnd_545x39_7N10_2mag_desert_AK","rhs_30Rnd_545x39_7N22_desert_AK"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_pkm", 10, 1, 2, ["rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR_green"], 3];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_akms", 75, 2, 4, ["rhs_30Rnd_545x39_7N10_AK","rhs_45Rnd_545x39_7N10_AK"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_akms", 10, 2, 4, ["rhs_75Rnd_762x39mm_tracer"], 4];
a3e_arr_CrashSiteWeapons pushback ["rhs_weap_svdp_npz", 20, 1, 2, ["rhs_10Rnd_762x54mmR_7N1"], 8];
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