// GM
// BW vs NVA


/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;	//player side GM BW
A3E_VAR_Side_Opfor = east;	//GM NVA
A3E_VAR_Side_Ind = resistance;	//GM Poland

A3E_VAR_Flag_Opfor = "\gm\gm_core\data\flags\gm_flag_gc_co.paa";
A3E_VAR_Flag_Ind = "\gm\gm_core\data\flags\gm_flag_pl_co.paa";
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"gm_pl_army_rifleman_akm_80_moro",
	"gm_pl_army_rifleman_akm_80_moro",
	"gm_pl_army_squadleader_akm_80_moro",
	"gm_pl_army_rifleman_akm_80_moro"];

// Prison backpacks
a3e_arr_PrisonBackpacks = [
	"gm_pl_army_backpack_at_80_gry"
	,"gm_pl_army_backpack_80_oli"
	,"gm_ge_backpack_satchel_80_blk"];
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
	"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_ff_p601"
	,"gm_gc_pol_p601"
	,"gm_gc_dp_p601"
	,"gm_xx_civ_bicycle_01"];
	if(Param_UseDLCContact==1) then {
	a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses pushback "C_Tractor_01_F";
	};
	
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_gc_army_p601"
		,"gm_gc_army_p601"
		,"gm_gc_army_p601"
		,"gm_gc_army_bicycle_01_oli"
		,"gm_gc_army_bicycle_01_oli"
		,"gm_gc_army_ural4320_reammo"
		,"gm_gc_army_ural375d_refuel"
		,"gm_gc_army_ural375d_medic"
		,"gm_gc_army_ural4320_repair"
		,"gm_gc_army_ural44202"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_pt76b"
		,"gm_gc_army_pt76b"
		,"gm_gc_army_t55"
		,"gm_gc_army_t55a"
		,"gm_gc_army_t55ak"
		,"gm_gc_army_t55am2"
		,"gm_gc_army_t55am2b"
		,"gm_gc_army_zsu234v1"
		,"gm_gc_army_bmp1sp2"
		,"gm_gc_army_bmp1sp2"
		,"gm_gc_army_brdm2"
		,"gm_gc_army_brdm2"
		,"gm_gc_army_brdm2um"
		,"gm_gc_army_btr60pa"
		,"gm_gc_army_btr60pb"
		,"gm_gc_army_btr60pu12"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_reammo"
		,"gm_pl_army_ural375d_refuel"
		,"gm_pl_army_ural375d_medic"
		,"gm_pl_army_ural4320_repair"
		,"gm_pl_army_brdm2"
		,"gm_pl_army_brdm2"
		,"gm_pl_army_ot64a"
		,"gm_pl_army_ot64a"
		,"gm_pl_army_pt76b"
		,"gm_pl_army_pt76b"
		,"gm_pl_army_bmp1sp2"
		,"gm_pl_army_bmp1sp2"
		,"gm_pl_army_zsu234v1"
		,"gm_pl_army_t55"
		,"gm_pl_army_t55a"
		,"gm_pl_army_t55ak"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_gc_army_p601"
		,"gm_gc_army_p601"
		,"gm_gc_army_p601"
		,"gm_gc_army_bicycle_01_oli"
		,"gm_gc_army_bicycle_01_oli"
		,"gm_gc_army_ural4320_reammo"
		,"gm_gc_army_ural375d_refuel"
		,"gm_gc_army_ural375d_medic"
		,"gm_gc_army_ural4320_repair"
		,"gm_gc_army_ural44202"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_pt76b"
		,"gm_gc_army_pt76b"
		,"gm_gc_army_t55"
		,"gm_gc_army_t55a"
		,"gm_gc_army_t55ak"
		,"gm_gc_army_t55am2"
		,"gm_gc_army_t55am2b"
		,"gm_gc_army_zsu234v1"
		,"gm_gc_army_bmp1sp2"
		,"gm_gc_army_bmp1sp2"
		,"gm_gc_army_brdm2"
		,"gm_gc_army_brdm2"
		,"gm_gc_army_brdm2um"
		,"gm_gc_army_btr60pa"
		,"gm_gc_army_btr60pb"
		,"gm_gc_army_btr60pu12"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_reammo"
		,"gm_pl_army_ural375d_refuel"
		,"gm_pl_army_ural375d_medic"
		,"gm_pl_army_ural4320_repair"
		,"gm_pl_army_brdm2"
		,"gm_pl_army_brdm2"
		,"gm_pl_army_ot64a"
		,"gm_pl_army_ot64a"
		,"gm_pl_army_pt76b"
		,"gm_pl_army_pt76b"
		,"gm_pl_army_bmp1sp2"
		,"gm_pl_army_bmp1sp2"
		,"gm_pl_army_zsu234v1"
		,"gm_pl_army_t55"
		,"gm_pl_army_t55a"
		,"gm_pl_army_t55ak"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"gm_gc_army_p601"
		,"gm_gc_army_p601"
		,"gm_gc_army_p601"
		,"gm_gc_army_bicycle_01_oli"
		,"gm_gc_army_bicycle_01_oli"
		,"gm_gc_army_ural4320_reammo"
		,"gm_gc_army_ural375d_refuel"
		,"gm_gc_army_ural375d_medic"
		,"gm_gc_army_ural4320_repair"
		,"gm_gc_army_ural44202"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_ural4320_cargo"
		,"gm_gc_army_pt76b"
		,"gm_gc_army_pt76b"
		,"gm_gc_army_t55"
		,"gm_gc_army_t55a"
		,"gm_gc_army_t55ak"
		,"gm_gc_army_t55am2"
		,"gm_gc_army_t55am2b"
		,"gm_gc_army_zsu234v1"
		,"gm_gc_army_bmp1sp2"
		,"gm_gc_army_bmp1sp2"
		,"gm_gc_army_brdm2"
		,"gm_gc_army_brdm2"
		,"gm_gc_army_brdm2um"
		,"gm_gc_army_btr60pa"
		,"gm_gc_army_btr60pb"
		,"gm_gc_army_btr60pu12"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_cargo"
		,"gm_pl_army_ural4320_reammo"
		,"gm_pl_army_ural375d_refuel"
		,"gm_pl_army_ural375d_medic"
		,"gm_pl_army_ural4320_repair"
		,"gm_pl_army_brdm2"
		,"gm_pl_army_brdm2"
		,"gm_pl_army_ot64a"
		,"gm_pl_army_ot64a"
		,"gm_pl_army_pt76b"
		,"gm_pl_army_pt76b"
		,"gm_pl_army_bmp1sp2"
		,"gm_pl_army_bmp1sp2"
		,"gm_pl_army_zsu234v1"
		,"gm_pl_army_t55"
		,"gm_pl_army_t55a"
		,"gm_pl_army_t55ak"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"gm_gc_army_engineer_mpiaks74n_80_str"
	,"gm_gc_army_engineer_mpiaks74n_80_str"
	,"gm_gc_army_engineer_mpiaks74n_80_str"
	,"gm_gc_army_medic_mpiak74n_80_str"
	,"gm_gc_army_medic_mpiak74n_80_str"
	,"gm_gc_army_medic_mpiak74n_80_str"
	,"gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_str"
	,"gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk_80_str"
	,"gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_str"
	,"gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_str"
	,"gm_gc_army_machinegunner_lmgrpk_80_str"
	,"gm_gc_army_machinegunner_lmgrpk_80_str"
	,"gm_gc_army_machinegunner_lmgrpk_80_str"
	,"gm_gc_army_antitank_mpiak74n_rpg7_80_str"
	,"gm_gc_army_antitank_mpiak74n_rpg7_80_str"
	,"gm_gc_army_demolition_mpiaks74n_80_str"
	,"gm_gc_army_demolition_mpiaks74n_80_str"
	,"gm_gc_army_rifleman_mpiak74n_80_str"
	,"gm_gc_army_rifleman_mpiak74n_80_str"
	,"gm_gc_army_rifleman_mpiak74n_80_str"
	,"gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str"
	,"gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str"
	,"gm_gc_army_antitank_mpiak74n_fagot_80_str"
	,"gm_gc_army_antitank_mpiak74n_fagot_80_str"
	,"gm_gc_army_antiair_mpiak74n_9k32m_80_str"
	,"gm_gc_army_antiair_mpiak74n_9k32m_80_str"
	,"gm_gc_army_rifleman_mpiak74n_80_str"
	,"gm_gc_army_rifleman_mpiak74n_80_str"
	,"gm_gc_army_rifleman_mpiak74n_80_str"
	,"gm_gc_army_machinegunner_pk_80_str"
	,"gm_gc_army_machinegunner_pk_80_str"
	,"gm_gc_army_machinegunner_pk_80_str"
	,"gm_gc_army_marksman_svd_80_str"
	,"gm_gc_army_marksman_svd_80_str"
	,"gm_gc_army_squadleader_mpiak74n_80_str"
	,"gm_gc_army_squadleader_mpiak74n_80_str"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"gm_pl_army_engineer_akm_80_moro"
	,"gm_pl_army_engineer_akm_80_moro"
	,"gm_pl_army_engineer_akm_80_moro"
	,"gm_pl_army_medic_akm_80_moro"
	,"gm_pl_army_medic_akm_80_moro"
	,"gm_pl_army_medic_akm_80_moro"
	,"gm_pl_army_machinegunner_pk_80_moro"
	,"gm_pl_army_machinegunner_pk_80_moro"
	,"gm_pl_army_machinegunner_assistant_akm_pk_80_moro"
	,"gm_pl_army_machinegunner_rpk_80_moro"
	,"gm_pl_army_machinegunner_rpk_80_moro"
	,"gm_pl_army_machinegunner_rpk_80_moro"
	,"gm_pl_army_machinegunner_assistant_akm_rpk_80_moro"
	,"gm_pl_army_demolition_akm_80_moro"
	,"gm_pl_army_demolition_akm_80_moro"
	,"gm_pl_army_demolition_akm_80_moro"
	,"gm_pl_army_rifleman_akm_80_moro"
	,"gm_pl_army_rifleman_akm_80_moro"
	,"gm_pl_army_rifleman_akm_80_moro"
	,"gm_pl_army_rifleman_akm_80_moro"
	,"gm_pl_army_rifleman_akm_80_moro"
	,"gm_pl_army_rifleman_akm_80_moro"
	,"gm_pl_army_antitank_akm_fagot_80_moro"
	,"gm_pl_army_antitank_akm_fagot_80_moro"
	,"gm_pl_army_antitank_akm_rpg7_80_moro"
	,"gm_pl_army_antitank_akm_rpg7_80_moro"
	,"gm_pl_army_antitank_akm_rpg7_80_moro"
	,"gm_pl_army_antiair_akm_9k32m_80_moro"
	,"gm_pl_army_antiair_akm_9k32m_80_moro"
	,"gm_pl_army_marksman_svd_80_moro"
	,"gm_pl_army_marksman_svd_80_moro"
	,"gm_pl_army_marksman_svd_80_moro"
	,"gm_pl_army_antitank_assistant_akm_rpg7_80_moro"
	,"gm_pl_army_antitank_assistant_akm_rpg7_80_moro"
	,"gm_pl_army_squadleader_akm_80_moro"
	,"gm_pl_army_squadleader_akm_80_moro"];
