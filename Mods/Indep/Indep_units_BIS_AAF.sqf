/*
 * Description: This file contains the infantry unit types for the units spawned in the mission for the independent side.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\Flag_AAF_CO.paa";
 
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes pushback "I_Soldier_AR_F";
a3e_arr_Escape_StartPositionGuardTypes pushback "I_Soldier_GL_F";
a3e_arr_Escape_StartPositionGuardTypes pushback "I_Soldier_F";
a3e_arr_Escape_StartPositionGuardTypes pushback "I_Soldier_lite_F";


// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes_Ind pushback "I_engineer_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_engineer_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_engineer_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_medic_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_medic_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_medic_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_A_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_A_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_A_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AA_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AA_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AR_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AR_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AR_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AT_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_exp_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_exp_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_exp_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_GL_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_GL_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_GL_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_LAT_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_LAT_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_lite_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_lite_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_lite_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_M_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_M_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_M_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_repair_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_repair_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_officer_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_officer_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_UAV_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_soldier_UAV_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AAR_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_support_AMG_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_support_AMort_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AAA_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_Soldier_AAT_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_support_GMG_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_support_MG_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_support_Mort_F";
a3e_arr_Escape_InfantryTypes_Ind pushback "I_G_Sharpshooter_F";

a3e_arr_recon_I_InfantryTypes pushback "I_Soldier_exp_F";
a3e_arr_recon_I_InfantryTypes pushback "I_Soldier_GL_F";
a3e_arr_recon_I_InfantryTypes pushback "I_Soldier_AR_F";
a3e_arr_recon_I_InfantryTypes pushback "I_medic_F";
a3e_arr_recon_I_InfantryTypes pushback "I_Soldier_lite_F";
a3e_arr_recon_I_InfantryTypes pushback "I_Soldier_LAT_F";
a3e_arr_recon_I_InfantryTypes pushback "I_officer_F";

//Random array. Types of helicopters to spawn
a3e_arr_I_pilots pushback "I_helipilot_F";
a3e_arr_I_pilots pushback "I_helicrew_F";


//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopper_pilot pushback "I_helipilot_F";
a3e_arr_searchChopper_crew pushback "I_helicrew_F";