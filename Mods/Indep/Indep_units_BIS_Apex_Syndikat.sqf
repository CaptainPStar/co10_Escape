/*
 * Description: This file contains the infantry unit types for the units spawned in the mission for the independent side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\flag_fd_green_CO.paa"; // Update 3: Placeholder for Syndikat flag.
 
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes pushback "I_C_Soldier_Bandit_3_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_C_Soldier_Bandit_6_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_C_Soldier_Bandit_5_F";
	a3e_arr_Escape_StartPositionGuardTypes pushback "I_C_Soldier_Bandit_1_F";

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_8_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_8_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_7_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_5_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_5_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_4_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_1_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_1_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_1_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_2_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_2_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_2_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_2_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_3_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_3_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_3_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_8_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_8_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_6_F";
	a3e_arr_Escape_InfantryTypes_Ind pushback "I_C_Soldier_Bandit_6_F";
a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_1_F";
	a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_2_F";
	a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_3_F";
	a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_4_F";
	a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_5_F";
	a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_6_F";
	a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_7_F";
	a3e_arr_recon_I_InfantryTypes pushback "I_C_Soldier_Para_8_F";

//Random array. Types of helicopters to spawn
a3e_arr_I_pilots pushback "I_C_Soldier_Bandit_4_F";
	a3e_arr_I_pilots pushback "I_C_Soldier_Bandit_5_F";

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopper_pilot pushback "O_T_Helipilot_F";
a3e_arr_searchChopper_crew pushback	"O_T_Helicrew_F";