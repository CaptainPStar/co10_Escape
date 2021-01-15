// fn_Ammo Depot4.sqf - Script by NeoArmageddon.
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
		
		_pos = [_center,_center vectorAdd [-7.52502,-19.5674,0.5],_rotation] call A3E_fnc_rotatePosition;
		_obj = createvehicle [_car, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[1,-0.000440045,0],[0,-0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

	// Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [-14.3452,-5.09326,-0.00143909],_rotation] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [15.0289,10.7007,-0.00143814],_rotation] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

	// ++++++++FLAG++++++++++//
	
//Add your own server flag - uncomment line 104  (see https://forums.bohemia.net/forums/topic/180080-co10-escape/?do=findComment&comment=3346952 )
//+ Create a folder "flag" in the root directory of your misson file. Drop in your paa logo & call it logo.paa (jpg might work, PAA is the best).
_obj = ["Flag_CSAT_F",_center,[-15.5826,-14.6431,0],_rotation,266.77] call _fnc_createObject;
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
		//_box = createVehicle ["Box_East_Wps_F", [(_center select 0) + -4.68042, (_center select 1) + -5.16992, 0], [], 0, "CAN_COLLIDE"];	
		_box = ["Box_East_Wps_F",_center,[-4.68042,-5.16992,0],_rotation,0] call _fnc_createObject;				
/*		_pos = [_center,_center vectorAdd [-4.68042,-5.16992,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_East_WpsLaunch_F", [(_center select 0) + -4.46521, (_center select 1) + -0.0180664, 0], [], 0, "CAN_COLLIDE"];	
		_box = ["Box_East_WpsLaunch_F",_center,[-4.46521,-0.0180664,0],_rotation,0] call _fnc_createObject;		
/*		_pos = [_center,_center vectorAdd [-4.46521,-0.0180664,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_East_WpsSpecial_F", [(_center select 0) + -5.61267, (_center select 1) + -2.32764, 0], [], 0, "CAN_COLLIDE"];	
		_box = ["Box_East_WpsSpecial_F",_center,[-5.61267,-2.32764,0],_rotation,0] call _fnc_createObject;			
/*		_pos = [_center,_center vectorAdd [-5.61267,-2.32764,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_NATO_AmmoVeh_F", [(_center select 0) + -7.30652, (_center select 1) + -4.67676, 0], [], 0, "CAN_COLLIDE"];	
		_box = ["Box_NATO_AmmoVeh_F",_center,[-7.30652,-4.67676,0],_rotation,0] call _fnc_createObject;			
		/*		
		_pos = [_center,_center vectorAdd [-7.30652,-4.67676,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_East_Wps_F", [(_center select 0) + -7.4679, (_center select 1) + -0.294922, 0], [], 0, "CAN_COLLIDE"];
		_box = ["Box_East_Wps_F",_center,[-7.4679,-0.294922,0],_rotation,0] call _fnc_createObject;			
/*		_pos = [_center,_center vectorAdd [-7.4679,-0.294922,0],_rotation] call A3E_fnc_rotatePosition;
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
		//_box = createVehicle ["Box_East_WpsLaunch_F", [(_center select 0) + -5.82874, (_center select 1) + 2.37256, 0], [], 0, "CAN_COLLIDE"];	
		_box = ["Box_East_WpsLaunch_F",_center,[-5.82874,2.37256,0],_rotation,0] call _fnc_createObject;		
/*		_pos = [_center,_center vectorAdd [-5.82874,2.37256,0],_rotation] call A3E_fnc_rotatePosition;
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
	
	
	
// bonus vehicle	["O_Truck_03_device_F",_center,[-7.52502,-19.5674,4.76837e-007],_rotation,270.579] call _fnc_createObject;
// static gunner	["B_sniper_F",_center,[-14.3452,-5.09326,-0.00143909],_rotation,0] call _fnc_createObject;
// static gunner	["B_sniper_F",_center,[15.0289,10.7007,-0.00143814],_rotation,0] call _fnc_createObject;
	//["Flag_CSAT_F",_center,[-15.5826,-14.6431,0],_rotation,0] call _fnc_createObject;
	/*
	["AmmoCrates_NoInteractive_Small",_center,[-4.68042,-5.16992,0],_rotation,96.1081] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Medium",_center,[-4.46521,-0.0180664,0],_rotation,0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Large",_center,[-5.61267,-2.32764,0],_rotation,0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",_center,[-7.30652,-4.67676,0],_rotation,96.1081] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",_center,[-7.4679,-0.294922,0],_rotation,96.1081] call _fnc_createObject;
	*/
	["Land_HBarrier_5_F",_center,[14.7574,-1.69922,0],_rotation,270] call _fnc_createObject;
	["Land_Garbage_square5_F",_center,[15.6165,-4.22607,0],_rotation,0] call _fnc_createObject;
	["Land_GarbageWashingMachine_F",_center,[14.8662,-3.47607,0],_rotation,0] call _fnc_createObject;
	["Land_BagFence_Round_F",_center,[16.73,11.8066,0],_rotation,226.013] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[14.2413,12.5239,0],_rotation,0] call _fnc_createObject;
	["Land_BagFence_End_F",_center,[17.2416,10.3989,0],_rotation,300] call _fnc_createObject;
	["Land_GarbageBags_F",_center,[15.3663,-1.72607,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[14.4913,-11.1011,0],_rotation,270] call _fnc_createObject;
	["Land_Cargo_House_V3_F",_center,[7.11633,3.27393,0],_rotation,225] call _fnc_createObject;
	["Land_Cargo20_brick_red_F",_center,[-15.3837,7.27393,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-9.87659,10.7598,0],_rotation,165] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-13.0673,7.9834,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-4.38342,11.7739,0],_rotation,180] call _fnc_createObject;
	["Land_Garbage_square5_F",_center,[-9.38354,7.52393,0],_rotation,0] call _fnc_createObject;
	["Land_Garbage_square5_F",_center,[-4.38354,8.02393,0],_rotation,0] call _fnc_createObject;
	["Land_GarbagePallet_F",_center,[-11.6337,9.27393,0],_rotation,315] call _fnc_createObject;
	["Land_Cargo10_sand_F",_center,[11.8663,0.0239258,0],_rotation,180.001] call _fnc_createObject;
	["Land_CratesWooden_F",_center,[4.86633,6.52393,0],_rotation,315] call _fnc_createObject;
	["Land_BagFence_Round_F",_center,[2.99121,12.0239,0],_rotation,134.609] call _fnc_createObject;
	["Land_BagFence_Round_F",_center,[-16.6647,-3.09863,0],_rotation,102.894] call _fnc_createObject;
	["Land_PowerGenerator_F",_center,[0.866577,-5.72607,0],_rotation,180] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[8.24133,12.6489,0],_rotation,180] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[-17.0186,-6.71777,0],_rotation,270] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[5.36633,12.6489,0],_rotation,0] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[-5.38367,9.77393,0],_rotation,0] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[12.6161,-2.22607,0],_rotation,90] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[12.6163,-3.85107,0],_rotation,0] call _fnc_createObject;
	["Land_Sacks_goods_F",_center,[-3.63367,9.77393,0],_rotation,0] call _fnc_createObject;
	["Land_CratesShabby_F",_center,[-9.38367,9.27393,0],_rotation,75] call _fnc_createObject;
	["Land_BagFence_End_F",_center,[2.11633,10.7739,0],_rotation,315] call _fnc_createObject;
	["Land_BagFence_End_F",_center,[12.6052,12.6821,0],_rotation,30] call _fnc_createObject;
	["Land_BagFence_End_F",_center,[-15.2747,-1.66064,0],_rotation,150] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[-8.32312,8.92041,0],_rotation,225.016] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[-7.65125,9.44189,0],_rotation,89.9714] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[-8.41785,9.70947,0],_rotation,44.9736] call _fnc_createObject;
	["Land_Sack_F",_center,[-8.67651,8.56689,0],_rotation,105] call _fnc_createObject;
	["Land_BarrelTrash_F",_center,[-1.88367,10.5239,0],_rotation,359.962] call _fnc_createObject;
	["Land_TTowerSmall_2_F",_center,[1.11658,-7.72607,0],_rotation,0] call _fnc_createObject;
	["Land_Cargo_House_V3_F",_center,[-4.66394,-10.2104,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[7.36658,-16.6011,0],_rotation,180] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[5.86633,-14.7261,0],_rotation,0] call _fnc_createObject;
	["Land_BagFence_End_F",_center,[-17.1761,-8.354,0],_rotation,300] call _fnc_createObject;
	["Land_MetalBarrel_empty_F",_center,[8.86633,-15.2261,0],_rotation,105] call _fnc_createObject;
	["Land_MetalBarrel_empty_F",_center,[8.86633,-14.4761,0],_rotation,105] call _fnc_createObject;
	["Land_MetalBarrel_empty_F",_center,[-0.785522,-9.7583,0],_rotation,105] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[8.11633,-15.2261,0],_rotation,179.966] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[7.28625,-14.1245,0],_rotation,224.974] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[8.11633,-14.4761,0],_rotation,359.966] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[7.36633,-15.2261,0],_rotation,224.974] call _fnc_createObject;
	["CamoNet_OPFOR_F",_center,[-6.21301,8.35596,0],_rotation,165] call _fnc_createObject;	
	["Land_Cargo_House_V3_F",_center,[-11.2587,-10.1011,0],_rotation,270] call _fnc_createObject;
/*
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
