// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
// Small Tin shed with door, tin window covers, flag, speakers, burning barrel x 2 and sandbags

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

_pos = [_center,_center vectorAdd [-0.40625,0.394531,-0.130976],_rotation] call _fnc_rotatePos;
_obj = "Land_Shed_05_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.719339,0.694659,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

A3E_PrisonGateObject = _obj;

_pos = [_center,_center vectorAdd [2,0,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_medium_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-2,0,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_medium_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,2,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_medium_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0,-2,0],_rotation] call _fnc_rotatePos;
_obj = "Land_ClutterCutter_medium_F" createvehicle _pos;
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1.20801,-2.19336,0.372054],_rotation] call _fnc_rotatePos;
_obj = "Land_TinWall_01_m_4m_v1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.719522,-0.69447,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

_pos = [_center,_center vectorAdd [0.500977,4.58984,0],_rotation] call _fnc_rotatePos;
_obj = "MetalBarrel_burning_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.74023,0.224609,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.730091,0.68335,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.70605,-0.212891,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.719465,0.694528,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.59668,3.36328,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.712687,-0.701482,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1.82422,3.44531,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.670701,0.741727,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.40527,1.92383,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.703043,0.711147,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [2.17578,2.21875,0.372054],_rotation] call _fnc_rotatePos;
_obj = "Land_TinWall_01_m_4m_v1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.702039,0.712139,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_obj allowDamage false;

_pos = [_center,_center vectorAdd [-5.06738,-1.04297,0],_rotation] call _fnc_rotatePos;
_obj = "FlagPole_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.749656,-0.661828,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [2.38574,-1.92578,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.729482,-0.684,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.28711,-1.79688,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.667428,0.744674,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-2.18652,-2.2207,0.434343],_rotation] call _fnc_rotatePos;
_obj = "Land_TinWall_01_m_4m_v1_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.67389,-0.738832,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-1.67578,-3.29102,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.683674,0.729788,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.424805,-4.54297,0],_rotation] call _fnc_rotatePos;
_obj = "MetalBarrel_burning_F" createvehicle _pos;
_obj setVectorDirAndUp [[0,1,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0.693359,-3.39453,0],_rotation] call _fnc_rotatePos;
_obj = "Land_SandbagBarricade_01_half_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.707107,0.707107,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.6416,0.886719,0.173401],_rotation] call _fnc_rotatePos;
_obj = "Land_Loudspeakers_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.747319,0.664465,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

A3E_PrisonLoudspeakerObject = _obj;
publicvariable "A3E_PrisonLoudspeakerObject";

_pos = [_center,_center vectorAdd [random 2.0 - 1, random 2.0 -1,0],_rotation] call _fnc_rotatePos;
private _backpack = "B_AssaultPack_khk" createvehicle _pos;
_backpack setdir ((getdir _backpack) + _rotation);
_backpack setPosATL _pos;

_backpack;