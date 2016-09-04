/*
 * Description: This file contains the infantry unit types for the units spawned in the mission for the enemy side (east or west).
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

A3E_VAR_Side_Opfor = east;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
 
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];


// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes pushback "O_T_Engineer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Engineer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Engineer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Medic_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Medic_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Medic_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_A_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_A_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_A_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AA_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AA_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_exp_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_exp_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_GL_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_GL_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_GL_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_LAT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_LAT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_M_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_M_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_M_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_Repair_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_Repair_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Officer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Officer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_UAV_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_UAV_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AAR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Support_AMG_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Support_AMort_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AAA_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_AAT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Support_GMG_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Support_MG_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Support_Mort_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_M_F"; // Used to be sharpshooter
	a3e_arr_Escape_InfantryTypes pushback "O_T_Recon_F";
	a3e_arr_Escape_InfantryTypes pushback "O_T_Soldier_M_F"; // Used to be heavy gunner

a3e_arr_recon_InfantryTypes pushback "O_V_Soldier_Exp_ghex_F";
	a3e_arr_recon_InfantryTypes pushback "O_V_Soldier_JTAC_ghex_F";
	a3e_arr_recon_InfantryTypes pushback "O_V_Soldier_M_ghex_F";
	a3e_arr_recon_InfantryTypes pushback "O_V_Soldier_ghex_F";
	a3e_arr_recon_InfantryTypes pushback "O_V_Soldier_Medic_ghex_F";
	a3e_arr_recon_InfantryTypes pushback "O_V_Soldier_LAT_ghex_F";
	a3e_arr_recon_InfantryTypes pushback "O_V_Soldier_TL_ghex_F";

//Random array. Types of helicopters to spawn

a3e_arr_O_pilots pushback "O_T_Helipilot_F";
a3e_arr_O_pilots pushback "O_T_Helicrew_F";
