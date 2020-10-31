private ["_centerPos", "_rotateDir", "_staticWeaponClasses", "_parkedVehicleClasses", "_index"];
private ["_pos", "_dir", "_posX", "_posY", "_sectionDir", "_guns", "_gun", "_vehicle", "_powerGenerator","_static"];
private ["_fnc_CreateObject", "_parkedArmorClasses", "_armor", "_random", "_objectName", "_hqObject"];
private ["_obj", "_mNumber", "_sarmor", "_objpos", "_guardtower", "_staticAAClasses", "_newpos", "_aaemplacement", "_staticAA"];

if(isNil("A3E_MotorPoolMarkerNumber")) then {
    A3E_MotorPoolMarkerNumber = 0;
} else {
    A3E_MotorPoolMarkerNumber =A3E_MotorPoolMarkerNumber +1;
};

_mNumber = A3E_MotorPoolMarkerNumber;

_centerPos            = [_this, 0] call bis_fnc_param;
_rotateDir            = [_this, 1] call bis_fnc_param;
_staticWeaponClasses  = [_this, 2, []] call bis_fnc_param;
_parkedVehicleClasses = [_this, 3, []] call bis_fnc_param;
_parkedArmorClasses   = [_this, 4, []] call bis_fnc_param;
_staticAAClasses      = [_this, 5, []] call bis_fnc_param;


_fnc_CreateObject = {
    private ["_className", "_relativePos", "_relativeDir", "_centerPos", "_rotateDir"];
    private ["_object", "_realPos", "_realDir", "_alignWithSurface", "_normal"];
    
    _className = _this select 0;
    _relativePos = _this select 1;
    _relativeDir = _this select 2;
    _centerPos = _this select 3;
    _rotateDir = _this select 4;
    if (count _this > 5) then {
        _alignWithSurface = _this select 5;
    } else {
        _alignWithSurface = false;
    };
    // Object Placement script
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1)], _rotateDir] call a3e_fnc_RotatePosition);
    if (count _relativePos > 2) then {_realPos set [2, (_relativePos select 2)]};	
    _realDir = _relativeDir + _rotateDir;
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"]; 
    if (_className == "Land_Cargo_HQ_V1_F" && (count _staticAAClasses > 0)) then {
        _newpos = [(_realPos select 0), (_realPos select 1), 3];
        _staticAA = _staticAAClasses call BIS_fnc_selectRandom;
        _aaemplacement = createVehicle [_staticAA, _newpos, [], 0, "CAN_COLLIDE"];
        _aaemplacement setDir (_realDir + 180);
        _aaemplacement attachTo [_object,[4.7,1.3,1.2]];
        [_aaemplacement,east] spawn A3E_fnc_AddStaticGunner; 
    };
    // Object Facing and Vector Up script
    _object setDir _realDir;
    if (_alignWithSurface) then {
        _normal = (surfaceNormal _realPos);
        _object setVectorUp _normal;
    };
    _object
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
    _object
};

//// Objects!
/// (Barbed Wire)
// North wire
_pos = [-17.528, 26.345];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-25.715, 26.343];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-1.18, 26.435];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-9.368, 26.433];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [15.175, 26.435];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [6.988, 26.433];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [23.443, 26.347];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

//South Wall
_pos = [-25.534, -26.362];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-9.592, -26.436];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-17.854, -26.401];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [23.463, -26.397];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [15.275, -26.399];
_dir = 0;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

//West Wall
_pos = [-28.799, -21.217];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-28.801, -15.008];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-28.77, -8.764];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-28.696, -2.412];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-28.84, 17.968];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-28.842, 24.849];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-28.795, 11.505];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-28.731, 4.582];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

