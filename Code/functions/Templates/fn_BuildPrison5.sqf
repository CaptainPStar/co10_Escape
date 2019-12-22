// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
//Slum house small 2 doors and window, flag, speakers, burning barrels x 2 and sandbags


private["_obj","_pos"];
params ["_center","_rotation","_backpack"];

//Stuff that needs to be global
if(isserver) then {
	[_center,25] call a3e_fnc_cleanupTerrain;
	
	_pos = [_center,_center vectorAdd [-1.7373,0.169922,-0.138047],_rotation] call A3E_fnc_rotatePosition;
	_obj = "Land_Slum_House02_F" createVehicle _pos;
	_obj setVectorDirAndUp [[0.706483,0.70773,0],[0,0,1]];
	_obj setdir ((getdir _obj) + _rotation);
	_obj setPosATL _pos;
	_obj allowDamage false;

	A3E_PrisonGateObject = _obj;
	
	_pos = [_center,_center vectorAdd [0.420898,4.25977,-0.318182],_rotation] call A3E_fnc_rotatePosition;
	_obj = "Land_Loudspeakers_F" createVehicle _pos;
	_obj setVectorDirAndUp [[-0.689121,0.724646,0],[0,0,1]];
	_obj setdir ((getdir _obj) + _rotation);
	_obj setPosATL _pos;

	A3E_PrisonLoudspeakerObject = _obj;
	publicvariable "A3E_PrisonLoudspeakerObject";

	_pos = [_center,_center vectorAdd [random 2.0 - 1, random 2.0 -1,0],_rotation] call A3E_fnc_rotatePosition;
	_backpack setdir ((getdir _backpack) + _rotation);
	_backpack setPosATL _pos;
	
};

//Stuff that can be local and is created duplicated on each client. This reduces network traffic at start.

_pos = [_center,_center vectorAdd [-1.97363,1.90625,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.707107,0.707107,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1,0,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1,0,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,1,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,-1,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;


_pos = [_center,_center vectorAdd [1.72363,3.03906,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.700534,0.713619,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.30664,0.273438,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.71424,-0.6999,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [2.96289,-0.701172,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.73009,0.683351,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.10449,1.62109,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.716088,0.69801,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.22461,0.443359,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "MetalBarrel_burning_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1.73633,-3.25,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.705229,-0.70898,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.151367,-3.79297,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.707107,0.707107,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.351563,-4.73633,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "FlagPole_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.684954,-0.728586,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj setflagtexture A3E_VAR_Flag_Ind;

_pos = [_center,_center vectorAdd [-2.76563,-2.06055,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "MetalBarrel_burning_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1.42285,-2.27148,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.708664,0.705546,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;