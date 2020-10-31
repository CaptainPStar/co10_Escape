// GM
// NVA vs BW


/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = east;	//player side GM NVA
A3E_VAR_Side_Opfor = west; //GM BW
A3E_VAR_Side_Ind = resistance; //GM Denmark

A3E_VAR_Flag_Opfor = "\gm\gm_core\data\flags\gm_flag_ge_co.paa";
A3E_VAR_Flag_Ind = "\gm\gm_core\data\flags\gm_flag_dk_co.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"gm_dk_army_rifleman_gvm95_90_m84",
	"gm_dk_army_rifleman_gvm95_90_m84",
	"gm_dk_army_squadleader_gvm95_p2a1_90_m84",
	"gm_dk_army_rifleman_gvm95_90_m84"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["gm_p1_blk","gm_8rnd_9x19mm_b_dm11_p1_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm_blk","gm_8rnd_9x18mm_b_pst_pm_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_p1_blk","gm_8rnd_9x19mm_b_dm11_p1_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm_blk","gm_8rnd_9x18mm_b_pst_pm_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_p1_blk","gm_8rnd_9x19mm_b_dm11_p1_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm_blk","gm_8rnd_9x18mm_b_pst_pm_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_mp2a1_blk", "gm_32rnd_9x19mm_b_dm51_mp2_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm63_blk", "gm_25Rnd_9x18mm_B_pst_pm63_blk"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"gm_ge_civ_u1300l"
	,"gm_ge_civ_u1300l"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_ff_typ1200"
	,"gm_ge_pol_typ1200"
	,"gm_ge_dbp_typ1200"
	,"gm_ge_pol_bicycle_01_grn"
	,"gm_ge_dbp_bicycle_01_ylw"];
	if(Param_UseDLCContact==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Tractor_01_F";
	};

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_ge_army_bicycle_01_oli"
		,"gm_ge_army_k125"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_kat1_454_cargo"
		,"gm_ge_army_u1300l_container"
		,"gm_ge_army_u1300l_medic"
		,"gm_ge_army_u1300l_repair"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_kat1_451_reammo"
		,"gm_ge_army_kat1_451_container"
		,"gm_ge_army_kat1_451_refuel"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_typ1200_cargo"
		,"gm_ge_army_gepard1a1"
		,"gm_ge_army_m113a1g_apc"
		,"gm_ge_army_m113a1g_apc_milan"
		,"gm_ge_army_m113a1g_command"
		,"gm_ge_army_m113a1g_medic"
		,"gm_ge_army_fuchsa0_command"
		,"gm_ge_army_fuchsa0_engineer"
		,"gm_ge_army_fuchsa0_reconnaissance"
		,"gm_ge_army_fuchsa0_reconnaissance"
		,"gm_ge_army_luchsa1"
		,"gm_ge_army_luchsa2"
		,"gm_ge_army_bpz2a0"
		,"gm_ge_army_Leopard1a1"
		,"gm_ge_army_Leopard1a1a1"
		,"gm_ge_army_Leopard1a1a2"
		,"gm_ge_army_Leopard1a3"
		,"gm_ge_army_Leopard1a3a1"
		,"gm_ge_army_Leopard1a5"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"gm_dk_army_m113a1dk_apc"
		,"gm_dk_army_m113a1dk_command"
		,"gm_dk_army_m113a1dk_engineer"
		,"gm_dk_army_m113a1dk_medic"
		,"gm_dk_army_m113a2dk"
		,"gm_dk_army_u1300l_container"
		,"gm_dk_army_u1300l_container"
		,"gm_dk_army_typ1200_cargo"
		,"gm_dk_army_typ1200_cargo"
		,"gm_dk_army_bpz2a0"
		,"gm_dk_army_Leopard1a3"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_ge_army_bicycle_01_oli"
		,"gm_ge_army_k125"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_kat1_454_cargo"
		,"gm_ge_army_u1300l_container"
		,"gm_ge_army_u1300l_medic"
		,"gm_ge_army_u1300l_repair"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_kat1_451_reammo"
		,"gm_ge_army_kat1_451_container"
		,"gm_ge_army_kat1_451_refuel"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_typ1200_cargo"
		,"gm_ge_army_gepard1a1"
		,"gm_ge_army_gepard1a1"
		,"gm_ge_army_m113a1g_apc"
		,"gm_ge_army_m113a1g_apc_milan"
		,"gm_ge_army_m113a1g_command"
		,"gm_ge_army_m113a1g_medic"
		,"gm_ge_army_fuchsa0_command"
		,"gm_ge_army_fuchsa0_engineer"
		,"gm_ge_army_fuchsa0_reconnaissance"
		,"gm_ge_army_fuchsa0_reconnaissance"
		,"gm_ge_army_luchsa1"
		,"gm_ge_army_luchsa2"
		,"gm_ge_army_bpz2a0"
		,"gm_ge_army_Leopard1a1"
		,"gm_ge_army_Leopard1a1a1"
		,"gm_ge_army_Leopard1a1a2"
		,"gm_ge_army_Leopard1a3"
		,"gm_ge_army_Leopard1a3a1"
		,"gm_ge_army_Leopard1a5"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"gm_dk_army_m113a1dk_apc"
		,"gm_dk_army_m113a1dk_command"
		,"gm_dk_army_m113a1dk_engineer"
		,"gm_dk_army_m113a1dk_medic"
		,"gm_dk_army_m113a2dk"
		,"gm_dk_army_u1300l_container"
		,"gm_dk_army_u1300l_container"
		,"gm_dk_army_typ1200_cargo"
		,"gm_dk_army_typ1200_cargo"
		,"gm_dk_army_bpz2a0"
		,"gm_dk_army_Leopard1a3"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_ge_army_bicycle_01_oli"
		,"gm_ge_army_k125"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_kat1_454_cargo"
		,"gm_ge_army_u1300l_container"
		,"gm_ge_army_u1300l_medic"
		,"gm_ge_army_u1300l_repair"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_kat1_451_reammo"
		,"gm_ge_army_kat1_451_container"
		,"gm_ge_army_kat1_451_refuel"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_typ1200_cargo"
		,"gm_ge_army_gepard1a1"
		,"gm_ge_army_gepard1a1"
		,"gm_ge_army_m113a1g_apc"
		,"gm_ge_army_m113a1g_apc_milan"
		,"gm_ge_army_m113a1g_command"
		,"gm_ge_army_m113a1g_medic"
		,"gm_ge_army_fuchsa0_command"
		,"gm_ge_army_fuchsa0_engineer"
		,"gm_ge_army_fuchsa0_reconnaissance"
		,"gm_ge_army_fuchsa0_reconnaissance"
		,"gm_ge_army_luchsa1"
		,"gm_ge_army_luchsa2"
		,"gm_ge_army_bpz2a0"
		,"gm_ge_army_Leopard1a1"
		,"gm_ge_army_Leopard1a1a1"
		,"gm_ge_army_Leopard1a1a2"
		,"gm_ge_army_Leopard1a3"
		,"gm_ge_army_Leopard1a3a1"
		,"gm_ge_army_Leopard1a5"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"gm_dk_army_m113a1dk_apc"
		,"gm_dk_army_m113a1dk_command"
		,"gm_dk_army_m113a1dk_engineer"
		,"gm_dk_army_m113a1dk_medic"
		,"gm_dk_army_m113a2dk"
		,"gm_dk_army_u1300l_container"
		,"gm_dk_army_u1300l_container"
		,"gm_dk_army_typ1200_cargo"
		,"gm_dk_army_typ1200_cargo"
		,"gm_dk_army_bpz2a0"
		,"gm_dk_army_Leopard1a3"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"gm_ge_army_engineer_g3a4_80_ols"
	,"gm_ge_army_engineer_g3a4_80_ols"
	,"gm_ge_army_engineer_g3a4_80_ols"
	,"gm_ge_army_medic_g3a3_80_ols"
	,"gm_ge_army_medic_g3a3_80_ols"
	,"gm_ge_army_medic_g3a3_80_ols"
	,"gm_ge_army_antitank_assistant_g3a3_pzf44_80_ols"
	,"gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols"
	,"gm_ge_army_machinegunner_assistant_g3a3_mg3_80_ols"
	,"gm_ge_army_antitank_assistant_g3a3_pzf84_80_ols"
	,"gm_ge_army_antitank_assistant_g3a3_pzf84_80_ols"
	,"gm_ge_army_antiair_g3a3_fim43_parka_80_ols"
	,"gm_ge_army_antiair_g3a3_fim43_parka_80_ols"
	,"gm_ge_army_marksman_g3a3_80_ols"
	,"gm_ge_army_marksman_g3a3_80_ols"
	,"gm_ge_army_marksman_g3a3_80_ols"
	,"gm_ge_army_antitank_g3a3_milan_80_ols"
	,"gm_ge_army_antitank_g3a3_milan_80_ols"
	,"gm_ge_army_demolition_g3a4_80_ols"
	,"gm_ge_army_demolition_g3a4_80_ols"
	,"gm_ge_army_rifleman_g3a3_80_ols"
	,"gm_ge_army_rifleman_g3a3_80_ols"
	,"gm_ge_army_rifleman_g3a3_80_ols"
	,"gm_ge_army_grenadier_g3a3_80_ols"
	,"gm_ge_army_grenadier_g3a3_80_ols"
	,"gm_ge_army_grenadier_g3a3_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf84_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf84_80_ols"
	,"gm_ge_army_machinegunner_mg3_80_ols"
	,"gm_ge_army_machinegunner_mg3_80_ols"
	,"gm_ge_army_machinegunner_mg3_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf44_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf44_80_ols"
	,"gm_ge_army_squadleader_g3a3_p2a1_80_ols"
	,"gm_ge_army_squadleader_g3a3_p2a1_80_ols"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"gm_dk_army_squadleader_gvm95_p2a1_90_m84"
	,"gm_dk_army_rifleman_gvm95_90_m84"
	,"gm_dk_army_rifleman_gvm95_90_m84"
	,"gm_dk_army_rifleman_gvm95_90_m84"
	,"gm_dk_army_rifleman_gvm95_90_m84"
	,"gm_dk_army_medic_gvm95_90_m84"
	,"gm_dk_army_medic_gvm95_90_m84"
	,"gm_dk_army_marksman_g3a3_90_m84"
	,"gm_dk_army_machinegunner_mg3_90_m84"
	,"gm_dk_army_machinegunner_assistant_gvm95_mg3_90_m84"
	,"gm_dk_army_antitank_gvm95_pzf84_90_m84"
	,"gm_dk_army_antitank_assistant_gvm95_pzf84_90_m84"
	,"gm_dk_army_antiair_gvm95_fim43_90_m84"
	,"gm_dk_army_demolition_gvm95_90_m84"];
