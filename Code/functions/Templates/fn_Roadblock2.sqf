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

_pos = [_center,_center vectorAdd [-10.5365,-1.88892,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.998298,0.0583221,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-9.54016,-4.48584,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.769706,0.638399,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-4.61743,-5.52637,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0193368,-0.999813,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-7.25806,-5.48535,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0231416,-0.999732,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-6.74536,-1.16248,0.019196],_rotation] call _fnc_rotatePos;
_obj = "Land_Locomotive_01_v1_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.00749208,-0.999972,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [10.5684,-2.94543,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999894,-0.0145383,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.59009,-6.02368,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0245898,-0.999698,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [8.07642,0.18457,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagBunker_Tower_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0442845,0.999019,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [7.43286,-1.5929,2.81069],_rotation] call _fnc_rotatePos;
_obj = "B_T_Static_AA_F" createvehicle _pos;
_obj setVectorDirAndUp [[-0.126156,-0.99201,0],[-0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [9.55457,-5.21326,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.657954,-0.753058,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [7.23071,-6.06079,0],_rotation] call _fnc_rotatePos;
_obj = "Land_CncBarrier_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0206801,-0.999786,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

