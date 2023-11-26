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

A3E_Var_AllowVanillaNightVision = false;

A3E_MapItemsUsedInMission = ["ItemMap"]; //MapItems that should be removed from guards and are allowed to be carried randomly by patrols
A3E_ItemsToBeRemoved = ["gm_ge_army_conat2","gm_ferod51_oli"]; //Items to randomly remove from units and to remove from guards

//////////////////////////////////////////////////////////////////
// fn_createStartPos.sqf
// Array of templates to use for prisons
//////////////////////////////////////////////////////////////////
A3E_PrisonTemplates = [
	"a3e_fnc_BuildPrison1"
	,"a3e_fnc_BuildPrison2"
	,"a3e_fnc_BuildPrison3"
	,"a3e_fnc_BuildPrison4"
	,"a3e_fnc_BuildPrison5"
	];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"gm_xx_army_machinegunner_rpk_80_oli",
	"gm_xx_army_rifleman_01_akm_alp",
	"gm_xx_army_assault_ak74nk_80_wdl",
	"gm_xx_army_squadleader_m16a1_80_grn",
	"gm_xx_army_squadleader_m16a1_80_grn"];
	
// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"gm_pl_army_backpack_80_oli"
	,"gm_gc_army_backpack_80_assaultpack_empty_str"];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["gm_p1_blk","gm_8rnd_9x19mm_b_dm11_p1_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm_blk","gm_8rnd_9x18mm_b_pst_pm_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_p1_blk","gm_8rnd_9x19mm_b_dm11_p1_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm_blk","gm_8rnd_9x18mm_b_pst_pm_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_p1sd_blk","gm_8Rnd_9x19mm_B_DM11_p1_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_m49_blk","gm_8Rnd_9x19mm_B_DM11_p210_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_p210_blk","gm_8Rnd_9x19mm_B_DM11_p210_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pim_blk","gm_8Rnd_9x18mm_B_pst_pm_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_mp2a1_blk", "gm_32rnd_9x19mm_b_dm51_mp2_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm63_handgun_blk", "gm_15Rnd_9x18mm_B_pst_pm63_blk"];
