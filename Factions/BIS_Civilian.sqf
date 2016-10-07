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
_returnValues append ["BIS_Civilian"];

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
	"C_Van_01_fuel_F"
	,"C_Hatchback_01_F",3
	,"C_Hatchback_01_sport_F"
	,"C_Offroad_02_unarmed_F"//Jeep
	,"C_Offroad_01_F",2
	,"C_Offroad_01_repair_F"
	,"C_Quadbike_01_F",2
	,"C_SUV_01_F",3
	,"C_Van_01_transport_F"
	,"C_Van_01_box_F",3
	,"C_Truck_02_fuel_F"
	,"C_Truck_02_box_F"
	,"C_Truck_02_transport_F"
	,"C_Truck_02_covered_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Air
/////////////////////////////////////////////////////////////////////
// Helicopters
_returnNames append ["CivilianHelicopters"];
_returnValues append [
	[
	"C_Heli_Light_01_civil_F"//M-900
	] call a3e_fnc_expandProbabilities
];
// Planes
_returnNames append ["CivilianPlanes"];
_returnValues append [
	[
	"C_Plane_Civil_01_F"
	,"C_Plane_Civil_01_racing_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Sea
/////////////////////////////////////////////////////////////////////
// unarmed boats
_returnNames append ["CivilianBoats"];
_returnValues append [
	[
	"C_Boat_Civil_01_F"
	,"C_Rubberboat"
	,"C_Boat_Transport_02_F"
	,"C_Scooter_Transport_01_F"
	] call a3e_fnc_expandProbabilities
];

/////////////////////////////////////////////////////////////////////
// Footer
// Don't change this!
private _return = [_returnNames,_returnValues];
_return;
/////////////////////////////////////////////////////////////////////