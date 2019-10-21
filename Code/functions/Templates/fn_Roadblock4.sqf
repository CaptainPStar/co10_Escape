// fn_rOADBLOCK4.sqf - Script by NeoArmageddon.
// A huge shout out to NeoArmageddon for his advice & wisdom. 
// Thanks to Zec Building Compositions for helping make this :) 
// Relative positions exported thanks too Maca's M3Eden Editor Addon.
// modified by aussie :)

params ["_center", "_rotation", ["_static", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
[_center,25] call a3e_fnc_cleanupTerrain;

private _fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir",["_align",true]];
    private _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call A3E_fnc_RotatePosition);
    private _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
	if(_align) then {
		_object setVectorUp surfaceNormal _realPos;
	};	
    _object
};

private _objects = [];
private _obj = objNull;

_obj = ["Land_PowerGenerator_F",_center,[-6.22791,5.81348,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_TTowerSmall_2_F",_center,[-5.87024,7.4834,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_HBarrier_Big_F",_center,[9.34473,8.75732,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_HBarrier_Big_F",_center,[9.46973,0.257324,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[7.21973,9.13232,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[7.21973,16.7573,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_LampShabby_F",_center,[10.3447,0.132324,0],_rotation,60] call _fnc_createObject;
_obj = ["Land_HBarrier_5_F",_center,[24.22,-8.11719,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_HBarrier_5_F",_center,[20.8447,-10.2427,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[7.46973,-14.9927,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[7.59473,-23.9927,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_PaperBox_closed_F",_center,[20.4447,-5.32764,0],_rotation,225] call _fnc_createObject;
_obj = ["CamoNet_BLUFOR_open_F",_center,[17.7197,-5.24268,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_PaperBox_open_empty_F",_center,[16.7198,-6.49268,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_HBarrier_1_F",_center,[9.34473,-8.99316,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_BagBunker_Tower_F",_center,[13.4695,-12.6177,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_HBarrier_5_F",_center,[-3.65527,0.757324,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_HBarrier_5_F",_center,[-15.7804,2.38184,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[-2.15527,9.00732,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[-2.15527,16.6323,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_BagFence_Long_F",_center,[-3.42371,10.8706,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_BagFence_Short_F",_center,[-10.6738,15.4951,0],_rotation,345] call _fnc_createObject;
_obj = ["Land_BagFence_Round_F",_center,[-8.53552,15.6221,0],_rotation,15] call _fnc_createObject;
_obj = ["Land_BagFence_Round_F",_center,[-6.54883,13.9951,0],_rotation,210] call _fnc_createObject;
_obj = ["Land_BagFence_Round_F",_center,[-4.29871,13.2461,0],_rotation,30] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-14.1553,9.25732,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-8.03027,-0.492676,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-15.155,6.38232,0],_rotation,120] call _fnc_createObject;
// BASIC WEAPONS CRATE_obj = ["Land_PaperBox_open_full_F",_center,[-11.7788,3.81836,0],180,[true,false]],
_obj = ["CamoNet_BLUFOR_F",_center,[-12.7802,2.63281,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_HBarrier_5_F",_center,[-12.1554,-7.24316,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_HBarrier_Big_F",_center,[-7.16614,-14.4321,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[-1.78027,-24.1177,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_Mil_ConcreteWall_F",_center,[-1.90527,-15.1177,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_Cargo_Patrol_V1_F",_center,[-7.2804,-8.36865,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_BarGate_F",_center,[3.09448,-5.61768,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-8.90527,-2.86719,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-5.0658,-9.98145,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-8.2229,-10.0518,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-11.2803,-3.74268,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_HBarrier_3_F",_center,[-3.65527,-7.49268,0],_rotation,270] call _fnc_createObject;

// call _fnc_createObject;
//STATIC GUNNER		["B_Soldier_A_F",[13.554,-11.0762,-2.78144],0,[true,false]],
//STATIC GUNNER	["B_Soldier_A_F",[-8.06909,12.104,-0.00143909],186.127,[true,false]],
//VEHICLE	["Land_DataTerminal_01_F",[3.79742,36.481,0],90.7022,[true,false]]

if(!(isNull _static)) then {
	_pos = [_center,_center vectorAdd [13.554,-11.0762,2.78144],_rotation] call A3E_fnc_rotatePosition;
	//_static setVectorDirAndUp [[0.0308489,0.999524,0],[0,0,1]];
	_static setdir ((getdir _static) + _rotation);
	_static setVectorUp surfaceNormal _pos;
	_static setPosATL _pos;
};

if !(isNull _vehicle) then {
	private _pos = [_center,_center vectorAdd [3.79742,36.481,0],_rotation] call A3E_fnc_rotatePosition;
	_vehicle setdir (180.256 + _rotation);
	_vehicle setPosATL _pos;
};

// Weapons

private ["_box", "_weaponCount"];

// Basic Weapon Box
private _weapons = [];
private _weaponMagazines = [];

for "_i" from 0 to (count a3e_arr_AmmoDepotBasicWeapons - 1) do {
    private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
    
    _handGunItem = a3e_arr_AmmoDepotBasicWeapons select _i;
    
    _weaponClassName = _handGunItem select 0;
    _probabilityOfPrecence = _handGunItem select 1;
    _minCount = _handGunItem select 2;
    _maxCount = _handGunItem select 3;
    _magazines = _handGunItem select 4;
    _magazinesPerWeapon = _handGunItem select 5;
    
    if (random 100 <= _probabilityOfPrecence) then {
        _weaponCount = floor (_minCount + random (_maxCount - _minCount));
        _weapons pushBack [_weaponClassName, _weaponCount];
        
        for "_j" from 0 to (count _magazines) - 1 do {
            _weaponMagazines pushBack [_magazines select _j, _weaponCount * _magazinesPerWeapon];
        };
    };
};

if (count _weapons > 0 || count _weaponMagazines > 0) then {
    //_box = "Box_East_Wps_F" createVehicle [(_middlePos select 0) - 3, (_middlePos select 1) + 0, 0];
    //_box = createVehicle ["Box_East_Wps_F", [(_middlePos select 0) - 3, (_middlePos select 1) + 0, 0], [], 0, "CAN_COLLIDE"];
		_box = createVehicle ["Box_East_Wps_F", [(_center select 0) + -11.7788, (_center select 1) + 3.81836, 0.1], [], 0, "CAN_COLLIDE"];
/*			
	_pos = [_center,_center vectorAdd [-11.7788,3.81836,0],_rotation] call A3E_fnc_rotatePosition;
	_box = "Box_East_Wps_F" createvehicle _pos;
	_box setVectorDirAndUp [[-0.999965,0.00837127,0],[0,0,1]];
	_box setdir ((getdir _box) + _rotation);
	_box setPosATL _pos;
*/		
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;

    
    {
        _box addWeaponCargoGlobal _x;
    } foreach _weapons;
    
    {
        _box addMagazineCargoGlobal _x;
    } foreach _weaponMagazines;
};


_objects;