a3e_arr_PrisonBackpackWeapons pushback ["gm_pm63_blk", "gm_25Rnd_9x18mm_B_pst_pm63_blk"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"gm_ge_civ_u1300l"
	,"gm_ge_civ_u1300l"
	,"gm_ge_ff_u1300l_firefighter"
	,"gm_ge_ff_u1300l_medic"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_ff_typ1200"
	,"gm_ge_pol_typ1200"
	,"gm_ge_dbp_typ1200"
	,"gm_ge_civ_typ247"
	,"gm_ge_civ_typ247"
	,"gm_ge_civ_typ247"
	,"gm_ge_ff_typ247"
	,"gm_ge_ff_typ247_firefighter"
	,"gm_ge_dbp_typ247"
	,"gm_ge_civ_typ251"
	,"gm_ge_civ_typ251"
	,"gm_ge_dbp_typ251"
	,"gm_ge_civ_typ253"
	,"gm_ge_civ_typ253"
	,"gm_ge_civ_typ253"
	,"gm_ge_civ_typ253"
	,"gm_ge_ff_typ253"
	,"gm_ge_pol_typ253"
	,"gm_ge_taxi_typ253"
	,"gm_ge_taxi_typ253"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_ff_w123"
	,"gm_ge_pol_w123"
	,"gm_ge_dbp_w123"
	,"gm_ge_taxi_w123"
	,"gm_ge_taxi_w123"
	,"gm_ge_taxi_w123"
	,"gm_ge_pol_bicycle_01_grn"
	,"gm_ge_dbp_bicycle_01_ylw"];
	if(A3E_Param_UseDLCContact==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Tractor_01_F";
	};

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_ge_army_bicycle_01_oli"
		,"gm_ge_army_k125"
		,"gm_ge_army_w123_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_typ247_firefighter"
		,"gm_ge_army_typ247_cargo"
		,"gm_ge_army_typ253_cargo"
		,"gm_ge_army_typ253_mp"
		,"gm_ge_army_u1300l_container"
		,"gm_ge_army_u1300l_medic"
		,"gm_ge_army_u1300l_repair"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_firefighter"
		,"gm_ge_army_kat1_451_reammo"
		,"gm_ge_army_kat1_451_container"
		,"gm_ge_army_kat1_451_refuel"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_452_container"
		,"gm_ge_army_kat1_454_cargo"
		,"gm_ge_army_kat1_454_reammo"
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
		,"gm_ge_army_bibera0"
		,"gm_ge_army_kat1_463_mlrs"
		,"gm_ge_army_m109g"
		,"gm_ge_army_marder1a1a"
		,"gm_ge_army_marder1a1plus"
		,"gm_ge_army_marder1a2"
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
		,"gm_dk_army_typ247_cargo"
		,"gm_dk_army_typ253_cargo"
		,"gm_dk_army_typ253_mp"
		,"gm_dk_army_bpz2a0"
		,"gm_dk_army_bibera0"
		,"gm_dk_army_m109"
		,"gm_dk_army_Leopard1a3"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_ge_army_bicycle_01_oli"
		,"gm_ge_army_k125"
		,"gm_ge_army_w123_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_typ247_firefighter"
		,"gm_ge_army_typ247_cargo"
		,"gm_ge_army_typ253_cargo"
		,"gm_ge_army_typ253_mp"
		,"gm_ge_army_u1300l_container"
		,"gm_ge_army_u1300l_medic"
		,"gm_ge_army_u1300l_repair"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_firefighter"
		,"gm_ge_army_kat1_451_reammo"
		,"gm_ge_army_kat1_451_container"
		,"gm_ge_army_kat1_451_refuel"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_452_container"
		,"gm_ge_army_kat1_454_cargo"
		,"gm_ge_army_kat1_454_reammo"
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
		,"gm_ge_army_bibera0"
		,"gm_ge_army_kat1_463_mlrs"
		,"gm_ge_army_m109g"
		,"gm_ge_army_marder1a1a"
		,"gm_ge_army_marder1a1plus"
		,"gm_ge_army_marder1a2"
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
		,"gm_dk_army_typ247_cargo"
		,"gm_dk_army_typ253_cargo"
		,"gm_dk_army_typ253_mp"
		,"gm_dk_army_bpz2a0"
		,"gm_dk_army_bibera0"
		,"gm_dk_army_m109"
		,"gm_dk_army_Leopard1a3"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_ge_army_bicycle_01_oli"
		,"gm_ge_army_k125"
		,"gm_ge_army_w123_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_cargo"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_milan"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_iltis_mg3"
		,"gm_ge_army_typ247_firefighter"
		,"gm_ge_army_typ247_cargo"
		,"gm_ge_army_typ253_cargo"
		,"gm_ge_army_typ253_mp"
		,"gm_ge_army_u1300l_container"
		,"gm_ge_army_u1300l_medic"
		,"gm_ge_army_u1300l_repair"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_cargo"
		,"gm_ge_army_u1300l_firefighter"
		,"gm_ge_army_kat1_451_reammo"
		,"gm_ge_army_kat1_451_container"
		,"gm_ge_army_kat1_451_refuel"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_451_cargo"
		,"gm_ge_army_kat1_452_container"
		,"gm_ge_army_kat1_454_cargo"
		,"gm_ge_army_kat1_454_reammo"
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
		,"gm_ge_army_bibera0"
		,"gm_ge_army_kat1_463_mlrs"
		,"gm_ge_army_m109g"
		,"gm_ge_army_marder1a1a"
		,"gm_ge_army_marder1a1plus"
		,"gm_ge_army_marder1a2"
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
		,"gm_dk_army_typ247_cargo"
		,"gm_dk_army_typ253_cargo"
		,"gm_dk_army_typ253_mp"
		,"gm_dk_army_bpz2a0"
		,"gm_dk_army_bibera0"
		,"gm_dk_army_m109"
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
	,"gm_ge_army_grenadier_hk69a1_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf84_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf84_80_ols"
	,"gm_ge_army_machinegunner_mg3_80_ols"
	,"gm_ge_army_machinegunner_mg3_80_ols"
	,"gm_ge_army_machinegunner_mg3_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf44_80_ols"
	,"gm_ge_army_antitank_g3a3_pzf44_80_ols"
	,"gm_ge_army_radioman_g3a3_80_ols"
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
	,"gm_dk_army_demolition_gvm95_90_m84"
	,"gm_dk_army_radioman_gvm95_90_m84"
	,"gm_dk_army_antitank_gvm95_m72a3_90_m84"];
a3e_arr_recon_InfantryTypes = [
	"gm_ge_army_sf_squadleader_mp5sd3_p2a1_80_wdl"
	,"gm_ge_army_sf_antiair_mp5a3_fim43_80_wdl"
	,"gm_ge_army_sf_antitank_mp5a3_milan_80_wdl"
	,"gm_ge_army_sf_demolition_mp5a2_80_wdl"
	,"gm_ge_army_sf_antitank_mp5a2_pzf84_80_wdl"
	,"gm_ge_army_sf_antitank_assistant_mp5a2_pzf84_80_wdl"
	,"gm_ge_army_sf_marksman_g3a3_80_wdl"
	,"gm_ge_army_sf_rifleman_g3a4_80_wdl"
	,"gm_ge_army_sf_rifleman_mp5a3_80_wdl"
	,"gm_ge_army_sf_radioman_mp5a3_80_wdl"
	,"gm_ge_army_sf_machinegunner_g8a2_80_wdl"
	,"gm_ge_army_sf_grenadier_hk69a1_80_wdl"];
