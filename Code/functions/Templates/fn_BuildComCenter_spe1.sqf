//SPE ComCenter 1
//Both sides, standard camp with tent

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
_obj = ["Land_SPE_Sandbag_Long",_center,[-15.144,-2.10303,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-15.1565,-6.65527,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[-14.7852,-10.1289,0],_rotation,225] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-12.4434,-11.1758,0],_rotation,140.79] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-4.05371,-9.84619,0],_rotation,230.334] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Short",_center,[-1.02979,-10.0283,0],_rotation,298.011] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[6.5437,-10.5806,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[11.0967,-10.5908,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[1.99878,-10.5806,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[14.8369,-6.91211,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-4.10669,-7.55615,0],_rotation,334.434] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[14.8491,-2.35986,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[14.5327,-10.5786,0],_rotation,135] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Curve",_center,[-12.511,-7.69336,0],_rotation,21.0123] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[5.92212,-11.3213,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[-11.2058,-8.88867,0],_rotation,106.761] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[11.8914,-11.3223,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[-0.0537109,-11.3228,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[8.9126,-11.3228,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[2.93677,-11.3242,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[-5.0542,-7.55078,0],_rotation,64.5774] call _fnc_createObject;
_obj = ["Land_SPE_Ammocrate_US_04",_center,[2.69727,-7.3374,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Gun_Hole",_center,[-2.5332,-9.5791,0],_rotation,275.922] call _fnc_createObject;
_obj = ["Land_SPE_Netting_02",_center,[14.356,-4.67725,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Stretcher",_center,[9.12817,-6.39648,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Stretcher",_center,[10.3494,-6.45654,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Tent_01",_center,[6.81274,-4.84863,0],_rotation,0] call _fnc_createObject;
_obj = ["SPE_FlagCarrier_FFF",_center,[-0.375732,0.0952148,0],_rotation,270] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;
_obj = ["Land_SPE_Sandbag_Long",_center,[-15.1414,6.9585,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-15.1536,2.40625,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Onion_Lamp",_center,[6.4209,7.34619,0.747771],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Covered_Pallets_02_Olive",_center,[-1.88647,6.30127,0],_rotation,90.3943] call _fnc_createObject;
_obj = ["Land_SPE_Covered_Pallets_01_Olive",_center,[-1.83643,9.00244,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-11.3564,11.1851,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-6.80127,11.1743,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[14.8674,6.73828,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[14.8552,2.18604,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[11.3577,11.1704,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[6.80249,11.1792,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[2.29663,11.1641,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-2.25635,11.1743,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[-14.6494,10.4731,0],_rotation,315] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[14.6184,10.4224,0],_rotation,45] call _fnc_createObject;
_obj = ["Land_WoodenTable_large_F",_center,[3.80225,2.94287,-0.00534344],_rotation,90.0034] call _fnc_createObject;
_obj = ["Land_SPE_Cider_Bottle_03",_center,[3.2417,2.94922,0.864592],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Netting_01",_center,[-12.2612,5.93604,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Netting_01",_center,[-8.00073,10.1143,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_SPE_Netting_02",_center,[14.3635,4.58008,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Netting_02",_center,[1.22388,10.7354,0],_rotation,0] call _fnc_createObject;
_obj = ["SPE_Radio_Us",_center,[8.73096,7.56055,0],_rotation,0] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
//_obj = ["SPE_ST_MG34_Bipod",_center,[-14.4316,-9.92139,0],_rotation,225] call _fnc_createObject;
//_obj = ["SPE_ST_MG34_Bipod",_center,[14.2874,-10.1504,0],_rotation,135] call _fnc_createObject;
//_obj = ["SPE_ST_MG34_Bipod",_center,[-14.4094,10.1772,0],_rotation,315] call _fnc_createObject;
//_obj = ["SPE_ST_MG34_Bipod",_center,[14.2546,10.2148,0],_rotation,45] call _fnc_createObject;
_obj = ["Land_SPE_Tent_02",_center,[6.7356,5.20215,0],_rotation,0] call _fnc_createObject;
//_obj = ["B_Truck_01_box_F",_center,[-5.81372,4.7915,0.023201],_rotation,180] call _fnc_createObject;
//_obj = ["SPE_ST_OpelBlitz_Flak38",_center,[-9.83447,5.10352,-0.0117512],_rotation,179.998] call _fnc_createObject;
_obj = ["SPE_DiningTable_01_w",_center,[6.30591,7.40723,0],_rotation,0] call _fnc_createObject;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-14.4316,-9.92139,0],_rotation,225] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[14.2874,-10.1504,0],_rotation,135] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-14.4094,10.1772,0],_rotation,315] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[14.2546,10.2148,0],_rotation,45] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-9.83447,5.10352,-0.0117512],_rotation,179.998] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-5.81372,4.7915,0.023201],_rotation,180] call _fnc_createObject;
};