a3e_arr_recon_InfantryTypes = [
	"gm_ge_army_sf_squadleader_mp5sd3_p2a1_80_wdl"
	,"gm_ge_army_sf_antiair_mp5a3_fim43_80_wdl"
	,"gm_ge_army_sf_antitank_mp5a3_milan_80_wdl"
	,"gm_ge_army_sf_demolition_mp5a2_80_wdl"
	,"gm_ge_army_sf_antitank_mp5a2_pzf84_80_wdl"
	,"gm_ge_army_sf_antitank_assistant_mp5a2_pzf84_80_wdl"
	,"gm_ge_army_sf_marksman_g3a3_80_wdl"
	,"gm_ge_army_sf_rifleman_g3a4_80_wdl"
	,"gm_ge_army_sf_rifleman_mp5a3_80_wdl"];
a3e_arr_recon_I_InfantryTypes = [
	"gm_dk_army_sf_squadleader_mp5a3_p2a1_84_m84"
	,"gm_dk_army_sf_demolition_mp5a3_84_m84"
	,"gm_dk_army_sf_antitank_mp5a3_pzf84_84_m84"
	,"gm_dk_army_sf_antitank_assistant_mp5a3_pzf84_84_m84"
	,"gm_dk_army_sf_antiair_mp5a3_fim43_84_m84"
	,"gm_dk_army_sf_rifleman_mp5a3_84_m84"
	,"gm_dk_army_sf_marksman_g3a3_84_m84"
	,"gm_dk_army_sf_rifleman_g3a4_84_m84"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"gm_ge_army_iltis_milan"
	,"gm_ge_army_iltis_mg3"
	,"gm_ge_army_fuchsa0_reconnaissance"
	,"gm_ge_army_luchsa1"
	,"gm_ge_army_m113a1g_apc"
	,"gm_ge_army_m113a1g_apc_milan"
	,"gm_ge_army_milan_launcher_tripod"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"gm_dk_army_m113a1dk_apc"
	,"gm_dk_army_m113a2dk"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"gm_ge_army_iltis_cargo"
	,"gm_ge_army_u1300l_cargo"
	,"gm_ge_army_kat1_451_cargo"
	,"gm_ge_army_kat1_454_cargo"
	,"gm_ge_army_fuchsa0_command"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"gm_dk_army_typ1200_cargo"
	,"gm_dk_army_m113a1dk_command"];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"gm_ge_army_fuchsa0_reconnaissance"
	,"gm_ge_army_luchsa1"
	,"gm_ge_army_luchsa2"
	,"gm_ge_army_m113a1g_apc_milan"
	,"gm_ge_army_iltis_milan"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"gm_ge_army_m113a1g_apc"
	,"gm_ge_army_m113a1g_apc_milan"
	,"gm_ge_army_luchsa1"
	,"gm_ge_army_luchsa2"
	,"gm_ge_army_fuchsa0_reconnaissance"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"gm_ge_army_gepard1a1"
	,"gm_ge_army_Leopard1a1a1"
	,"gm_ge_army_Leopard1a3"
	,"gm_ge_army_Leopard1a5"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"gm_ge_army_mg3_aatripod"
	,"gm_ge_army_mg3_aatripod"
	,"gm_ge_army_milan_launcher_tripod"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"gm_ge_army_k125"
	,"gm_ge_army_iltis_cargo"
	,"gm_ge_army_iltis_milan"
	,"gm_ge_army_iltis_mg3"
	,"gm_ge_army_u1300l_container"
	,"gm_ge_army_u1300l_medic"
	,"gm_ge_army_u1300l_repair"
	,"gm_ge_army_m113a1g_apc_milan"
	,"gm_ge_army_m113a1g_medic"
	,"gm_ge_army_kat1_451_cargo"
	,"gm_ge_army_kat1_451_refuel"
	,"gm_ge_army_fuchsa0_reconnaissance"
	,"gm_ge_army_luchsa1"
	,"gm_ge_army_bpz2a0"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"gm_ge_civ_u1300l"
	,"gm_ge_civ_u1300l"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_ff_typ1200"
	,"gm_ge_pol_typ1200"
	,"gm_ge_dbp_typ1200"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"gm_ge_army_mg3_aatripod"
	,"gm_ge_army_mg3_aatripod"
	,"B_G_HMG_02_high_F"
	,"gm_ge_army_milan_launcher_tripod"
	,"B_T_Static_AA_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"gm_dk_army_typ1200_cargo"
	,"gm_dk_army_u1300l_container"
	,"gm_ge_army_k125"
	,"gm_ge_army_iltis_cargo"
	,"gm_ge_army_iltis_milan"
	,"gm_ge_army_iltis_mg3"
	,"gm_ge_army_kat1_454_cargo"
	,"gm_ge_army_u1300l_container"
	,"gm_ge_army_u1300l_medic"
	,"gm_ge_army_u1300l_repair"
	,"gm_ge_army_u1300l_cargo"
	,"gm_ge_army_kat1_451_reammo"
	,"gm_ge_army_kat1_451_container"
	,"gm_ge_army_kat1_451_refuel"
	,"gm_ge_army_kat1_451_cargo"
	,"gm_ge_army_typ1200_cargo"
	,"gm_ge_army_m113a1g_medic"
	,"gm_ge_army_m113a1g_command"
	,"gm_ge_army_m113a1g_apc"
	,"gm_ge_army_bicycle_01_oli"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"gm_ge_army_bo105p_pah1a1"];
	//"CUP_B_UH1D_gunship_GER_KSK"];
	//"O_Heli_Attack_02_black_F"
	//,"O_T_VTOL_02_infantry_F"];