a3e_arr_recon_I_InfantryTypes = [
	"gm_dk_army_sf_squadleader_mp5a3_p2a1_84_m84"	//80s
	,"gm_dk_army_sf_demolition_mp5a3_84_m84"
	,"gm_dk_army_sf_antitank_mp5a3_pzf84_84_m84"
	,"gm_dk_army_sf_antitank_assistant_mp5a3_pzf84_84_m84"
	,"gm_dk_army_sf_antiair_mp5a3_fim43_84_m84"
	,"gm_dk_army_sf_rifleman_mp5a3_84_m84"
	,"gm_dk_army_sf_marksman_g3a3_84_m84"
	,"gm_dk_army_sf_rifleman_g3a4_84_m84"
	,"gm_dk_army_sf_radioman_g3a4_84_m84"
	,"gm_dk_army_sf_antitank_mp5a3_m72a3_84_m84"
	,"gm_dk_army_sf_machinegunner_mg8_84_m84"
	,"gm_dk_army_sf_antiair_mpm85_fim43_90_m84"	//90s
	,"gm_dk_army_sf_antitank_mpm85_m72a3_90_m84"
	,"gm_dk_army_sf_demolition_mpm85_90_m84"
	,"gm_dk_army_sf_antitank_mpm85_pzf84_90_m84"
	,"gm_dk_army_sf_antitank_assistant_mpm85_pzf84_90_m84"
	,"gm_dk_army_sf_machinegunner_mg8_90_m84"
	,"gm_dk_army_sf_marksman_msg90a1_90_m84"
	,"gm_dk_army_sf_radioman_mpm85_90_m84"
	,"gm_dk_army_sf_rifleman_mpm85_90_m84"
	,"gm_dk_army_sf_squadleader_mpm85_p2a1_90_m84"];

a3e_units_civilian_InfantryTypes = [
	"gm_gc_civ_man_02_80_gry"
	,"gm_gc_civ_man_01_80_blk"
	,"gm_gc_civ_man_01_80_blu"
	,"gm_gc_civ_man_03_80_blu"
	,"gm_gc_civ_man_02_80_brn"
	,"gm_gc_civ_man_03_80_grn"
	,"gm_gc_civ_man_03_80_gry"
	,"gm_gc_civ_man_04_80_blu"
	,"gm_gc_civ_man_04_80_gry"
//	,"gm_gc_pol_officer_80_blu"		//police east
//	,"gm_ge_pol_officer_80_grn"		//police west
//	,"gm_ge_pol_patrol_80_blk"		//police west
//	,"gm_ge_ff_man_80_orn"		//firefighter west
//	,"gm_ge_dbp_man_01_80_blu"		//postman west
	];

