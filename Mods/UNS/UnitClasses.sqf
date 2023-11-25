/*
 * Description: This file contains the vehicle types and unit types for the units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

A3E_VAR_Side_Blufor = west;
A3E_VAR_Side_Opfor = east;
A3E_VAR_Side_Ind = resistance;

A3E_VAR_Flag_Opfor = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
A3E_VAR_Flag_Ind = "\A3\Data_F\Flags\flag_fd_green_CO.paa"; // Update 3: Placeholder for Syndikat flag.
 
A3E_VAR_Side_Blufor_Str = format["%1",A3E_VAR_Side_Blufor];// UNS US-Army
A3E_VAR_Side_Opfor_Str = format["%1",A3E_VAR_Side_Opfor];// UNS NVA
A3E_VAR_Side_Ind_Str = format["%1",A3E_VAR_Side_Ind];// UNS Vietcong

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [
	"uns_men_VC_recon_RF1"
	,"uns_men_VC_recon_RF2"
	,"uns_men_VC_recon_RF3"
	,"uns_men_VC_recon_RF4"
	,"uns_men_VC_recon_RF5"
	,"uns_men_VC_recon_RF6"
	,"uns_men_VC_recon_RF7"];

// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons pushback ["uns_bhp","uns_13Rnd_hp"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_coltcmdr","uns_coltcmdrmag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_357m","uns_357mag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_m1911","uns_m1911mag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_m2carbine_shorty_p","uns_m2carbinemag"];
//a3e_arr_PrisonBackpackWeapons pushback ["uns_m79p","uns_1Rnd_BS_M576"]; //doesnt work right now
a3e_arr_PrisonBackpackWeapons pushback ["uns_MX991_m1911_base","uns_m1911mag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_MX991_m1911SD_base","uns_m1911mag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_makarov", "uns_makarovmag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_mat49p", "uns_mat49_20_mag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_nagant_m1895", "uns_nagant_m1895mag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_p64", "uns_6Rnd_czak"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_pm63p", "uns_25Rnd_pm_pa"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_Ruger", "uns_Rugermag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_38spec", "uns_38specmag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_sw_m10", "uns_38specmag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_sa61_p", "uns_20Rnd_sa61_pa"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_APS", "uns_20Rnd_APS"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_tt30", "uns_tokarevmag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_Tt33", "uns_tokarevmag"];
a3e_arr_PrisonBackpackWeapons pushback ["uns_ppk", "uns_38specmag"];

// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [
	"uns_willys_2_arvn"];

// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {//Few (1-3)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"uns_BTR152_DSHK"
		,"uns_Type55"
		,"uns_Type55_RR57"
		,"uns_Type55_RR73"
		,"uns_Type55_MG"
		,"uns_Type55_M40"
		,"uns_Type55_patrol"
		,"uns_Type55_LMG"
		,"uns_Type55_twinMG"
		,"uns_nvatruck"
		,"uns_nvatruck_camo"
		,"uns_nvatruck_mg"
		,"uns_nvatruck_open"
		,"uns_zil157"
		,"uns_BTR152_ZPU"
		,"pook_PU12_NVA"
		,"pook_URAL_UTILITY_NVA"
		,"uns_nvatruck_s60"
		,"uns_nvatruck_type65"
		,"uns_nvatruck_zpu"
		,"uns_nvatruck_zu23"
		,"uns_Type63_amb"
		,"uns_nvatruck_reammo"
		,"uns_nvatruck_refuel"
		,"uns_nvatruck_repair"
		,"uns_Zil157_refuel"
		,"uns_zil157_repair"
		,"uns_Type55_mortar"
		,"pook_ZSU_NVA"
		,"pook_ZSU57_NVA"
		,"uns_Type63_mg"
		,"uns_ot34_85_nva"
		,"uns_t34_85_nva"
		,"uns_t54_nva"
		,"uns_t55_nva"
		,"uns_to55_nva"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"uns_t34_76_vc"];
    };
    case 2: {//Some (4-6)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"uns_BTR152_DSHK"
		,"uns_Type55"
		,"uns_Type55_RR57"
		,"uns_Type55_RR73"
		,"uns_Type55_MG"
		,"uns_Type55_M40"
		,"uns_Type55_patrol"
		,"uns_Type55_LMG"
		,"uns_Type55_twinMG"
		,"uns_nvatruck"
		,"uns_nvatruck_camo"
		,"uns_nvatruck_mg"
		,"uns_nvatruck_open"
		,"uns_zil157"
		,"uns_BTR152_ZPU"
		,"pook_PU12_NVA"
		,"pook_URAL_UTILITY_NVA"
		,"uns_nvatruck_s60"
		,"uns_nvatruck_type65"
		,"uns_nvatruck_zpu"
		,"uns_nvatruck_zu23"
		,"uns_Type63_amb"
		,"uns_nvatruck_reammo"
		,"uns_nvatruck_refuel"
		,"uns_nvatruck_repair"
		,"uns_Zil157_refuel"
		,"uns_zil157_repair"
		,"uns_Type55_mortar"
		,"pook_ZSU_NVA"
		,"pook_ZSU57_NVA"
		,"uns_Type63_mg"
		,"uns_ot34_85_nva"
		,"uns_t34_85_nva"
		,"uns_t54_nva"
		,"uns_t55_nva"
		,"uns_to55_nva"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"uns_t34_76_vc"];
    };
    default {//A lot (7-8)
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
		"uns_BTR152_DSHK"
		,"uns_Type55"
		,"uns_Type55_RR57"
		,"uns_Type55_RR73"
		,"uns_Type55_MG"
		,"uns_Type55_M40"
		,"uns_Type55_patrol"
		,"uns_Type55_LMG"
		,"uns_Type55_twinMG"
		,"uns_nvatruck"
		,"uns_nvatruck_camo"
		,"uns_nvatruck_mg"
		,"uns_nvatruck_open"
		,"uns_zil157"
		,"uns_BTR152_ZPU"
		,"pook_PU12_NVA"
		,"pook_URAL_UTILITY_NVA"
		,"uns_nvatruck_s60"
		,"uns_nvatruck_type65"
		,"uns_nvatruck_zpu"
		,"uns_nvatruck_zu23"
		,"uns_Type63_amb"
		,"uns_nvatruck_reammo"
		,"uns_nvatruck_refuel"
		,"uns_nvatruck_repair"
		,"uns_Zil157_refuel"
		,"uns_zil157_repair"
		,"uns_Type55_mortar"
		,"pook_ZSU_NVA"
		,"pook_ZSU57_NVA"
		,"uns_Type63_mg"
		,"uns_ot34_85_nva"
		,"uns_t34_85_nva"
		,"uns_t54_nva"
		,"uns_t55_nva"
		,"uns_to55_nva"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [
		"uns_t34_76_vc"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [
	"uns_men_NVA_65_AA"
	,"uns_men_NVA_65_AT"
	,"uns_men_NVA_65_AT2"
	,"uns_men_NVA_65_AS5"
	,"uns_men_NVA_65_AS8"
	,"uns_men_NVA_65_AS6"
	,"uns_men_NVA_65_AS2"
	,"uns_men_NVA_65_AS7"
	,"uns_men_NVA_65_AS4"
	,"uns_men_NVA_65_AS1"
	,"uns_men_NVA_65_AS3"
	,"uns_men_NVA_65_LMG"
	,"uns_men_NVA_65_COM"
	,"uns_men_NVA_65_MGS"
	,"uns_men_NVA_65_MGAAS"
	,"uns_men_NVA_65_HMG"
	,"uns_men_NVA_65_MED"
	,"uns_men_NVA_65_MED"
	,"uns_men_NVA_65_MED"
	,"uns_men_NVA_65_MTS"
	,"uns_men_NVA_65_nco"
	,"uns_men_NVA_65_off"
	,"uns_men_NVA_65_RTO"
	,"uns_men_NVA_65_RF2"
	,"uns_men_NVA_65_RF3"
	,"uns_men_NVA_65_RF1"
	,"uns_men_NVA_65_SAP"
	,"uns_men_NVA_65_SAP"
	,"uns_men_NVA_65_SAP"
	,"uns_men_NVA_65_SLT"
	,"uns_men_NVA_65_MRK"
	,"uns_men_NVA_65_TRI"];
a3e_arr_Escape_InfantryTypes_Ind = [
	"uns_men_VC_recon_RF1"
	,"uns_men_VC_recon_RF2"
	,"uns_men_VC_recon_RF3"
	,"uns_men_VC_recon_RF4"
	,"uns_men_VC_recon_RF5"
	,"uns_men_VC_recon_RF6"
	,"uns_men_VC_recon_RF7"
	,"uns_men_VC_recon_AT"
	,"uns_men_VC_recon_AS1"
	,"uns_men_VC_recon_AS2"
	,"uns_men_VC_recon_AS3"
	,"uns_men_VC_recon_AS4"
	,"uns_men_VC_recon_AS5"
	,"uns_men_VC_recon_AS6"
	,"uns_men_VC_recon_LMG"
	,"uns_men_VC_recon_HMG"
	,"uns_men_VC_recon_MGS"
	,"uns_men_VC_recon_MED"
	,"uns_men_VC_recon_MED"
	,"uns_men_VC_recon_MTS"
	,"uns_men_VC_recon_nco"
	,"uns_men_VC_recon_off"
	,"uns_men_VC_recon_RTO"
	,"uns_men_VC_recon_SAP"
	,"uns_men_VC_recon_SAP2"
	,"uns_men_VC_recon_MRK"
	,"uns_men_VC_recon_MRK2"
	,"uns_men_VC_recon_TRI"];
a3e_arr_recon_InfantryTypes = [
	"uns_men_NVA_daccong_ACR"
	,"uns_men_NVA_daccong_AA1"
	,"uns_men_NVA_daccong_AT2"
	,"uns_men_NVA_daccong_AT3"
	,"uns_men_NVA_daccong_AT"
	,"uns_men_NVA_daccong_AS6"
	,"uns_men_NVA_daccong_AS3"
	,"uns_men_NVA_daccong_AS2"
	,"uns_men_NVA_daccong_AS1"
	,"uns_men_NVA_daccong_AS5"
	,"uns_men_NVA_daccong_AS4"
	,"uns_men_NVA_daccong_LMG"
	,"uns_men_NVA_daccong_COM"
	,"uns_men_NVA_daccong_cov2"
	,"uns_men_NVA_daccong_cov3"
	,"uns_men_NVA_daccong_cov1"
	,"uns_men_NVA_daccong_cov6"
	,"uns_men_NVA_daccong_cov5"
	,"uns_men_NVA_daccong_cov7"
	,"uns_men_NVA_daccong_cov4"
	,"uns_men_NVA_daccong_MGS"
	,"uns_men_NVA_daccong_HMG"
	,"uns_men_NVA_daccong_MED"
	,"uns_men_NVA_daccong_MED"
	,"uns_men_NVA_daccong_MTS"
	,"uns_men_NVA_daccong_nco"
	,"uns_men_NVA_daccong_off"
	,"uns_men_NVA_daccong_RTO"
	,"uns_men_NVA_daccong_SAP2"
	,"uns_men_NVA_daccong_SAP1"
	,"uns_men_NVA_daccong_MRK"
	,"uns_men_NVA_daccong_TRI"];
a3e_arr_recon_I_InfantryTypes = [
	"uns_men_VC_mainforce_68_AT"
	,"uns_men_VC_mainforce_68_AT2"
	,"uns_men_VC_mainforce_68_AS1"
	,"uns_men_VC_mainforce_68_AS5"
	,"uns_men_VC_mainforce_68_AS3"
	,"uns_men_VC_mainforce_68_AS2"
	,"uns_men_VC_mainforce_68_AS4"
	,"uns_men_VC_mainforce_68_LMG"
	,"uns_men_VC_mainforce_68_COM"
	,"uns_men_VC_mainforce_68_MGS"
	,"uns_men_VC_mainforce_68_HMG"
	,"uns_men_VC_mainforce_68_MED"
	,"uns_men_VC_mainforce_68_MED"
	,"uns_men_VC_mainforce_68_MTS"
	,"uns_men_VC_mainforce_68_nco"
	,"uns_men_VC_mainforce_68_off"
	,"uns_men_VC_mainforce_68_RTO"
	,"uns_men_VC_mainforce_68_RF1"
	,"uns_men_VC_mainforce_68_RF4"
	,"uns_men_VC_mainforce_68_RF3"
	,"uns_men_VC_mainforce_68_RF5"
	,"uns_men_VC_mainforce_68_RF2"
	,"uns_men_VC_mainforce_68_SAP"
	,"uns_men_VC_mainforce_68_MRK"
	,"uns_men_VC_mainforce_68_TRI"
	,"uns_men_VC_mainforce_68_Ra1"
	,"uns_men_VC_mainforce_68_Ra2"
	,"uns_men_VC_mainforce_68_Rmed"
	,"uns_men_VC_mainforce_68_Rmg"
	,"uns_men_VC_mainforce_68_Roff"
	,"uns_men_VC_mainforce_68_Rmrk"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [
	"uns_nvatruck_mg"
	,"uns_Type55_LMG"
	,"uns_Type55_MG"
	,"uns_Type55_twinMG"
	,"uns_Type63_mg"
	,"uns_BTR152_DSHK"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [
	"uns_t34_76_vc"
	,"uns_dshk_high_VC"
	,"uns_dshk_twin_VC"
	,"uns_SPG9_73mm_VC"
	,"uns_Type36_57mm_VC"
	,"uns_M40_106mm_VC"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [
	"uns_nvatruck_open"
	,"uns_nvatruck_mg"
	,"uns_nvatruck"
	,"uns_nvatruck_camo"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [
	"uns_nvatruck_open"];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [
	"uns_BTR152_DSHK"
	,"uns_Type55_MG"
	,"uns_Type63_mg"];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [
	"uns_Type63_mg"
	,"uns_BTR152_DSHK"
	,"uns_Type55_M40"
	,"uns_Type55_twinMG"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [
	"uns_ot34_85_nva"
	,"uns_t34_85_nva"
	,"uns_t54_nva"
	,"uns_t55_nva"
	,"uns_to55_nva"
	,"pook_ZSU_NVA"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [
	"uns_dshk_high_NVA"
	,"uns_dshk_twin_NVA"
	,"uns_pk_high_NVA"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [
	"uns_Type63_amb"
	,"uns_nvatruck_reammo"
	,"uns_nvatruck_refuel"
	,"uns_nvatruck_repair"
	,"uns_Zil157_refuel"
	,"uns_zil157_repair"
	,"pook_URAL_UTILITY_NVA"
	,"uns_nvatruck"
	,"uns_nvatruck_type65"
	,"uns_nvatruck_open"
	,"uns_nvatruck_mg"
	,"uns_Type55"
	,"uns_Type55_LMG"
	,"uns_Type55_twinMG"
	,"uns_BTR152_DSHK"
	,"uns_Type63_mg"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [
	"uns_willys_2_arvn"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [
	"uns_dshk_armoured_NVA"
	,"uns_dshk_high_NVA"
	,"uns_dshk_low_NVA"
	,"uns_dshk_twin_NVA"
	,"uns_dshk_wheeled_NVA"
	,"uns_M40_106mm_NVA"
	,"uns_mg42_low_NVA"
	,"uns_pk_high_NVA"
	,"uns_pk_low_NVA"
	,"uns_SPG9_73mm_NVA"
	,"uns_spiderhole_NVA"
	,"uns_spiderhole_leanto_NVA"
	,"uns_Type36_57mm_NVA"
	,"uns_Type74_NVA"
	,"uns_ZPU4_NVA"
	,"pook_ZU23_NVA"
	,"uns_ZU23_NVA"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [
	"uns_Type63_amb"
	,"uns_nvatruck_reammo"
	,"uns_nvatruck_refuel"
	,"uns_nvatruck_repair"
	,"uns_Zil157_refuel"
	,"uns_zil157_repair"
	,"pook_URAL_UTILITY_NVA"
	,"uns_nvatruck"
	,"uns_nvatruck_type65"
	,"uns_nvatruck_open"
	,"uns_nvatruck_mg"
	,"uns_Type55"
	,"uns_Type55_LMG"
	,"uns_Type55_twinMG"
	,"uns_BTR152_DSHK"
	,"uns_Type63_mg"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [
	"uns_Mi8TV_VPAF_MG"
	,"uns_Mi8TV_VPAF_MG"
	,"uns_an2_cas"];
a3e_arr_O_transport_heli = [
	"uns_Mi8T_VPAF"
	,"uns_Mi8TV_VPAF_MG"];
a3e_arr_O_pilots = [
	"uns_nvaf_pilot2"];
a3e_arr_I_transport_heli = [
	"uns_Mi8T_VPAF"];
a3e_arr_I_pilots = [
	"uns_nvaf_pilot2"];


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
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_nagant_m1895", 50, 4, 8, ["uns_nagant_m1895mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_mat49", 50, 4, 8, ["uns_mat49mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_ak47", 100, 2, 4, ["uns_ak47mag", "uns_ak47mag_T"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_aks47", 75, 2, 4, ["uns_ak47mag_T"], 4];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_akms_drum", 50, 2, 4, ["uns_75Rnd_akdr"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_type99", 50, 2, 4, ["uns_type99mag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_type99_gl", 50, 2, 4, ["uns_type99mag", "Uns_1Rnd_30mm_FRAG"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_sks", 50, 2, 4, ["uns_sksmag"], 10];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_m45", 10, 1, 2, ["uns_m45mag", "uns_m45mag_T"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_thompsonvc", 30, 1, 2, ["uns_thompsonmag_20", "uns_thompsonmag_30"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_t233", 20, 1, 2, ["uns_40Rnd_556x45_t223"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_k50m", 20, 1, 3, ["uns_k50mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_k50mdrum", 20, 1, 2, ["uns_ppshmag_T"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_l2a1", 20, 1, 2, ["uns_l1a1mag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_smle", 20, 1, 2, ["uns_smlemag"], 10];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_m1garand", 10, 2, 4, ["uns_m1garandmag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_m50", 10, 2, 4, ["uns_m50mag"], 6];

// Weapons and ammo in the special weapons box
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons = [];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_mg42", 50, 2, 4, ["uns_50Rnd_792x57_Mg42"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_PK", 50, 2, 4, ["uns_100Rnd_762x54_PK"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_type50", 50, 2, 4, ["uns_ppshmag", "uns_k50mag"], 5];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_DP28_base", 50, 2, 4, ["uns_47Rnd_DP28"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_rpd", 20, 2, 4, ["uns_rpdmag"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_STG_44", 20, 2, 4, ["uns_30Rnd_kurtz_stg"], 6];
a3e_arr_AmmoDepotBasicWeapons pushback ["uns_svd_base", 40, 1, 2, ["uns_svdmag"], 6];

// non-CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_mas36", 20, 2, 4, ["uns_mas36mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_mas36_gl", 20, 2, 4, ["uns_mas36mag"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_kar98k", 20, 2, 4, ["uns_kar98kmag"], 12];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_mg42_bakelite", 20, 1, 1, ["uns_250Rnd_792x57_Mg42"], 4];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_type100", 20, 2, 4, ["uns_type100_T"], 6];
a3e_arr_AmmoDepotSpecialWeapons pushback ["uns_ukvz59", 20, 2, 4, ["uns_100Rnd_762x54_ukvz59"], 6];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["uns_rpg2", 50, 3, 5, ["uns_rpg2grenade"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["uns_rpg7", 50, 1, 2, ["uns_rpg7grenade"], 3];
a3e_arr_AmmoDepotLaunchers pushback ["uns_sa7", 50, 1, 2, ["uns_sa7mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["uns_sa7b", 50, 1, 3, ["uns_sa7bmag"], 2];
// non-CSAT weapons
a3e_arr_AmmoDepotLaunchers pushback ["uns_m20_bazooka", 20, 1, 2, ["uns_M28A2_mag","uns_M30_smoke_mag"], 2];
a3e_arr_AmmoDepotLaunchers pushback ["uns_m72", 40, 1, 3, ["uns_m72rocket"], 1];
a3e_arr_AmmoDepotLaunchers pushback ["uns_m127a1_flare", 100, 1, 3, ["uns_1Rnd_M127_mag"], 5];
a3e_arr_AmmoDepotLaunchers pushback ["uns_B40", 100, 1, 1, ["uns_B40grenade"], 3];
//a3e_arr_AmmoDepotLaunchers pushback ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["uns_M118_mag_remote", "PipeBomb"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["uns_mine_AP_mag", "uns_mine_AV_mag", "uns_traps_nade_mag2"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["uns_traps_claymore_mag", "uns_traps_flare_mag"], 5];
a3e_arr_AmmoDepotOrdnance pushback [objNull, 30, 1, 1, ["uns_mine_beer_mag"], 5];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["uns_f1gren", "uns_rdg2"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["uns_m18white", "uns_m18Yellow", "uns_m18red", "uns_m18Green", "uns_m18Purple", "uns_m18Blue", "uns_m18Orange"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["uns_molotov_mag"], 50];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["uns_1Rnd_Smoke_40mm", "uns_1Rnd_SmokeRed_40mm", "uns_1Rnd_SmokeGreen_40mm", "uns_1Rnd_SmokeYellow_40mm", "uns_40mm_white", "uns_40mm_green", "uns_40mm_red", "uns_40mm_yellow"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["uns_1Rnd_Smoke_MKV", "uns_1Rnd_SmokeRed_MKV", "uns_1Rnd_SmokeGreen_MKV", "uns_1Rnd_SmokeYellow_MKV"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 50, 1, 1, ["uns_40mm_mkv_White", "uns_40mm_mkv_Red", "uns_40mm_mkv_Green", "uns_40mm_mkv_Yellow"], 25];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["uns_1Rnd_AB_M397", "Uns_1Rnd_HE_M406", "Uns_1Rnd_HE_M381", "uns_m406vest", "uns_molotov_mag"], 5];
a3e_arr_AmmoDepotVehicle pushback [objNull, 10, 1, 1, ["uns_1Rnd_BS_M576", "uns_1Rnd_HEDP_M433"], 5];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems pushback ["ToolKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["Medikit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["UNS_TrapKit", 20, 1, 1, [], 0];
a3e_arr_AmmoDepotVehicleItems pushback ["FirstAidKit", 100, 10, 50, [], 0];
a3e_arr_AmmoDepotVehicleBackpacks = ["UNS_NVA_R3"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems pushback ["uns_binocular_navy", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["uns_ANPVS2", 10, 1, 3];
};
a3e_arr_AmmoDepotItems pushback ["uns_binocular_army", 50, 2, 3, [], 0];
a3e_arr_AmmoDepotItems pushback ["ItemCompass", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemGPS", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["ItemMap", 50, 1, 3];
a3e_arr_AmmoDepotItems pushback ["ItemRadio", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["ItemWatch", 50, 1, 10];
a3e_arr_AmmoDepotItems pushback ["uns_b_6H3", 50, 1, 5];
a3e_arr_AmmoDepotItems pushback ["uns_s_PBS1", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_b_spike", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_b_type30", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_o_Akatihi4x", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_bp_DP28", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_b_mas49", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_o_smle_3x", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["b_smle_1937", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_b_m4", 10, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_o_M84", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_s_M14", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_b_m6", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_o_LeatherwoodART_m14", 20, 1, 3];
a3e_arr_AmmoDepotItems pushback ["uns_s_M45", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_o_M84", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_o_zf41", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_o_Unertl8x", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_o_PU", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_o_PSO1", 30, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_o_PSO1_camo", 10, 1, 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems pushback ["uns_o_ANPVS2_M16", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["uns_o_ANPVS2", 10, 1, 1];
	a3e_arr_AmmoDepotItems pushback ["uns_o_ANPVS2_M14", 10, 1, 2];
};
a3e_arr_AmmoDepotItems pushback ["uns_o_Unertl8x_m70", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_o_RedfieldART", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["UNS_ItemRadio_T_884", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["UNS_Ear", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_s_Sten", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_bp_M60", 10, 1, 2];
a3e_arr_AmmoDepotItems pushback ["uns_bp_DP28", 40, 1, 2];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons pushback ["uns_357m", "uns_357mag", 5];
a3e_arr_CivilianCarWeapons pushback ["uns_tt30", "uns_tokarevmag", 5];
a3e_arr_CivilianCarWeapons pushback ["uns_sten", "uns_stenmag", 5];
a3e_arr_CivilianCarWeapons pushback ["uns_model70_iron", "uns_model70mag", 12];
a3e_arr_CivilianCarWeapons pushback ["uns_ak47_49", "uns_ak47mag", 6];
a3e_arr_CivilianCarWeapons pushback ["uns_aks47f", "uns_ak47mag", 6];
a3e_arr_CivilianCarWeapons pushback ["uns_baikal", "uns_12gaugemag_2", 6];
a3e_arr_CivilianCarWeapons pushback ["uns_baikal_sawnoff", "uns_12gaugemag_2", 6];
a3e_arr_CivilianCarWeapons pushback ["uns_rpg2", "uns_rpg2grenade", 2];
//a3e_arr_CivilianCarWeapons pushback ["arifle_MXM_SOS_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 7];
//a3e_arr_CivilianCarWeapons pushback ["arifle_Katiba_C_F", "30Rnd_65x39_caseless_green", 5];
//a3e_arr_CivilianCarWeapons pushback ["arifle_Mk20_GL_ACO_F", "UGL_FlareWhite_F", 8];
//a3e_arr_CivilianCarWeapons pushback ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5];
//a3e_arr_CivilianCarWeapons pushback ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12];
//a3e_arr_CivilianCarWeapons pushback ["srifle_DMR_06_camo_khs_F", "20Rnd_762x51_Mag", 8];
//a3e_arr_CivilianCarWeapons pushback ["launch_RPG32_F", "RPG32_F", 2];
//a3e_arr_CivilianCarWeapons pushback ["Medikit", objNull, 0];
//a3e_arr_CivilianCarWeapons pushback ["Toolkit", objNull, 0];
a3e_arr_CivilianCarWeapons pushback ["uns_binocular_army", objNull, 0];
a3e_arr_CivilianCarWeapons pushback [objNull, "uns_mine_cigs_mag", 2];
a3e_arr_CivilianCarWeapons pushback [objNull, "uns_molotov_mag", 5];
a3e_arr_CivilianCarWeapons pushback [objNull, "uns_rdg3", 5];

// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [
	"uns_o_colt4x"
	,"uns_o_LeatherwoodART_m16"];
//	"optic_Aco"
//	"optic_ACO_grn"
//	,"optic_Arco"
//	,"optic_Hamr"
//	,"optic_MRCO"
//	,"optic_Holosight"];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [
	"uns_o_Akatihi4x"
	,"uns_o_smle_3x"
	,"uns_o_M84"
	,"uns_o_LeatherwoodART_m14"
	,"uns_o_Unertl8x"
	,"uns_o_APXSOM"
	,"uns_o_zf41"
	,"uns_o_PU"
	,"uns_o_RedfieldART"
	,"uns_o_PSO1"
	,"uns_o_PSO1_camo"
	,"uns_o_Unertl8x_m70"];
a3e_arr_NightScopes = [
	"uns_o_ANPVS2_M14"
	,"uns_o_ANPVS2_M16"
	,"uns_o_ANPVS2"];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [
	"uns_bp_DP28"
	,"uns_bp_M60"];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [
	"uns_ch34_army"
	,"uns_ch34_army_M60"
	,"uns_ch47_m60_army"
	,"uns_UH1D_m60"
	,"uns_UH1H_m60"
	,"uns_h21c_mg"
	,"uns_h21c"];
a3e_arr_extraction_chopper_escort = [
	"UNS_AH1G"
	,"UNS_AH1G_M195"
	,"UNS_AH1G_M200"
	,"UNS_AH1G_SUU11"
	,"uns_ach47_m134"
	,"uns_ach47_m200"
	,"uns_oh6_m27r"
	,"uns_UH1C_M21_M200_1AC"
	,"uns_UH1C_M21_M158"
	,"uns_UH1C_M21_M200"];

//////////////////////////////////////////////////////////////////
// RunExtractionBoat.sqf
// Boats that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_boat = [
	"uns_pbr"
	,"uns_pbr_mk18"
	,"uns_PBR_M10"];
a3e_arr_extraction_boat_escort = [
	"uns_pbr"
	,"uns_pbr_mk18"
	,"uns_PBR_M10"];
	
//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [
	"uns_an2"
	,"uns_an2_bmb"
	,"uns_an2_cas"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [
	"uns_Mi8T_VPAF"];
a3e_arr_searchChopperHard = [
	"uns_Mi8TV_VPAF_MG"];
a3e_arr_searchChopper_pilot = [
	"uns_nvaf_pilot2"];
a3e_arr_searchChopper_crew = [
	"uns_nvaf_pilot5"];

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
	"UNS_ASSAULT_BOAT_NVA"
	,"UNS_ASSAULT_BOAT_VC"
	,"UNS_PATROL_BOAT_NVA"
	,"UNS_PATROL_BOAT_VC"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "uns_resupply_crate_NVA";
a3e_additional_weapon_box_2 = "uns_HiddenAmmoBox";

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [
	"uns_m1941_82mm_mortarNVA_arty"
	,"uns_m1941_82mm_mortarNVA_pvp"
	,"uns_m1941_82mm_mortarNVA"];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [
	"uns_an2_cas"
	,"uns_Mig21_BMB"
	,"uns_Mig21_CAP"
	,"uns_Mig21_CAS"
	,"uns_Mig21_HCAS"];

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
	"uns_a1j_Wreck"
	,"uns_a3b_Wreck"
	,"uns_A4_Wreck"
	,"uns_A6_Wreck"
	,"uns_A7_wreck"
	,"uns_ah1g_Wreck"
	,"uns_c1a_wreck"
	,"uns_ch47_wreck"
	,"uns_E2A_Wreck"
	,"uns_f100_Wreck"
	,"UNS_F111_wreck"
	,"uns_h21c_wreck"
	,"OH6_Wreck"
	,"uns_oh6_wreck"
	,"uns_uh1c_wreck"
	,"UH1_Wreck"
	,"uns_uh1d_wreck"
	,"uns_uh1_Wreck"
	,"uns_uh1h_wreck"];
a3e_arr_CrashSiteCrew = [
	"uns_heli_pilot_base"
	,"uns_pilot12"
	,"uns_pilot6"
	,"uns_pilot2"
	,"uns_pilot10"
	,"uns_pilot4"
	,"uns_pilot13"
	,"uns_pilN1"
	,"uns_pil1"
	,"uns_pilot19"
	,"uns_pilot20"];
a3e_arr_CrashSiteWrecksCar = [
	"m113ruin2"];
a3e_arr_CrashSiteCrewCar = [
	"uns_US_2MI_DRV"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons pushback ["uns_m72", 40, 1, 2, ["uns_m72rocket"], 1];
a3e_arr_CrashSiteWeapons pushback ["uns_m20_bazooka", 20, 1, 2, ["uns_M28A2_mag","uns_M30_smoke_mag"], 2];
if(A3E_Param_NoNightvision==0) then {
	a3e_arr_CrashSiteWeapons pushback ["uns_m3carbine", 10, 1, 2, ["uns_m2carbinemag"], 8];
};
a3e_arr_CrashSiteWeapons pushback ["uns_m1carbine_pouch", 75, 1, 2, ["uns_m1carbinemag"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_m16_camo", 60, 1, 2, ["uns_20Rnd_556x45_Stanag"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_M16A1_HBAR", 60, 1, 2, ["uns_30Rnd_556x45_Stanag_T"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_M16_dm", 60, 1, 2, ["uns_20Rnd_556x45_Stanag_T"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_m14", 40, 2, 4, ["uns_m14mag"], 6];
a3e_arr_CrashSiteWeapons pushback ["uns_m1garand", 40, 2, 4, ["uns_m1garandmag"], 6];
a3e_arr_CrashSiteWeapons pushback ["uns_m1897", 50, 2, 4, ["uns_12gaugemag_6", "uns_12gaugemag_6f"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_bar", 20, 1, 2, ["uns_barmag"], 12];
a3e_arr_CrashSiteWeapons pushback ["uns_m1919a6", 10, 1, 2, ["uns_100Rnd_m1919"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_m79p", 10, 1, 2, ["Uns_1Rnd_HE_M381","uns_1Rnd_BS_M576","uns_1Rnd_HEDP_M433"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_m60grip", 10, 1, 2, ["uns_m60mag"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_xm177e2_short", 10, 1, 2, ["uns_30Rnd_556x45_Stanag_T"], 8];
a3e_arr_CrashSiteWeapons pushback ["uns_M40_base", 10, 1, 2, ["uns_m40mag"], 12];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems pushback ["uns_o_colt4x", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["uns_o_LeatherwoodART_m16", 30, 1, 3];
a3e_arr_CrashSiteItems pushback ["uns_o_M84", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["uns_o_LeatherwoodART_m14", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["uns_s_M16", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["uns_s_M14", 20, 1, 3];
a3e_arr_CrashSiteItems pushback ["uns_o_RedfieldART", 20, 1, 3];