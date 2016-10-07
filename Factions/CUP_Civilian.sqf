/*
 * Description: This is a faction config including all the classnames for units, vehicles and weapons
 * Blah
 * More explanation stuff
 */

/////////////////////////////////////////////////////////////////////
// Header
// Don't change this!
private _returnNames = [];
private _returnValues = [];
/////////////////////////////////////////////////////////////////////

// Name of the faction
_returnNames append ["FactionName"];
_returnValues append ["CUP_Civilian"];

// For which side can this file be used?
// Can only be one or more of: "Player", "Enemy", "Indep", "Civilian"
_returnNames append ["UsableSides"];
_returnValues append [["Civilian"]];


/////////////////////////////////////////////////////////////////////
// Vehicles
// Random array
// Probability depends on number of entries
// A number can be added to duplicate a classname, so _"Blah",3_ equals _"Blah","Blah","Blah"_
// Arrays are supported, ["Blah","Doom","Test"] is counted as one entry, and when chosen with a possibility of 1/3 for each
// Combination ["Blah",2,"Doom"],3 is possible
/////////////////////////////////////////////////////////////////////

// Civilian cars for traffic
_returnNames append ["CivilianVehicles"];
_returnValues append [
	[
	"CUP_C_UAZ_Unarmed_TK_CIV"
	,"CUP_C_UAZ_Open_TK_CIV"
	,"CUP_C_LR_Transport_CTK",2
	,"CUP_C_V3S_Open_TKC"
	,"CUP_C_V3S_Covered_TKC"
	,[
		"CUP_C_Ural_Civ_01"
		,"CUP_C_Ural_Civ_02"
		,"CUP_C_Ural_Civ_03"
		,"CUP_C_Ural_Open_Civ_01"
		,"CUP_C_Ural_Open_Civ_02"
		,"CUP_C_Ural_Open_Civ_03"
	],4
	,[
		"CUP_C_Datsun_Tubeframe"
		,"CUP_C_Datsun_Plain"
		,"CUP_C_Datsun_Covered"
		,"CUP_C_Datsun_4seat"
		,"CUP_C_Datsun"
	],4
	,[
		"CUP_C_Skoda_White_CIV"
		,"CUP_C_Skoda_Red_CIV"
		,"CUP_C_Skoda_Green_CIV"
		,"CUP_C_Skoda_Blue_CIV"
	],4
	,[
		"CUP_C_Golf4_black_Civ"
		,"CUP_C_Golf4_blue_Civ"
		,"CUP_C_Golf4_green_Civ"
		,"CUP_C_Golf4_red_Civ"
		,"CUP_C_Golf4_white_Civ"
		,"CUP_C_Golf4_yellow_Civ"
	],5
	,[
		"CUP_C_Golf4_camo_Civ"
		,"CUP_C_Golf4_camodark_Civ"
		,"CUP_C_Golf4_camodigital_Civ"
		,"CUP_C_Golf4_kitty_Civ"
		,"CUP_C_Golf4_crowe_Civ"
		,"CUP_C_Golf4_reptile_Civ"
		,"CUP_C_Golf4_whiteblood_Civ"
	]
	,"CUP_C_SUV_CIV",2
	,"CUP_C_SUV_TK"
	,"CUP_C_Octavia_CIV",2
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Air
/////////////////////////////////////////////////////////////////////
// Helicopters
_returnNames append ["CivilianHelicopters"];
_returnValues append [
	[
	"CUP_C_Mi17_Civilian_RU"//M-900
	] call a3e_fnc_expandProbabilities
];
// Planes
_returnNames append ["CivilianPlanes"];
_returnValues append [
	[
	"CUP_C_DC3_CIV"
	,"CUP_C_DC3_TanoAir_CIV"
	,"CUP_C_AN2_AEROSCHROT_TK_CIV"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Sea
/////////////////////////////////////////////////////////////////////
// unarmed boats
_returnNames append ["CivilianBoats"];
_returnValues append [
	[
	"CUP_C_Fishing_Boat_Chernarus"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Footer
// Don't change this!
private _return;
_return = [_returnNames,_returnValues];
_return;
/////////////////////////////////////////////////////////////////////