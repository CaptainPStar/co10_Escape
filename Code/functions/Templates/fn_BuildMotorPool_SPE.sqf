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

[_center,25] call a3e_fnc_cleanupTerrain;

//Fix rotation
_rotation = _rotation + 180;
private _obj = objNull;
_obj = ["Land_SPE_HedgeHog",_center,[-0.863281,-13.3867,0],_rotation,147.692] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[-6.64111,-13.0991,0],_rotation,342.835] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-18.0205,-10.0625,0],_rotation,358.645] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-11.3347,-12.3267,0],_rotation,94.1094] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-9.45972,-9.7334,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-15.8906,-12.3154,0],_rotation,85.1966] call _fnc_createObject;
_obj = ["Land_SPE_Dugout_Cover",_center,[0.287842,-10.1138,-0.5],_rotation,248.892] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[2.58496,-12.0732,0.246677],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[-3.80518,-11.5078,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Netting_01",_center,[-13.7251,-12.4082,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[12.0947,-13.0249,0],_rotation,305.443] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[5.93164,-12.3369,0],_rotation,248.584] call _fnc_createObject;
_obj = ["Land_SPE_Dugout_Cover",_center,[4.10083,-10.4248,-0.4],_rotation,290.641] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Nest",_center,[12.4353,-10.249,0],_rotation,119.622] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Curve",_center,[8.73438,-10.1743,0],_rotation,121.492] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[16.7983,-9.77344,0],_rotation,117.88] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_04",_center,[8.92969,-14.1646,0],_rotation,172.928] call _fnc_createObject;
//_obj = ["SPE_ST_MG34_Bipod",_center,[12.1401,-9.96387,0],_rotation,119.622] call _fnc_createObject;
_obj = ["EmptyDetector",_center,[0,0,0],_rotation,0] call _fnc_createObject;
_obj = ["EmptyDetector",_center,[0,0,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[0.744141,13.4912,0],_rotation,297.691] call _fnc_createObject;
_obj = ["Land_SPE_Fuel_Barrel_German",_center,[3.19336,-7.83252,0],_rotation,274.952] call _fnc_createObject;
_obj = ["Land_SPE_Fuel_Barrel_German",_center,[3.19727,-7.01904,0],_rotation,317.9] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-9.2688,-5.14404,0],_rotation,4.55676] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-18.0676,-5.44141,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-18.0166,-0.875,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long",_center,[-17.9204,3.77881,0],_rotation,181.034] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_02",_center,[2.22241,11.6646,0],_rotation,359.575] call _fnc_createObject;
_obj = ["Land_SPE_Ammobox_German_02_Covered",_center,[1.86401,-7.05859,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_SPE_Dugout_3m_sandbags",_center,[2.42188,-8.3667,-0.2],_rotation,180] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long_Thick",_center,[0.197266,-6.3667,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Curve",_center,[-18.541,8.63965,0],_rotation,182.586] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Short_Low",_center,[-17.5693,12.229,0],_rotation,234.075] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Single",_center,[-16.864,11.7324,0],_rotation,143.768] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Single",_center,[-16.4705,12.2041,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Netting_01",_center,[-9.45923,-8.2915,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_SPE_Netting_01",_center,[-17.8452,-8.14844,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Netting_02",_center,[-18.5024,1.18457,0],_rotation,89.0474] call _fnc_createObject;
//_obj = ["SPE_ST_MG34_Bipod",_center,[-18.1785,9.89697,0],_rotation,277.125] call _fnc_createObject;
//_obj = ["B_MBT_01_TUSK_F",_center,[-13.6895,-6.84521,-0.00116253],_rotation,359.998] call _fnc_createObject;
//_obj = ["B_Truck_01_cargo_F",_center,[-4.92944,-4.14453,0.025085],_rotation,0.140117] call _fnc_createObject;
_obj = ["Land_SPE_HedgeHog",_center,[5.60303,13.5562,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.2571,7.94434,0],_rotation,260.858] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.8132,-7.01514,0],_rotation,343.837] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.8059,-3.89844,0],_rotation,174.601] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.2776,-3.19287,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.7981,0.0717773,0],_rotation,85.606] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.25,-0.209961,0],_rotation,175.747] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.2925,-3.93115,0],_rotation,243.322] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.8015,0.766602,0],_rotation,330.605] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.7976,-3.09424,0],_rotation,80.8283] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.458,10.6724,-0.3],_rotation,273.935] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.8169,3.84912,0],_rotation,99.856] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.7739,8.04199,0],_rotation,180.042] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.2766,0.827148,0],_rotation,220.012] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.7983,5.06201,0],_rotation,355.774] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.2529,4.77881,0],_rotation,265.636] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.3086,-6.81592,0],_rotation,44.7562] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[13.2891,4.07959,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_TimberLog_05_F",_center,[15.354,12.791,-0.4],_rotation,45.101] call _fnc_createObject;
_obj = ["Land_SPE_Fuel_Barrel_German",_center,[3.89941,-7.06592,0],_rotation,217.154] call _fnc_createObject;
_obj = ["Land_SPE_Fuel_Barrel_German",_center,[3.66382,-6.39014,0],_rotation,264.3] call _fnc_createObject;
_obj = ["Land_SPE_Fuel_Barrel_German",_center,[3.91528,-7.75732,0],_rotation,50.5543] call _fnc_createObject;
_obj = ["Land_SPE_Dugout_Cover",_center,[15.5859,-6.81104,-0.3],_rotation,156.4] call _fnc_createObject;
_obj = ["Land_SPE_Dugout_6m",_center,[13.6438,3.53174,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Dugout_6m",_center,[13.6042,-3.06885,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_SPE_Wood_TrenchLogWall_01_4m_v1",_center,[13.519,-1.56641,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Wood_TrenchLogWall_01_4m_v1",_center,[13.5344,6.41357,0],_rotation,180.042] call _fnc_createObject;
_obj = ["Land_SPE_Wood_TrenchLogWall_01_4m_v1",_center,[13.5469,-5.56396,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Wood_TrenchLogWall_01_4m_v1",_center,[13.5398,2.40723,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Wood_TrenchLogWall_01_4m_v2",_center,[14.5872,11.561,0],_rotation,41.6931] call _fnc_createObject;
_obj = ["Land_SPE_Sandbag_Long_Thick",_center,[4.86182,-6.75439,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_SPE_Ladder",_center,[12.6213,7.04639,0.772553],_rotation,270] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_Posts",_center,[15.1826,-3.86963,0],_rotation,87.906] call _fnc_createObject;
_obj = ["Land_SPE_Dugout_6m315",_center,[13.7454,10.3296,0],_rotation,131.916] call _fnc_createObject;
_obj = ["Land_SPE_BarbedWire_03",_center,[15.625,3.76855,0],_rotation,272.63] call _fnc_createObject;
//_obj = ["B_MRAP_01_gmg_F",_center,[9.2854,2.55762,-0.0134706],_rotation,339.798] call _fnc_createObject;


// Statics 

if (count _staticWeaponClasses > 0) then {
    // Gun behind sandbags
    _pos = [12.1401,-9.96387,0];
    _dir = 119;
    
    _guns = _staticWeaponClasses;
    _gun = selectRandom _guns;
    _static = [_gun, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	[_static,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};
if (count _staticWeaponClasses > 0) then {
    // Gun behind sandbags
    _pos = [-18.1785,9.89697,0];
    _dir = 277;
    
    _guns = _staticWeaponClasses;
    _gun = selectRandom _guns;
    _static = [_gun, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	[_static,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};

// Armor
_armor = selectRandom _parkedArmorClasses;

if (count _parkedArmorClasses > 0) then {

    _pos = [-13.6895,-6.84521,0];
    _dir = 0;
    
    _sarmor = [_armor, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	
	_sarmor setfuel random [0.05, 0.10, 0.15];
	_sarmor setdamage random [0.25, 0.5, 0.9];
	_sarmor setVehicleAmmo random [0, 0.5, 1];

};
// setVehicleAmmo cannot be used until Ammo Depots rearm all vehicles


// Vehicles
if (count _parkedVehicleClasses > 0) then {
    // Cars
    _pos = [-4.92944,-4.14453,0.025085];
    _dir = 0;
    
    _vehicle = selectRandom _parkedVehicleClasses;
    _stupidvehicle = [_vehicle, _pos, _dir, _center, _rotation] call _fnc_CreateVehicle;
	
	_stupidvehicle setfuel random 1;
	_stupidvehicle setdamage random [0, 0.2, 0.5];
	_stupidvehicle setVehicleAmmo random [0, 0.5, 1];
};

_random = random 1;
if (_random > .5 ) then {
    _pos = [9.2854,2.55762,-0.0134706];
    _dir = 340;
    
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
