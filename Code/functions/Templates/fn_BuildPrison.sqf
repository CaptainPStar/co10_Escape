// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"

private["_center","_rotation","_obj","_pos"];
_center = param[0];
_rotation = param[1];

[_center,25] call a3e_fnc_cleanupTerrain;

_fnc_rotatePos = {
private ["_centerPos", "_pos", "_dir"];
private ["_px", "_py", "_mpx", "_mpy", "_ma", "_rpx", "_rpy"];
_centerPos = _this select 0;
_pos = _this select 1;
_dir = _this select 2;
    _px = _pos select 0;
    _py = _pos select 1;
    _mpx = _centerPos select 0;
    _mpy = _centerPos select 1;
    _ma = _dir;
    _rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
    _rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
[_rpx, _rpy, (_pos select 2)];
};


_pos = [_center,_center vectorAdd [random 2.0 - 1, random 2.0 -1,0],_rotation] call _fnc_rotatePos;
private _backpack = "B_AssaultPack_khk" createvehicle _pos;
_backpack setdir ((getdir _backpack) + _rotation);
_backpack setPosATL _pos;

_pos = [_center,_center vectorAdd [4,0,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_large_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4,0,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_large_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,4,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_large_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,-4,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_large_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.69727,-3.16309,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999662,0.0260012,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.2594,6.38867,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999048,0.0436198,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.32532,2.89893,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999794,-0.0202722,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.42505,-0.589844,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.998384,0.056825,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.68982,-0.773926,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.999524,0.030847,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.79578,8.24268,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Loudspeakers_F" createvehicle _pos;
_obj setVectorDirAndUp [[1,-4.37114e-008,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

A3E_PrisonLoudspeakerObject = _obj;
publicvariable "A3E_PrisonLoudspeakerObject";

_pos = [_center,_center vectorAdd [6.57373,8.39502,0],_rotation] call _fnc_rotatePos;
_obj = "FlagPole_F" createvehicle _pos;
_obj setVectorDirAndUp [[1,-4.37114e-008,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj setflagtexture A3E_VAR_Flag_Ind;

_pos = [_center,_center vectorAdd [3.08691,7.09082,0],_rotation] call _fnc_rotatePos;
_obj = "Land_City_Gate_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

A3E_PrisonGateObject = _obj;

_pos = [_center,_center vectorAdd [-6.74756,2.68604,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-1,4.88762e-007,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.78992,6.13916,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999695,-0.0246782,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4.37268,7.43896,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.92676,7.2876,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999662,0.0260012,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-5.16956,7.34766,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.990439,0.137951,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.68286,4.83301,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999767,0.0215948,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.6814,1.29395,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-1,4.88762e-007,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-2.61975,7.38037,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.138062,7.29297,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.997484,-0.0708981,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-2.60461,12.8789,-0.0299988],_rotation] call _fnc_rotatePos;
_obj = "Campfire_burning_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_obj = "Land_ClutterCutter_medium_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1.12219,14.3564,0.244108],_rotation] call _fnc_rotatePos;
_obj = "Land_CampingChair_V2_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.987853,0.155393,-0],[0.155393,-0.987853,-4.37114e-008]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.68799,11.499,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CampingChair_V2_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.333724,-0.942671,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.63342,11.6113,0.513469],_rotation] call _fnc_rotatePos;
_obj = "Land_Can_V2_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1.24951,11.5718,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CampingChair_V2_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.686883,-0.726768,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.903931,7.43994,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.10034,7.51563,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999662,0.0260012,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.26306,5.08643,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999048,0.0436198,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.30688,1.56104,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999048,0.0436198,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.4397,-1.90332,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999048,0.0436198,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.75391,-2.18457,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-1,4.88762e-007,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.79163,-5.37305,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.0304073,0.999538,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.33545,-4.78223,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.314127,0.949381,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-5.49976,-5.08545,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.376566,0.92639,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.2915,-4.79785,2.65993],_rotation] call _fnc_rotatePos;
_obj = "Land_PortableLight_double_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.593972,-0.804485,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-5.9801,-6.18262,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Portable_generator_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.958493,-0.285115,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.2251,-5.22949,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0519837,-0.998648,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.3125,-5.33887,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.0304073,0.999538,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1.40027,-5.37744,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.0304073,0.999538,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1.9823,-5.39307,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.0304073,0.999538,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [5.71082,-4.50049,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.726466,0.687203,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.8855,-5.01807,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.281733,-0.959493,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.46252,-3.00098,1.33838],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.937104,0.349051,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [5.85583,-4.71143,2.65993],_rotation] call _fnc_rotatePos;
_obj = "Land_PortableLight_double_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.598925,-0.800805,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.50574,-5.33691,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Portable_generator_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.667424,-0.744678,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_backpack;