a3e_arr_recon_InfantryTypes = [
	"gm_gc_army_sf_antiair_pm63_9k32m_80_str"
	,"gm_gc_army_sf_antitank_mpikms72_rpg7_80_str"
	,"gm_gc_army_sf_antitank_mpikms72_fagot_80_str"
	,"gm_gc_army_sf_demolition_pm63_80_str"
	,"gm_gc_army_sf_machinegunner_lmgrpk_80_str"
	,"gm_gc_army_sf_marksman_svd_80_str"
	,"gm_gc_army_sf_engineer_mpikms72_80_str"
	,"gm_gc_army_sf_rifleman_mpikms72_80_str"
	,"gm_gc_army_sf_rifleman_pm63_80_str"
	,"gm_gc_army_sf_squadleader_mpikms72_80_str"];
a3e_arr_recon_I_InfantryTypes = [
	"gm_pl_army_sf_antiair_pm63_9k32m_80_moro"
	,"gm_pl_army_sf_antitank_akmn_rpg7_80_moro"
	,"gm_pl_army_sf_antitank_akmn_fagot_80_moro"
	,"gm_pl_army_sf_demolition_pm63_80_moro"
	,"gm_pl_army_sf_machinegunner_rpk_80_moro"
	,"gm_pl_army_sf_marksman_svd_80_moro"
	,"gm_pl_army_sf_engineer_pm63_80_moro"
	,"gm_pl_army_sf_rifleman_akmn_80_moro"
	,"gm_pl_army_sf_rifleman_pm63_80_moro"
	,"gm_pl_army_sf_squadleader_akmn_80_moro"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"gm_gc_army_brdm2"
	,"gm_gc_army_brdm2"
	,"gm_gc_army_btr60pb"
	,"gm_gc_army_bmp1sp2"
	//,"O_HMG_01_high_F"
	,"gm_gc_army_fagot_launcher_tripod"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"gm_pl_army_brdm2"
	,"gm_pl_army_brdm2"
	,"gm_pl_army_ot64a"
	,"gm_pl_army_ot64a"
	//,"I_HMG_01_high_f"
	,"gm_pl_army_fagot_launcher_tripod"
	,"gm_pl_army_bmp1sp2"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"gm_gc_army_p601"
	,"gm_gc_army_ural4320_cargo"
	,"gm_gc_army_ural4320_cargo"
	,"gm_gc_army_ural4320_cargo"
	,"gm_gc_army_brdm2um"
	,"gm_gc_army_btr60pa"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"gm_pl_army_ural4320_cargo"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"gm_gc_army_brdm2"
	,"gm_gc_army_brdm2"
	,"gm_gc_army_brdm2um"
	,"gm_gc_army_btr60pb"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"gm_gc_army_brdm2"
	,"gm_gc_army_btr60pb"
	,"gm_gc_army_bmp1sp2"
	,"gm_gc_army_pt76b"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"gm_gc_army_t55"
	,"gm_gc_army_t55a"
	,"gm_gc_army_t55ak"
	,"gm_gc_army_t55am2"
	,"gm_gc_army_t55am2b"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"O_G_HMG_02_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"gm_gc_army_p601"
	,"gm_gc_army_p601"
	,"gm_gc_army_bicycle_01_oli"
	,"gm_gc_army_ural4320_reammo"
	,"gm_gc_army_ural375d_refuel"
	,"gm_gc_army_ural375d_medic"
	,"gm_gc_army_ural4320_repair"
	,"gm_gc_army_ural4320_cargo"
	,"gm_gc_army_ural4320_cargo"
	,"gm_gc_army_brdm2um"
	,"gm_gc_army_brdm2"
	,"gm_gc_army_brdm2"
	,"gm_gc_army_btr60pa"
	,"gm_gc_army_btr60pb"
	,"gm_gc_army_btr60pu12"
	,"gm_gc_army_bmp1sp2"
	,"gm_gc_army_zsu234v1"
	,"gm_gc_army_pt76b"
	,"gm_gc_army_t55"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_civ_p601"
	,"gm_gc_ff_p601"
	,"gm_gc_pol_p601"
	,"gm_gc_dp_p601"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"gm_gc_army_fagot_launcher_tripod"
	,"O_G_HMG_02_high_F"
	,"O_G_HMG_02_high_F"
	];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"gm_gc_army_p601"
	,"gm_gc_army_p601"
	,"gm_gc_army_bicycle_01_oli"
	,"gm_gc_army_ural4320_reammo"
	,"gm_gc_army_ural375d_refuel"
	,"gm_gc_army_ural375d_medic"
	,"gm_gc_army_ural4320_repair"
	,"gm_gc_army_ural4320_cargo"
	,"gm_gc_army_ural4320_cargo"
	,"gm_gc_army_brdm2um"
	,"gm_gc_army_brdm2"
	,"gm_gc_army_brdm2"
	,"gm_gc_army_btr60pa"
	,"gm_gc_army_btr60pb"
	,"gm_gc_army_btr60pu12"
	,"gm_pl_army_ot64a"
	,"gm_pl_army_ot64a"
	,"gm_pl_army_brdm2"
	,"gm_pl_army_ural4320_cargo"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"gm_gc_airforce_mi2urn"
	,"gm_gc_airforce_mi2us"];
