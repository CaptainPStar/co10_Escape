// Object composition created and exported with Map Builder
// See www.map-builder.info - Map Builder by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
params ["_center", "_staticWeaponClasses", "_parkedVehicleClasses"];

if(!isserver) exitwith {};

private ["_obj", "_pos", "_marker", "_instanceNo", "_gun", "_car"];
private _rotation = random 360;

// Remove objects 
[_center,25] call a3e_fnc_cleanupTerrain;

if (isNil "drn_BuildAmmoDepot_MarkerInstanceNo") then {
   drn_BuildAmmoDepot_MarkerInstanceNo = 0;
}
else {
	drn_BuildAmmoDepot_MarkerInstanceNo = drn_BuildAmmoDepot_MarkerInstanceNo + 1;
};
_instanceNo = drn_BuildAmmoDepot_MarkerInstanceNo;

_pos = [_center,_center vectorAdd [-10.2106,4.54272,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_New_WiredFence_5m_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999996,0.00287123,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-9.78967,6.03186,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_LampShabby_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.739872,-0.672748,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-5.52759,6.67126,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_New_WiredFence_10m_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.00534881,-0.999986,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [4.57214,6.7522,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_New_WiredFence_10m_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.00534881,-0.999986,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-10.314,-6.51233,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_New_WiredFence_5m_F" createvehicle _pos;
_obj setVectorDirAndUp [[1,-2.44816e-005,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [-10.6722,-1.05103,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_Net_Fence_Gate_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999996,0.00287123,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;



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

        _pos = [_center,_center vectorAdd [-2.90967,3.92102,0.000301838],_rotation] call A3E_fnc_rotatePosition;
        _obj = createvehicle [_car, _pos, [], 0, "NONE"];
        _obj setVectorDirAndUp [[1,-0.000440045,0],[0,-0,1]];
        _obj setdir ((getdir _obj) + _rotation);
        _obj setPosATL _pos;

        [_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

    _pos = [_center,_center vectorAdd [-11.0073,-8.27209,0],_rotation] call A3E_fnc_rotatePosition;
    _obj = "Land_BagFence_End_F" createvehicle _pos;
    _obj setVectorDirAndUp [[0.000345146,1,0],[0,0,1]];
    _obj setdir ((getdir _obj) + _rotation);
    _obj setPosATL _pos;

    _pos = [_center,_center vectorAdd [-12.5851,-5.17175,0],_rotation] call A3E_fnc_rotatePosition;
    _obj = "Land_BagFence_Round_F" createvehicle _pos;
    _obj setVectorDirAndUp [[0.788684,-0.614799,0],[0,-0,1]];
    _obj setdir ((getdir _obj) + _rotation);
    _obj setPosATL _pos;

    _pos = [_center,_center vectorAdd [-11.0167,-4.33191,0],_rotation] call A3E_fnc_rotatePosition;
    _obj = "Land_BagFence_End_F" createvehicle _pos;
    _obj setVectorDirAndUp [[0.000345146,1,0],[0,0,1]];
    _obj setdir ((getdir _obj) + _rotation);
    _obj setPosATL _pos;



    _pos = [_center,_center vectorAdd [-12.5383,-7.54541,0],_rotation] call A3E_fnc_rotatePosition;
    _obj = "Land_BagFence_Round_F" createvehicle _pos;
    _obj setVectorDirAndUp [[0.713115,0.701047,0],[0,0,1]];
    _obj setdir ((getdir _obj) + _rotation);
    _obj setPosATL _pos;


 // Statics

 if (count _staticWeaponClasses > 0) then {
    _gun = selectRandom _staticWeaponClasses;

    _pos = [_center,_center vectorAdd [-11.7528,-6.52271,0.0750003],_rotation] call A3E_fnc_rotatePosition;
    _obj = createVehicle [_gun, _pos, [], 0, "NONE"];
    _obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
    _obj setdir ((getdir _obj) + _rotation);
    _obj setPosATL _pos;
    [_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};



_pos = [_center,_center vectorAdd [-5.54004,-9.3822,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_New_WiredFence_10m_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.00534881,-0.999986,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;



_pos = [_center,_center vectorAdd [7.77478,-2.05566,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_LampShabby_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0544991,0.998514,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [9.48694,4.03503,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_Net_Fence_Gate_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999999,0.00140818,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [9.79907,-3.88293,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_New_WiredFence_10m_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999996,0.00287123,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

_pos = [_center,_center vectorAdd [3.01978,-8.02002,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Flag_CSAT_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.0760487,-0.997104,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;
//_obj forceFlagTexture "mapConfig\logo.paa"; 

_pos = [_center,_center vectorAdd [4.15967,-5.37695,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_Cargo_House_V2_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.999996,0.00287123,0],[0,0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;



    // Weapons


//_pos = [_center,_center vectorAdd [-0.278687,-7.39478,0],_rotation] call A3E_fnc_rotatePosition;
//_obj = "Box_Ammo_F" createvehicle _pos;
//_obj setVectorDirAndUp [[-0.999874,-0.0158694,0],[-0,0,1]];


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

        _pos = [_center,_center vectorAdd [-4.62939,-4.94458,0],_rotation] call A3E_fnc_rotatePosition;
        _box = "Box_East_Wps_F" createvehicle _pos;
        _box setVectorDirAndUp [[-0.999965,0.00837127,0],[0,0,1]];
        _box setdir ((getdir _box) + _rotation);
        _box setPosATL _pos;

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
        _pos = [_center,_center vectorAdd [-1.5481,-4.83618,0],_rotation] call A3E_fnc_rotatePosition;
        _box = "Box_East_WpsLaunch_F" createvehicle _pos;
        _box setVectorDirAndUp [[-0.999231,0.0392098,0],[0,0,1]];
        _box setdir ((getdir _box) + _rotation);
        _box setPosATL _pos;

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

        _pos = [_center,_center vectorAdd [-8.66211,-7.44202,0],_rotation] call A3E_fnc_rotatePosition;
        _box = "Box_East_WpsSpecial_F" createvehicle _pos;
        _box setVectorDirAndUp [[-0.999874,-0.0158694,0],[-0,0,1]];
        _box setdir ((getdir _box) + _rotation);
        _box setPosATL _pos;

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

    private _items = [];
    for "_i" from 0 to (count a3e_arr_AmmoDepotVehicleItems - 1) do {
        private ["_item", "_itemClassName", "_probabilityOfPrecence", "_minCount", "_maxCount"];
        
        _item = a3e_arr_AmmoDepotVehicleItems select _i;
        
        _itemClassName = _item select 0;
        _probabilityOfPrecence = _item select 1;
        _minCount = _item select 2;
        _maxCount = _item select 3;
        
        if (random 100 <= _probabilityOfPrecence) then {
            private _itemCount = floor (_minCount + random (_maxCount - _minCount));
            _items pushback [_itemClassName, _itemCount];
        };
    };


    if (count _weapons > 0 || count _weaponMagazines > 0 || count _items > 0) then {
        //_box = "Box_NATO_AmmoVeh_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) + 0, 0];
        //_box = createVehicle ["Box_NATO_AmmoVeh_F", [(_middlePos select 0) + 0, (_middlePos select 1) + 0, 0], [], 0, "CAN_COLLIDE"];

        _pos = [_center,_center vectorAdd [-7.50476,-5.06494,0],_rotation] call A3E_fnc_rotatePosition;
        _box = "Box_NATO_AmmoVeh_F" createvehicle _pos;
        _box setVectorDirAndUp [[-0.999874,-0.0158694,0],[-0,0,1]];
        _box setdir ((getdir _box) + _rotation);
        _box setPosATL _pos;

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
            private _itemCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons pushBack [_itemClassName, _itemCount];
        };
    };
    
    if (count _weapons > 0) then {
        //_box = "Box_East_Wps_F" createVehicle [(_middlePos select 0) + 0, (_middlePos select 1) + 3, 0];
        //_box = createVehicle ["Box_East_Wps_F", [(_middlePos select 0) + 3, (_middlePos select 1) - 3, 0], [], 0, "CAN_COLLIDE"];

        _pos = [_center,_center vectorAdd [-5.63904,-7.51245,0],_rotation] call A3E_fnc_rotatePosition;
        _box = "Box_East_Wps_F" createvehicle _pos;
        _box setVectorDirAndUp [[-0.0739712,-0.99726,0],[0,0,1]];
        _box setdir ((getdir _box) + _rotation);
        _box setPosATL _pos;

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

        _pos = [_center,_center vectorAdd [-2.97229,-7.60938,0],_rotation] call A3E_fnc_rotatePosition;
        _box = "Box_East_WpsLaunch_F" createvehicle _pos;
        _box setVectorDirAndUp [[-0.999602,0.0282007,0],[0,0,1]];
        _box setdir ((getdir _box) + _rotation);
        _box setPosATL _pos;


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

_pos = [_center,_center vectorAdd [4.53369,-9.31958,0],_rotation] call A3E_fnc_rotatePosition;
_obj = "Land_New_WiredFence_10m_F" createvehicle _pos;
_obj setVectorDirAndUp [[0.00534881,-0.999986,0],[0,-0,1]];
_obj setdir ((getdir _obj) + _rotation);
_obj setPosATL _pos;

    // Set markers
    
    //_marker = createMarker ["drn_AmmoDepotMapMarker" + str _instanceNo, _middlePos];
    //_marker setMarkerType "o_installation";
      //_marker setMarkerType "o_installation";

      ["drn_AmmoDepotMapMarker" + str _instanceNo,_center,"o_installation"] call A3E_fnc_createLocationMarker;

      _marker = createMarkerLocal ["drn_AmmoDepotPatrolMarker" + str _instanceNo, _center];
      _marker setMarkerShapeLocal "ELLIPSE";
      _marker setMarkerAlphaLocal 0;
      _marker setMarkerSizeLocal [50, 50];