//East Wall
_pos = [28.789, -20.491];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [28.902, -7.952];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [28.847, -1.784];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [28.886, 4.57];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [28.81, 17.295];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [28.884, 10.955];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [28.718, 23.351];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [28.884, -14.264];
_dir = 90;
["Land_Razorwire_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;


/// Heavy Barriers
// East Wall
_pos = [26.957, -10.414];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [26.957, -1.918];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [26.968, 6.562];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [26.963, 15.039];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [26.957, -18.912];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// West Wall
_pos = [-27.174, -19.079];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-27.174, -10.58];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-27.174, -2.084];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-27.162, 6.396];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-27.168, 14.873];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// North Wall
_pos = [-17.022, 24.435];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-8.58, 24.423];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-0.0550000000003, 24.425];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [8.437, 24.42];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [16.925, 24.423];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// South Wall
_pos = [-7.258, -24.495];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-15.707, -24.495];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-24.209, -24.487];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [15.47, -24.389];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [24.011, -24.387];
_dir = 180;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Inner Walls / Gate
_pos = [-2.018, -21.584];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [10.238, -21.471];
_dir = 90;
["Land_HBarrierBig_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [0.773000000001, -17.508];
_dir = 180;
["Land_BarGate_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [-1.873, -26.09];
_dir = 0;
["Land_Sign_WarningMilitaryVehicles_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [9.957, -26.012];
_dir = 0;
["Land_Sign_WarningMilitaryVehicles_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-2.35, -17.1];
_dir = 270;
["Flag_CSAT_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [0.90, -3.4];
_dir = 317.365;
["Land_BagFence_Round_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-1.50, -3.4];
//was -1.75
_dir = 37.9281;
["Land_BagFence_Round_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Heavy Barrier Towers
_pos = [-24.561, 21.048];
_dir = 180;
["Land_HBarrierTower_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [24.412, 20.998];
_dir = 180;
["Land_HBarrierTower_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

/// Southeast Corner Structures

_pos = [22.013, -19.625];
_dir = 0;
["Land_Cargo_Patrol_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [15.39, -19.588];
_dir = 180;
["Land_Cargo_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [21.685, -9.118];
_dir = 270;
["Land_Cargo20_military_green_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [24.183, -8.204];
_dir = 90;
["Land_Cargo40_military_green_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

// SE Objects

_pos = [23.929, -22.702];
_dir = 355;
["Land_PaperBox_closed_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;
// -1 Y for both boxes
_pos = [22.146, -22.661];
_dir = 95;
["Land_PaperBox_closed_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [10.281, -16.768];
_dir = 0;
["Land_LampStreet_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

//in SE containers
_pos = [24.201, -9.483, 0.2];
_dir = 255;
["Land_PaperBox_closed_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [24.045, -7.815, 0.2];
_dir = 175;
["Land_PaperBox_closed_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [21.681, -7.155, 0.2];
_dir = 355;
["Land_PaperBox_closed_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [24.283, -13.09, 0.2];
_dir = 355;
["Land_PaperBox_closed_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [24.201, -11.42, 0.2];
_dir = 100;
["Land_PaperBox_closed_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

/// Southwest Corner Structures
_pos = [-16.176, -13.577];
_dir = 90;
["Land_Cargo_HQ_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
// _objectName

_pos = [-4.764, -21.475];
_dir = 90;
["Land_Cargo10_military_green_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

// SW Objects
_pos = [-21.912, -7.346];
_dir = 105;
["Land_PowerGenerator_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

/// Northwest Corner Structures
_pos = [-8.496, 17.75];
_dir = 0;
["Land_Cargo_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-21.231, 6.447];
_dir = 270;
["Land_Cargo_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-18.844, 22.31];
_dir = 0;
["Land_FieldToilet_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [-20.233, 22.31];
_dir = 0;
["Land_FieldToilet_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [-24.735, 12.254];
_dir = 90;
["Land_WaterTank_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [-1.733, 8.341];
_dir = 270;
["Land_LampStreet_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [-15.227, 22.203];
_dir = 270;
["Land_PowerGenerator_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [-23.092, 12.867];
_dir = 0;
["Land_Sink_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

/// Northeast Corner Structures
_pos = [9.597, 8.789];
_dir = 0;
["Land_TentHangar_V1_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;
//Original 23987.447,3.1900001,17611.889
// Offset x -23977.85, y -17603.1

// NE Objects
_pos = [0.351000000002, 5.476];
_dir = 270;
["Land_Workbench_01_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [9.386, 17.716];
_dir = 222;
["Land_Portable_generator_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [18.082, 16.429];
_dir = 0;
["Land_PowerGenerator_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [0.351000000002, 8.4];
_dir = 270;
["Land_Metal_rack_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [16.65, 10.806];
_dir = 215;
["Land_ScrapHeap_1_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [16.531, 6.271];
_dir = 340;
["Land_ScrapHeap_1_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [0.505000000001, 1.132];
_dir = 350;
["Land_PaperBox_open_full_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [6.025, 9.638];
_dir = 180;
["Oil_Spill_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [10.916, 9.074];
_dir = 0;
["Oil_Spill_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [10.775, 14.207];
_dir = 80;
["Land_EngineCrane_01_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [13.775, 14.207];
_dir = 45;
["Land_Pallets_stack_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [9.132, 16.435];
_dir = 60;
["Land_PortableLight_double_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [0.937000000002, 15.244];
_dir = 300;
["Land_PortableLight_double_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [2.498, 17.0];
_dir = 65;
["Land_WeldingTrolley_01_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [0.490000000002, 3.009];
_dir = 65;
["Land_ToolTrolley_01_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [0.351000000002, 10.517];
_dir = 270;
["Land_Workbench_01_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [18.699, 2.134];
_dir = 70;
["Land_MetalBarrel_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [18.121, 1.785];
_dir = 0;
["Land_MetalBarrel_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [18.74, 1.474];
_dir = 180;
["Land_MetalBarrel_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [0.158000000003, 17.3];
_dir = 270;
["Land_MetalBarrel_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [1.021, 14.32];
_dir = 60;
["Land_Wrench_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [0.332000000002, 7.254];
_dir = 0;
["Land_ExtensionCord_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [1.463, 16.41];
_dir = 0;
["Land_ExtensionCord_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [10.302, 16.72];
_dir = 0;
["Land_ExtensionCord_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [16.189, 0.937000000002];
_dir = 240;
["Land_PalletTrolley_01_khaki_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

///Objects with YOffset
// +1 X, +2 Y for objects on HQ

_pos = [0.375, 4.89, 1.1];
_dir = 310;
["Land_Grinder_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [0.295000000002, 9.505, 1.1];
_dir = 310;
["Land_DrillAku_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-14.528, -11.741, 3.1];
_dir = 110;
["Land_CampingTable_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-14.536, -11.582, 4];
_dir = 0;
["Land_Camping_Light_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [0.293000000001, 10.611, 1];
_dir = 0;
["Land_Camping_Light_F", _pos, _dir, _centerPos, _rotateDir, true] call _fnc_CreateObject;

_pos = [-15.51, -11.004, 3.1];
_dir = 305;
["Land_CampingChair_V2_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-15.432, -12.284, 3.1];
_dir = 225;
["Land_CampingChair_V2_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Statics 

if (count _staticWeaponClasses > 0) then {
    // Gun behind sandbags
    _pos = [-0.35, -2.7];
    _dir = 173;
    
    _guns = _staticWeaponClasses;
    _gun = selectRandom _guns;
    _static = [_gun, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
	[_static,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};

// Armor
_armor = selectRandom _parkedArmorClasses;

if (count _parkedArmorClasses > 0) then {

    _pos = [6.021, 7.199];
    _dir = 180;
    
    _sarmor = [_armor, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateVehicle;
	
	_sarmor setfuel random [0.05, 0.10, 0.15];
	_sarmor setdamage random [0.25, 0.5, 0.9];
	_sarmor setVehicleAmmo random [0, 0.5, 1];

};
// setVehicleAmmo cannot be used until Ammo Depots rearm all vehicles


// Vehicles
if (count _parkedVehicleClasses > 0) then {
    // Cars
    _pos = [11.136, 7.155];
    _dir = 180;
    
    _vehicle = selectRandom _parkedVehicleClasses;
    _stupidvehicle = [_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateVehicle;
	
	_stupidvehicle setfuel random 1;
	_stupidvehicle setdamage random [0, 0.2, 0.5];
	_stupidvehicle setVehicleAmmo random [0, 0.5, 1];
};

_random = random 1;
if (_random > .5 ) then {
    _pos = [-20.35, -1.202];
    _dir = 100;
    
    _vehicle = selectRandom _parkedVehicleClasses;
    _stupidvehicle = [_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
	
	_stupidvehicle setfuel random 1;
	_stupidvehicle setdamage random [0, 0.2, 0.5];
	_stupidvehicle setVehicleAmmo random [0, 0.5, 1];
};
if (_random > .75) then {
    _pos = [-15.247, 12.6];
    _dir = 144;
   
     _vehicle = selectRandom _parkedVehicleClasses;
    _stupidvehicle = [_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
	
	_stupidvehicle setfuel random 1;
	_stupidvehicle setdamage random [0, 0.2, 0.5];
	_stupidvehicle setVehicleAmmo random [0, 0.5, 1];
};

["A3E_MotorPoolMapMarker" + str _mNumber,_centerPos,"o_service"] call A3E_fnc_createLocationMarker;

_marker = createMarkerLocal ["A3E_MotorPoolPatrolMarker" + str _mNumber, _centerPos];
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerAlphaLocal 0;
_marker setMarkerSizeLocal [40, 38];


