//VN US ComCenter 
//Barracks

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

//Fix rotation
_rotation = _rotation + 180;

private _obj = objNull;
_obj = ["Land_vn_lampshabby_f",_center,[-18.0972,-12.8335,0],_rotation,40.423] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-16.0911,-13.8794,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-19.1427,-10.7036,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_bagfence_long_f",_center,[-17.2941,-8.02783,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_bagfence_long_f",_center,[-17.1813,-3.45801,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-19.4863,-11.0146,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-19.4904,-3.27393,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-16.0485,-14.4775,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_bagfence_end_f",_center,[-15.9758,-6.83887,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_bagfence_end_f",_center,[-15.8862,-4.69824,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_f",_center,[-19.1219,-2.88965,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_bagbunker_small_f",_center,[-17.1898,-5.75635,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-19.1071,6.45166,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-19.1182,0.722656,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-16.2083,15.1079,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-19.1437,12.166,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-19.4905,4.47314,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-19.4945,12.2139,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-16.0328,15.6587,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_wall_tin_4",_center,[-14.5265,10.8735,3.85243],_rotation,180] call _fnc_createObject;
_obj = ["vn_b_ammobox_supply_02",_center,[-13.3597,0.0693359,-4.76837e-007],_rotation,178.449] call _fnc_createObject;
_obj = ["Land_vn_ttowersmall_1_f",_center,[-16.032,9.80713,9.51793],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_lampshabby_f",_center,[1.58289,-14.9819,0],_rotation,84.8753] call _fnc_createObject;
_obj = ["Land_vn_lampshabby_f",_center,[-1.02649,-1.73682,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-10.4474,-13.8691,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[14.9497,-14.1216,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[18.0156,-11.0532,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[18.0178,-5.3335,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-4.68347,-13.8198,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-10.2899,-2.0835,1.19245],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_stair_01",_center,[16.0902,-9.24951,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-8.28003,-14.4668,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[18.3883,-11.0327,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[14.9302,-14.4771,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[18.3885,-3.28955,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-4.42334,-14.4639,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_bunker_05_01",_center,[14.8262,-12.1143,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_gate_f",_center,[6.22461,-14.4614,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_woodentable_large_f",_center,[16.2494,-13.2905,1.17931],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_woodentable_large_f",_center,[16.2572,-12.4609,1.17283],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_woodentable_large_f",_center,[16.26,-11.3062,1.173],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_czechhedgehog_01_f",_center,[11.8131,-15.6533,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_czechhedgehog_01_f",_center,[-2.51538,-15.9819,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_czechhedgehog_01_f",_center,[10.8861,-16.9673,0],_rotation,269.946] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_half_f",_center,[15.0206,-12.7847,1.13543],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_half_f",_center,[-5.96948,-2.27539,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_BarGate_F",_center,[6.41211,-13.834,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_short_green_f",_center,[15.0662,-11.3628,1.3275],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_long_green_f",_center,[11.5278,-12.7856,0],_rotation,256.469] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_long_green_f",_center,[11.5524,-12.8467,0.848154],_rotation,74.9084] call _fnc_createObject;
_obj = ["Land_vn_guardbox_01_smooth_f",_center,[0.0108643,-15.5244,0.0506177],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_round_green_f",_center,[-6.23401,-4.67822,0],_rotation,304.132] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_round_green_f",_center,[-1.047,-13.7041,0],_rotation,216.569] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_round_green_f",_center,[-1.02356,-13.8765,0.798213],_rotation,216.569] call _fnc_createObject;
_obj = ["Land_Loudspeakers_F",_center,[12.1653,-13.5542,0],_rotation,180] call _fnc_createObject;
_obj = ["Flag_US_F",_center,[-6.27246,-4.18555,0],_rotation,180] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;
_obj = ["Land_DataTerminal_01_F",_center,[-10.6299,10,4.68368],_rotation,0] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;
_obj = ["Land_vn_lampshabby_f",_center,[17.0925,13.9746,0],_rotation,216.389] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-4.83643,15.1313,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[9.37256,15.0654,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[-10.5646,15.1182,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[18.0402,0.373047,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[18.0146,11.8164,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[15.0162,15.0757,1.88703],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[18.0513,6.10205,1.887],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[18.3901,4.45459,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-0.543823,15.6592,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[-8.28674,15.667,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[14.9502,15.6606,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[7.20227,15.6675,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_mil_wiredfence_f",_center,[18.3904,12.1978,0],_rotation,270] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_tall_03",_center,[2.87793,14.9536,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_tall_03",_center,[-0.327637,14.9976,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_wall_tin_4",_center,[-11.2158,10.9561,3.85243],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_f",_center,[0.817627,11.2891,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_f",_center,[1.30042,0.530762,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_f",_center,[7.02515,0.506348,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_f",_center,[3.67688,11.2666,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_f",_center,[9.11548,0.369141,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_f",_center,[3.79749,0.358887,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_barracks_01_grey_f",_center,[-2.80273,5.78662,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_round_green_f",_center,[12.8447,11.6265,3.85243],_rotation,217.414] call _fnc_createObject;
_obj = ["Land_vn_bagfence_01_round_green_f",_center,[12.9263,11.6968,4.64283],_rotation,217.414] call _fnc_createObject;
_obj = ["vn_b_ammobox_supply_03",_center,[-11.7437,-0.102539,-1.43051e-006],_rotation,359.999] call _fnc_createObject;
_obj = ["Land_vn_sandbagbarricade_01_hole_f",_center,[5.46863,14.8491,0],_rotation,180] call _fnc_createObject;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-17.4955,-5.66846,-0.00652599],_rotation,270.001] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[16.1575,-12.4819,2.02589],_rotation,152.666] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[11.2203,-6.87842,0.0215259],_rotation,212.386] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-9.55225,-10.5732,0.0226202],_rotation,89.9999] call _fnc_createObject;
};