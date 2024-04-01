//SPE Ammo Depot 3
//Bocage medium

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

		_obj = [_car,_center,[-5.76709,1.20166,0.0249758],_rotation,180] call _fnc_createObject;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
//_obj = ["B_T_Truck_01_fuel_F",_center,[-5.76709,1.20166,0.0249758],_rotation,180] call _fnc_createObject;

	// Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_obj = [_gun,_center,[-0.486572,-7.271,-0.00396919],_rotation,234.25] call _fnc_createObject;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

//_obj = ["SPE_ST_MG42_Lafette_Deployed",_center,[-0.486572,-7.271,-0.00396919],_rotation,234.25] call _fnc_createObject;


//SPAWN IN THE BASE OBJECTS
_obj = ["Land_SPE_bocage_tree_03",_center,[-9.4021,6.2251,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_bocage_tree_03_mound",_center,[-9.41309,6.20996,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[-9.4021,-3.93701,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Bocage_Long",_center,[-9.40698,-3.93799,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Bocage_Low_Long",_center,[4.58594,-10.0249,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Bocage_Low_Long",_center,[-3.30322,11.1675,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-2.7771,-5.32129,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[-1.84155,-8.52979,0],_rotation,217.58] call _fnc_createObject;
_obj = ["Land_SPE_bocage_tree_02_mound",_center,[11.1113,6.31592,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_bocage_tree_02",_center,[11.0945,6.35693,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_bocage_tree_01_mound",_center,[7.18237,11.3105,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_tree_01",_center,[7.18359,11.3101,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Netting_01",_center,[3.36011,-3.93896,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Netting_01",_center,[-3.65601,9.16357,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_SPE_Mound_Low_02",_center,[-5.15747,-10.0723,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[-3.2981,11.1694,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[11.093,-3.74316,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_bocage_long_mound",_center,[4.59106,-10.0229,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Bocage_Long",_center,[11.0881,-3.74512,0],_rotation,0] call _fnc_createObject;


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
		_box  = ["SPE_BasicWeaponsBox_US",_center,[5.3042,-7.99023,-9.53674e-007],_rotation,360] call _fnc_createObject;
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
		_box  = ["SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball",_center,[9.2063,-5.26563,-9.53674e-007],_rotation,90] call _fnc_createObject;
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
		_box = [a3e_additional_weapon_box_1,_center,[6.1875,-4.82471,9.53674e-007],_rotation,89.999] call _fnc_createObject;
        _box call A3E_fnc_initArsenal;		  
		_box = [a3e_additional_weapon_box_2,_center,[2.80322,8.69238,1.43051e-006],_rotation,359.999] call _fnc_createObject;
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
		_box  = ["SPE_Mine_AmmoBox_US",_center,[9.33057,-1.82275,-4.76837e-007],_rotation,359.999] call _fnc_createObject;
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
		_box  = ["SPE_BasicAmmunitionBox_US",_center,[-1.65479,7.64502,0.0305448],_rotation,359.86] call _fnc_createObject;
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
		_box  = ["SPE_BasicAmmunitionBox_US",_center,[8.08789,-8.08398,4.76837e-007],_rotation,89.253] call _fnc_createObject;
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
     	_box  = ["SPE_BasicWeaponsBox_US",_center,[9.31396,0.529297,-4.76837e-007],_rotation,89.9995] call _fnc_createObject;
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

_obj = ["Box_NATO_Ammo_F",_center,[8.08789,-8.08398,4.76837e-007],_rotation,89.253] call _fnc_createObject;							SPE_BasicAmmunitionBox_US
_obj = ["Box_NATO_AmmoOrd_F",_center,[9.33057,-1.82275,-4.76837e-007],_rotation,359.999] call _fnc_createObject;					SPE_Mine_AmmoBox_US
_obj = ["Box_NATO_Wps_F",_center,[5.3042,-7.99023,-9.53674e-007],_rotation,360] call _fnc_createObject;								SPE_BasicWeaponsBox_US
_obj = ["Box_NATO_WpsSpecial_F",_center,[9.2063,-5.26563,-9.53674e-007],_rotation,90] call _fnc_createObject;						SPE_US_2x_Open_Ammocrate_alt_Rifle_Ball
_obj = ["B_supplyCrate_F",_center,[2.80322,8.69238,1.43051e-006],_rotation,359.999] call _fnc_createObject;				//extra2	SPE_Hay_WeaponCache_FFI
_obj = ["Box_NATO_WpsLaunch_F",_center,[9.31396,0.529297,-4.76837e-007],_rotation,89.9995] call _fnc_createObject;					SPE_BasicWeaponsBox_US
_obj = ["Box_NATO_AmmoVeh_F",_center,[-1.65479,7.64502,0.0305448],_rotation,359.86] call _fnc_createObject;							SPE_BasicAmmunitionBox_US
_obj = ["Box_NATO_Equip_F",_center,[6.1875,-4.82471,9.53674e-007],_rotation,89.999] call _fnc_createObject;				//extra1	SPE_Hay_WeaponCache_FFI
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