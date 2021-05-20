//VN NVA ComCenter 1
//Big rock

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

[_center,25] call a3e_fnc_cleanupTerrain;

_fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];

    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call A3E_fnc_rotatePosition);
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};

//Fix rotation
_rotation = _rotation + 180;

private _obj = objNull;
_obj = ["Land_vn_cave_04_01",_center,[6.83154,0.357422,-9.53674e-007],_rotation,0] call _fnc_createObject;
_obj = ["Land_DataTerminal_01_F",_center,[3.59229,1.67432,14.1044],_rotation,101.297] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;
_obj = ["Land_vn_bagfence_01_round_green_f",_center,[4.41602,-7.02637,21.5102],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_camonetb_nato",_center,[-13.7062,0.142578,-1.43051e-006],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_ttowersmall_2_f",_center,[1.81067,6.1001,14.9617],_rotation,56.3967] call _fnc_createObject;
_obj = ["Land_vn_o_platform_03",_center,[-2.43896,5.58105,0],_rotation,293.894] call _fnc_createObject;
_obj = ["Land_vn_o_wallfoliage_01",_center,[14.8151,-11.1729,0],_rotation,102.303] call _fnc_createObject;


if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[1.62415,-7.17041,0.0570941],_rotation,183.539] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[4.45178,-6.19922,20.6783],_rotation,180.364] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-14.73,-2.07471,0.0231428],_rotation,270.79] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-14.9005,2.23926,-0.0993633],_rotation,268.443] call _fnc_createObject;
};