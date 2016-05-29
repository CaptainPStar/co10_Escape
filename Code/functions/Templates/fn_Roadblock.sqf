// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"

private["_obj","_pos"];
params["_center","_rotation","_static","_vehicle"];

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

private _objects = [];

if(!(isNull _vehicle)) then {
	_pos = [_center,_center vectorAdd [-1.19421,-9.90234,0.000301838],_rotation] call _fnc_rotatePos;
	_vehicle setVectorDirAndUp [[-0.999602,0.0282026,0],[0,0,1]];
	_vehicle setdir ((getdir _vehicle) + _rotation);
	_vehicle setPosATL _pos;
};


_pos = [_center,_center vectorAdd [6.06116,-3.30908,-0.0952728],_rotation] call _fnc_rotatePos;
_obj = "Land_BagBunker_Tower_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.00573361,-0.999984,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;


if(!(isNull _static)) then {
	_pos = [_center,_center vectorAdd [6.75171,-1.32764,2.67601],_rotation] call _fnc_rotatePos;
	_static setVectorDirAndUp [[0.0308489,0.999524,0],[0,0,1]];
	_static setdir ((getdir _static) + _rotation);
	_static setPosATL _pos;
};


_pos = [_center,_center vectorAdd [-4.17871,-2.42529,0],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_5_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_pos = [_center,_center vectorAdd [-4.18518,-2.42969,1.29559],_rotation] call _fnc_rotatePos;
_obj = "Land_HBarrier_5_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_pos = [_center,_center vectorAdd [-4.33887,4.98438,-0.200378],_rotation] call _fnc_rotatePos;
_obj = "Land_Razorwire_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;


_pos = [_center,_center vectorAdd [3.70532,5.08203,-0.222816],_rotation] call _fnc_rotatePos;
_obj = "Land_Razorwire_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_objects;