//////////////////////////////////////////////////////////////////
// fn_RoadBlocks.sqf
// Array of templates to use for roadblocks
//////////////////////////////////////////////////////////////////
A3E_RoadblockTemplates = [
	"rb_gm_rb1"
	,"rb_gm_rb2"
	,"rb_gm_rb3"
	,"rb_gm_rb4"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"gm_ge_army_iltis_milan"
	,"gm_ge_army_iltis_mg3"
	,"gm_ge_army_fuchsa0_reconnaissance"
	,"gm_ge_army_luchsa1"
	,"gm_ge_army_marder1a1a"
	,"gm_ge_army_m113a1g_apc"
	,"gm_ge_army_m113a1g_apc_milan"
	,"gm_ge_army_milan_launcher_tripod"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"gm_dk_army_m113a1dk_apc"
	,"gm_dk_army_m113a2dk"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"gm_ge_army_iltis_cargo"
	,"gm_ge_army_w123_cargo"
	,"gm_ge_army_typ247_cargo"
	,"gm_ge_army_typ253_cargo"
	,"gm_ge_army_u1300l_cargo"
	,"gm_ge_army_kat1_451_cargo"
	,"gm_ge_army_kat1_454_cargo"
	,"gm_ge_army_fuchsa0_command"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"gm_dk_army_typ1200_cargo"
	,"gm_dk_army_typ247_cargo"
	,"gm_dk_army_typ253_cargo"
	,"gm_dk_army_typ253_mp"
	,"gm_dk_army_m113a1dk_command"];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"gm_ge_army_fuchsa0_reconnaissance"
	,"gm_ge_army_luchsa1"
	,"gm_ge_army_luchsa2"
	,"gm_ge_army_marder1a1a"
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
	,"gm_ge_army_marder1a2"
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
	,"gm_ge_army_w123_cargo"
	,"gm_ge_army_iltis_cargo"
	,"gm_ge_army_iltis_milan"
	,"gm_ge_army_iltis_mg3"
	,"gm_ge_army_typ247_cargo"
	,"gm_ge_army_typ253_cargo"
	,"gm_ge_army_u1300l_container"
	,"gm_ge_army_u1300l_medic"
	,"gm_ge_army_u1300l_repair"
	,"gm_ge_army_u1300l_firefighter"
	,"gm_ge_army_m113a1g_apc_milan"
	,"gm_ge_army_m113a1g_medic"
	,"gm_ge_army_kat1_451_cargo"
	,"gm_ge_army_kat1_451_refuel"
	,"gm_ge_army_kat1_454_reammo"
	,"gm_ge_army_fuchsa0_reconnaissance"
	,"gm_ge_army_luchsa1"
	,"gm_ge_army_bpz2a0"
	,"gm_ge_army_bibera0"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"gm_ge_civ_u1300l"
	,"gm_ge_civ_u1300l"
	,"gm_ge_ff_u1300l_firefighter"
	,"gm_ge_ff_u1300l_medic"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_civ_typ1200"
	,"gm_ge_ff_typ1200"
	,"gm_ge_pol_typ1200"
	,"gm_ge_dbp_typ1200"
	,"gm_ge_civ_typ247"
	,"gm_ge_civ_typ247"
	,"gm_ge_civ_typ247"
	,"gm_ge_ff_typ247"
	,"gm_ge_ff_typ247_firefighter"
	,"gm_ge_dbp_typ247"
	,"gm_ge_civ_typ251"
	,"gm_ge_civ_typ251"
	,"gm_ge_dbp_typ251"
	,"gm_ge_civ_typ253"
	,"gm_ge_civ_typ253"
	,"gm_ge_civ_typ253"
	,"gm_ge_civ_typ253"
	,"gm_ge_ff_typ253"
	,"gm_ge_pol_typ253"
	,"gm_ge_taxi_typ253"
	,"gm_ge_taxi_typ253"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_civ_w123"
	,"gm_ge_ff_w123"
	,"gm_ge_pol_w123"
	,"gm_ge_dbp_w123"
	,"gm_ge_taxi_w123"
	,"gm_ge_taxi_w123"
	,"gm_ge_taxi_w123"];

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
	,"gm_ge_army_w123_cargo"
	,"gm_ge_army_iltis_cargo"
	,"gm_ge_army_iltis_milan"
	,"gm_ge_army_iltis_mg3"
	,"gm_ge_army_typ247_cargo"
	,"gm_ge_army_typ253_cargo"
	,"gm_ge_army_kat1_454_cargo"
	,"gm_ge_army_u1300l_container"
	,"gm_ge_army_u1300l_medic"
	,"gm_ge_army_u1300l_repair"
	,"gm_ge_army_u1300l_cargo"
	,"gm_ge_army_u1300l_firefighter"
	,"gm_ge_army_kat1_451_reammo"
	,"gm_ge_army_kat1_451_container"
	,"gm_ge_army_kat1_451_refuel"
	,"gm_ge_army_kat1_451_cargo"
	,"gm_ge_army_kat1_454_reammo"
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

