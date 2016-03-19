	if(!isserver) exitwith {};
	
	private ["_middlePos", "_staticWeaponClasses", "_parkedVehicleClasses"];
    private ["_object", "_pos", "_marker", "_instanceNo", "_randomNo", "_gun", "_angle", "_car"];
    
    _middlePos = _this select 0;
    _staticWeaponClasses = _this select 1;
    _parkedVehicleClasses = _this select 2;
    
    if (isNil "drn_BuildAmmoDepot_MarkerInstanceNo") then {
        drn_BuildAmmoDepot_MarkerInstanceNo = 0;
    }
    else {
        drn_BuildAmmoDepot_MarkerInstanceNo = drn_BuildAmmoDepot_MarkerInstanceNo + 1;
    };
    _instanceNo = drn_BuildAmmoDepot_MarkerInstanceNo;
    
    _pos = [(_middlePos select 0) - 4.5, (_middlePos select 1) + 6, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 0;
    
    _pos = [(_middlePos select 0) - 1.5, (_middlePos select 1) + 6, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 0;
    
    _pos = [(_middlePos select 0) + 1.5, (_middlePos select 1) + 6, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 0;
    
    _pos = [(_middlePos select 0) + 4.5, (_middlePos select 1) + 6, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 0;
    
    _pos = [(_middlePos select 0) - 6, (_middlePos select 1) - 4.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 270;
    
    _pos = [(_middlePos select 0) - 6, (_middlePos select 1) - 1.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 270;
    
    _pos = [(_middlePos select 0) - 6, (_middlePos select 1) + 1.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 270;
    
    _pos = [(_middlePos select 0) - 6, (_middlePos select 1) + 4.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 270;
    
    _pos = [(_middlePos select 0) - 4.5, (_middlePos select 1) - 6, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 180;
    
    /*
    _pos = [(_middlePos select 0) - 1.5, (_middlePos select 1) - 6, 0];
    _object = "Fence_Ind" createVehicle _pos;
    _object setPos _pos;
    _object setDir 180;
    
    _pos = [(_middlePos select 0) + 1.5, (_middlePos select 1) - 6, 0];
    _object = "Fence_Ind" createVehicle _pos;
    _object setPos _pos;
    _object setDir 180;
    */
    
    _pos = [(_middlePos select 0) + 4.5, (_middlePos select 1) - 6, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 180;
    
    _pos = [(_middlePos select 0) + 6, (_middlePos select 1) - 4.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
    
    _pos = [(_middlePos select 0) + 6, (_middlePos select 1) - 1.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
    
    _pos = [(_middlePos select 0) + 6, (_middlePos select 1) + 1.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
    
    _pos = [(_middlePos select 0) + 6, (_middlePos select 1) + 4.5, 0];
    //_object = "Land_IndFnc_3_F" createVehicle _pos;
    _object = createVehicle ["Land_IndFnc_3_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
    
    // Tunnor
    _pos = [(_middlePos select 0) + 7, (_middlePos select 1) - 5, 0];
    //_object = "MetalBarrel_burning_F" createVehicle _pos;
    _object = createVehicle ["MetalBarrel_burning_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
    
    _pos = [(_middlePos select 0) - 5, (_middlePos select 1) + 7, 0];
    //_object = "MetalBarrel_burning_F" createVehicle _pos;
    _object = createVehicle ["MetalBarrel_burning_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
    
    // Flagga
    
    _pos = [(_middlePos select 0) + 3.2, (_middlePos select 1) - 6.5, 0];
    //_object = "Flag_CSAT_F" createVehicle _pos;
    _object = createVehicle ["FlagPole_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
	_object setflagtexture A3E_VAR_Flag_Opfor;
    
    _pos = [(_middlePos select 0) - 3, (_middlePos select 1) - 6.3, 0];
    //_object = "Flag_CSAT_F" createVehicle _pos;
    _object = createVehicle ["FlagPole_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 90;
	_object setflagtexture A3E_VAR_Flag_Opfor;
    
    // Skylt
    
    _pos = [(_middlePos select 0) + 3, (_middlePos select 1) - 7, 0];
    //_object = "Land_Sign_WarningMilAreaSmall_F" createVehicle _pos;
    _object = createVehicle ["Land_Sign_WarningMilAreaSmall_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 340;
    
    _pos = [(_middlePos select 0) - 3, (_middlePos select 1) - 7, 0];
    //_object = "Land_Sign_WarningMilAreaSmall_F" createVehicle _pos;
    _object = createVehicle ["Land_Sign_WarningMilAreaSmall_F", _pos, [], 0, "NONE"];
    _object setPos _pos;
    _object setDir 20;
    
    // Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = _staticWeaponClasses select floor random count _staticWeaponClasses;
        
        _randomNo = random 100;
        _pos = [(_middlePos select 0) + 10, (_middlePos select 1) + 10, 0];
        _angle = 45;
        
        if (_randomNo > 25) then {
            _pos = [(_middlePos select 0) + 10, (_middlePos select 1) - 10, 0];
            _angle = 135
        };
        if (_randomNo > 50) then {
            _pos = [(_middlePos select 0) - 10, (_middlePos select 1) - 10, 0];
            _angle = 225
        };
        if (_randomNo > 75) then {
            _pos = [(_middlePos select 0) - 10, (_middlePos select 1) + 10, 0];
            _angle = 315
        };
        
        //_object = _gun createVehicle _pos;
        _object = createVehicle [_gun, _pos, [], 0, "NONE"];
        _object setPos _pos;
        _object setDir _angle;
		[_object,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
    
    // Cars
    
    if (random 10 > 1 && count _parkedVehicleClasses > 0) then {
        _car = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
    }
    else {
        _car = "";
    };
    
    if (_car != "") then {
        _randomNo = random 4;
        _pos = [(_middlePos select 0) + 8, (_middlePos select 1), 0];
        _angle = 45;
        if ((random 100) > 50) then {_angle = 0;} else {_angle = 180;};
        
        if (_randomNo > 2) then {
            _pos = [(_middlePos select 0) - 8, (_middlePos select 1), 0];
            if ((random 100) > 50) then {_angle = 0;} else {_angle = 180;};
        };
        if (_randomNo > 3) then {
            _pos = [(_middlePos select 0), (_middlePos select 1) + 8, 0];
            if ((random 100) > 50) then {_angle = 90;} else {_angle = 270;};
        };
        
        //_object = _car createVehicle _pos;
        _object = createVehicle [_car, _pos, [], 0, "NONE"];
        _object setPos _pos;
        _object setDir _angle;
		[_object,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
    
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
        _box = createVehicle ["Box_East_Wps_F", [(_middlePos select 0) - 3, (_middlePos select 1) + 0, 0], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
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
        _box = createVehicle ["Box_East_WpsLaunch_F", [(_middlePos select 0) + 3, (_middlePos select 1) + 0, 0], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
        {
            _box addWeaponCargoGlobal _x;
        } foreach _weapons;
        
        {
            _box addMagazineCargoGlobal _x;
        } foreach _weaponMagazines;
    };

	if((Param_Waffelbox)==1) then {
		_box = createVehicle [a3e_additional_weapon_box_1, [(_middlePos select 0) + 0, (_middlePos select 1) + 3, 0], [], 0, "CAN_COLLIDE"];
		_box = createVehicle [a3e_additional_weapon_box_2, [(_middlePos select 0) + 3, (_middlePos select 1) + 3, 0], [], 0, "CAN_COLLIDE"];
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
        _box = createVehicle ["Box_East_WpsSpecial_F", [(_middlePos select 0) + 0, (_middlePos select 1) - 3, 0], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
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
        _box = createVehicle ["Box_NATO_AmmoVeh_F", [(_middlePos select 0) + 0, (_middlePos select 1) + 0, 0], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
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
        _box = createVehicle ["Box_East_Wps_F", [(_middlePos select 0) + 3, (_middlePos select 1) - 3, 0], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
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
        _box = createVehicle ["Box_East_WpsLaunch_F", [(_middlePos select 0) - 3, (_middlePos select 1) - 3, 0], [], 0, "CAN_COLLIDE"];
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
        
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
	  
    ["drn_AmmoDepotMapMarker" + str _instanceNo,_middlePos,"o_installation"] call A3E_fnc_createLocationMarker;

    _marker = createMarkerLocal ["drn_AmmoDepotPatrolMarker" + str _instanceNo, _middlePos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlpha 0;
    _marker setMarkerSizeLocal [50, 50];