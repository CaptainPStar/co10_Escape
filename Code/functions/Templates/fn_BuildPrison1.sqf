// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
// Tin Shed with metal gate center wall, flag, speakers, burning barrells x 2 and sandbags

private["_obj","_pos"];
params ["_center","_rotation","_backpack"];

//Stuff that needs to be global
if(isserver) then {
	[_center,25] call a3e_fnc_cleanupTerrain;

	_pos = [_center,_center vectorAdd [4.0293,4.16406,0.173401],_rotation] call A3E_fnc_rotatePosition;
	_obj = "Land_Loudspeakers_F" createVehicle _pos;
	_obj setVectorDirAndUp [[-0.718849,0.695166,0],[0,0,1]];
	_obj setdir ((getdir _obj) + _rotation);
	_obj setPosATL _pos;

	A3E_PrisonLoudspeakerObject = _obj;
	publicvariable "A3E_PrisonLoudspeakerObject";
	
	_pos = [_center,_center vectorAdd [-3.67871,-0.154297,0],_rotation] call A3E_fnc_rotatePosition;
	_obj = "Land_TinWall_01_m_gate_v1_closed_F" createVehicle _pos;
	_obj setVectorDirAndUp [[-0.707107,0.707107,0],[0,0,1]];
	_obj setdir ((getdir _obj) + _rotation);
	_obj setPosATL _pos;
	_obj allowDamage false;

	A3E_PrisonGateObject = _obj;
	
	_pos = [_center,_center vectorAdd [random 2.0 - 1, random 2.0 -1,0],_rotation] call A3E_fnc_rotatePosition;
	_backpack setdir ((getdir _backpack) + _rotation);
	_backpack setPosATL _pos;
	
};

//Stuff that can be local and is created duplicated on each client. This reduces network traffic at start.


_pos = [_center,_center vectorAdd [0.931641,5.20703,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.707107,-0.707107,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.561523,3.66406,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.707107,-0.707107,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.58105,3.80859,0.887205],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_TinWall_01_m_4m_v1_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.709843,0.70436,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

_pos = [_center,_center vectorAdd [2.24414,5.75977,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.691034,-0.722822,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.74707,4.28906,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.708352,-0.705859,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4.00781,-4.13281,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "FlagPole_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.755461,-0.655193,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj setflagtexture A3E_VAR_Flag_Ind;

_pos = [_center,_center vectorAdd [-0.22168,0.210938,-0.109428],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_Shed_07_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.708044,0.706168,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

_pos = [_center,_center vectorAdd [2,0,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-2,0,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,2,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,-2,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_ClutterCutter_medium_F" createVehicleLocal _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;


_pos = [_center,_center vectorAdd [-2.0166,2.1875,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.707107,-0.707107,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-5.49023,-1.12109,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "MetalBarrel_burning_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-5.58984,-2.23242,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.717314,0.69675,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.7207,-3.66406,0.969697],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_TinWall_01_m_4m_v1_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.715095,-0.699027,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

_pos = [_center,_center vectorAdd [0.390625,-3.39258,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.707107,0.707107,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1.17969,-4.92578,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.707107,0.707107,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4.20898,-3.9668,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.722822,-0.691034,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-2.62891,-5.40234,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.729486,0.683996,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1.9043,-1.91211,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.707107,0.707107,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.46777,-0.371094,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.714851,0.699277,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.99512,1.15039,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.714851,0.699277,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [5.21094,2.78125,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_SandbagBarricade_01_half_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[-0.703668,-0.710529,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.52441,1.85352,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "MetalBarrel_burning_F" createVehicleLocal _pos;
_obj setVectorDirAndUp [[0.00220456,0.999998,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
