//VN NVA Ammo Depot 1
//Elephant Grass

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

		_obj = [_car,_center,[10.0938,2.33252,0.02425],_rotation,357.021] call _fnc_createObject;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
//_obj = ["B_Truck_01_box_F",_center,[10.0938,2.33252,0.02425],_rotation,357.021] call _fnc_createObject;

	// Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_obj = [_gun,_center,[-10.0546,6.84326,0],_rotation,295.002] call _fnc_createObject;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_obj = [_gun,_center,[8.21301,-9.3999,0],_rotation,134.999] call _fnc_createObject;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

//_obj = ["B_HMG_01_high_F",_center,[-10.0546,6.84326,-0.0121174],_rotation,295.002] call _fnc_createObject;
//_obj = ["B_HMG_01_high_F",_center,[8.21301,-9.3999,-0.0121193],_rotation,134.999] call _fnc_createObject;


//SPAWN IN THE BASE OBJECTS	
["Land_vn_o_tower_02",_center,[-3.89917,-4.69971,0],_rotation,270] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[-3.9668,-8.50146,0],_rotation,90] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[-0.0913086,-8.61084,0],_rotation,90] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[-3.65234,4.30078,0],_rotation,90] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[-6.15234,-6.55908,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[-0.236572,-6.43066,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_shelter_02",_center,[-7.49585,-2.66162,0],_rotation,268.307] call _fnc_createObject;
["Land_vn_o_shelter_03",_center,[-11.9624,1.52393,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_shelter_05",_center,[-8.72534,5.64111,0],_rotation,90] call _fnc_createObject;
["Land_vn_elephant_grass_01",_center,[-4.03052,6.8584,-4.76837e-007],_rotation,242.895] call _fnc_createObject;
["Land_vn_elephant_grass_01",_center,[-8.92969,-7.87842,-4.76837e-007],_rotation,0] call _fnc_createObject;
["Land_vn_o_shelter_01",_center,[0.556885,2.17383,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_shelter_01",_center,[4.69238,2.38721,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_shelter_01",_center,[2.01099,-6.3042,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[3.76318,-8.41602,0],_rotation,90] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[1.47705,-2.0752,0],_rotation,90] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[7.16211,-7.29932,0],_rotation,45.696] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[4.625,4.66064,0],_rotation,90] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[5.01685,-3.75732,0],_rotation,90] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[6.8584,-1.59033,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_wallfoliage_01",_center,[6.65088,2.47119,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_shelter_02",_center,[0.431641,5.68457,0],_rotation,0] call _fnc_createObject;
["Land_vn_o_platform_06",_center,[3.13159,-0.967773,0],_rotation,0] call _fnc_createObject;
["Land_vn_elephant_grass_01",_center,[5.22998,6.88281,-4.76837e-007],_rotation,0] call _fnc_createObject;


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
		_box  = ["vn_o_ammobox_04",_center,[5.80908,1.44336,0],_rotation,268.018] call _fnc_createObject;
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
		_box  = ["vn_o_ammobox_02",_center,[1.77856,5.43896,-4.76837e-007],_rotation, 89.5743] call _fnc_createObject;
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
		_box = [a3e_additional_weapon_box_1,_center,[-8.85522,-1.6333,-0.0232277],_rotation,0.0211214] call _fnc_createObject;
        _box call A3E_fnc_initArsenal;		  
		_box = [a3e_additional_weapon_box_2,_center,[1.56714,7.75244,-1.90735e-006],_rotation,359.991] call _fnc_createObject;
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
		_box  = ["vn_o_ammobox_05",_center,[-0.278076,7.09668,-0.000917435],_rotation, 92.3004] call _fnc_createObject;
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
		_box  = ["vn_o_ammobox_08",_center,[-8.42957,-3.82764,-0.0303817],_rotation, 181.928] call _fnc_createObject;
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
		_box  = ["vn_o_ammobox_01",_center,[-0.985107,5.01563,-0.0157876],_rotation, 88.0508] call _fnc_createObject;
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
     	_box  = ["vn_o_ammobox_03",_center,[3.5542,3.65479,0],_rotation, 358.807] call _fnc_createObject;
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
_obj = ["vn_o_ammobox_06",_center,[-8.85522,-1.6333,-0.0232277],_rotation,0.0211214] call _fnc_createObject;	//NVA Armory	add1
_obj = ["vn_o_ammobox_08",_center,[-8.42957,-3.82764,-0.0303817],_rotation,181.928] call _fnc_createObject;		//PAVN Full Armory	vehicle
_obj = ["vn_o_ammobox_05",_center,[-0.278076,7.09668,-0.000917435],_rotation,92.3004] call _fnc_createObject;	//VC Armory 	ordnance
_obj = ["vn_o_ammobox_01",_center,[-0.985107,5.01563,-0.0157876],_rotation,88.0508] call _fnc_createObject;		//grenade
_obj = ["vn_o_ammobox_02",_center,[1.77856,5.43896,-4.76837e-007],_rotation,89.5743] call _fnc_createObject;	//magazine
_obj = ["vn_o_ammobox_03",_center,[3.5542,3.65479,0],_rotation,358.807] call _fnc_createObject;					//launcher
_obj = ["vn_o_ammobox_04",_center,[5.80908,1.44336,0],_rotation,268.018] call _fnc_createObject;					//weapons
_obj = ["vn_o_ammobox_10",_center,[1.56714,7.75244,-1.90735e-006],_rotation,359.991] call _fnc_createObject;	//PAVN 85mm ammo	add2
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