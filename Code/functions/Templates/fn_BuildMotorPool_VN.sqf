private ["_center", "_rotation", "_staticWeaponClasses", "_parkedVehicleClasses", "_index"];
private ["_pos", "_dir", "_posX", "_posY", "_sectionDir", "_guns", "_gun", "_vehicle", "_powerGenerator","_static"];
private ["_fnc_CreateObject", "_parkedArmorClasses", "_armor", "_random", "_objectName", "_hqObject"];
private ["_obj", "_mNumber", "_sarmor", "_objpos", "_guardtower", "_staticAAClasses", "_newpos", "_aaemplacement", "_staticAA"];

if(isNil("A3E_MotorPoolMarkerNumber")) then {
    A3E_MotorPoolMarkerNumber = 0;
} else {
    A3E_MotorPoolMarkerNumber =A3E_MotorPoolMarkerNumber +1;
};

_mNumber = A3E_MotorPoolMarkerNumber;

_center           = [_this, 0] call bis_fnc_param;
_rotation            = [_this, 1] call bis_fnc_param;
_staticWeaponClasses  = [_this, 2, []] call bis_fnc_param;
_parkedVehicleClasses = [_this, 3, []] call bis_fnc_param;
_parkedArmorClasses   = [_this, 4, []] call bis_fnc_param;
_staticAAClasses      = [_this, 5, []] call bis_fnc_param;


_fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];
diag_log _className;
  
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_centerPos select 2)], _rotateDir] call a3e_fnc_RotatePosition);
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};

_fnc_CreateVehicle = {
    private ["_className", "_relativePos", "_relativeDir", "_centerPos", "_rotateDir"];
    private ["_object", "_realPos", "_realDir"];
    
    _className = _this select 0;
    _relativePos = _this select 1;
    _relativeDir = _this select 2;
    _centerPos = _this select 3;
    _rotateDir = _this select 4;
	
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1)], _rotateDir] call a3e_fnc_RotatePosition);
    _realDir = _relativeDir + _rotateDir;
    _object = createVehicle [_className, _realpos, [], 0, "NONE"];
    _object setDir _realDir;
	_object setPos _realPos;
    _object
};

[_center,50] call a3e_fnc_cleanupTerrain;

