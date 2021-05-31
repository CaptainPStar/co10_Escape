//VN NVA ComCenter 2
//Ruins

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
_obj = ["Land_vn_temple_ruin_04",_center,[-14.1665,-5.42725,0],_rotation,179.11] call _fnc_createObject;
_obj = ["Land_vn_temple_statue_01",_center,[-4.40002,-11.2827,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_temple_statue_01",_center,[9.62402,-11.1064,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_temple_ruin_03",_center,[4.05493,-6.36914,-4.76837e-007],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_temple_ruin_04",_center,[19.1982,-5.46338,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_fence_punji_01_03",_center,[-9.875,-7.88281,0],_rotation,359.783] call _fnc_createObject;
_obj = ["Land_vn_temple_ruin_02",_center,[-8.8446,8.22266,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_temple_ruin_01",_center,[17.3854,7.271,0.0840883],_rotation,181.683] call _fnc_createObject;
_obj = ["vn_o_snipertree_02",_center,[3.03821,9.82666,0],_rotation,311.807] call _fnc_createObject;
_obj = ["Land_DataTerminal_01_F",_center,[18.3275,10.8257,8.49434],_rotation,0] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;
_obj = ["Land_vn_ttowersmall_2_f",_center,[14.9763,7.34375,0.252264],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_o_platform_01",_center,[-2.35046,-4.22705,0],_rotation,0] call _fnc_createObject;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[17.3751,-5.94971,-0.0084095],_rotation,180.009] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-9.40308,9.13135,5.19235],_rotation,359.999] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-12.9794,0.32373,0.025034],_rotation,269.953] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[10.2394,9.25195,0.0214782],_rotation,360] call _fnc_createObject;
};