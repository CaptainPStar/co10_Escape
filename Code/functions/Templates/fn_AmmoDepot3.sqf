// fn_Ammo Depot3.sqf - Script by NeoArmageddon.
// A huge shout out to NeoArmageddon for his advice & wisdom. 
// Thanks to Zec Building Compositions for helping make this :) 
// Relative positions exported thanks too Maca's M3Eden Editor Addon.
// modified by aussie :)
if(!isserver) exitwith {};

private ["_center", "_staticWeaponClasses", "_parkedVehicleClasses"];
private ["_object", "_pos", "_marker", "_instanceNo", "_randomNo", "_gun", "_angle", "_car"];
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


_fnc_createObject = {
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
		
		_pos = [_center,_center vectorAdd [-5.27795,-15.8394,0.5],_rotation] call A3E_fnc_rotatePosition;
		_obj = createvehicle [_car, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[1,-0.000440045,0],[0,-0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

	// Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [6.0531,12.4585,-0.00143909],_rotation] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [3.42651,-6.48389,-0.00143814],_rotation] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

	// ++++++++FLAG++++++++++//
	
//Add your own server flag - uncomment line 104  (see https://forums.bohemia.net/forums/topic/180080-co10-escape/?do=findComment&comment=3346952 )
//+ Create a folder "flag" in the root directory of your misson file. Drop in your paa logo & call it logo.paa (jpg might work, PAA is the best).
_obj = ["Flag_CSAT_F",_center,[7.68066,-4.16943,0],_rotation,266.77] call _fnc_createObject;
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
		//_box = createVehicle ["Box_East_Wps_F", [(_center select 0) + 0.276978, (_center select 1) + -2.48975, 0.1], [], 0, "CAN_COLLIDE"];
		_box = ["Box_East_Wps_F",_center,[0.276978,-2.48975,0],_rotation,0] call _fnc_createObject;	
/*			_box = ["Box_East_WpsSpecial_F",_center,[-0.655273,0.352539,0],_rotation,0] call _fnc_createObject;	
		_pos = [_center,_center vectorAdd [0.276978,-2.48975,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_East_WpsSpecial_F", [(_center select 0) + -0.655273, (_center select 1) + 0.352539, 0.1], [], 0, "CAN_COLLIDE"];
		_box = ["Box_East_WpsSpecial_F",_center,[-0.655273,0.352539,0],_rotation,0] call _fnc_createObject;			
		/*_pos = [_center,_center vectorAdd [-0.655273,0.352539,0],_rotation] call A3E_fnc_rotatePosition;
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

	if((A3E_Param_Waffelbox)==1) then {
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
		//_box = createVehicle ["Box_East_WpsSpecial_F", [(_center select 0) + 0.492188, (_center select 1) + 2.66211, 0.1], [], 0, "CAN_COLLIDE"];
		_box = ["Box_East_WpsSpecial_F",_center,[0.492188,2.66211,0],_rotation,0] call _fnc_createObject;	
/*				
		_pos = [_center,_center vectorAdd [0.492188,2.66211,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_NATO_AmmoVeh_F", [(_center select 0) + -2.34912, (_center select 1) + -1.99658, 0.1], [], 0, "CAN_COLLIDE"];
		_box = ["Box_NATO_AmmoVeh_F",_center,[-2.34912,-1.99658,0],_rotation,0] call _fnc_createObject;	
/*			
		_pos = [_center,_center vectorAdd [-2.34912,-1.99658,-0.133212],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_East_Wps_F", [(_center select 0) + -2.5105, (_center select 1) + 2.38525, 0], [], 0, "CAN_COLLIDE"];
		_box = ["Box_East_Wps_F",_center,[-2.5105,2.38525,0],_rotation,0] call _fnc_createObject;	
/*	
		_pos = [_center,_center vectorAdd [-2.5105,2.38525,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_East_WpsLaunch_F", [(_center select 0) + -0.764404, (_center select 1) + -4.57227, 0], [], 0, "CAN_COLLIDE"];
		_box = ["Box_East_WpsLaunch_F",_center,[-0.764404,-4.57227,0],_rotation,0] call _fnc_createObject;	
/*		
		_pos = [_center,_center vectorAdd [-0.764404,-4.57227,0],_rotation] call A3E_fnc_rotatePosition;
		_box = "Box_East_WpsLaunch_F" createvehicle _pos;
		_box setVectorDirAndUp [[-0.999602,0.0282007,0],[0,0,1]];
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

    // Set markers
    
    //_marker = createMarker ["drn_AmmoDepotMapMarker" + str _instanceNo, _middlePos];
    //_marker setMarkerType "o_installation";
      //_marker setMarkerType "o_installation";
	  
    ["drn_AmmoDepotMapMarker" + str _instanceNo,_center,"o_installation"] call A3E_fnc_createLocationMarker;

    _marker = createMarkerLocal ["drn_AmmoDepotPatrolMarker" + str _instanceNo, _center];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerSizeLocal [50, 50];
	
	
// bonus vehice	["O_Truck_03_device_F",_center,[-5.27795,-15.8394,4.76837e-007],_rotation,181.262] call _fnc_createObject;
// static weapons	["B_sniper_F",_center,[6.0531,12.4585,-0.00143909],_rotation,0] call _fnc_createObject;
// static weapons	["B_sniper_F",_center,[3.42651,-6.48389,-0.00143814],_rotation,0] call _fnc_createObject;
	["Land_Cargo_House_V1_F",_center,[7.94409,2.11621,0],_rotation,90] call _fnc_createObject;
	["Land_Cargo_House_V1_F",_center,[-7.29944,-1.27393,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[6.37476,16.2656,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-13.0569,13.5439,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-9.1521,16.9565,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-2.13916,6.80273,0],_rotation,180] call _fnc_createObject;
	["Land_Garbage_square5_F",_center,[-0.702393,10.1104,0],_rotation,0] call _fnc_createObject;
	["Land_Garbage_square5_F",_center,[-9.68762,12.4941,0],_rotation,0] call _fnc_createObject;
	// this is clipping ["Land_GarbageWashingMachine_F",_center,[-8.63928,12.3027,0],_rotation,180] call _fnc_createObject;
	["Land_GarbagePallet_F",_center,[-0.943848,10.1108,0],_rotation,0] call _fnc_createObject;
	["Land_Cargo10_yellow_F",_center,[9.7356,10.1777,0],_rotation,134.999] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[-4.49426,9.07959,0],_rotation,0] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[4.01624,8.97852,0],_rotation,225] call _fnc_createObject;
	["Land_WaterBarrel_F",_center,[1.8606,6.67773,0],_rotation,359.996] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-10.7644,-5.69727,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[9.36047,-4.07227,0],_rotation,285] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[8.7356,-9.19727,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[6.36047,-11.3223,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-9.76453,-9.19727,0],_rotation,0] call _fnc_createObject;
	["Land_PowerGenerator_F",_center,[-8.7644,-7.82227,0],_rotation,270] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[7.2356,-9.07227,0],_rotation,359.966] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[5.65552,-8.7207,0],_rotation,224.974] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[6.4856,-9.82227,0],_rotation,179.966] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[5.7356,-9.82227,0],_rotation,224.974] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[7.2356,-9.82227,0],_rotation,179.966] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[6.4856,-9.07227,0],_rotation,359.966] call _fnc_createObject;
//	["Land_BarrelTrash_grey_F",_center,[-0.764404,-4.57227,0],_rotation,359.962] call _fnc_createObject;
	["Land_TTowerSmall_2_F",_center,[-9.26416,-7.57227,0],_rotation,0] call _fnc_createObject;
	//["Flag_CSAT_F",_center,[7.68066,-4.16943,0],_rotation,0] call _fnc_createObject;
	["Land_Cargo20_sand_F",_center,[-0.809814,-11.5806,0],_rotation,232.02] call _fnc_createObject;
/*	["AmmoCrates_NoInteractive_Small",_center,[0.276978,-2.48975,0],_rotation,96.1081] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Medium",_center,[0.492188,2.66211,0],_rotation,0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Large",_center,[-0.655273,0.352539,0],_rotation,0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",_center,[-2.34912,-1.99658,-0.133212],_rotation,96.1081] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",_center,[-2.5105,2.38525,0],_rotation,96.1081,_center,[true,false]]
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