a3e_arr_O_transport_heli = [
	"gm_ge_army_ch53g"
	,"gm_ge_army_ch53gs"
	,"gm_ge_army_bo105p1m_vbh_swooper"];
	//"CUP_B_UH1D_GER_KSK"];
	//"O_Heli_Light_02_unarmed_F"];
a3e_arr_O_pilots = [
	"gm_ge_army_pilot_p1_80_oli"];
a3e_arr_I_transport_heli = [
	"gm_ge_bgs_bo105_vbh"];
	//"CUP_B_UH1D_GER_KSK"];
a3e_arr_I_pilots = [
	"gm_ge_bgs_pilot_p1_80_grn"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_p1_blk", 50, 4, 8, ["gm_8rnd_9x19mm_b_dm51_p1_blk"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_mp2a1_blk", 50, 4, 8, ["gm_32rnd_9x19mm_b_dm51_mp2_blk"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_g3a3_oli", 100, 2, 4, ["gm_20rnd_762x51mm_b_t_dm21a1_g3_blk"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_mg3_blk", 50, 2, 4, ["gm_120rnd_762x51mm_b_t_dm21_mg3_grn"], 3];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_g3a4_oli", 50, 2, 4, ["gm_20rnd_762x51mm_b_t_dm21a2_g3_blk"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_g3a3_oli", 50, 2, 4, ["gm_20rnd_762x51mm_b_t_dm21a1_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_m16a1_blk", 50, 1, 3, ["gm_20Rnd_556x45mm_b_M855_stanag_gry"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_m16a2_blk", 40, 1, 3, ["gm_30Rnd_556x45mm_b_M855_stanag_gry"], 6];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_g3a3_oli_feroz24", 50, 2, 4, ["gm_20Rnd_762x51mm_b_DM41_g3_blk"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_p2a1_blk", 50, 2, 4, ["gm_1Rnd_265mm_flare_multi_red_gc", "gm_1Rnd_265mm_flare_para_yel_DM16"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_p2a1_launcher_blk", 5, 1, 2, ["gm_1Rnd_2650mm_potato_dm11"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_mp5a2_blk", 40, 2, 4, ["gm_30Rnd_9x19mm_B_DM51_mp5_blk", "gm_30Rnd_9x19mm_B_DM11_mp5_blk"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_mp5a3_blk", 30, 2, 4, ["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_mp5sd2_blk", 20, 2, 4, ["gm_30Rnd_9x19mm_B_DM51_mp5_blk", "gm_30Rnd_9x19mm_B_DM11_mp5_blk"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_mp5sd3_blk", 10, 2, 4, ["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk"], 5];
// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_c7a1_oli", 40, 2, 4, ["gm_20Rnd_556x45mm_b_t_M856_stanag_gry"], 6];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["gm_pzf44_2_oli", 50, 3, 5, ["gm_1rnd_44x537mm_heat_dm32_pzf44_2"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["gm_pzf84_oli", 50, 1, 2, ["gm_1rnd_84x245mm_heat_t_dm12a1_carlgustaf"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["gm_pzf84_oli", 50, 1, 2, ["gm_1rnd_84x245mm_heat_t_dm22_carlgustaf", "gm_1rnd_84x245mm_illum_dm16_carlgustaf"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["gm_fim43_oli", 50, 1, 2, ["gm_1Rnd_70mm_he_m585_fim43"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["gm_rpg7_prp", 20, 1, 2, ["gm_1rnd_40mm_heat_pg7v_rpg7"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["gm_rpg7_prp", 10, 1, 2, ["gm_1Rnd_40mm_heat_pg7vl_rpg7"], 2];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["gm_explosive_petn_charge"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["gm_mine_ap_dm31"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["gm_mine_at_dm21"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_handgrenade_frag_dm51", "gm_handgrenade_frag_dm51a1"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_1rnd_67mm_heat_dm22a1_g3"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_smokeshell_grn_dm21", "gm_smokeshell_red_dm23", "gm_smokeshell_yel_dm26", "gm_smokeshell_org_dm32", "gm_smokeshell_wht_dm25"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["gm_handgrenade_conc_dm51"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_1Rnd_265mm_flare_para_yel_DM16", "gm_1Rnd_265mm_flare_single_wht_DM15", "gm_1Rnd_265mm_flare_single_red_DM13", "gm_1Rnd_265mm_flare_single_grn_DM11", "gm_1Rnd_265mm_flare_single_yel_DM10"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["gm_1Rnd_265mm_flare_multi_wht_DM25", "gm_1Rnd_265mm_flare_multi_red_DM23", "gm_1Rnd_265mm_flare_multi_grn_DM21", "gm_1Rnd_265mm_flare_multi_yel_DM20"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["gm_1Rnd_265mm_smoke_single_yel_DM19", "gm_1Rnd_265mm_smoke_single_org_DM22", "gm_1Rnd_265mm_smoke_single_vlt_DM24"], 5];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_repairkit_01", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_army_medkit_80", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_army_gauzeBandage", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_facewear_m65", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["gm_ge_army_backpack_80_oli"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
//a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02_ghex_F", 10, 1, 2];
/*if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["O_NVGoggles_ghex_F", 10, 1, 3];
};*/
a3e_arr_AmmoDepotItems pushback ["gm_ferod16_oli", 50, 2, 3, [], 0];
//a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_ge_army_conat2", 50, 1, 3];
//a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["gm_watch_kosei_80", 50, 1, 10];
//a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
//a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 2]; //G3
a3e_arr_AmmoDepotItems pushback ["gm_feroz24_blk", 30, 1, 2]; //G3
a3e_arr_AmmoDepotItems pushback ["gm_c79a1_blk", 10, 1, 2]; //C7
a3e_arr_AmmoDepotItems pushback ["gm_pso1_gry", 20, 1, 3]; //SVD
a3e_arr_AmmoDepotItems pushback ["gm_zfk4x25_blk", 20, 1, 3]; //AK
a3e_arr_AmmoDepotItems pushback ["gm_feroz2x17_pzf44_2_blk", 25, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_feroz2x17_pzf84_blk", 25, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_pgo7v_blk", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_suppressor_safloryt_blk", 10, 1, 2]; //PM63
a3e_arr_AmmoDepotItems pushback ["gm_zvn64_front", 50, 1, 3]; //AKs
a3e_arr_AmmoDepotItems pushback ["gm_zvn64_rear_ak", 50, 1, 3]; //AKs
/*if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["optic_tws", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_tws_mg", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["optic_NVS", 10, 1, 2];
	a3e_arr_AmmoDepotItems pushback ["optic_Nightstalker", 10, 1, 1];
};*/


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["gm_p1_blk", "gm_8rnd_9x19mm_b_dm11_p1_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_p1_blk", "gm_8rnd_9x19mm_b_dm51_p1_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_p2a1_blk", "gm_1Rnd_265mm_flare_multi_red_gc", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_p2a1_blk", "gm_1Rnd_265mm_flare_para_yel_DM16", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_p2a1_blk", "gm_1Rnd_265mm_flare_multi_nbc_DM47", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_m16a1_blk", "gm_20Rnd_556x45mm_b_M855_stanag_gry", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_mp2a1_blk", "gm_32rnd_9x19mm_b_dm11_mp2_blk", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_rpg7_prp", "gm_1rnd_40mm_heat_pg7v_rpg7", 2];
a3e_arr_CivilianCarWeapons pushback ["gm_pm63_blk", "gm_15Rnd_9x18mm_B_pst_pm63_blk", 7];
a3e_arr_CivilianCarWeapons pushback ["gm_pm63_blk", "gm_25Rnd_9x18mm_B_pst_pm63_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_mp5a2_blk", "gm_30Rnd_9x19mm_B_DM11_mp5_blk", 8];
//a3e_arr_CivilianCarWeapons pushback ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5];
//a3e_arr_CivilianCarWeapons pushback ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12];
//a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
//a3e_arr_CivilianCarWeapons pushback ["launch_RPG32_F", "RPG32_F", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["gm_ge_army_medkit_80", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["gm_repairkit_01", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["gm_ferod16_oli", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "gm_explosive_petn_charge", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "gm_handgrenade_frag_dm51", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "gm_smokeshell_wht_dm25", 5];

// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"gm_feroz24_blk"
	,"gm_c79a1_blk"];
//	"optic_Aco"
//	"optic_ACO_grn"
//	,"optic_Arco"
//	,"optic_Hamr"
//	,"optic_MRCO"
//	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"gm_feroz24_blk"
	,"gm_c79a1_blk"];
a3e_arr_NightScopes = [];
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
	"land"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"gm_gc_airforce_mi2p"
	,"gm_gc_airforce_mi2sr"
	,"gm_gc_airforce_mi2t"
	];
a3e_arr_extraction_chopper_escort = [
	"gm_gc_airforce_mi2us"
	,"gm_gc_airforce_mi2urn"
	];

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
	"gm_gc_army_ural4320_cargo",	//
	"gm_gc_army_btr60pa",	//
	"gm_gc_army_btr60pb",	//
	"gm_gc_army_bmp1sp2"];	//
a3e_arr_extraction_car_escort = [
	"gm_gc_army_zsu234v1",
	"gm_gc_army_pt76b",
	"gm_gc_army_t55ak",
	"gm_gc_army_t55am2b"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"gm_ge_airforce_do28d2_n84"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"gm_ge_army_bo105p1m_vbh"];
	//"CUP_B_UH1D_GER_KSK"];
a3e_arr_searchChopperHard = [
	"gm_ge_army_bo105p_pah1a1"];
	//"CUP_B_UH1D_gunship_GER_KSK"];
a3e_arr_searchChopper_pilot = [
	"gm_ge_bgs_pilot_p1_80_grn"];
a3e_arr_searchChopper_crew = [
	"gm_ge_bgs_pilot_p1_80_grn"];

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
	"B_T_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "gm_AmmoBox_1000Rnd_762x51mm_b_DM41_g3";
a3e_additional_weapon_box_2 = "gm_AmmoBox_4Rnd_44x537mm_heat_DM32_pzf44_2";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"B_T_Mortar_01_F"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"B_Plane_CAS_01_dynamicLoadout_F"
	,"I_Plane_Fighter_03_CAS_F"
	,"B_Plane_Fighter_01_Cluster_F"
	,"B_Plane_CAS_01_Cluster_F"
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
	"gm_gc_army_crew_mpiaks74nk_80_blk"
	,"gm_gc_army_crew_mpiaks74nk_80_blk"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_HMMWV_F"
	,"Land_Wreck_Hunter_F"
	,"Land_Wreck_Slammer_F"
	,"Land_Wreck_AFV_Wheeled_01_F"];
a3e_arr_CrashSiteCrewCar = [
	"gm_gc_army_crew_mpiaks74nk_80_blk"
	,"gm_gc_bgs_rifleman_mpikm72_80_str"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["gm_rpg7_prp", 20, 1, 2, ["gm_1rnd_40mm_heat_pg7v_rpg7"], 3];
a3e_arr_CrashSiteWeapons pushback ["gm_rpg7_prp", 10, 1, 2, ["gm_1Rnd_40mm_heat_pg7vl_rpg7"], 2];
a3e_arr_CrashSiteWeapons pushback ["gm_svd_wud", 10, 1, 2, ["gm_10Rnd_762x54mmR_api_7bz3_svd_blk"], 2];
a3e_arr_CrashSiteWeapons pushback ["gm_svd_wud", 10, 1, 2, ["gm_10Rnd_762x54mmR_b_t_7t2_svd_blk"], 8];
a3e_arr_CrashSiteWeapons pushback ["gm_mpikms72_brn", 50, 2, 4, ["gm_30rnd_762x39mm_b_t_m43_ak47_blk"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_akm_wud", 75, 2, 4, ["gm_30rnd_762x39mm_b_t_m43_ak47_blk"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_hmgpkm_prp", 30, 1, 2, ["gm_100rnd_762x54mm_b_t_t46_pk_grn"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_lmgrpk74n_prp", 30, 1, 2, ["gm_45rnd_545x39mm_b_t_7t3_ak74_prp"], 8];
a3e_arr_CrashSiteWeapons pushback ["gm_lp1_blk", 50, 1, 2, ["gm_1Rnd_265mm_flare_multi_nbc_DM47","gm_1Rnd_265mm_flare_single_grn_gc"], 8];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["gm_pso1_gry", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zfk4x25_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_pgo7v_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zvn64_front", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zvn64_rear_ak", 50, 1, 3];