// Eden Object composition to SQF
// Export file
// Script by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
private ["_staticWeaponClasses", "_parkedVehicleClasses"];

private["_center","_rotation","_obj","_pos"];
_center = param[0];
_rotation = param[1];

if (count _this > 2) then { _staticWeaponClasses = _this select 2; } else { _staticWeaponClasses = []; };
if (count _this > 3) then { _parkedVehicleClasses = _this select 3; } else { _parkedVehicleClasses = []; };

[_center,40] call a3e_fnc_cleanupTerrain;

_fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];

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

    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call _fnc_rotatePos);
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};

private _obj = objNull;
_obj = ["Land_SandbagBarricade_01_F",_center,[9.9585,-10.6621,0],_rotation,268.474] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-12.3207,-13.0791,-0.0999999],_rotation,89.775] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-10.7937,-14.4932,-0.0999999],_rotation,358.665] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[-8.875,-10.938,0],_rotation,90.7497] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[-8.90588,-12.6616,0],_rotation,90.7497] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[-8.75488,-14.3672,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_hole_F",_center,[9.87732,-8.4917,0],_rotation,268.784] call _fnc_createObject;
_obj = ["Land_Bunker_01_tall_F",_center,[8.11548,-3.84229,0],_rotation,269.456] call _fnc_createObject;
_obj allowDamage false;
_obj = ["Land_Bunker_01_small_F",_center,[6.03345,-13.6006,0],_rotation,359.472] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[-0.138062,-14.3682,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[-5.29395,-14.3638,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[-8.76709,-2.43945,0],_rotation,89.7881] call _fnc_createObject;
_obj = ["Land_TTowerSmall_1_F",_center,[6.98938,-4.75049,10.4077],_rotation,0] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-12.7303,10.3848,0],_rotation,88.6579] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-12.7457,12.7349,-0.0999999],_rotation,88.658] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-12.6832,5.58984,0],_rotation,88.6579] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-9.01892,14.2583,0],_rotation,179.769] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-11.3326,14.2607,-0.0999999],_rotation,179.769] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[3.00427,10.0005,0],_rotation,180.006] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[1.27979,10.0073,0],_rotation,180.006] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[9.58594,10.8198,0],_rotation,269.295] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_hole_F",_center,[-12.7317,7.98828,0],_rotation,89.7316] call _fnc_createObject;
_obj = ["Land_Bunker_01_HQ_F",_center,[-4.80273,6.13574,0.230144],_rotation,269.295] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[9.6012,7.39795,0],_rotation,270.071] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[9.60693,2.23975,0],_rotation,270.071] call _fnc_createObject;

_obj = ["FlagPole_F",_center,[-7.95715,-12.8491,0],_rotation,266.77] call _fnc_createObject;
_obj setflagtexture A3E_VAR_Flag_Opfor;

_obj = ["Land_DataTerminal_01_F",_center,[7.92371,-3.09668,4.97927],_rotation,269.752] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-10.9712,-12.5483,-0.0121183],_rotation,271.186] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-11.2578,13.0923,-0.0121183],_rotation,326.452] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-4.02551,-7.95752,-0.00933647],_rotation,269.625] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[6.86597,6.07422,-0.00949287],_rotation,0.0176632] call _fnc_createObject;
};