//Ammo Depot Crates
// classnames to be used for the crates that are placed at an ammo depot
a3e_arr_AmmoDepotCrate_Basic = ["gm_ge_army_ammobox_smallarms_80"];
a3e_arr_AmmoDepotCrate_Special = ["gm_ammobox_pile_small_03_empty"];
a3e_arr_AmmoDepotCrate_Launchers = ["gm_AmmoBox_wood_03_empty"];
a3e_arr_AmmoDepotCrate_Ordnance = ["gm_AmmoBox_6Rnd_mine_ap_dm31_put"];
a3e_arr_AmmoDepotCrate_Vehicle = ["gm_ammobox_aluminium_01_empty","gm_ammobox_aluminium_03_empty","gm_ammobox_aluminium_02_empty"];
a3e_arr_AmmoDepotCrate_Items = ["gm_ammobox_aluminium_04_empty","gm_ammobox_aluminium_05_empty"];
a3e_arr_AmmoDepotCrate_Random = ["gm_ge_army_ammobox_everything_80"];
a3e_arr_AmmoDepotCrate_RandomInf = ["gm_ge_army_ammobox_cache_80"];
a3e_arr_AmmoDepotCrate_Car = ["gm_ammobox_aluminium_07_empty"];
a3e_arr_AmmoDepotCrate_CrashSite = ["gm_AmmoBox_wood_04_empty"];
a3e_arr_AmmoDepotCrate_Extra1 = ["gm_ge_army_ammobox_allmagazines_80"];
a3e_arr_AmmoDepotCrate_Extra2 = ["gm_ge_army_ammobox_allmagazines_80"];

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
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_m16a1_blk", 50, 1, 3, ["gm_20Rnd_556x45mm_B_M193_stanag_gry"], 6];
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
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_g36a1_blk", 10, 2, 4, ["gm_30Rnd_556x45mm_B_DM11_g36_blk"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_g8a1_blk", 10, 2, 4, ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], 7];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_g8a2_blk", 10, 2, 4, ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_40Rnd_762x51mm_B_T_DM21_g3_blk"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_mg8a2_blk", 10, 2, 4, ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_msg90_blk", 10, 2, 4, ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_hk33a2_blk", 10, 2, 4, ["gm_30Rnd_556x45mm_B_DM11_hk33_blk"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_hk53a3_blk", 10, 2, 4, ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_40Rnd_556x45mm_B_DM11_hk33_blk"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_g11k2_blk", 10, 2, 4, ["gm_50Rnd_473x33mm_B_DM11_g11_blk"], 8];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_hk69a1_blk", 10, 2, 4, ["1Rnd_HE_Grenade_shell", "UGL_FlareWhite_F","1Rnd_Smoke_Grenade_shell"], 5];
// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_c7a1_oli", 40, 2, 4, ["gm_20Rnd_556x45mm_b_t_M856_stanag_gry"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_sg542_oli", 10, 2, 4, ["gm_20Rnd_762x51mm_B_T_DM21A1_sg542_blk"], 10];

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
a3e_arr_AmmoDepotLaunchers pushback ["gm_m72a3_oli", 10, 1, 2, ["gm_1Rnd_66mm_heat_m72a3"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["gm_rpg18_oli", 10, 1, 2, ["gm_1Rnd_64mm_heat_pg18"], 1];
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
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["gm_mine_at_dm1233"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_handgrenade_frag_dm51", "gm_handgrenade_frag_dm51a1"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_1rnd_67mm_heat_dm22a1_g3"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_smokeshell_grn_dm21", "gm_smokeshell_red_dm23", "gm_smokeshell_yel_dm26", "gm_smokeshell_org_dm32", "gm_smokeshell_wht_dm25"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["gm_handgrenade_conc_dm51"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","1Rnd_Smoke_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_1Rnd_265mm_flare_para_yel_DM16", "gm_1Rnd_265mm_flare_single_wht_DM15", "gm_1Rnd_265mm_flare_single_red_DM13", "gm_1Rnd_265mm_flare_single_grn_DM11", "gm_1Rnd_265mm_flare_single_yel_DM10"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["gm_1Rnd_265mm_flare_multi_wht_DM25", "gm_1Rnd_265mm_flare_multi_red_DM23", "gm_1Rnd_265mm_flare_multi_grn_DM21", "gm_1Rnd_265mm_flare_multi_yel_DM20"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["gm_1Rnd_265mm_smoke_single_yel_DM19", "gm_1Rnd_265mm_smoke_single_org_DM22", "gm_1Rnd_265mm_smoke_single_vlt_DM24"], 5];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_repairkit_01", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_boltcutter", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_army_medkit_80", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_army_gauzeBandage", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_facewear_m65", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_facewear_sunglasses", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_facewear_glacierglasses", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_xx_headgear_headwrap_01_dino", 20, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["gm_ge_army_backpack_80_oli"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
//a3e_arr_AmmoDepotItems pushback ["Laserdesignator_02_ghex_F", 10, 1, 2];
/*if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["O_NVGoggles_ghex_F", 10, 1, 3];
};*/
a3e_arr_AmmoDepotItems pushback ["gm_ferod16_oli", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["gm_lp7_oli", 10, 1, 2]; //Rangefinder West
//a3e_arr_AmmoDepotItems pushback ["gm_lpr1_oli", 10, 1, 2]; //Rangefinder East
a3e_arr_AmmoDepotItems pushback ["gm_ge_army_conat2", 50, 1, 3];
//a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["gm_watch_kosei_80", 50, 1, 10];
//a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
//a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
//G3, MP5 etc stuff
a3e_arr_AmmoDepotItems pushback ["gm_maglite_2d_hkslim_blk", 30, 1, 2]; //flashlight
a3e_arr_AmmoDepotItems pushback ["gm_suppressor_atec150_762mm_long_blk", 20, 1, 2]; //
a3e_arr_AmmoDepotItems pushback ["gm_suppressor_atec150_762mm_blk", 20, 1, 2]; //
a3e_arr_AmmoDepotItems pushback ["gm_suppressor_atec150_556mm_long_blk", 10, 1, 2]; //
a3e_arr_AmmoDepotItems pushback ["gm_suppressor_atec150_556mm_blk", 10, 1, 2]; //
a3e_arr_AmmoDepotItems pushback ["gm_feroz24_blk", 30, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_bayonet_g3_blk", 30, 1, 2]; //G3
a3e_arr_AmmoDepotItems pushback ["gm_bayonet_g3_oli", 10, 1, 2]; //G3
a3e_arr_AmmoDepotItems pushback ["gm_g3_bipod_blk", 30, 1, 2]; //G3
a3e_arr_AmmoDepotItems pushback ["gm_zpp_stanagClaw_blk", 20, 1, 2]; //flashlight sight
a3e_arr_AmmoDepotItems pushback ["gm_colt4x20_stanagClaw_blk", 5, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_blits_stanagClaw_blk", 5, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_blits_stanagClaw_oli", 5, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_feroz24_stanagClaw_blk", 5, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_feroz24_stanagClaw_oli", 5, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_diavari_da_stanagClaw_blk", 5, 1, 2]; //1.5-6x sight
a3e_arr_AmmoDepotItems pushback ["gm_diavari_da_stanagClaw_oli", 5, 1, 2]; //1.5-6x sight
a3e_arr_AmmoDepotItems pushback ["gm_zf10x42_stanagClaw_blk", 10, 1, 2]; //10x sight
a3e_arr_AmmoDepotItems pushback ["gm_zf10x42_stanagClaw_oli", 10, 1, 2]; //10x sight
a3e_arr_AmmoDepotItems pushback ["gm_rv_stanagClaw_blk", 10, 1, 2]; //G3 reflex sight
a3e_arr_AmmoDepotItems pushback ["gm_rv_stanagClaw_oli", 10, 1, 2]; //G3 reflex sight
a3e_arr_AmmoDepotItems pushback ["gm_streamlight_sl20_stanagClaw_brn", 10, 1, 2]; //Beamlight
a3e_arr_AmmoDepotItems pushback ["gm_streamlight_sl20_stanagClaw_blk", 10, 1, 2]; //Beamlight
a3e_arr_AmmoDepotItems pushback ["gm_maglite_3d_stanagClaw_blk", 20, 1, 2]; //McLight
a3e_arr_AmmoDepotItems pushback ["gm_ls45_red_stanagClaw_blk", 10, 1, 2]; //Laser
a3e_arr_AmmoDepotItems pushback ["gm_ls45_ir_stanagClaw_blk", 10, 1, 2]; //Laser IR
a3e_arr_AmmoDepotItems pushback ["gm_ls1500_red_stanagClaw_blk", 10, 1, 2]; //Laser
a3e_arr_AmmoDepotItems pushback ["gm_ls1500_ir_stanagClaw_blk", 10, 1, 2]; //Laser IR
a3e_arr_AmmoDepotItems pushback ["gm_lsminiv_red_stanagClaw_blk", 10, 1, 2]; //Laser
a3e_arr_AmmoDepotItems pushback ["gm_lsminiv_ir_stanagClaw_blk", 10, 1, 2]; //Laser IR
a3e_arr_AmmoDepotItems pushback ["gm_feroz24_stanagHK_blk", 20, 1, 2]; //G8A2
a3e_arr_AmmoDepotItems pushback ["gm_g8_bipod_blk", 20, 1, 2]; //G8
a3e_arr_AmmoDepotItems pushback ["gm_g11_lps_prism11mm_blk", 10, 1, 2]; //G11 1x sight
a3e_arr_AmmoDepotItems pushback ["gm_g11_mps_prism11mm_blk", 10, 1, 2]; //G11 3x sight
a3e_arr_AmmoDepotItems pushback ["gm_bayonet_g11_blk", 10, 1, 2]; //
a3e_arr_AmmoDepotItems pushback ["gm_surefire_l60_wht_bayonetg11_blk", 10, 1, 2]; //G11 flashlight
a3e_arr_AmmoDepotItems pushback ["gm_msg90_bipod_blk", 20, 1, 2]; //MSG90
//RIS
a3e_arr_AmmoDepotItems pushback ["gm_c79a1_blk", 10, 1, 2]; //C7
a3e_arr_AmmoDepotItems pushback ["gm_c79a1_oli", 15, 1, 2]; //C7
a3e_arr_AmmoDepotItems pushback ["gm_blits_ris_blk", 5, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_feroz24_ris_blk", 5, 1, 2]; //4x sight
a3e_arr_AmmoDepotItems pushback ["gm_zf10x42_ris_blk", 5, 1, 2]; //10x sight
a3e_arr_AmmoDepotItems pushback ["gm_zf10x42_ris_oli", 5, 1, 2]; //10x sight
a3e_arr_AmmoDepotItems pushback ["gm_rv_ris_blk", 20, 1, 2]; //Reflex
a3e_arr_AmmoDepotItems pushback ["gm_streamlight_sl20_ris_brn", 10, 1, 2]; //Beamlight
a3e_arr_AmmoDepotItems pushback ["gm_streamlight_sl20_ris_blk", 10, 1, 2]; //Beamlight
a3e_arr_AmmoDepotItems pushback ["gm_maglite_3d_ris_blk", 20, 1, 2]; //McLight
a3e_arr_AmmoDepotItems pushback ["gm_ls45_red_ris_blk", 10, 1, 2]; //Laser
a3e_arr_AmmoDepotItems pushback ["gm_ls45_ir_ris_blk", 10, 1, 2]; //Laser IR
a3e_arr_AmmoDepotItems pushback ["gm_ls1500_red_ris_blk", 10, 1, 2]; //Laser
a3e_arr_AmmoDepotItems pushback ["gm_ls1500_ir_ris_blk", 10, 1, 2]; //Laser IR
a3e_arr_AmmoDepotItems pushback ["gm_lsminiv_red_ris_blk", 10, 1, 2]; //Laser
a3e_arr_AmmoDepotItems pushback ["gm_lsminiv_ir_ris_blk", 10, 1, 2]; //Laser IR
//SIG stuff
a3e_arr_AmmoDepotItems pushback ["gm_ls45_red_stanagSig_blk", 10, 1, 2]; //SIG Laser
//AK stuff
//a3e_arr_AmmoDepotItems pushback ["gm_pso1_gry", 20, 1, 3]; //SVD
//a3e_arr_AmmoDepotItems pushback ["gm_pka_dovetail_blk", 20, 1, 3]; //reflex
//a3e_arr_AmmoDepotItems pushback ["gm_pka_dovetail_gry", 20, 1, 3]; //reflex
//a3e_arr_AmmoDepotItems pushback ["gm_zln1k_grn_dovetail_blk", 20, 1, 3]; //laser
//a3e_arr_AmmoDepotItems pushback ["gm_zln1k_grn_dovetail_gry", 20, 1, 3]; //laser
//a3e_arr_AmmoDepotItems pushback ["gm_zln1k_ir_dovetail_blk", 20, 1, 3]; //laser IR
//a3e_arr_AmmoDepotItems pushback ["gm_zln1k_ir_dovetail_gry", 20, 1, 3]; //laser IR
//a3e_arr_AmmoDepotItems pushback ["gm_zfk4x25_blk", 20, 1, 3]; //4x sight
//a3e_arr_AmmoDepotItems pushback ["gm_zvn64_front", 50, 1, 3]; //AK ironsight night
//a3e_arr_AmmoDepotItems pushback ["gm_zvn64_rear_ak", 50, 1, 3]; //AK ironsight night
//a3e_arr_AmmoDepotItems pushback ["gm_flashlightp2_wht_ak74handguard_blu", 50, 1, 3]; //flashlight
//a3e_arr_AmmoDepotItems pushback ["gm_flashlightp2_brk_ak74handguard_dino", 50, 1, 3]; //flashlight
//a3e_arr_AmmoDepotItems pushback ["gm_suppressor_pbs4_545mm_blk", 50, 1, 3]; //AK supressor
//a3e_arr_AmmoDepotItems pushback ["gm_suppressor_pbs1_762mm_blk", 50, 1, 3]; //AK supressor
//a3e_arr_AmmoDepotItems pushback ["gm_bayonet_6x3_wud", 50, 1, 3]; //bayonet
//a3e_arr_AmmoDepotItems pushback ["gm_bayonet_6x3_blk", 50, 1, 3]; //bayonet
//a3e_arr_AmmoDepotItems pushback ["gm_suppressor_safloryt_blk", 10, 1, 2]; //PM63
//Launcher sights
a3e_arr_AmmoDepotItems pushback ["gm_feroz2x17_pzf44_2_blk", 25, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_feroz2x17_pzf84_blk", 25, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_pgo7v_blk", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["gm_feroz51_stanagClaw_oli", 10, 1, 1]; //G3
	a3e_arr_AmmoDepotItems pushback ["gm_feroz51_ris_oli", 10, 1, 1]; //G3
//	a3e_arr_AmmoDepotItems pushback ["gm_nspu_dovetail_blk", 10, 1, 2];//AK
//	a3e_arr_AmmoDepotItems pushback ["gm_nspu_dovetail_gry", 10, 1, 2];//AK
	a3e_arr_AmmoDepotItems pushback ["gm_ferod51_oli", 10, 1, 1];	//NVG west
//	a3e_arr_AmmoDepotItems pushback ["gm_nsg66_oli", 10, 1, 1];	//NVG east
};


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["gm_p1_blk", "gm_8rnd_9x19mm_b_dm11_p1_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_p210_blk", "gm_8Rnd_9x19mm_B_DM11_p210_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_p2a1_blk", "gm_1Rnd_265mm_flare_multi_red_gc", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_p2a1_blk", "gm_1Rnd_265mm_flare_para_yel_DM16", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_p2a1_blk", "gm_1Rnd_265mm_flare_multi_nbc_DM47", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_m16a1_blk", "gm_20Rnd_556x45mm_B_M193_stanag_gry", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_mp2a1_blk", "gm_32rnd_9x19mm_b_dm11_mp2_blk", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_rpg7_prp", "gm_1rnd_40mm_heat_pg7v_rpg7", 2];
a3e_arr_CivilianCarWeapons pushback ["gm_pm63_blk", "gm_15Rnd_9x18mm_B_pst_pm63_blk", 7];
a3e_arr_CivilianCarWeapons pushback ["gm_pm63_blk", "gm_25Rnd_9x18mm_B_pst_pm63_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_mp5nsd2_blk", "gm_30Rnd_9x19mm_B_DM11_mp5_blk", 8];
a3e_arr_CivilianCarWeapons pushback ["gm_g3a3a0_gold", "gm_20Rnd_762x51mm_B_T_DM21_g3_gold", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_hk512_wud", "gm_7rnd_12ga_hk512_pellet", 12];
a3e_arr_CivilianCarWeapons pushback ["gm_hk512_wud", "gm_7rnd_12ga_hk512_slug", 12];
a3e_arr_CivilianCarWeapons pushback ["gm_sg551_pnk", "gm_30Rnd_556x45mm_B_DM11_sg550_brn", 8];
a3e_arr_CivilianCarWeapons pushback ["gm_psg1_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", 8];
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
	,"gm_feroz24_stanagHK_blk"
	,"gm_rv_stanagClaw_blk"
	,"gm_rv_ris_blk"
	,"gm_c79a1_blk"
	,"gm_c79a1_oli"];
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
a3e_arr_NightScopes = [
	"gm_feroz51_stanagClaw_oli"
	,"gm_feroz51_ris_oli"];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"gm_g3_bipod_blk"
	,"gm_g8_bipod_blk"
	];

//////////////////////////////////////////////////////////////////
// revive/functions/revive/fn_Check_Revive_FAK.sqf and fn_HandleRevive
// additional types of FAKs or Medkits that should work for revives
// arrays have to be global, because check is performed on client
//////////////////////////////////////////////////////////////////
private _faks = [
	"FirstAidKit"
	,"gm_gc_army_gauzeBandage"
	,"gm_gc_army_medkit"
	,"gm_ge_army_burnBandage"
	,"gm_ge_army_gauzeBandage"
	,"gm_ge_army_gauzeCompress"
	,"gm_ge_firstaidkit_vehicle"
	,"gm_gc_firstaidkit_vehicle"
	,"gm_ge_army_firstaidkit_vehicle"];
missionNamespace setvariable ["a3e_arr_faks",_faks,true];
_medkits = [
	"Medikit"
	,"gm_ge_army_medkit_80"
	,"gm_gc_army_medbox"];
missionNamespace setvariable ["a3e_arr_medkits",_medkits,true];

//////////////////////////////////////////////////////////////////
// fn_addIntel.sqf
// types of intel items you can find on enemies
//////////////////////////////////////////////////////////////////
A3E_IntelItems = [
	"Files"
	,"FileTopSecret"
	,"FilesSecret"
	//,"FlashDisk"
	,"DocumentsSecret"
	,"Wallet_ID"
	,"FileNetworkStructure"
	//,"MobilePhone"
	//,"SmartPhone"
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
	"land"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
// always the fallback option, use BIS units if mod has no helicopters
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"gm_gc_airforce_mi2p_grg"	//8
	,"gm_gc_airforce_mi2urn"		//8
	,"gm_gc_airforce_mi2t_grg"	//7
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
	"Land_Mi8_wreck_F"];
a3e_arr_CrashSiteCrew = [
	"gm_gc_airforce_pilot_pm_80_blu"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_UAZ_F"
	,"Land_Wreck_Ural_F"
	,"Land_Wreck_T72_hull_F"
	,"Land_V3S_wreck_F"
	,"Land_Wreck_BRDM2_F"
	,"Land_Wreck_BMP2_F"];
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
a3e_arr_CrashSiteItems pushback ["gm_pka_dovetail_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zfk4x25_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_pgo7v_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zvn64_front", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zvn64_rear_ak", 50, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_flashlightp2_wht_ak74handguard_blu", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_flashlightp2_brk_ak74handguard_dino", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_suppressor_pbs4_545mm_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_suppressor_pbs1_762mm_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_bayonet_6x3_wud", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zln1k_grn_dovetail_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_zln1k_ir_dovetail_blk", 20, 1, 3];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_CrashSiteItems pushback ["gm_nspu_dovetail_blk", 10, 1, 2];//AK
	a3e_arr_CrashSiteItems pushback ["gm_nspu_dovetail_gry", 10, 1, 2];//AK
	a3e_arr_CrashSiteItems pushback ["gm_nsg66_oli", 10, 1, 1];	//NVG east
};

//Mines and traps, fn_initTraps
A3E_Trap_Classes = [["roadcenter","gm_minestatic_ap_dm31"],["roadcenter","gm_minestatic_at_dm21"],["random","gm_minestatic_ap_pfm1"]];//,["roadcenter","vn_mine_tripwire_m16_04"],["roadside","vn_mine_tripwire_arty"],["random","vn_mine_tripwire_f1_02"]]; Classnames ofd traps and mines. String or array in form [classname, trigger range, scriptcode]
A3E_Trap_Pathes = ["HIDE"]; //Classnames of roads and pathes for the traps to spawn
/*
gm_minestatic_ap_dm31	//german bounding tripwire AP
gm_minestatic_ap_pfm1	//russian ap butterfly
gm_minestatic_at_dm1233	//artillery at
gm_minestatic_at_dm21	//german at plate
gm_minestatic_at_mn111	//polish airdropped at, spider
gm_minestatic_at_ptm3	//russian at, scatterable, block
gm_minestatic_at_tm46	//soviet at plate
*/