_obj = objNull;
_obj = ["Land_GarbagePallet_F",_center,[-10.3717,-22.479,0],_rotation,92.7328] call _fnc_createObject;
_obj = ["Land_GarbagePallet_F",_center,[-5.88843,-22.8965,0],_rotation,287.687] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-6.78625,-30.6665,0],_rotation,141.411] call _fnc_createObject;
_obj = ["Land_vn_garbage_square3_f",_center,[-7.15955,-25.1387,0],_rotation,287.687] call _fnc_createObject;
_obj = ["Land_vn_junkpile_f",_center,[-8.25464,-22.5684,0],_rotation,303.421] call _fnc_createObject;
_obj = ["Land_Garbage_square5_F",_center,[-9.44299,-23.4375,-0.0106225],_rotation,180.053] call _fnc_createObject;
_obj = ["Land_vn_guardbox_01_smooth_f",_center,[-2.66492,-25.7988,0.0506177],_rotation,0.042] call _fnc_createObject;
_obj = ["Land_vn_signm_warningmilitaryvehicles_english_f",_center,[-2.53992,-27.9004,0.0973058],_rotation,1.47841] call _fnc_createObject;
_obj = ["Land_Decal_Garbage_01_F",_center,[-8.40674,-23.9932,0],_rotation,358.677] call _fnc_createObject;
_obj = ["vn_b_item_lighter_01_gh",_center,[-3.20703,-27.2803,1.08483],_rotation,210.487] call _fnc_createObject;
_obj = ["Land_Metal_rack_F",_center,[-1.32446,11.4487,2.76566e-005],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_ExtensionCord_F",_center,[-1.34509,10.3105,0],_rotation,359.769] call _fnc_createObject;
_obj = ["vn_us_komex_small_03",_center,[-9.90625,-17.5957,-9.53674e-007],_rotation,180.052] call _fnc_createObject;
_obj = ["vn_bar_01_campchair_01",_center,[-16.4867,8.53809,9.53674e-007],_rotation,99.8649] call _fnc_createObject;
_obj = ["vn_bar_01_campchair_01",_center,[-16.7487,9.81055,4.76837e-007],_rotation,78.5309] call _fnc_createObject;
_obj = ["vn_bar_01_campchair_01",_center,[-17.4956,10.8491,4.76837e-007],_rotation,42.6128] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-29.5328,-5.49023,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-29.491,-13.709,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-29.6094,11.2148,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-29.5688,2.82422,0],_rotation,270.041] call _fnc_createObject;
_obj = ["vn_steeldrum_bbq_02",_center,[-19.1479,8.729,0],_rotation,94.4324] call _fnc_createObject;
_obj = ["Land_vn_lampshabby_f_4xdir_normal",_center,[-4.65234,-1.44238,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_quonset_02_01",_center,[-23.0144,7.11865,0],_rotation,0.0420669] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_3",_center,[-26.9149,-6.27734,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_3",_center,[-3.91675,-19.8003,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_bagfence_round_f",_center,[-2.02795,-3.60645,0],_rotation,40.0406] call _fnc_createObject;
_obj = ["vn_flag_usa",_center,[-4.0946,-13.8237,0],_rotation,270.041] call _fnc_createObject;
_obj setflagtexture A3E_VAR_Flag_Opfor;
_obj = ["Land_vn_usaf_revetment_helipad_01",_center,[-19.6549,-19.6499,0.0399866],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_waterbottle_01_empty_f",_center,[-19.0436,7.80859,0.531664],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_WoodenLog_F",_center,[-19.0645,7.81055,8.58307e-006],_rotation,180.037] call _fnc_createObject;
_obj = ["Land_Workbench_01_F",_center,[-1.4137,8.13867,9.53674e-007],_rotation,270.042] call _fnc_createObject;
_obj = ["Land_vn_hlaska",_center,[-23.7285,23.8042,0],_rotation,0.0420669] call _fnc_createObject;
_obj = ["Land_Sink_F",_center,[-24.5763,18,-9.53674e-007],_rotation,0.0513841] call _fnc_createObject;
_obj = ["Land_Wrench_F",_center,[-1.36011,13.4961,0.814818],_rotation,60.025] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-8.59705,31.3853,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_b_prop_m149",_center,[-23.6464,14.8223,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_shower_01",_center,[-14.1068,24.4624,0.00383854],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_latrine_01",_center,[-19.4929,25.7163,0.02],_rotation,90.04] call _fnc_createObject;
_obj = ["Land_vn_quonset_02",_center,[-9.83044,20.3018,0],_rotation,0.0420669] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_8",_center,[-13.6199,27.96,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_8",_center,[-26.9069,13.2007,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_Workbench_01_F",_center,[-1.32227,13.5693,4.76837e-007],_rotation,270.042] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[16.3175,-25.6538,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_BarGate_F",_center,[3.9563,-23.2393,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_3",_center,[23.1466,-22.4976,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_3",_center,[16.1396,-22.4922,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_Sign_WarningMilitaryVehicles_F",_center,[10.6421,-22.7725,0],_rotation,0.0420669] call _fnc_createObject;
_obj = ["Land_vn_sign_warningmilitaryarea_f",_center,[10.7091,-25.4868,0],_rotation,1.34406] call _fnc_createObject;
_obj = ["Land_ToolTrolley_01_F",_center,[-1.01721,5.67969,-9.53674e-007],_rotation,66.3013] call _fnc_createObject;
_obj = ["Land_vn_woodenbox_f",_center,[21.6101,3.03711,2.38419e-006],_rotation,355.152] call _fnc_createObject;
_obj = ["Land_vn_woodenbox_f",_center,[21.9094,4.41504,0],_rotation,165.755] call _fnc_createObject;
_obj = ["Land_vn_woodenbox_f",_center,[21.6001,3.41846,0.433019],_rotation,354.515] call _fnc_createObject;
_obj = ["Land_vn_woodenbox_f",_center,[21.7107,3.63037,4.76837e-007],_rotation,175.078] call _fnc_createObject;
_obj = ["Land_Grinder_F",_center,[-1.02905,5.61328,0.94526],_rotation,88.3011] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[29.3947,-5.72266,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[29.3584,2.59229,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[29.3175,10.9824,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[29.4358,-13.9395,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_lampshabby_f_4xdir_normal",_center,[10.9929,-13.481,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_hootch_01_13",_center,[15.9059,-14.8818,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_3",_center,[27.2971,-16.6738,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_3",_center,[10.0492,-18.3672,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_3",_center,[27.2936,-6.1582,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_tank_rust_f",_center,[24.9299,-5.67822,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_bagfence_round_f",_center,[0.775635,-3.6875,0],_rotation,320.042] call _fnc_createObject;
_obj = ["Land_PalletTrolley_01_khaki_F",_center,[17.198,3.11572,0.768267],_rotation,179.246] call _fnc_createObject;
_obj = ["Land_vn_usaf_hangar_03",_center,[7.18188,9.72314,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Oil_Spill_F",_center,[3.59546,10.415,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_paperbox_01_open_water_f",_center,[20.6793,0.333496,0],_rotation,90.7596] call _fnc_createObject;
_obj = ["Land_vn_paperbox_closed_f",_center,[20.5933,1.92871,0],_rotation,84.9527] call _fnc_createObject;
_obj = ["vn_us_komex_medium_02",_center,[20.7638,9.53516,0],_rotation,179.931] call _fnc_createObject;
_obj = ["Land_vn_strazni_vez",_center,[24.2456,-18.9546,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_MetalBarrel_F",_center,[19.7638,4.50488,0.0138068],_rotation,195.353] call _fnc_createObject;
_obj = ["Land_MetalBarrel_F",_center,[20.8671,6.14209,0.113962],_rotation,9.29083] call _fnc_createObject;
_obj = ["Land_MetalBarrel_F",_center,[19.6227,5.06885,0.00898027],_rotation,348.949] call _fnc_createObject;
_obj = ["Land_vn_paperbox_01_small_closed_brown_f",_center,[20.7719,1.91699,1.24088],_rotation,359.297] call _fnc_createObject;
_obj = ["Land_vn_paperbox_01_open_boxes_f",_center,[-0.994873,3.53809,0],_rotation,357.345] call _fnc_createObject;
_obj = ["Land_vn_usaf_sign_ns_01",_center,[17.3942,-1.50586,1.63638],_rotation,0.517511] call _fnc_createObject;
_obj = ["Land_vn_hlaska",_center,[24.3628,24.4717,0],_rotation,0.0420669] call _fnc_createObject;
_obj = ["Land_ExtensionCord_F",_center,[9.35767,21.3311,4.76837e-007],_rotation,0.0423699] call _fnc_createObject;
_obj = ["Land_ExtensionCord_F",_center,[-0.400391,19.6621,0],_rotation,0.0420324] call _fnc_createObject;
_obj = ["Land_WeldingTrolley_01_F",_center,[-0.187378,20.7598,-4.76837e-007],_rotation,65.0438] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[-0.411377,31.416,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_razorwire_f",_center,[7.90149,31.4385,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_vn_mobileradar_01_generator_f",_center,[11.9849,22.5435,0],_rotation,270.415] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_8",_center,[27.3011,13.3198,0],_rotation,270.041] call _fnc_createObject;
_obj = ["Land_vn_usaf_revetment_low_8",_center,[14.245,27.9839,0],_rotation,180.052] call _fnc_createObject;
_obj = ["Land_PortableLight_double_F",_center,[1.64441,18.6206,0],_rotation,300.042] call _fnc_createObject;
_obj = ["Land_PortableLight_double_F",_center,[9.8429,19.8057,0],_rotation,60.0406] call _fnc_createObject;
_obj = ["Land_PowerGenerator_F",_center,[18.7947,19.6768,0],_rotation,0.0420669] call _fnc_createObject;
_obj = ["Land_Pallets_stack_F",_center,[13.7316,19.957,0],_rotation,45.0395] call _fnc_createObject;
_obj = ["Oil_Spill_F",_center,[11.5354,12.0503,0],_rotation,0.0420669] call _fnc_createObject;
_obj = ["Land_MetalBarrel_F",_center,[-0.995117,20.1338,1.23978e-005],_rotation,270.048] call _fnc_createObject;


// Statics 

if (count _staticWeaponClasses > 0) then {
    // Gun behind sandbags
    _pos = [-0.678833,-2.81836,0.00262451];
    _dir = 180;
    
    _guns = _staticWeaponClasses;
    _gun = selectRandom _guns;
    _static = [_gun, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	[_static,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};

// Armor
_armor = selectRandom _parkedArmorClasses;

if (count _parkedArmorClasses > 0) then {

    _pos = [4.5835,9.05664,0.0];
    _dir = 180;
    
    _sarmor = [_armor, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	
	_sarmor setfuel random [0.05, 0.10, 0.15];
	_sarmor setdamage random [0.25, 0.5, 0.9];
	_sarmor setVehicleAmmo random [0, 0.5, 1];

};
// setVehicleAmmo cannot be used until Ammo Depots rearm all vehicles


// Vehicles
if (count _parkedVehicleClasses > 0) then {
    // Cars
    _pos = [11.8638,3.90039,-0.00717783];
    _dir = 180;
    
    _vehicle = selectRandom _parkedVehicleClasses;
    _stupidvehicle = [_vehicle, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	
	_stupidvehicle setfuel random 1;
	_stupidvehicle setdamage random [0, 0.2, 0.5];
	_stupidvehicle setVehicleAmmo random [0, 0.5, 1];
};

_random = random 1;
if (_random > .5 ) then {
    _pos = [-19.9519,-4.28418,0.0252523];
    _dir = 98;
    
    _vehicle = selectRandom _parkedVehicleClasses;
    _stupidvehicle = [_vehicle, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	
	_stupidvehicle setfuel random 1;
	_stupidvehicle setdamage random [0, 0.2, 0.5];
	_stupidvehicle setVehicleAmmo random [0, 0.5, 1];
};
if (_random > .75) then {
    _pos = [-7.5968,7.2417,0.0250859];
    _dir = 177.7;
   
     _vehicle = selectRandom _parkedVehicleClasses;
    _stupidvehicle = [_vehicle, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	
	_stupidvehicle setfuel random 1;
	_stupidvehicle setdamage random [0, 0.2, 0.5];
	_stupidvehicle setVehicleAmmo random [0, 0.5, 1];
};

["A3E_MotorPoolMapMarker" + str _mNumber,_center,"o_service"] call A3E_fnc_createLocationMarker;

_marker = createMarkerLocal ["A3E_MotorPoolPatrolMarker" + str _mNumber, _center];
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerAlphaLocal 0;
_marker setMarkerSizeLocal [40, 38];


