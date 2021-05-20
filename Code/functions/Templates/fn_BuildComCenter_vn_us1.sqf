//VN US ComCenter 1
//FOB

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
_obj = ["Land_vn_tank_rust_f",_center,[-16.0333,-3.42969,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_latrine_01",_center,[-16.0443,2.56787,0.02],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-19.7001,-5.97998,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-19.599,-0.737793,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-15.5463,8.01416,0.336152],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-19.338,4.43506,0.235377],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-19.4772,-14.168,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-16.0304,-17.8208,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_firing_05",_center,[-15.9308,-13.1245,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_90_02",_center,[-13.2426,2.58057,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_b_trench_05_02",_center,[-20.0199,-6.12354,0],_rotation,267.764] call _fnc_createObject;
_obj = ["Land_vn_ttowersmall_2_f",_center,[-5.23083,-9.03076,4.29881],_rotation,270.023] call _fnc_createObject;
_obj = ["Land_vn_b_trench_bunker_03_04",_center,[1.88782,-5.0249,0.0156546],_rotation,270.023] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[18.7479,-7.39941,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[18.849,-2.15723,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[14.6068,-18.9004,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-9.4198,7.43945,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-1.22766,7.47363,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[19.11,3.01563,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[6.86902,7.47461,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[18.9708,-15.5874,0.151823],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[15.0612,7.50879,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[6.41467,-18.9346,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_firing_03",_center,[-4.98669,5.00439,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_b_trench_firing_04",_center,[5.8761,-16.1436,0],_rotation,180.332] call _fnc_createObject;
_obj = ["Land_vn_b_trench_stair_02",_center,[9.24353,-6.75,1.18605],_rotation,88.3893] call _fnc_createObject;
_obj = ["Land_vn_b_trench_stair_02",_center,[11.3444,-6.68799,0],_rotation,88.3893] call _fnc_createObject;
_obj = ["Land_vn_b_trench_90_01",_center,[12.9171,-13.5317,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_90_02",_center,[13.7335,1.79639,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_b_trench_05_02",_center,[0.534302,8.59619,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_05_02",_center,[6.16028,8.81641,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_05_02",_center,[19.5717,-5.64209,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_tower_01",_center,[14.4908,4.2666,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_bunker_05_02",_center,[8.74329,0.0078125,0],_rotation,88.7085] call _fnc_createObject;
_obj = ["Flag_US_F",_center,[3.85242,-4.5752,2.47959],_rotation,179.967] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;
_obj = ["Land_DataTerminal_01_F",_center,[-3.39685,-4.99121,1.00253],_rotation,270] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;


if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[14.6976,4.29492,4.32537],_rotation,359.999] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-16.1321,-15.0767,0.265357],_rotation,180.003] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-3.01941,-13.6514,0.0263076],_rotation,269.938] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-9.7395,-3.92725,0.0251126],_rotation,178.996] call _fnc_createObject;
};