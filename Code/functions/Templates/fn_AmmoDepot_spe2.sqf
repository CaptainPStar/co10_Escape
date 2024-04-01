//SPE Ammo Depot 2
//Bocage small

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

		_obj = [_car,_center,[-6.31226,-0.320313,0.0229487],_rotation,180] call _fnc_createObject;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
//_obj = ["B_T_Truck_01_fuel_F",_center,[-6.31226,-0.320313,0.0229487],_rotation,180] call _fnc_createObject;

	// Statics
    //None here


//SPAWN IN THE BASE OBJECTS
_obj = ["Land_SPE_Bocage_Low_Long",_center,[-10.218,-0.0834961,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Bocage_Low_Long",_center,[-4.33618,6.77734,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Mound_Low_02",_center,[-5.96851,-6.21729,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[-10.2131,-0.0820313,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[-4.33105,6.7793,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Bocage_Low_Long",_center,[3.7749,-6.16992,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Bocage_Low_Long",_center,[10.2771,0.110352,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_tree_01_mound",_center,[6.14941,6.92041,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_tree_01",_center,[6.15063,6.91992,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[3.78003,-6.16797,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[10.282,0.111816,0],_rotation,0] call _fnc_createObject;

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
		_box  = ["SPE_BasicWeaponsBox_US",_center,[-0.595703,-4.0791,-4.76837e-007],_rotation,360] call _fnc_createObject;
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
		_box  = ["SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball",_center,[7.54175,-3.93408,-9.53674e-007],_rotation,360] call _fnc_createObject;
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
		_box = [a3e_additional_weapon_box_1,_center,[1.7417,-4.15283,-9.53674e-007],_rotation,90.0009] call _fnc_createObject;
        _box call A3E_fnc_initArsenal;		  
		_box = [a3e_additional_weapon_box_2,_center,[0.213867,4.39355,-1.43051e-006],_rotation,0.000742093] call _fnc_createObject;
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
		_box  = ["SPE_Mine_AmmoBox_US",_center,[7.8623,0.312012,-1.43051e-006],_rotation,359.995] call _fnc_createObject;
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
		_box  = ["SPE_BasicAmmunitionBox_US",_center,[-3.00586,3.8252,0.0305448],_rotation,359.86] call _fnc_createObject;
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
		_box  = ["SPE_BasicAmmunitionBox_US",_center,[4.73926,-4.02637,1.90735e-006],_rotation,89.2553] call _fnc_createObject;
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
     	_box  = ["SPE_BasicWeaponsBox_US",_center,[7.84424,3.65479,-9.53674e-007],_rotation,90.0009] call _fnc_createObject;
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
_obj = ["Box_NATO_AmmoVeh_F",_center,[-3.00586,3.8252,0.0305448],_rotation,359.86] call _fnc_createObject;				SPE_BasicAmmunitionBox_US
_obj = ["Box_NATO_Wps_F",_center,[-0.595703,-4.0791,-4.76837e-007],_rotation,360] call _fnc_createObject;						SPE_BasicWeaponsBox_US
_obj = ["B_supplyCrate_F",_center,[0.213867,4.39355,-1.43051e-006],_rotation,0.000742093] call _fnc_createObject;		//extra2	SPE_Hay_WeaponCache_FFI
_obj = ["Box_NATO_Ammo_F",_center,[4.73926,-4.02637,1.90735e-006],_rotation,89.2553] call _fnc_createObject;					SPE_BasicAmmunitionBox_US
_obj = ["Box_NATO_AmmoOrd_F",_center,[7.8623,0.312012,-1.43051e-006],_rotation,359.995] call _fnc_createObject;					SPE_Mine_AmmoBox_US
_obj = ["Box_NATO_WpsSpecial_F",_center,[7.54175,-3.93408,-9.53674e-007],_rotation,360] call _fnc_createObject;		SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball
_obj = ["Box_NATO_WpsLaunch_F",_center,[7.84424,3.65479,-9.53674e-007],_rotation,90.0009] call _fnc_createObject;				SPE_BasicWeaponsBox_US
_obj = ["Box_NATO_Equip_F",_center,[1.7417,-4.15283,-9.53674e-007],_rotation,90.0009] call _fnc_createObject;		//extra1	SPE_Hay_WeaponCache_FFI
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