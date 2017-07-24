// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"

private["_center","_rotation","_obj","_pos"];
_center = param[0];
_rotation = param[1];

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

_pos = [_center,_center vectorAdd [-5.95618,-2.24744,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0190546,-0.999818,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.06775,-2.36169,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0936972,0.995601,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-5.99878,2.02588,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0190546,-0.999818,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-10.2567,-0.683105,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Locomotive_01_v1_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999998,0.00176294,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [0.0308838,0.071167,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BarGate_F" createvehicle _pos;
_obj setVectorDirAndUp [[-8.74228e-008,-1,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4.48022,1.17017,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.774822,-0.632179,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4.38293,-1.52686,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.777087,0.629394,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.40308,2.1676,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0936972,0.995601,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.79761,1.47278,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.727894,-0.68569,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [6.6438,-0.0732422,0.0750003],_rotation] call _fnc_rotatePos;
_obj = "B_T_Static_AA_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.999196,-0.0400955,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.93359,-1.76733,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.775402,0.631468,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

