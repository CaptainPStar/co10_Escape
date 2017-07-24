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

_pos = [_center,_center vectorAdd [-5.53674,-3.69824,0],_rotation] call _fnc_rotatePos;
_obj = "Land_LampShabby_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0183471,-0.999832,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-0.158936,-3.08484,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Metal_Shed_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0183471,-0.999832,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1.2627,-3.60278,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Net_Fence_Gate_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0348819,0.999391,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

A3E_PrisonGateObject = _obj;

_pos = [_center,_center vectorAdd [5.2926,-3.39038,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Loudspeakers_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0183407,-0.999832,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

A3E_PrisonLoudspeakerObject = _obj;
publicvariable "A3E_PrisonLoudspeakerObject";

_pos = [_center,_center vectorAdd [-4.48804,0.371826,0],_rotation] call _fnc_rotatePos;
private _backpack = "B_AssaultPack_khk" createvehicle _pos;
_backpack setVectorDirAndUp [[0,1,0],[0,0,1]];
_backpack setdir ((getdir _backpack) + _rotation);
_backpack setPosATL _pos;

_backpack;

