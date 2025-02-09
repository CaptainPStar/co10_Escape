// fn_BuildComCenter5.sqf - Script by NeoArmageddon.
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

_fnc_createObject = {
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

_obj = ["Flag_CSAT_F",_center,[0.432495,17.1548,0],_rotation,266.77] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;
//_obj forceFlagTexture "mapConfig\logo.paa"; 

_obj = ["Land_DataTerminal_01_F",_center,[-5.43176,0.866699,0],_rotation,357.19] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-2.85498,1.03955,2.78144],_rotation,271.186] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
	
	_gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-27,10.5,-0.00143814],_rotation,326.452] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[0.432495,13.1548,0],_rotation,268] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[-17.1572,3.0,4.76837],_rotation,94] call _fnc_createObject;
};

//private _objects = [
/*
	["O_Truck_03_device_F",[-17.3881,3.79053,4.76837e-007],270.579] call _fnc_createObject;
	["B_sniper_F",[-2.90063,1.04688,-2.78144],0] call _fnc_createObject;
	["B_sniper_F",[18.1021,3.36182,-0.00143814],0] call _fnc_createObject;
	["Flag_Syndikat_F",[0.432495,17.1548,0],0] call _fnc_createObject;
	["Land_PowerGenerator_F",[-8.77734,-14.645,0],1.00179e-005] call _fnc_createObject;
	["Land_TTowerSmall_2_F",[-8.41968,-12.9751,0],0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Medium",[-0.671387,10.9893,0],0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Large",[-1.81885,8.67969,0],0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",[-3.5127,6.33057,0],96.1081] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",[-3.67407,10.7124,0],96.1081] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Medium",[1.57117,8.73828,0],0] call _fnc_createObject;
	["AmmoCrates_NoInteractive_Small",[-0.886597,5.8374,0],96.1081] call _fnc_createObject;
*/
	["Land_Mil_WiredFence_F",_center,[20.3303,23.1187,0],_rotation,0.783559] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[23.8303,19.6177,0],_rotation,89.7835] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[12.6411,23.2656,0],_rotation,0.783559] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[14.9553,20.6187,0],_rotation,0] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[9.08032,20.6187,0],_rotation,0] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[17.8303,17.4932,0],_rotation,90] call _fnc_createObject;
	["Land_BarGate_F",_center,[28.3303,4.49365,0],_rotation,270] call _fnc_createObject;
	["Land_Mil_WiredFence_Gate_F",_center,[23.9554,3.86816,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[6.45532,2.74268,0],_rotation,90] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[8.45532,-12.6318,0],_rotation,90] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[23.3945,-5.0293,0],_rotation,89.7835] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[23.5803,12.7427,0],_rotation,89.7835] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[23.3303,-12.7573,0],_rotation,89.7835] call _fnc_createObject;
	["Land_Cargo_Patrol_V1_F",_center,[16.5806,15.6191,-4.76837e-007],_rotation,270] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[5.83032,-1.13184,0],_rotation,90] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[12.9554,8.11816,0],_rotation,15] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[29.5804,11.2432,0],_rotation,270] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[25.4553,-2.88184,0],_rotation,90] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[29.4553,-4.50684,0],_rotation,0] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[26.8303,-4.50684,0],_rotation,180] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[31.0803,-3.13184,0],_rotation,90] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[28.2053,12.8682,0],_rotation,1.00179e-005] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[6.45532,6.74316,0],_rotation,270] call _fnc_createObject;
	["Land_Sign_WarningMilitaryArea_F",_center,[32.2054,11.2437,0],_rotation,270] call _fnc_createObject;
	["Land_Cargo10_grey_F",_center,[12.7053,10.4932,0],_rotation,165.001] call _fnc_createObject;
	["Land_Cargo20_military_green_F",_center,[12.4553,-6.88184,0],_rotation,270] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[17.3303,-11.8813,0],_rotation,270] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[17.8303,11.4932,0],_rotation,90] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[17.3303,-5.88135,0],_rotation,270] call _fnc_createObject;
	["Land_Pallets_F",_center,[8.70532,3.61816,0],_rotation,135] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[8.45532,-18.1318,0],_rotation,90] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[23.3945,-20.5298,0],_rotation,89.7835] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[19.8945,-24.0293,0],_rotation,179.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[12.1445,-24.0293,0],_rotation,179.784] call _fnc_createObject;
	["Land_Cargo_Patrol_V1_F",_center,[15.9556,-16.0059,-4.76837e-007],_rotation,270] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[14.4553,-21.0063,0],_rotation,0] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[17.3303,-17.8813,0],_rotation,270] call _fnc_createObject;
	["Land_Wall_IndCnc_4_D_F",_center,[8.3302,-20.6318,0],_rotation,180] call _fnc_createObject;
	["Land_Wall_IndCnc_Pole_F",_center,[11.3998,-21.0557,0],_rotation,0] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-10.6697,23.6187,0],_rotation,0.783559] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[4.83032,23.3687,0],_rotation,0.783559] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-18.4197,23.7437,0],_rotation,0.783559] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-21.8553,20.3462,0],_rotation,270.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-2.91968,23.4937,0],_rotation,0.783559] call _fnc_createObject;
	["Land_Cargo_Patrol_V1_F",_center,[-16.5444,16.4932,-4.76837e-007],_rotation,1.00179e-005] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-14.9197,20.4932,0],_rotation,180] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-2.91968,20.4937,0],_rotation,0] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-17.7947,17.3682,0],_rotation,90] call _fnc_createObject;
	["Land_Wall_IndCnc_4_D_F",_center,[-8.79456,20.1182,0],_rotation,0] call _fnc_createObject;
	["Land_Wall_IndCnc_Pole_F",_center,[-11.8641,20.542,0],_rotation,180] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[3.08032,20.4937,0],_rotation,0] call _fnc_createObject;
	["Land_BarGate_F",_center,[-26.0447,3.86816,0],_rotation,90] call _fnc_createObject;
	["Land_Mil_WiredFence_Gate_F",_center,[-22.2947,3.86816,0],_rotation,90] call _fnc_createObject;
	["Land_GymBench_01_F",_center,[-6.6698,-9.25684,0],_rotation,195] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[-6.79456,6.36865,0],_rotation,270] call _fnc_createObject;
	["Land_HBarrier_5_F",_center,[2.95532,0.618164,0],_rotation,0] call _fnc_createObject;
	["Land_CratesWooden_F",_center,[-8.66968,5.99316,0],_rotation,90] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-22.1053,-12.7788,0],_rotation,270.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-21.9803,12.5962,0],_rotation,270.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-21.9803,-5.0293,0],_rotation,270.784] call _fnc_createObject;
	["Land_GarbageContainer_open_F",_center,[2.83032,2.49316,0],_rotation,180] call _fnc_createObject;
	["Land_BagBunker_Tower_F",_center,[-4.41943,0.744141,0],_rotation,270] call _fnc_createObject;
	["Land_PaperBox_closed_F",_center,[3.8302,-1.13184,0],_rotation,195] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[-24.5447,12.8682,0],_rotation,0] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[-23.1696,11.2432,0],_rotation,270] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[-25.9197,-4.50684,0],_rotation,180] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[5.08032,8.36816,0],_rotation,1.00179e-005] call _fnc_createObject;
	["Land_WoodenTable_small_F",_center,[-17.4197,-10.7568,0],_rotation,0.000379845] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-18.2947,-6.00635,0],_rotation,270] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-17.7947,11.3682,0],_rotation,90] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-18.2947,-12.0063,0],_rotation,270] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-10.6697,-6.50684,0],_rotation,0] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-15.6697,-6.50684,0],_rotation,0] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-3.66968,-8.63184,0],_rotation,90] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-0.669678,-11.3818,0],_rotation,0] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-1.16968,-13.6318,0],_rotation,90] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-5.66968,-6.50684,0],_rotation,0] call _fnc_createObject;
	["Land_BarrelTrash_grey_F",_center,[-5.41968,8.36816,0],_rotation,359.989] call _fnc_createObject;
	["Land_Net_Fence_Gate_F",_center,[4.70532,-11.0068,0],_rotation,0] call _fnc_createObject;
	["Land_Communication_F",_center,[1.20532,2.86768,0],_rotation,180] call _fnc_createObject;
	["Land_WaterBarrel_F",_center,[-5.16968,7.24316,0],_rotation,359.995] call _fnc_createObject;
	["Land_Bench_01_F",_center,[-14.7947,-19.2568,0],_rotation,0] call _fnc_createObject;
	["Land_Bench_01_F",_center,[-5.6698,-19.1318,0],_rotation,0] call _fnc_createObject;
	["Land_Bench_01_F",_center,[-10.2947,-19.2568,0],_rotation,0] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[4.39453,-24.0293,0],_rotation,179.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-11.1055,-24.0293,0],_rotation,179.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-22.2303,-20.5288,0],_rotation,270.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-18.8555,-24.0293,0],_rotation,179.784] call _fnc_createObject;
	["Land_Mil_WiredFence_F",_center,[-3.35547,-24.0293,0],_rotation,179.784] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-9.54468,-21.1318,0],_rotation,180] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-3.54468,-21.0068,0],_rotation,180] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-15.4197,-21.1318,0],_rotation,180] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[2.45532,-21.0068,0],_rotation,180] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-2.79468,-18.3818,0],_rotation,270] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[2.20532,-15.8818,0],_rotation,270] call _fnc_createObject;
	["Land_New_WiredFence_5m_F",_center,[-0.544678,-18.8818,0],_rotation,0] call _fnc_createObject;
	["Land_Wall_IndCnc_4_F",_center,[-18.2947,-18.0063,0],_rotation,270] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[-27.1697,12.8682,0],_rotation,180] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[-27.2948,-2.88184,0],_rotation,90] call _fnc_createObject;
	["Land_Sign_WarningMilitaryArea_F",_center,[-29.9197,-2.88184,0],_rotation,90] call _fnc_createObject;
	["Land_BagFence_Long_F",_center,[-28.7946,11.4932,0],_rotation,270] call _fnc_createObject;
	//["Land_DataTerminal_01_F",_center,[-5.43176,0.866699,0],_rotation,180,_center,[true,false]]
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