//SPE ComCenter GER 1
//Mansion ruin

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
_obj = ["Land_SPE_Manor_House_ruins",_center,[0.168213,0.272461,0],_rotation,0] call _fnc_createObject;
_obj allowDamage false;
_obj = ["Land_SPE_HedgeHog",_center,[-16.4033,1.62402,0],_rotation,236.733] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-17.4426,5.08154,0],_rotation,100.445] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-16.5383,-6.70996,0],_rotation,227.788] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-8.41528,-11.5088,0],_rotation,269.576] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Short",_center,[-9.36792,-2.82178,4.02],_rotation,180.792] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_02",_center,[-16.3154,9.06982,0],_rotation,290.01] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_02",_center,[-16.8066,-2.57178,0],_rotation,269.592] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_02",_center,[-12.4741,-9.27148,0],_rotation,211.485] call _fnc_createObject;
//_obj = ["SPE_Weaponcrate_MP40_GER",_center,[-8.51587,1.06494,0.799145],_rotation,360] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[13.2324,-9.51172,0],_rotation,130.911] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[5.91968,-13.8252,0],_rotation,158.231] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-2.63672,12.1021,0],_rotation,11.8271] call _fnc_createObject;
_obj = ["Land_SPE_Fuel_Barrel_German",_center,[14.4543,3.03223,0],_rotation,297.348] call _fnc_createObject;
_obj = ["Land_SPE_Fuel_Barrel_German",_center,[14.1914,2.24854,0],_rotation,69.1102] call _fnc_createObject;
_obj = ["Land_SPE_Ger_Lamp",_center,[-4.90332,1.03955,4.79009],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Ger_Lamp",_center,[4.27759,2.36035,1.57023],_rotation,251.188] call _fnc_createObject;
_obj = ["Land_SPE_Ger_Lamp",_center,[-3.95972,0.974609,1.57023],_rotation,231.981] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[3.62378,-12.3159,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[9.28198,-2.51758,4.02],_rotation,58.185] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_02",_center,[9.73901,-11.7881,0],_rotation,160.262] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[0.0532227,-13.1362,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Curve",_center,[-3.54028,-11.0649,0],_rotation,136.29] call _fnc_createObject;
_obj = ["Land_SPE_Ammocan_German",_center,[9.60205,1.02148,0.800145],_rotation,162.413] call _fnc_createObject;
_obj = ["Land_SPE_Ammocan_German",_center,[-1.41406,-6.51367,4.02],_rotation,164.756] call _fnc_createObject;
_obj = ["Land_SPE_Ammocan_German",_center,[-1.58374,-7.54199,4.02],_rotation,47.6361] call _fnc_createObject;
_obj = ["Land_SPE_Ammocan_German",_center,[11.0735,-0.671387,0.800145],_rotation,297.568] call _fnc_createObject;
_obj = ["Land_SPE_Ammocan_German",_center,[0.801514,5.89111,4.02],_rotation,153.802] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Single",_center,[5.88818,-11.8726,0],_rotation,143.522] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Gun_Hole",_center,[11.489,-0.933594,4.059],_rotation,2.214] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Gun_Hole",_center,[4.87109,-4.26758,1.403],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Gun_Hole",_center,[6.65015,-4.30859,1.403],_rotation,90] call _fnc_createObject;
_obj = ["SPE_Banner_01_GER_F",_center,[0.135986,-8.16455,3.205],_rotation,180] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;
_obj = ["SPE_Banner_01_GER_F",_center,[0.175049,6.78516,2.828],_rotation,0] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;
_obj = ["SPE_Radio_Ger",_center,[5.30518,1.10742,4.63],_rotation,270.512] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
//_obj = ["SPE_MG34_Bipod",_center,[-0.44873,-6.90332,4.30228],_rotation,180] call _fnc_createObject;
//_obj = ["SPE_MG34_Bipod",_center,[10.5432,0.478027,0.8],_rotation,90] call _fnc_createObject;
//_obj = ["SPE_MG34_Bipod",_center,[-0.0578613,5.54785,4.02],_rotation,0] call _fnc_createObject;
//_obj = ["B_Truck_01_box_F",_center, call _fnc_createObject;
//_obj = ["SPE_ST_OpelBlitz_Flak38",_center,[12.3794,10.4053,-0.0116215],_rotation,93.13] call _fnc_createObject;
_obj = ["SPE_CoffeeTable",_center,[5.20508,0.754395,4.02],_rotation,0] call _fnc_createObject;
_obj = ["SPE_LeatherChair",_center,[5.19702,0.234375,1.478],_rotation,313.606] call _fnc_createObject;
_obj = ["SPE_SideTable_01",_center,[-4.93408,1.13135,4.02],_rotation,0] call _fnc_createObject;
_obj = ["SPE_SideTable_01",_center,[-3.75684,1.11621,0.8],_rotation,0] call _fnc_createObject;
_obj = ["SPE_SideTable_01",_center,[4.12891,2.17285,0.800145],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Cabinet",_center,[3.10913,-0.661621,0.8],_rotation,180] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-10.8611,12.7852,0],_rotation,280.162] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-14.5776,13.0356,0],_rotation,350.148] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[4.32715,13.6348,0],_rotation,280.162] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[12.9475,13.8267,0],_rotation,67.9907] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_02",_center,[-6.76099,12.8696,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_02",_center,[8.50635,13.9224,0],_rotation,0] call _fnc_createObject;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-0.44873,-6.90332,4.30228],_rotation,180] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[10.5432,0.478027,1],_rotation,90] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-0.0578613,5.54785,4.02],_rotation,0] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;

};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[17.1189,1.74414,0.0232019],_rotation,180] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[12.3794,10.4053,-0.0116215],_rotation,93.13] call _fnc_createObject;
};