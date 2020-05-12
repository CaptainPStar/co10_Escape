// Eden Object composition to SQF
// Export file
// Script by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
private ["_staticWeaponClasses", "_parkedVehicleClasses"];

private["_center","_rotation","_obj","_pos"];
_center = param[0];
_rotation = param[1];

if (count _this > 2) then { _staticWeaponClasses = _this select 2; } else { _staticWeaponClasses = []; };
if (count _this > 3) then { _parkedVehicleClasses = _this select 3; } else { _parkedVehicleClasses = []; };

[_center,25] call a3e_fnc_cleanupTerrain;

_fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];

    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call A3E_fnc_rotatePosition);
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};

private _obj = objNull;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-10.3904,-12.7241,0],_rotation,358.693] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-14.2667,-11.3242,-0.0999999],_rotation,89.804] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-14.2626,-9.01123,0],_rotation,89.8037] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-12.7402,-12.7383,-0.0999999],_rotation,358.693] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[-5.59692,-12.6797,0],_rotation,358.693] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[-10.8129,9.59375,0],_rotation,179.331] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[-9.99683,3.01025,0],_rotation,90.0414] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[-10.0046,1.28564,0],_rotation,90.0414] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[-7.38989,9.60645,0],_rotation,180.108] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[-2.23352,9.60938,0],_rotation,180.108] call _fnc_createObject;
_obj = ["Land_Bunker_01_HQ_F",_center,[-6.13794,-4.7998,0.230144],_rotation,179.331] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_hole_F",_center,[-7.995,-12.7256,0],_rotation,359.767] call _fnc_createObject;
_obj = ["Land_TTowerSmall_1_F",_center,[4.75586,6.98535,12.4077],_rotation,270.036] call _fnc_createObject;
_obj = ["FlagPole_F",_center,[12.8467,-7.96338,0],_rotation,176.806] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;
_obj = ["Land_DataTerminal_01_F",_center,[3.10437,7.92236,4.97927],_rotation,179.788] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[13.0726,-12.3271,-0.0999999],_rotation,359.81] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_half_F",_center,[14.4888,-10.8018,-0.0999999],_rotation,268.701] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[14.3628,-8.76367,0],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[12.6566,-8.91309,0],_rotation,0.784823] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_1_F",_center,[10.9343,-8.88232,0],_rotation,0.784823] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[14.3622,-5.30273,0],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[2.43689,-8.76953,0],_rotation,359.823] call _fnc_createObject;
_obj = ["Land_Bunker_01_blocks_3_F",_center,[14.3689,-0.145508,0],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Bunker_01_small_F",_center,[13.6061,6.02637,0],_rotation,269.507] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_F",_center,[10.6691,9.95264,0],_rotation,178.51] call _fnc_createObject;
_obj = ["Land_SandbagBarricade_01_hole_F",_center,[8.50049,9.87305,0],_rotation,178.82] call _fnc_createObject;
_obj = ["Land_Bunker_01_tall_F",_center,[3.84802,8.1123,0],_rotation,179.492] call _fnc_createObject;
_obj allowDamage false;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-13.0974,-11.251,-0.0121183],_rotation,236.488] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[12.5444,-10.979,-0.0131187],_rotation,181.226] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[7.95679,-4.03076,0.0232229],_rotation,179.661] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-6.07373,6.87354,0.0213032],_rotation,270.053] call _fnc_createObject;
};