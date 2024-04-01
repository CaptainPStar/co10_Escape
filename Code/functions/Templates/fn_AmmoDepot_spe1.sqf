//SPE Ammo Depot 1
//Barn

// Eden Object composition to SQF
// Export file
// Script by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"

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

		_obj = [_car,_center,[-11.4243,-1.82373,0.0185852],_rotation,180] call _fnc_createObject;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
//_obj = ["B_T_Truck_01_fuel_F",_center,[-11.4243,-1.82373,0.0185852],_rotation,180] call _fnc_createObject;

	// Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_obj = [_gun,_center,[9.8772,-2.75,-0.00653458],_rotation,106.631] call _fnc_createObject;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

//_obj = ["SPE_leFH18_AT",_center,[9.8772,-2.75,-0.00653458],_rotation,106.631] call _fnc_createObject;


//SPAWN IN THE BASE OBJECTS	
_obj = ["Land_SPE_Barn_01",_center,[0.853027,-0.613281,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Tractor_01",_center,[-4.08301,-9.09326,0],_rotation,248.545] call _fnc_createObject;
_obj = ["Land_SPE_Straw_Bale_Stack_01",_center,[5.80151,6.44482,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Short",_center,[-8.73975,6.44629,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-6.39722,7.45313,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[5.50098,0.505371,2.38294],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-0.746094,-2.06543,2.38358],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[1.22021,0.526855,2.38262],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[-2.88135,8.10938,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Straw_Bale",_center,[0.956787,4.62988,0.13251],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Straw_Bale",_center,[0.394775,-4.20898,0],_rotation,88.3485] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long_Thick",_center,[2.08813,-5.90381,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Curve",_center,[8.39941,-6.99316,0],_rotation,100.584] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Curve",_center,[10.5134,-1.04053,0],_rotation,326.237] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Short_Low",_center,[-0.68042,7.26416,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Short_Low",_center,[-8.70557,4.15137,0],_rotation,0] call _fnc_createObject;
_obj = ["SPE_Cow_Dead_Brown_01",_center,[11.0171,7.79688,0],_rotation,148.657] call _fnc_createObject;
_obj = ["Land_SPE_57MM_shellcase_01",_center,[7.06128,-2.11914,0],_rotation,0] call _fnc_createObject;
_obj = ["SPE_Banner_01_FFF_F",_center,[-2.69702,5.33496,2.82045],_rotation,0] call _fnc_createObject;
_obj = ["SPE_Banner_01_FFF_F",_center,[8.26221,1.92822,1.90718],_rotation,90] call _fnc_createObject;

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
             if(typeName _weaponClassName == "STRING") then {
				_weapons pushBack [_weaponClassName, _weaponCount];
			};
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines pushBack [_magazines select _j, _weaponCount * _magazinesPerWeapon];
            };
        };
    };

    if (count _weapons > 0 || count _weaponMagazines > 0) then {
		_box  = ["SPE_BasicWeaponsBox_US",_center,[-1.18188,-3.66699,0.131509],_rotation,270] call _fnc_createObject;
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
             if(typeName _weaponClassName == "STRING") then {
				_weapons pushBack [_weaponClassName, _weaponCount];
			};
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines pushBack [_magazines select _j, _weaponCount * _magazinesPerWeapon];
            };
        };
    };

    if (count _weapons > 0 || count _weaponMagazines > 0) then {
		_box  = ["SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball",_center,[-5.05176,-4.07324,0.131509],_rotation,1.18748e-005] call _fnc_createObject;
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

	//additional boxes (only spawned if activated in mission parameters)
	if((A3E_Param_Waffelbox)==1) then {
		_box = [a3e_additional_weapon_box_1,_center,[3.61914,3.03125,0.131509],_rotation,89.9911] call _fnc_createObject;
        _box call A3E_fnc_initArsenal;		  
		_box = [a3e_additional_weapon_box_2,_center,[6.41284,3.28174,0.131508],_rotation,0.00162917] call _fnc_createObject;
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
             if(typeName _weaponClassName == "STRING") then {
				_weapons pushBack [_weaponClassName, _weaponCount];
			};
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines pushBack [_magazines select _j, _weaponCount * _magazinesPerWeapon];
            };
        };
    };
    
    if (count _weapons > 0 || count _weaponMagazines > 0) then {
		_box  = ["SPE_Mine_AmmoBox_US",_center,[-1.2019,4.25098,0.131508],_rotation,89.9995] call _fnc_createObject;
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
             if(typeName _weaponClassName == "STRING") then {
				_weapons pushBack [_weaponClassName, _weaponCount];
			};
            
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
		_box  = ["SPE_BasicAmmunitionBox_US",_center,[-8.56396,-6.21338,0],_rotation,90] call _fnc_createObject;
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
		_box  = ["SPE_BasicAmmunitionBox_US",_center,[-5.28589,4.06689,0.131512],_rotation,89.9967] call _fnc_createObject;
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
     	_box  = ["SPE_BasicWeaponsBox_US",_center,[-0.886719,1.23584,0.13151],_rotation,90.0005] call _fnc_createObject;
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

/*
_obj = ["Box_NATO_AmmoVeh_F",_center,[-8.56396,-6.21338,0],_rotation,90] call _fnc_createObject;							SPE_AmmoCrate_VehicleAmmo_US
_obj = ["Box_NATO_WpsSpecial_F",_center,[-5.05176,-4.07324,0.131509],_rotation,1.18748e-005] call _fnc_createObject;		SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball
_obj = ["Box_NATO_WpsLaunch_F",_center,[-0.886719,1.23584,0.13151],_rotation,90.0005] call _fnc_createObject;				SPE_BasicWeaponsBox_US
_obj = ["B_supplyCrate_F",_center,[6.41284,3.28174,0.131508],_rotation,0.00162917] call _fnc_createObject;		//extra2	SPE_Hay_WeaponCache_FFI
_obj = ["Box_NATO_AmmoOrd_F",_center,[-1.2019,4.25098,0.131508],_rotation,89.9995] call _fnc_createObject;					SPE_Mine_AmmoBox_US
_obj = ["Box_NATO_Ammo_F",_center,[-5.28589,4.06689,0.131512],_rotation,89.9967] call _fnc_createObject;					SPE_BasicAmmunitionBox_US
_obj = ["Box_NATO_Wps_F",_center,[-1.18188,-3.66699,0.131509],_rotation,270] call _fnc_createObject;						SPE_BasicWeaponsBox_US
_obj = ["Box_NATO_Equip_F",_center,[3.61914,3.03125,0.131509],_rotation,89.9911] call _fnc_createObject;		//extra1	SPE_Hay_WeaponCache_FFI
*/

    // Set markers
    
    //_marker = createMarker ["drn_AmmoDepotMapMarker" + str _instanceNo, _middlePos];
    //_marker setMarkerType "o_installation";
      //_marker setMarkerType "o_installation";
	  
    ["drn_AmmoDepotMapMarker" + str _instanceNo,_center,"o_installation"] call A3E_fnc_createLocationMarker;

    _marker = createMarkerLocal ["drn_AmmoDepotPatrolMarker" + str _instanceNo, _center];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerSizeLocal [50, 50];