// fn_BuildComCenter4.sqf - Script by NeoArmageddon.
// A huge shout out to NeoArmageddon for his advice & wisdom. 
// Thanks to Zec Building Compositions for helping make this :) 
// Relative positions exported thanks too Maca's M3Eden Editor Addon.
// modified by aussie :)
private ["_staticWeaponClasses", "_parkedVehicleClasses"];

private["_center","_rotation","_obj","_pos"];
_center = param[0];
_rotation = param[1];

if (count _this > 2) then { _staticWeaponClasses = _this select 2; } else { _staticWeaponClasses = []; };
if (count _this > 3) then { _parkedVehicleClasses = _this select 3; } else { _parkedVehicleClasses = []; };

[_center,40] call a3e_fnc_cleanupTerrain;

private _fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];

    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call A3E_fnc_rotatePosition);
    _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};

	// ++++++++FLAG++++++++++//
	
//Add your own server flag - uncomment line 49  (see https://forums.bohemia.net/forums/topic/180080-co10-escape/?do=findComment&comment=3346952 )
//+ Create a folder "flag" in the root directory of your misson file. Drop in your paa logo & call it logo.paa (jpg might work, PAA is the best).
_obj = ["Flag_CSAT_F",_center,[-10.4982,-0.0605469,0],_rotation,266.77] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;


_obj = ["Land_DataTerminal_01_F",_center,[12.6268,6.06348,0],_rotation,357.19] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-3.02271,-15.2334,-0.00143909],_rotation,271.186] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[17.5204,-21.04,17.8909],_rotation,326.452] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-4.1178,-4.31885,4.76837],_rotation,269.625] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[1.12317,-4.82031,4.76837],_rotation,0.0176632] call _fnc_createObject;
};

//private _objects = [
	["Land_Communication_F",_center,[9.50183,6.43896,0],_rotation,0] call _fnc_createObject;
	["Land_Cargo_Patrol_V2_F",_center,[5.12683,16.4385,-4.76837e-007],_rotation,213.517] call _fnc_createObject;
	["Land_Mil_WiredFence_Gate_F",_center,[-7.74817,19.9316,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[15.0018,8.43896,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[6.87683,17.314,0],_rotation,45] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[9.62683,11.689,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[0.501831,19.814,0],_rotation,1.70755e-005] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-2.37305,21.314,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-2.24817,18.189,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-4.37317,19.064,0],_rotation,270] call _fnc_createObject;
//	["Land_TBox_F",_center,[12.6268,6.06348,0],_rotation,357.19] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[8.12683,7.68896,0],_rotation,300.002] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[7.50159,8.18896,0],_rotation,225.008] call _fnc_createObject;
	["Land_MetalBarrel_F",_center,[8.12683,8.43896,0],_rotation,89.9929] call _fnc_createObject;
	["Land_Cargo_Tower_V2_F",_center,[13.6273,-17.4331,0],_rotation,90] call _fnc_createObject;
	["Land_Slum_House03_F",_center,[12.0018,-5.81104,0],_rotation,0] call _fnc_createObject;
	["Land_Slum_House01_F",_center,[12.3768,0.563965,0],_rotation,270] call _fnc_createObject;
	["Land_cargo_addon02_V1_F",_center,[4.75183,-22.061,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[18.8768,-21.311,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[18.7518,-13.061,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-0.123169,-22.061,0],_rotation,75] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[5.87683,-24.936,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[14.1268,-24.686,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-10.6361,-15.0889,0],_rotation,30] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[13.6268,-9.93604,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[18.377,4.93945,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[18.377,-6.06104,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[18.377,-0.560547,0],_rotation,270] call _fnc_createObject;
	["Land_Cargo10_grey_F",_center,[-0.349976,12.6338,0],_rotation,275.063] call _fnc_createObject;
	["Land_JunkPile_F",_center,[7.00183,-4.31104,0],_rotation,120] call _fnc_createObject;
	["Land_WaterTank_F",_center,[6.50183,-7.43604,0],_rotation,90.0015] call _fnc_createObject;
	["Land_CncBarrier_stripes_F",_center,[-5.24817,-19.186,0],_rotation,45] call _fnc_createObject;
	["Land_Portable_generator_F",_center,[-10.7578,-8.71289,0],_rotation,14.9869] call _fnc_createObject;
	["Land_PaperBox_open_empty_F",_center,[6.25183,-22.936,0],_rotation,90] call _fnc_createObject;
	["Land_BarrelTrash_grey_F",_center,[13.002,-1.93604,0],_rotation,359.998] call _fnc_createObject;
	["Land_Wreck_Slammer_hull_F",_center,[4.50183,-37.311,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-15.4982,7.06396,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-12.8732,16.439,0],_rotation,90] call _fnc_createObject;
	["Land_Wreck_Truck_dropside_F",_center,[-12.6232,31.564,0],_rotation,210] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-14.6233,19.5635,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-12.2482,21.564,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-15.4982,16.064,0],_rotation,0] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-11.3732,19.189,0],_rotation,270] call _fnc_createObject;
	["Land_BarrelSand_F",_center,[-13.373,8.43896,0],_rotation,359.998] call _fnc_createObject;
	["Land_HBarrier_3_F",_center,[-16.8732,11.814,0],_rotation,90] call _fnc_createObject;
	["Land_Cargo_House_V2_F",_center,[-13.3732,-6.68604,0],_rotation,268.897] call _fnc_createObject;
	["Land_Cargo_House_V2_F",_center,[-13.7482,2.31396,0],_rotation,267.293] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-13.9982,-2.18555,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_Big_F",_center,[-15.6232,-11.186,0],_rotation,180] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-18.9983,-7.68652,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-18.9983,3.31348,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-18.9983,-2.18652,0],_rotation,90] call _fnc_createObject;
	["Land_CratesWooden_F",_center,[-8.87317,-1.31104,0],_rotation,90] call _fnc_createObject;