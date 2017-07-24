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

_pos = [_center,_center vectorAdd [-0.0488281,-3.16846,0],_rotation] call _fnc_rotatePos;
_obj = "Land_i_Stone_HouseSmall_V3_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0122944,0.999924,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

A3E_PrisonGateObject = _obj;

_pos = [_center,_center vectorAdd [-3.83875,2.22778,1.27074],_rotation] call _fnc_rotatePos;
_obj = "Land_Shoot_House_Wall_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0168403,0.999792,0.0115183],[-0.000345191,-0.0115141,0.999934]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-7.8396,-4.41418,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Shoot_House_Wall_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0122944,0.999924,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-3.2832,-4.38989,1.2204],_rotation] call _fnc_rotatePos;
_obj = "Land_Shoot_House_Wall_Stand_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0122947,0.999924,-5.47213e-005],[-0.0044471,0.000109405,0.99999]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [2.28711,-3.37476,1.24524],_rotation] call _fnc_rotatePos;
_obj = "Land_Sleeping_bag_brown_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999967,0.00809752,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [1.30408,1.70447,1.26635],_rotation] call _fnc_rotatePos;
_obj = "FirePlace_burning_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0168403,0.999792,0.0115183],[-0.000345191,-0.0115141,0.999934]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-9.20837,1.69324,1.18687],_rotation] call _fnc_rotatePos;
private _backpack = "B_AssaultPack_khk" createvehicle _pos;
_backpack setVectorDirAndUp [[0,1,0],[0,0,1]];
_backpack setdir ((getdir _backpack) + _rotation);
_backpack setPosATL _pos;

_pos = [_center,_center vectorAdd [8.97656,0.100464,2.08826],_rotation] call _fnc_rotatePos;
_obj = "Item_Binocular" createvehicle _pos;
_obj setVectorDirAndUp [[0.951755,-0.306859,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [8.71741,0.172119,2.08712],_rotation] call _fnc_rotatePos;
_obj = "Item_FirstAidKit" createvehicle _pos;
_obj setVectorDirAndUp [[0.552993,-0.833186,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [10.3247,-4.55066,0],_rotation] call _fnc_rotatePos;
_obj = "Land_Loudspeakers_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999163,0.0409122,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

A3E_PrisonLoudspeakerObject = _obj;
publicvariable "A3E_PrisonLoudspeakerObject";

_backpack;

