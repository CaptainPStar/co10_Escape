private ["_centerPos", "_rotateDir", "_staticWeaponClasses", "_parkedVehicleClasses", "_index"];
private ["_pos", "_dir", "_posX", "_posY", "_sectionDir", "_guns", "_gun", "_vehicle", "_powerGenerator","_static"];
private ["_fnc_CreateObject"];
private ["_obj"];


_centerPos = _this select 0;
_rotateDir = _this select 1;

if (count _this > 2) then { _staticWeaponClasses = _this select 2; } else { _staticWeaponClasses = []; };
if (count _this > 3) then { _parkedVehicleClasses = _this select 3; } else { _parkedVehicleClasses = []; };

[_centerPos,40] call a3e_fnc_cleanupTerrain;

_fnc_CreateObject = {
    private ["_className", "_relativePos", "_relativeDir", "_centerPos", "_rotateDir"];
    private ["_object", "_realPos", "_realDir"];
    
    _className = _this select 0;
    _relativePos = _this select 1;
    _relativeDir = _this select 2;
    _centerPos = _this select 3;
    _rotateDir = _this select 4;
    
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1)], _rotateDir] call a3e_fnc_RotatePosition);
    _realDir = _relativeDir + _rotateDir;
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setDir _realDir;
    //_object lock true;
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
    //_object = _className createVehicle _realpos;
    _object = createVehicle [_className, _realpos, [], 0, "NONE"];
    _object setDir _realDir;
    //_object lock true;
    _object
};

/// Bagfence

/*
// (North western corner)
_pos = [-18, 16.5];
_dir = 90;
["Land_fort_bagfence_corner", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
*/

//(North western wall)
_pos = [-18, 15.15];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// (Western wall)
_posX = -19.2;
_sectionDir = 270;

_pos = [_posX, 14];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -4];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -1];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 2];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 5];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 8];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 11];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -7];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -10];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// (Southern wall)
_posY = -11.2;

_pos = [-18, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-15, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-12, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-9, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-6, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-3, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [0, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [3, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [6, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [9, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [12, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [15, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [18, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// (Eastern wall)
_posX = 19.2;
_sectionDir = 90;

_pos = [_posX, -10];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -7];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -4];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -1];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 2];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 5];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 8];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 11];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 14];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// (North eastern wall)
_pos = [18, 15.15];
_dir = 180;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Barracks

_pos = [-13, -3];
_dir = 0;
["Land_Cargo_Patrol_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
//"Land_Cargo20_military_green_F"
// Power Generator
_pos = [4, -7];
_dir = 90;
["Land_Communication_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;


// Antennas

_pos = [0, -9];
_dir = 180;
_obj = ["Land_DataTerminal_01_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
//[[_obj, "Hijack", "Scripts\Escape\Hijack.sqf"], "a3e_fnc_addHijackAction", nil, false] spawn BIS_fnc_MP;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;

_pos = [0, -9];
_dir = 180;
_obj = ["HeliHEmpty", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [13, 1];
_dir = 90;
_obj = ["Land_Medevac_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
//[[_obj, "Heal at medical building", "Scripts\Escape\HealAtMedicalBuilding.sqf"], "a3e_fnc_addHealAtMedicalBuildingAction", nil, false] spawn BIS_fnc_MP;

_pos = [10, -5];
_dir = 180;
["Land_Cargo_House_V1_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Toilet

_pos = [-8, -9];
_dir = 180;
["Land_ToiletBox_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
_pos = [-6.7, -9];
_dir = 180;
["Land_ToiletBox_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Fuel Tank
_pos = [-14, 10];
_dir = 90;
["Land_Tank_rust_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Camo Nets




// Flag
_pos = [0, 10];
_dir = 0;
_object = ["FlagPole_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
_object setflagtexture A3E_VAR_Flag_Opfor;

if (count _staticWeaponClasses > 0) then {
    // Statics
    _pos = [-17, 13.5];
    _dir = 0;
    
    _gun = _staticWeaponClasses select floor random count _staticWeaponClasses;
    _static = [_gun, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
	[_static,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
    
    _pos = [17, -9.5];
    _dir = 135;
    
    //_guns = ["DSHkM_Mini_TriPod", "AGS_Ins", "DSHKM_Ins"];
    _guns = ["O_HMG_01_high_F"];
    _gun = _guns select floor random count _guns;
    _static = [_gun, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
	[_static,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _pos = [11.5, 12];
    _dir = 270;
    
    _vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
    [_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateVehicle;
    //_object = _vehicle createVehicle [_realPos, [], 0, "CAN_COLLIDE"];
	
    _pos = [11.5, 6.5];
    _dir = 270;
    
    _vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
    [_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
};
