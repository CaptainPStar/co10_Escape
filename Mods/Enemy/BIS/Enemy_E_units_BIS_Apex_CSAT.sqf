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
a3e_arr_Escape_InfantryTypes append [
	"O_T_Engineer_F"
	,"O_T_Engineer_F"
	,"O_T_Engineer_F"
	,"O_T_Medic_F"
	,"O_T_Medic_F"
	,"O_T_Medic_F"
	,"O_T_Soldier_A_F"
	,"O_T_Soldier_A_F"
	,"O_T_Soldier_A_F"
	,"O_T_Soldier_AA_F"
	,"O_T_Soldier_AA_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AR_F"
	,"O_T_Soldier_AT_F"
	,"O_T_Soldier_AT_F"
	,"O_T_Soldier_exp_F"
	,"O_T_Soldier_exp_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_GL_F"
	,"O_T_Soldier_LAT_F"
	,"O_T_Soldier_LAT_F"
	,"O_T_Soldier_M_F"
	,"O_T_Soldier_M_F"
	,"O_T_Soldier_M_F"
	,"O_T_Soldier_Repair_F"
	,"O_T_Soldier_Repair_F"
	,"O_T_Officer_F"
	,"O_T_Officer_F"
	,"O_T_Soldier_UAV_F"
	,"O_T_Soldier_UAV_F"
	,"O_T_Soldier_AAR_F"
	,"O_T_Support_AMG_F"
	,"O_T_Support_AMort_F"
	,"O_T_Soldier_AAA_F"
	,"O_T_Soldier_AAT_F"
	,"O_T_Support_GMG_F"
	,"O_T_Support_MG_F"
	,"O_T_Support_Mort_F"
	,"O_T_Soldier_M_F"// Used to be sharpshooter
	,"O_T_Recon_F"
	,"O_T_Soldier_M_F"// Used to be heavy gunner
	];
a3e_arr_recon_InfantryTypes append [
	"O_V_Soldier_Exp_ghex_F"
	,"O_V_Soldier_JTAC_ghex_F"
	,"O_V_Soldier_M_ghex_F"
	,"O_V_Soldier_ghex_F"
	,"O_V_Soldier_Medic_ghex_F"
	,"O_V_Soldier_LAT_ghex_F"
	,"O_V_Soldier_TL_ghex_F"
	];

//Random array. Types of helicopters to spawn

a3e_arr_O_pilots append [
	"O_T_Helipilot_F"
	,"O_T_Helicrew_F"
	];