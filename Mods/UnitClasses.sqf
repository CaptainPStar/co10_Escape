/*
 * Description: This file contains the array declarations for vehicle types and unit types for all units spawned in the mission, and the weapons and magazines found in ammo boxes/cars.
 * All classnames are now separated into files for nits/vehicles/weapons for each side
 * Change the INCLUDE part in this file to choose which ones to use
 * This allows easier mixing of factions (RHS for enemy but CUP for Indep) or adding by using more than one file for a side, for example Civ_BIS, Civ_BIS_Apex and Civ_CUP together
 */

private ["_enemyFrequency"];
_enemyFrequency = _this select 0;

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = [];
// Prison backpack secondary weapon (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
// Random array. Civilian vehicle classes for ambient traffic.
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = [];
// Random arrays. Enemy vehicle classes for ambient traffic.
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [];
a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = [];


// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes = [];
a3e_arr_Escape_InfantryTypes_Ind = [];
a3e_arr_recon_InfantryTypes = [];
a3e_arr_recon_I_InfantryTypes = [];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = [];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = [];
// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = [];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = [];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = [];



// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.
// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = [];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = [];
// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = [];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = [];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = [];

// Vehicles, weapons and ammo at ammo depots
// Random array. An ammo depot contains one static weapon of the following types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = [];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = [];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = [];
a3e_arr_O_transport_heli = [];
a3e_arr_O_pilots = [];
a3e_arr_I_transport_heli = [];
a3e_arr_I_pilots = [];

// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.
// Weapons and ammo in the basic weapons box
a3e_arr_AmmoDepotBasicWeapons = [];
// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleBackpacks = [];
// Items
a3e_arr_AmmoDepotItems = [];

// Weapons that may show up in civilian cars
// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.
a3e_arr_CivilianCarWeapons = [];

// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = [];
a3e_arr_Scopes_SMG = [];
a3e_arr_Scopes_Sniper = [];
a3e_arr_NightScopes = [];
a3e_arr_TWSScopes = [];

// Here is a list of bipods, might get randomly added to enemy patrols:
a3e_arr_Bipods = [];

//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = [];
a3e_arr_extraction_chopper_escort = [];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = [];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopperEasy = [];
a3e_arr_searchChopperHard = [];
a3e_arr_searchChopper_pilot = [];
a3e_arr_searchChopper_crew = [];

//////////////////////////////////////////////////////////////////
// fn_PopulateAquaticPatrol
// boats that are spawned
//////////////////////////////////////////////////////////////////
a3e_arr_AquaticPatrols = [];

//////////////////////////////////////////////////////////////////
// fn_MortarSite
// mortar spawned in the mortar camps
//////////////////////////////////////////////////////////////////
a3e_arr_MortarSite = [];

//////////////////////////////////////////////////////////////////
// fn_CallCAS.sqf
// Classnames of planes for the CAS module
//////////////////////////////////////////////////////////////////
a3e_arr_CASplane = [];

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
a3e_arr_CrashSiteWrecks = [];
a3e_arr_CrashSiteCrew = [];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];




//////////////////////////////////////////////////////////////////
// INCLUDES
//
//////////////////////////////////////////////////////////////////
// Vanilla BIS
#include "Player_W_units_BIS_NATO_US.sqf"
#include "Player_W_weap_BIS_NATO_US.sqf"
#include "Enemy_E_units_BIS_CSAT.sqf"
#include "Enemy_E_veh_BIS_CSAT.sqf"
#include "Enemy_E_weap_BIS_CSAT.sqf"
#include "Indep_units_BIS_AAF.sqf"
#include "Indep_veh_BIS_AAF.sqf"
#include "Indep_weap_BIS_AAF.sqf"
#include "Civ_BIS_Vanilla.sqf"

/*// APEX BIS
#include "Player_W_units_BIS_Apex_US.sqf"
#include "Player_W_weap_BIS_Apex_US.sqf"
#include "Enemy_E_units_BIS_Apex_CSAT.sqf"
#include "Enemy_E_veh_BIS_Apex_CSAT.sqf"
#include "Enemy_E_weap_BIS_Apex_CSAT.sqf"
#include "Indep_units_BIS_Apex_Syndikat.sqf"
#include "Indep_veh_BIS_Apex_Syndikat.sqf"
#include "Indep_weap_BIS_Apex_Syndikat.sqf"
#include "Civ_BIS_Vanilla.sqf"
#include "Civ_BIS_Apex.sqf"
*/

//call compile preprocessFileLineNumbers "a\b\c\includes.hpp";

//{* INCLUDE UNITCLASSES HERE *};






//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// Two arrays for "Easy" and "Hard" parameter, both used on stadard setting
//////////////////////////////////////////////////////////////////

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