a3e_arr_O_transport_heli = [
	"gm_gc_airforce_mi2p"
	,"gm_gc_airforce_mi2p"
	,"gm_gc_airforce_mi2t"];
a3e_arr_O_pilots = [
	"gm_gc_airforce_pilot_pm_80_blu"];
a3e_arr_I_transport_heli = [
	"gm_pl_airforce_mi2p"
	,"gm_pl_airforce_mi2p"
	,"gm_pl_airforce_mi2t"];
a3e_arr_I_pilots = [
	"gm_pl_airforce_pilot_pm_80_gry"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_pm_blk", 50, 4, 8, ["gm_8Rnd_9x18mm_B_pst_pm_blk"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_mpiaks74nk_brn", 40, 4, 8, ["gm_30Rnd_545x39mm_B_7N6_ak74_org"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_mpiak74n_brn", 100, 2, 4, ["gm_30Rnd_545x39mm_B_7N6_ak74_org"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_lmgrpk_brn", 50, 2, 4, ["gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], 3];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_mpiaks74n_brn", 30, 2, 4, ["gm_30Rnd_545x39mm_B_T_7T3_ak74_org"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_mpikm72_brn", 25, 2, 4, ["gm_30Rnd_762x39mm_B_M43_ak47_blk"], 6];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_akm_wud", 50, 1, 3, ["gm_30Rnd_762x39mm_B_M43_ak47_blk"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["gm_akmn_wud", 40, 1, 3, ["gm_30Rnd_762x39mm_B_57N231_ak47_blk"], 6];

// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_pm63_blk", 50, 1, 2, ["gm_15Rnd_9x18mm_B_pst_pm63_blk", "gm_25Rnd_9x18mm_B_pst_pm63_blk"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_svd_wud_pso1", 40, 2, 4, ["gm_10Rnd_762x54mmR_AP_7N1_svd_blk"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_hmgpkm_prp", 50, 1, 2, ["gm_100Rnd_762x54mm_B_T_t46_pk_grn"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_lp1_blk", 50, 2, 4, ["gm_1Rnd_265mm_flare_single_wht_gc", "gm_1Rnd_265mm_flare_multi_red_gc"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_p2a1_launcher_blk", 5, 1, 2, ["gm_1Rnd_2650mm_potato_dm11"], 5];

// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_rpk_wud", 40, 2, 4, ["gm_75Rnd_762x39mm_B_T_M43_ak47_blk"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["gm_wz78_blk", 40, 2, 4, ["gm_1Rnd_265mm_smoke_single_yel_gc","gm_1Rnd_265mm_flare_single_grn_gc"], 6];

// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["gm_rpg7_prp", 50, 3, 5, ["gm_1Rnd_40mm_heat_pg7v_rpg7"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["gm_rpg7_prp", 30, 1, 3, ["gm_1Rnd_40mm_heat_pg7vl_rpg7"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["gm_9k32m_oli", 50, 1, 2, ["gm_1Rnd_72mm_he_9m32m"], 2];
//a3e_arr_AmmoDepotLaunchers pushback ["gm_pzf84_oli", 50, 1, 2, ["gm_1rnd_84x245mm_heat_t_dm12a1_carlgustaf"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["gm_pzf84_oli", 50, 1, 2, ["gm_1rnd_84x245mm_heat_t_dm22_carlgustaf", "gm_1rnd_84x245mm_illum_dm16_carlgustaf"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["gm_rpg7_wud", 20, 1, 2, ["gm_1rnd_40mm_heat_pg7v_rpg7"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["gm_rpg7_wud", 10, 1, 2, ["gm_1Rnd_40mm_heat_pg7vl_rpg7"], 2];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["gm_explosive_plnp_charge"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["gm_mine_at_tm46"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_handgrenade_frag_rgd5"], 50];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_1rnd_67mm_heat_dm22a1_g3"], 20];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_smokeshell_blu_gc", "gm_smokeshell_grn_gc", "gm_smokeshell_org_gc", "gm_smokeshell_red_gc", "gm_smokeshell_wht_gc","gm_smokeshell_yel_gc"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 30, 1, 1, ["gm_handgrenade_conc_dm51"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["gm_1Rnd_265mm_flare_single_wht_gc", "gm_1Rnd_265mm_flare_single_grn_gc", "gm_1Rnd_265mm_flare_single_red_gc"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 25, 1, 1, ["gm_1Rnd_265mm_flare_multi_red_gc"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 25, 1, 1, ["gm_1Rnd_265mm_smoke_single_yel_gc", "gm_1Rnd_265mm_smoke_single_blu_gc", "gm_1Rnd_265mm_smoke_single_blk_gc"], 5];
//a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 5];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_repairkit_01", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_ge_army_medkit_80", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_gc_army_medkit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_gc_army_gauzeBandage", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["gm_gc_army_facewear_schm41m", 50, 1, 3, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["gm_gc_army_backpack_80_assaultpack_str"];
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
a3e_arr_AmmoDepotItems pushback ["gm_df7x40_blk", 50, 2, 3, [], 0];
//a3e_arr_AmmoDepotItems pushback ["Rangefinder", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_gc_compass_f73", 50, 1, 3];
//a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["gm_watch_kosei_80", 50, 1, 10];
//a3e_arr_AmmoDepotItems pushback ["acc_flashlight", 50, 1, 5];
//a3e_arr_AmmoDepotItems pushback ["acc_pointer_IR", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["muzzle_snds_B", 10, 1, 2]; //G3
a3e_arr_AmmoDepotItems pushback ["gm_suppressor_safloryt_blk", 40, 1, 2]; //PM63
a3e_arr_AmmoDepotItems pushback ["gm_feroz24_blk", 2, 1, 2]; //G3
a3e_arr_AmmoDepotItems pushback ["gm_c79a1_blk", 2, 1, 2]; //C7
a3e_arr_AmmoDepotItems pushback ["gm_pso1_gry", 40, 1, 3]; //SVD
a3e_arr_AmmoDepotItems pushback ["gm_zvn64_front", 75, 1, 5]; //AKs
a3e_arr_AmmoDepotItems pushback ["gm_zvn64_rear_ak", 75, 1, 5]; //AKs
a3e_arr_AmmoDepotItems pushback ["gm_zfk4x25_blk", 30, 1, 3]; //AK
a3e_arr_AmmoDepotItems pushback ["gm_feroz2x17_pzf44_2_blk", 2, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_feroz2x17_pzf84_blk", 2, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_pgo7v_blk", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_bayonet_6x3_wud", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["gm_bayonet_6x3_blk", 30, 1, 2];
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
a3e_arr_CivilianCarWeapons pushback ["gm_pm_blk", "gm_8Rnd_9x18mm_B_pst_pm_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_pm_blk", "gm_8Rnd_9x18mm_B_pst_pm_blk", 5];
a3e_arr_CivilianCarWeapons pushback ["gm_wz78_blk", "gm_1Rnd_265mm_flare_multi_red_DM23", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_wz78_blk", "gm_1Rnd_265mm_flare_para_yel_DM16", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_wz78_blk", "gm_1Rnd_265mm_flare_multi_nbc_DM47", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_m16a1_blk", "gm_20Rnd_556x45mm_b_M855_stanag_gry", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_mp2a1_blk", "gm_32rnd_9x19mm_b_dm11_mp2_blk", 6];
a3e_arr_CivilianCarWeapons pushback ["gm_rpg7_prp", "gm_1rnd_40mm_heat_pg7v_rpg7", 2];
a3e_arr_CivilianCarWeapons pushback ["gm_mp5a2_blk", "gm_30Rnd_9x19mm_B_DM11_mp5_blk", 6];
//a3e_arr_CivilianCarWeapons pushback ["arifle_MXM_SOS_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 7];
//a3e_arr_CivilianCarWeapons pushback ["arifle_Katiba_C_F", "30Rnd_65x39_caseless_green", 5];
//a3e_arr_CivilianCarWeapons pushback ["arifle_Mk20_GL_ACO_F", "UGL_FlareWhite_F", 8];
//a3e_arr_CivilianCarWeapons pushback ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5];
//a3e_arr_CivilianCarWeapons pushback ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12];
//a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
//a3e_arr_CivilianCarWeapons pushback ["launch_RPG32_F", "RPG32_F", 2];
a3e_arr_CivilianCarWeapons pushback ["MineDetector", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["gm_ge_army_medkit_80", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["gm_repairkit_01", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["gm_df7x40_blk", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "gm_explosive_plnp_charge", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "gm_handgrenade_frag_rgd5", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "gm_smokeshell_wht_dm25", 5];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"gm_zfk4x25_blk"
	,"gm_pso1_gry"
	,"gm_zvn64_rear_ak"];
//	"optic_Aco"
//	"optic_ACO_grn"
//	,"optic_Arco"
//	,"optic_Hamr"
//	,"optic_MRCO"
//	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"gm_zfk4x25_blk"
	,"gm_pso1_gry"];
a3e_arr_NightScopes = [];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [];

//////////////////////////////////////////////////////////////////
// revive/functions/revive/fn_Check_Revive_FAK.sqf and fn_HandleRevive
// additional types of FAKs or Medkits that should work for revives
//////////////////////////////////////////////////////////////////
a3e_arr_faks = [
	"gm_gc_army_gauzeBandage"
	,"gm_gc_army_medkit"
	,"gm_ge_army_burnBandage"
	,"gm_ge_army_gauzeBandage"
	,"gm_ge_army_gauzeCompress"];
a3e_arr_medkits = [
	"gm_ge_army_medkit_80"];

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
	"gm_ge_army_bo105p1m_vbh_swooper"
	,"gm_ge_army_ch53gs"];
a3e_arr_extraction_chopper_escort = [
	"gm_ge_army_bo105p_pah1a1"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"B_Boat_Armed_01_minigun_F"];
a3e_arr_extraction_boat_escort = [
	"B_Boat_Armed_01_minigun_F"];

//////////////////////////////////////////////////////////////////
// RunExtractionLand.sqf
// Cars/APCs that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_car = [
	"gm_ge_army_kat1_451_cargo",	//
	"gm_ge_army_u1300l_cargo",	//
	"gm_ge_army_fuchsa0_command",	//
	"gm_ge_army_m113a1g_apc"];	//
a3e_arr_extraction_car_escort = [
	"gm_ge_army_gepard1a1",
	"gm_ge_army_luchsa2",
	"gm_ge_army_Leopard1a3a2",
	"gm_ge_army_Leopard1a5"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"gm_gc_airforce_l410t"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"gm_pl_airforce_mi2p"
	,"gm_pl_airforce_mi2ch"
	,"gm_pl_airforce_mi2platan"];
a3e_arr_searchChopperHard = [
	"gm_pl_airforce_mi2us"
	,"gm_pl_airforce_mi2urn"
	,"gm_pl_airforce_mi2urp"
	,"gm_pl_airforce_mi2urpg"
	,"gm_pl_airforce_mi2urs"
	,"gm_pl_airforce_mi2platan"];
a3e_arr_searchChopper_pilot = [
	"gm_pl_airforce_pilot_pm_80_gry"];
a3e_arr_searchChopper_crew = [
	"gm_pl_airforce_pilot_pm_80_gry"];

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
a3e_additional_weapon_box_1 = "gm_AmmoBox_2160Rnd_545x39mm_b_t_7t3_ak74";
a3e_additional_weapon_box_2 = "gm_AmmoBox_800Rnd_762x54mmR_b_t_7t2_pk";

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
	"Land_Wreck_Plane_Transport_01_F"
	//,"BlackhawkWreck"
	,"Land_Wreck_Heli_Attack_01_F"];
a3e_arr_CrashSiteCrew = [
	"gm_ge_army_crew_mp2a1_80_oli"
	,"gm_ge_army_crew_mp2a1_80_oli"];
a3e_arr_CrashSiteWrecksCar = [
	"Land_Wreck_HMMWV_F"];
	//,"M113Wreck"];
a3e_arr_CrashSiteCrewCar = [
	"gm_ge_army_rifleman_g3a3_80_ols"
	,"gm_ge_army_squadleader_g3a3_p2a1_80_ols"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["gm_pzf44_2_oli", 15, 1, 2, ["gm_1rnd_44x537mm_heat_dm32_pzf44_2"], 2];
a3e_arr_CrashSiteWeapons pushback ["gm_pzf84_oli", 15, 1, 2, ["gm_1rnd_84x245mm_heat_t_dm22_carlgustaf","gm_1rnd_84x245mm_illum_dm16_carlgustaf"], 2];
a3e_arr_CrashSiteWeapons pushback ["gm_g3a3_oli_feroz24", 20, 1, 2, ["gm_20Rnd_762x51mm_b_DM41_g3_blk"], 8];
a3e_arr_CrashSiteWeapons pushback ["gm_g3a4_oli", 25, 1, 2, ["gm_20rnd_762x51mm_b_t_dm21a2_g3_blk","gm_1rnd_67mm_heat_dm22a1_g3"], 8];
a3e_arr_CrashSiteWeapons pushback ["gm_g3a3_oli", 75, 2, 4, ["gm_20rnd_762x51mm_b_t_dm21a1_g3_blk"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_p2a1_blk", 50, 2, 4, ["gm_1Rnd_265mm_flare_multi_red_gc", "gm_1Rnd_265mm_flare_para_yel_DM16", "gm_1Rnd_265mm_smoke_single_vlt_DM24"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_mp2a1_blk", 30, 1, 2, ["gm_32rnd_9x19mm_b_dm51_mp2_blk"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_mp5a2_blk", 30, 1, 2, ["gm_30Rnd_9x19mm_B_DM11_mp5_blk"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_mp5sd3_blk", 30, 1, 2, ["gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], 6];
a3e_arr_CrashSiteWeapons pushback ["gm_mg3_blk", 25, 1, 2, ["gm_120rnd_762x51mm_b_t_dm21_mg3_grn"], 4];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["gm_feroz24_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_feroz2x17_pzf44_2_blk", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["gm_feroz2x17_pzf84_blk", 20, 1, 3];