// fn_Ammo Depot5.sqf - Script by NeoArmageddon.
// A huge shout out to NeoArmageddon for his advice & wisdom. 
// Thanks to Zec Building Compositions for helping make this :) 
// Relative positions exported thanks too Maca's M3Eden Editor Addon.
// modified by aussie :)
if(!isserver) exitwith {};

private ["_center", "_staticWeaponClasses", "_parkedVehicleClasses"];
private ["_obj", "_pos", "_marker", "_instanceNo", "_randomNo", "_gun", "_angle", "_car"];
_center = _this select 0;


_staticWeaponClasses = _this select 1;
_parkedVehicleClasses = _this select 2;
private _rotation = random 360;

[_center,25] call a3e_fnc_cleanupTerrain;

if (isNil "drn_BuildAmmoDepot_MarkerInstanceNo") then {
	drn_BuildAmmoDepot_MarkerInstanceNo = 0;
}
else {
	drn_BuildAmmoDepot_MarkerInstanceNo = drn_BuildAmmoDepot_MarkerInstanceNo + 1;
};
_instanceNo = drn_BuildAmmoDepot_MarkerInstanceNo;

private _fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];

    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call A3E_fnc_rotatePosition);
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};
    // Cars
    
    if (random 10 > 1 && count _parkedVehicleClasses > 0) then {
        _car = selectRandom _parkedVehicleClasses;
    }
    else {
        _car = "";
    };
    
    if (_car != "") then {
        //_object = _car createVehicle _pos;
        //_object = createVehicle [_car, _pos, [], 0, "NONE"];

		_pos = [_center,_center vectorAdd [26.1731,0.00830078,0],_rotation] call A3E_fnc_rotatePosition;
		_obj = createvehicle [_car, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[1,-0.000440045,0],[0,-0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

	// Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [-7.66699,-5.83887,-0.00143909],_rotation] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [-13.532,13.2534,-0.00143814],_rotation] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

//SPAWN IN THE BASE OBJECTS	
//private _objects = [
// Car // 	["O_Truck_03_device_F",_center,[24.1731,0.00830078,4.76837e-007],_rotation,180.808] call _fnc_createObject;
// Statics //		["B_sniper_F",_center,[-7.66699,-5.83887,-0.00143909],_rotation,0] call _fnc_createObject;
// Statics //		["B_sniper_F",_center,[-13.532,13.2534,-0.00143814],_rotation,0] call _fnc_createObject;
//	["Flag_CSAT_F",_center,[-16.4143,-1.93066,0],_rotation,0] call _fnc_createObject;
	["Land_PowerGenerator_F",_center,[-13.2283,4.92969,0],_rotation,180] call _fnc_createObject;
	["Land_TTowerSmall_2_F",_center,[-15.7585,4.91602,0],_rotation,0] call _fnc_createObject;
	["Land_Shed_Big_F",_center,[6.64624,1.66602,4.76837e-007],_rotation,0] call _fnc_createObject;
	["Land_Cargo_HQ_V1_F",_center,[3.64636,1.44727,-4.76837e-007],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-18.8104,2.74414,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-18.5604,-1.50586,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-15.8107,7.74414,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-15.3107,-6.50586,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrierWall4_F",_center,[5.89661,11.4478,0],_rotation,375] call _fnc_createObject;
	["Land_HBarrierWall4_F",_center,[0.896484,11.9478,0],_rotation,360] call _fnc_createObject;
	["Land_Razorwire_F",_center,[4.14624,14.1973,0],_rotation,180] call _fnc_createObject;
	["Land_Razorwire_F",_center,[-7.35376,11.4473,0],_rotation,180] call _fnc_createObject;
	["Land_Razorwire_F",_center,[-16.5605,-8.25586,0],_rotation,0] call _fnc_createObject;
	["Land_IronPipes_F",_center,[-8.66394,-11.6445,0],_rotation,13.8028] call _fnc_createObject;
	["Land_ConcretePipe_F",_center,[-8.88721,19.7896,0],_rotation,150.038] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[18.8116,-8.81396,0],_rotation,119.326] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-2.35376,12.1973,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[9.64624,11.9473,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[17.401,9.82178,0],_rotation,66.0661] call _fnc_createObject;
	// clipping like a mofo :( ["Land_CncShelter_F",_center,[10.3962,9.19678,0],_rotation,90] call _fnc_createObject;
	["Land_WaterTank_F",_center,[6.39624,-5.05273,0],_rotation,1.00179e-005] call _fnc_createObject;
	["Land_CratesWooden_F",_center,[-6.85376,6.94727,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_1_F",_center,[-2.10376,7.94678,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_1_F",_center,[9.64636,13.9473,0],_rotation,75] call _fnc_createObject;
	["Land_HBarrier_1_F",_center,[-1.60388,6.44727,0],_rotation,150] call _fnc_createObject;
	["Land_PaperBox_open_full_F",_center,[0.396118,-8.05273,0],_rotation,0] call _fnc_createObject;
	["Land_PaperBox_open_empty_F",_center,[9.64612,-5.05273,0],_rotation,0] call _fnc_createObject;
	["Land_WoodenTable_large_F",_center,[-4.10376,3.44727,0],_rotation,119.997] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[0.396118,-6.30273,0],_rotation,195] call _fnc_createObject;
	["Land_Sacks_heap_F",_center,[13.3962,-5.05273,0],_rotation,0] call _fnc_createObject;
	["Land_CncBarrier_F",_center,[19.97,1.30176,0],_rotation,90] call _fnc_createObject;
	["Land_CncBarrier_F",_center,[19.2821,-3.31396,0],_rotation,90] call _fnc_createObject;
	["Land_CncBarrier_F",_center,[16.6464,13.9468,0],_rotation,240] call _fnc_createObject;
	["Land_CncBarrier_F",_center,[19.6637,8.20215,0],_rotation,90] call _fnc_createObject;
	["Land_CncBarrier_F",_center,[13.3961,16.9478,0],_rotation,210] call _fnc_createObject;
	["Land_ShelvesWooden_khaki_F",_center,[-4.60498,-3.30273,0],_rotation,90.0034] call _fnc_createObject;
	["FlexibleTank_01_sand_F",_center,[1.64648,-6.80273,0],_rotation,359.98] call _fnc_createObject;
	["Land_CampingChair_V2_F",_center,[-4.10742,2.62549,0],_rotation,45.0014] call _fnc_createObject;
	["Land_CampingChair_V2_F",_center,[-4.22388,4.42432,0],_rotation,180.001] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[-3.10376,7.94727,0],_rotation,314.984] call _fnc_createObject;
	["Land_BarrelTrash_grey_F",_center,[-3.60376,-3.30273,0],_rotation,359.989] call _fnc_createObject;
	["Land_BarrelSand_F",_center,[10.8962,10.9473,0],_rotation,359.989] call _fnc_createObject;
	["Land_PlasticCase_01_small_F",_center,[-5.59644,-3.30371,0],_rotation,330.207] call _fnc_createObject;
	["Land_Garbage_square5_F",_center,[-3.85388,4.19727,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-1.85364,-9.55273,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[3.39636,-12.8027,0],_rotation,180] call _fnc_createObject;
	["Land_Razorwire_F",_center,[-3.85376,-10.3027,0],_rotation,90] call _fnc_createObject;
	["Land_Razorwire_F",_center,[1.14624,-14.3027,0],_rotation,0] call _fnc_createObject;
	["Land_LampShabby_F",_center,[8.64636,-12.8032,0],_rotation,270] call _fnc_createObject;
	["Land_Cargo10_grey_F",_center,[1.14624,-10.3027,0],_rotation,0.00180968] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[7.14612,-11.0527,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[8.14624,-12.5527,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[7.14636,-14.3027,0],_rotation,0] call _fnc_createObject;
	["Land_CncBarrier_F",_center,[13.6461,-13.5527,0],_rotation,315] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[9.39624,-11.8027,0],_rotation,314.984] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[9.64624,-11.0527,0],_rotation,179.991] call _fnc_createObject;
	["Land_Coil_F",_center,[-12.8181,-15.1147,0],_rotation,5.79208e-006] call _fnc_createObject;
	["Land_Razorwire_F",_center,[-20.5605,-4.75586,0],_rotation,90] call _fnc_createObject;
	["Land_Razorwire_F",_center,[-20.8105,5.99414,0],_rotation,90] call _fnc_createObject;
	["Land_ConcretePipe_F",_center,[-9.77002,15.9189,0],_rotation,120.031] call _fnc_createObject;
	/*
	["AmmoCrates_NoInteractive_Small",_center,[1.90552,-0.259277,-3.12652],_rotation,4.86573] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Medium",_center,[-15.1067,1.13428,0],_rotation,268.758] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Large",_center,[4.58655,-8.20313,0],_rotation,268.758] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",_center,[4.37134,-10.7197,0],_rotation,4.86573] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",_center,[6.86023,-9.09326,0],_rotation,4.86573] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Medium",_center,[-14.5537,-1.21094,0],_rotation,268.758,_center,[true,false]]
	
];

private _center = [0,0,0];
{
	private _object = (_x select 0) createVehicle [0,0,0];
	_object setDir (_x select 2);
	_object setPosATL (_center vectorAdd (_x select 1));
	_object enableSimulationGlobal ((_x select 3) select 0);
	_object allowDamage ((_x select 3) select 1);
} forEach _objects;
*/

	// ++++++++FLAG++++++++++//
	
//Add your own server flag - uncomment line 103  (see https://forums.bohemia.net/forums/topic/180080-co10-escape/?do=findComment&comment=3346952 )
//+ Create a folder "flag" in the root directory of your misson file. Drop in your paa logo & call it logo.paa (jpg might work, PAA is the best).
_obj = ["Flag_CSAT_F",_center,[-16.4143,-1.93066,0],_rotation,266.77] call _fnc_createObject;
//_obj forceFlagTexture "mapConfig\logo.paa"; 

 // Weapons
    
    private ["_weapons", "_weaponMagazines", "_box", "_weaponCount"];

    // Basic Weapon Box
    
    _weapons = [];
    _weaponMagazines = [];
    
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
		//_box = createVehicle ["Box_East_Wps_F", [(_center select 0) - 5, (_center select 1) + 1, 0], [], 0, "CAN_COLLIDE"];
		_box  = ["Box_East_Wps_F",_center,[-9.77002,1,0],_rotation, 0] call _fnc_createObject;
/*		_pos = [_center,_center vectorAdd [1.90552,-0.259277,3.12652],_rotation] call A3E_fnc_rotatePosition;
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

    // Special Weapon Box
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count a3e_arr_AmmoDepotSpecialWeapons - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = a3e_arr_AmmoDepotSpecialWeapons select _i;
        
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
        //_box = "Box_East_WpsLaunch_F" createVehicle [(_middlePos select 0) + 3, (_middlePos select 1) + 0, 0];
		//_box = createVehicle ["Box_East_WpsLaunch_F", [(_center select 0) - 5, (_center select 1) + 1.6, 0], [], 0, "CAN_COLLIDE"];
		_box  = ["Box_East_WpsLaunch_F",_center,[-15.1067,1.13428,0],_rotation, 0] call _fnc_createObject;
/*		_pos = [_center,_center vectorAdd [-15.1067,1.13428,0],_rotation] call A3E_fnc_rotatePosition;
		_box = "Box_East_WpsLaunch_F" createvehicle _pos;
		_box setVectorDirAndUp [[-0.999231,0.0392098,0],[0,0,1]];
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

	if((Param_Waffelbox)==1) then {
		_box = createVehicle [a3e_additional_weapon_box_1, [(_center select 0) + 0, (_center select 1) + 3, 0], [], 0, "CAN_COLLIDE"];
        _box call A3E_fnc_initArsenal;		  
		_box = createVehicle [a3e_additional_weapon_box_2, [(_center select 0) + 3, (_center select 1) + 3, 0], [], 0, "CAN_COLLIDE"];
        _box call A3E_fnc_initArsenal;				  
	 };
    // Ordnance
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count a3e_arr_AmmoDepotOrdnance - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = a3e_arr_AmmoDepotOrdnance select _i;
        
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
        //_box = "Box_East_WpsSpecial_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) - 3, 0];
        //_box = createVehicle ["Box_East_WpsSpecial_F", [(_middlePos select 0) + 0, (_middlePos select 1) - 3, 0], [], 0, "CAN_COLLIDE"];
		//_box = createVehicle ["Box_East_WpsSpecial_F", [(_center select 0) - 5, (_center select 1) + 1.6, 0], [], 0, "CAN_COLLIDE"];
		_box  = ["Box_East_WpsLaunch_F",_center,[4.58655,-8.20313,0],_rotation, 0] call _fnc_createObject;
/*		_pos = [_center,_center vectorAdd [4.58655,-8.20313,0],_rotation] call A3E_fnc_rotatePosition;
		_box = "Box_East_WpsSpecial_F" createvehicle _pos;
		_box setVectorDirAndUp [[-0.999874,-0.0158694,0],[-0,0,1]];
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
    
    // Vehicle
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count a3e_arr_AmmoDepotVehicle - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = a3e_arr_AmmoDepotVehicle select _i;
        
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
	
	 _items = [];
	 for "_i" from 0 to (count a3e_arr_AmmoDepotVehicleItems - 1) do {
        private ["_item", "_itemClassName", "_probabilityOfPrecence", "_minCount", "_maxCount"];
        
        _item = a3e_arr_AmmoDepotVehicleItems select _i;
        
        _itemClassName = _item select 0;
        _probabilityOfPrecence = _item select 1;
        _minCount = _item select 2;
        _maxCount = _item select 3;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _itemCount = floor (_minCount + random (_maxCount - _minCount));
            _items pushback [_itemClassName, _itemCount];
        };
    };
	
	
    if (count _weapons > 0 || count _weaponMagazines > 0 || count _items > 0) then {
        //_box = "Box_NATO_AmmoVeh_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) + 0, 0];
        //_box = createVehicle ["Box_NATO_AmmoVeh_F", [(_middlePos select 0) + 0, (_middlePos select 1) + 0, 0], [], 0, "CAN_COLLIDE"];
		//_box = createVehicle ["Box_NATO_AmmoVeh_F", [(_center select 0) + 0.90552, (_center select 1) + -1.259277,  3.128], [], 0, "CAN_COLLIDE"];
		_box  = ["Box_NATO_AmmoVeh_F",_center,[16.37134,-0.7197,0],_rotation, 0] call _fnc_createObject;
/*		_pos = [_center,_center vectorAdd [4.37134,-10.7197,0],_rotation] call A3E_fnc_rotatePosition;
		_box = "Box_NATO_AmmoVeh_F" createvehicle _pos;
		_box setVectorDirAndUp [[-0.999874,-0.0158694,0],[-0,0,1]];
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
		{
            _box addBackpackCargoGlobal [_x,4];
        } foreach a3e_arr_AmmoDepotVehicleBackpacks;
		{
            _box addItemCargoGlobal _x;
        } foreach _items;
    };
    
    // Items

    _weapons = [];
    
    for "_i" from 0 to (count a3e_arr_AmmoDepotItems - 1) do {
        private ["_item", "_itemClassName", "_probabilityOfPrecence", "_minCount", "_maxCount"];
        
        _item = a3e_arr_AmmoDepotItems select _i;
        
        _itemClassName = _item select 0;
        _probabilityOfPrecence = _item select 1;
        _minCount = _item select 2;
        _maxCount = _item select 3;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _itemCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons pushBack [_itemClassName, _itemCount];
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_East_Wps_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) + 3, 0];
        //_box = createVehicle ["Box_East_Wps_F", [(_middlePos select 0) + 3, (_middlePos select 1) - 3, 0], [], 0, "CAN_COLLIDE"];
		//_box = createVehicle ["Box_East_Wps_F", [(_center select 0) - 9.90552, (_center select 1) + -0.259277, 0], [], 0, "CAN_COLLIDE"];
		_box  = ["Box_East_Wps_F",_center,[6.86023,-9.09326,0],_rotation, 0] call _fnc_createObject;
/*		_pos = [_center,_center vectorAdd [6.86023,-9.09326,0],_rotation] call A3E_fnc_rotatePosition;
		_box = "Box_East_Wps_F" createvehicle _pos;
		_box setVectorDirAndUp [[-0.0739712,-0.99726,0],[0,0,1]];
		_box setdir ((getdir _box) + _rotation);
		_box setPosATL _pos;
*/
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;
        
        {
            _box addItemCargoGlobal _x;
        } foreach _weapons;
    };

    // Launchers
    
    _weapons = [];
    _weaponMagazines = [];
    
    for "_i" from 0 to (count a3e_arr_AmmoDepotLaunchers - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = a3e_arr_AmmoDepotLaunchers select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons set [count _weapons, [_weaponClassName, _weaponCount]];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines set [count _weaponMagazines, [_magazines select _j, _weaponCount * _magazinesPerWeapon]];
            };
        };
    };
    
    if (count _weapons > 0 || count _weaponMagazines > 0) then {
        //_box = "Box_East_WpsLaunch_F" createVehicle [(_middlePos select 0) - 3, (_middlePos select 1) - 3, 0];
        //_box = createVehicle ["Box_East_WpsLaunch_F", [(_middlePos select 0) - 3, (_middlePos select 1) - 3, 0], [], 0, "CAN_COLLIDE"];
	  
		//_box = createVehicle ["Box_East_WpsLaunch_F", [(_center select 0) - 9.90552, (_center select 1) + -1.259277, 0], [], 0, "CAN_COLLIDE"];
     	_box  = ["Box_East_WpsLaunch_F",_center,[-14.5537,-1.21094,0],_rotation, 0] call _fnc_createObject;
		//_pos = [_center,_center vectorAdd [-14.5537,-1.21094,0],_rotation] call A3E_fnc_rotatePosition;
		//_box = "Box_East_WpsLaunch_F" createvehicle _pos;
		//_box setVectorDirAndUp [[-0.999602,0.0282007,0],[0,0,1]];
		//_box setdir ((getdir _box) + _rotation);
		//_box setPosATL _pos;


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

    // Set markers
    
    //_marker = createMarker ["drn_AmmoDepotMapMarker" + str _instanceNo, _middlePos];
    //_marker setMarkerType "o_installation";
      //_marker setMarkerType "o_installation";
	  
    ["drn_AmmoDepotMapMarker" + str _instanceNo,_center,"o_installation"] call A3E_fnc_createLocationMarker;

    _marker = createMarkerLocal ["drn_AmmoDepotPatrolMarker" + str _instanceNo, _center];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerSizeLocal [50, 50];
	
