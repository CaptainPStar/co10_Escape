/*
 * Description: This file contains the infantry unit types for the units spawned in the mission on the enemy side (east or west).
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

A3E_VAR_Side_Opfor = east;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";

A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];


// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
	a3e_arr_Escape_InfantryTypes pushback "O_engineer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_engineer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_engineer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_medic_F";
	a3e_arr_Escape_InfantryTypes pushback "O_medic_F";
	a3e_arr_Escape_InfantryTypes pushback "O_medic_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_A_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_A_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_A_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AA_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AA_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_exp_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_exp_F";
	a3e_arr_Escape_InfantryTypes pushback "O_soldier_F";
	a3e_arr_Escape_InfantryTypes pushback "O_soldier_F";
	a3e_arr_Escape_InfantryTypes pushback "O_soldier_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_GL_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_GL_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_GL_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_LAT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_LAT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_lite_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_lite_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_lite_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_M_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_M_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_M_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_repair_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_repair_F";
	a3e_arr_Escape_InfantryTypes pushback "O_officer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_officer_F";
	a3e_arr_Escape_InfantryTypes pushback "O_soldier_UAV_F";
	a3e_arr_Escape_InfantryTypes pushback "O_soldier_UAV_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AAR_F";
	a3e_arr_Escape_InfantryTypes pushback "O_support_AMG_F";
	a3e_arr_Escape_InfantryTypes pushback "O_support_AMort_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AAA_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Soldier_AAT_F";
	a3e_arr_Escape_InfantryTypes pushback "O_support_GMG_F";
	a3e_arr_Escape_InfantryTypes pushback "O_support_MG_F";
	a3e_arr_Escape_InfantryTypes pushback "O_support_Mort_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Sharpshooter_F";
	a3e_arr_Escape_InfantryTypes pushback "O_Pathfinder_F";
	a3e_arr_Escape_InfantryTypes pushback "O_HeavyGunner_F";
	a3e_arr_Escape_InfantryTypes pushback "O_G_Sharpshooter_F";
	
a3e_arr_recon_InfantryTypes pushback "O_recon_exp_F";
	a3e_arr_recon_InfantryTypes pushback "O_recon_JTAC_F";
	a3e_arr_recon_InfantryTypes pushback "O_recon_M_F";
	a3e_arr_recon_InfantryTypes pushback "O_recon_medic_F";
	a3e_arr_recon_InfantryTypes pushback "O_recon_F";
	a3e_arr_recon_InfantryTypes pushback "O_recon_LAT_F";
	a3e_arr_recon_InfantryTypes pushback "O_recon_TL_F";


//Random array. Types of helicopters to spawn
a3e_arr_O_pilots pushback "O_Pilot_F";
a3e_arr_O_pilots pushback "O_helicrew_F";

