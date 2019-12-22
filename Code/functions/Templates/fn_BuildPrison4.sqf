// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
// Slum house 1 door, flag, speakers, tin walls, burning barrels x 2 and sandbags


private["_obj","_pos"];
params ["_center","_rotation","_backpack"];

//Stuff that needs to be global
if(isserver) then {
	[_center,25] call a3e_fnc_cleanupTerrain;
	_pos = [_center,_center vectorAdd [-4.59277,-1.16406,-0.334344],_rotation] call A3E_fnc_rotatePosition;
	_obj = "Land_Loudspeakers_F" createVehicle _pos;
	_obj setVectorDirAndUp [[0.699588,-0.714546,0],[0,-0,1]];
	_obj setdir ((getdir _obj) + _rotation);
	_obj setPosATL _pos;

	A3E_PrisonLoudspeakerObject = _obj;
	publicvariable "A3E_PrisonLoudspeakerObject";
	
	_pos = [_center,_center vectorAdd [0.275391,-1.38867,-0.0868696],_rotation] call A3E_fnc_rotatePosition;
	_obj = "Land_Slum_House03_F" createVehicle _pos;
	_obj setVectorDirAndUp [[-0.70649,0.707723,0],[0,0,1]];
	_obj setdir ((getdir _obj) + _rotation);
	_obj setPosATL _pos;
	_obj allowDamage false;

	A3E_PrisonGateObject = _obj;
	
	
	_pos = [_center,_center vectorAdd [random 2.0 - 1, random 2.0 -1,0],_rotation] call A3E_fnc_rotatePosition;
	_backpack setdir ((getdir _backpack) + _rotation);
	_backpack setPosATL _pos;

	
};

//Stuff that can be local and is created duplicated on each client. This reduces network traffic at start.

_pos = [_center,_center vectorAdd [-2.47168,-2.63281,0.207744],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_TinWall_01_m_4m_v1_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.715095,-0.699027,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

_pos = [_center,_center vectorAdd [-3.55273,-2.10352,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.713621,0.700532,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-2.70313,0.755859,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.719158,-0.694847,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4.22168,-0.585938,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.731889,0.681424,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;


_pos = [_center,_center vectorAdd [1.28223,5.04492,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "MetalBarrel_burning_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
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

_pos = [_center,_center vectorAdd [-1.27832,2.25391,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.716083,-0.698016,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0.262695,3.81445,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.717616,-0.696439,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.47852,0.705078,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.693892,-0.720079,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [2.25098,3.69531,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.701793,-0.712381,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.7334,2.18945,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.730997,-0.682381,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0.635742,-2.53125,0.680808],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_TinWall_01_m_4m_v1_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.696188,-0.717859,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

_pos = [_center,_center vectorAdd [1.55078,-2.13672,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.678826,0.734299,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.0498,-0.957031,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "FlagPole_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.759202,0.650855,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj setflagtexture A3E_VAR_Flag_Ind;

_pos = [_center,_center vectorAdd [-2.02734,-3.68945,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.713621,0.700532,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0.192383,-3.68555,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.693892,-0.720079,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1.01465,-4.86914,-0.0161617],_rotation] call A3E_fnc_rotatePosition;
_obj = "MetalBarrel_burning_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.0110183,0.999939,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

