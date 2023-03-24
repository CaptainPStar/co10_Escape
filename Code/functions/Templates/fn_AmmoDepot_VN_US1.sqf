//VN US Ammo Depot 1
//FOB

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

		_pos = [_center,_center vectorAdd [3.81812,-15.0552,0.0258894],_rotation,89.9946] call A3E_fnc_rotatePosition;
		_obj = createvehicle [_car, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[1,-0.000440045,0],[0,-0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;

		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

//["B_Truck_01_box_F",_center,[3.81812,-15.0552,0.0258894],_rotation,89.9946] call _fnc_createObject;

	// Statics
    
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [-12.8831,20.0786,0.262558],_rotation,319.998] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };
    if (count _staticWeaponClasses > 0) then {
        _gun = selectRandom _staticWeaponClasses;
        
		_pos = [_center,_center vectorAdd [8,-5.17139,2.10607],_rotation,90.03] call A3E_fnc_rotatePosition;
		_obj = createVehicle [_gun, _pos, [], 0, "NONE"];
		_obj setVectorDirAndUp [[-0.999998,0.00176479,0],[0,0,1]];
		_obj setdir ((getdir _obj) + _rotation);
		_obj setPosATL _pos;
		[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    };

//["B_HMG_01_high_F",_center,[-12.8831,20.0786,0.262558],_rotation,319.998] call _fnc_createObject;
//["B_HMG_01_high_F",_center,[8,-5.17139,2.10607],_rotation,90.03] call _fnc_createObject;

//SPAWN IN THE BASE OBJECTS	
["Land_vn_b_trench_tee_01",_center,[-12.8544,-8.13477,0],_rotation,90] call _fnc_createObject;
["Land_vn_b_trench_45_01",_center,[-13.0988,4.18408,0],_rotation,135.015] call _fnc_createObject;
["Land_vn_us_can_50",_center,[-13.5652,18.2549,-5.34058e-005],_rotation,44.362] call _fnc_createObject;
["Land_vn_us_can_50",_center,[-13.3538,18.4717,0.266359],_rotation,230.124] call _fnc_createObject;
["Land_vn_us_can_50",_center,[-13.3884,18.4043,0.549289],_rotation,55.7097] call _fnc_createObject;
["vn_bar_01_campchair_01",_center,[-2.75598,-1.02686,0],_rotation,286.872] call _fnc_createObject;
["vn_bar_01_campchair_01",_center,[-2.38196,0.217773,-3.33786e-006],_rotation,308.203] call _fnc_createObject;
["vn_bar_01_campchair_01",_center,[-2.59192,-2.2959,-3.33786e-006],_rotation,250.956] call _fnc_createObject;
["Land_vn_woodenbox_f",_center,[-8.50842,-3.34033,-0.000999928],_rotation,181.886] call _fnc_createObject;
["Land_vn_paperbox_01_small_closed_brown_idap_f",_center,[-9.17517,-2.65234,0],_rotation,85.7954] call _fnc_createObject;
["Land_vn_paperbox_01_small_closed_brown_f",_center,[-7.91296,-2.81104,0],_rotation,183.792] call _fnc_createObject;
["vn_steeldrum_bbq_02",_center,[-0.709595,-1.72266,-0.00612783],_rotation,295.853] call _fnc_createObject;
["Land_vn_camonet_nato",_center,[-8.90051,-15.6074,0],_rotation,270] call _fnc_createObject;
["Land_vn_b_trench_revetment_05_01",_center,[-1.46716,-12.3521,0.136416],_rotation,0] call _fnc_createObject;
["Land_vn_b_trench_revetment_05_01",_center,[9.79871,-12.2422,0],_rotation,360] call _fnc_createObject;
["Land_vn_b_trench_revetment_05_01",_center,[4.11975,-12.311,0.148319],_rotation,0] call _fnc_createObject;
["Land_vn_b_trench_revetment_tall_03",_center,[13.5367,-20.1357,0.148062],_rotation,89.041] call _fnc_createObject;
["Land_vn_b_trench_firing_04",_center,[11.1217,-23.1587,0],_rotation,0] call _fnc_createObject;
["Land_vn_b_trench_90_01",_center,[-11.5582,-20.1069,0],_rotation,90] call _fnc_createObject;
["Land_vn_b_trench_20_02",_center,[18.0698,-2.43066,0],_rotation,90] call _fnc_createObject;
["Land_vn_b_trench_20_02",_center,[-1.8252,-26.6963,0],_rotation,180] call _fnc_createObject;
["Land_vn_b_trench_bunker_05_01",_center,[-8.47205,-1.66748,0],_rotation,0] call _fnc_createObject;
["Land_vn_b_trench_bunker_04_01",_center,[3.67126,-4.79883,0],_rotation,0] call _fnc_createObject;
["Land_vn_us_30cal",_center,[9.58484,-3.51318,2.9708],_rotation,295.759] call _fnc_createObject;
["Land_WoodenLog_F",_center,[-0.473633,-0.515625,8.10623e-006],_rotation,21.4675] call _fnc_createObject;
["Land_vn_waterbottle_01_empty_f",_center,[-0.487549,-0.483887,0.559919],_rotation,21.4606] call _fnc_createObject;
["Land_vn_paperbox_01_small_destroyed_brown_idap_f",_center,[-9.2124,-3.36963,0.42896],_rotation,357.573] call _fnc_createObject;
["Land_vn_shower_01",_center,[9.19177,11.7573,0],_rotation,180] call _fnc_createObject;
["Land_vn_latrine_01",_center,[9.10181,16.8535,0],_rotation,90] call _fnc_createObject;
["Land_vn_b_trench_firing_03",_center,[14.3668,10.5864,0],_rotation,90] call _fnc_createObject;
["Land_vn_b_trench_firing_05",_center,[-12.0619,18.9014,0],_rotation,228.186] call _fnc_createObject;
["Land_vn_b_trench_cross_02",_center,[-10.4413,16.3906,0],_rotation,317.108] call _fnc_createObject;
["Land_vn_b_trench_90_01",_center,[12.0658,17.8447,0],_rotation,270] call _fnc_createObject;
["Land_vn_b_trench_45_02",_center,[3.16296,21.3115,0],_rotation,181.149] call _fnc_createObject;
["Land_vn_b_trench_bunker_06_02",_center,[0.612427,10.085,0],_rotation,0] call _fnc_createObject;

// ++++++++FLAG++++++++++//
_obj = ["Flag_US_F",_center,[2.19592,-6.47852,2.11162],_rotation,89.2916] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;


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
		_box  = ["vn_b_ammobox_04",_center,[8.72571,-7.70508,0],_rotation, 316.383] call _fnc_createObject;
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
//["vn_b_ammobox_04",_center,[8.72571,-7.70508,0],_rotation,316.383] call _fnc_createObject;	//weapons

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
		_box  = ["vn_b_ammobox_02",_center,[6.70715,-8.25488,-9.53674e-007],_rotation, 360] call _fnc_createObject;
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
//["vn_b_ammobox_02",_center,[6.70715,-8.25488,-9.53674e-007],_rotation,360] call _fnc_createObject;	//magazines


	//additional boxes (only spawned if activated in mission parameters)
	if((A3E_Param_Waffelbox)==1) then {
		_box = [a3e_additional_weapon_box_1,_center,[-7.48584,-12.9399,0.740623],_rotation,149.881] call _fnc_createObject;
        _box call A3E_fnc_initArsenal;		  
		_box = [a3e_additional_weapon_box_2,_center,[-8.95142,-14.8516,-0.0305896],_rotation,88.7741] call _fnc_createObject;
        _box call A3E_fnc_initArsenal;				  
	 };
//["vn_b_ammobox_01",_center,[-7.48584,-12.9399,0.740623],_rotation,149.881] call _fnc_createObject;
//["vn_b_ammobox_05",_center,[-8.95142,-14.8516,-0.0305896],_rotation,88.7741] call _fnc_createObject;

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
		_box  = ["vn_b_ammobox_08",_center,[-8.50525,-1.77441,4.29153e-006],_rotation, 268.759] call _fnc_createObject;
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
//["vn_b_ammobox_08",_center,[-8.50525,-1.77441,4.29153e-006],_rotation,268.759] call _fnc_createObject;	//ammo cache

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
		_box  = ["vn_b_ammobox_09",_center,[-8.10938,-18.6689,0.0385456],_rotation, 1.83589] call _fnc_createObject;
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
//["vn_b_ammobox_09",_center,[-8.10938,-18.6689,0.0385456],_rotation,1.83589] call _fnc_createObject;

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
		_box  = ["vn_b_ammobox_10",_center,[9.30969,-5.28662,-0.00154161],_rotation, 0.428783] call _fnc_createObject;
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;
        clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;
        
        {
            _box addItemCargoGlobal _x;
        } foreach _weapons;
    };
//["vn_b_ammobox_10",_center,[9.30969,-5.28662,-0.00154161],_rotation,0.428783] call _fnc_createObject;	//grenades

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
     	_box  = ["vn_b_ammobox_03",_center,[5.2699,-6.16455,-4.76837e-007],_rotation, 268.189] call _fnc_createObject;
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
//["vn_b_ammobox_03",_center,[5.2699,-6.16455,-4.76837e-007],_rotation,268.189] call _fnc_createObject;	//launcher


    // Set markers
    
    //_marker = createMarker ["drn_AmmoDepotMapMarker" + str _instanceNo, _middlePos];
    //_marker setMarkerType "o_installation";
      //_marker setMarkerType "o_installation";
	  
    ["drn_AmmoDepotMapMarker" + str _instanceNo,_center,"o_installation"] call A3E_fnc_createLocationMarker;

    _marker = createMarkerLocal ["drn_AmmoDepotPatrolMarker" + str _instanceNo, _center];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerSizeLocal [50, 50];