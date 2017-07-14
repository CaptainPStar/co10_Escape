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
	_pos = [_center,_center vectorAdd [-8.98853,0.582275,0.03473],_rotation] call _fnc_rotatePos;
	_vehicle setVectorDirAndUp [[-0.999602,0.0282026,0],[0,0,1]];
	_vehicle setdir ((getdir _vehicle) + _rotation);
	_vehicle setPosATL _pos;
};


_pos = [_center,_center vectorAdd [-3.21863,0.61731,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BarGate_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.00573361,-0.999984,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;


if(!(isNull _static)) then {
	_pos = [_center,_center vectorAdd [6.76208,0.251953,0],_rotation] call _fnc_rotatePos;
	_static setVectorDirAndUp [[0.0308489,0.999524,0],[0,0,1]];
	_static setdir ((getdir _static) + _rotation);
	_static setPosATL _pos;
};


_pos = [_center,_center vectorAdd [-4.06677,-1.17126,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_pos = [_center,_center vectorAdd [-3.97546,1.92419,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_pos = [_center,_center vectorAdd [4.46057,-1.41321,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_pos = [_center,_center vectorAdd [4.79553,1.97058,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_Round_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_pos = [_center,_center vectorAdd [-6.41394,-1.54944,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;


_pos = [_center,_center vectorAdd [-6.29773,2.72253,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_pos = [_center,_center vectorAdd [6.71497,-2.26184,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;


_pos = [_center,_center vectorAdd [7.21838,2.25183,0],_rotation] call _fnc_rotatePos;
_obj = "Land_BagFence_End_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999918,0.0127849,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
_objects pushback _obj;

_objects;
