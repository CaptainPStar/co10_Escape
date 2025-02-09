// Eden Object composition to SQF
// Export file
// Script by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"
params [
    ["_center", [], [[]], 3],
    ["_rotation", 0, [0]],
    ["_staticWeaponClasses", [],[[]]],
    ["_parkedVehicleClasses",[],[[]]]
];

private ["_obj", "_pos"];

[_center,25] call a3e_fnc_cleanupTerrain;

private _fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];

    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1), (_relativePos select 2)], _rotateDir] call A3E_fnc_rotatePosition);
    _object = createVehicle [_className, _realPos, [], 0, "NONE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};

//Fix rotation
_rotation = _rotation + 180;

private _obj = objNull;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[-11.6926,-11.2622,-0.438],_rotation,0.118369] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.9059,-0.509766,-0.438],_rotation,90.1229] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.9175,-4.50635,-0.438],_rotation,89.8749] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.9216,-8.47949,-0.438],_rotation,89.8749] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.9031,3.48584,-0.438],_rotation,90.1229] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[-11.677,10.2212,-0.438],_rotation,90.1229] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.8954,7.47021,-0.438],_rotation,90.1229] call _fnc_createObject;
_obj = ["CargoNet_01_barrels_F",_center,[0.140747,3.19678,-0.438001],_rotation,359.336] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[12.1373,-11.231,-0.438],_rotation,0.118369] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[1.81982,-11.2603,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[17.6586,-11.2666,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_ToiletBox_F",_center,[13.8558,-9.77197,-0.438],_rotation,179.537] call _fnc_createObject;
_obj = ["Land_ToiletBox_F",_center,[16.4661,-9.84424,-0.437992],_rotation,179.537] call _fnc_createObject;
_obj = ["Land_ToiletBox_F",_center,[15.132,-9.79834,-0.438],_rotation,179.537] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[17.8727,3.46289,-0.438],_rotation,269.948] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[17.8693,-0.536133,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[14.8733,-11.499,-0.438],_rotation,359.792] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-4.95654,-11.4834,-0.438],_rotation,0.118369] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[17.8741,-4.54395,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[17.8728,-8.51416,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-0.962769,-11.4883,-0.438],_rotation,0.118369] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[17.869,-4.53076,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-8.93896,-11.481,-0.438],_rotation,0.118369] call _fnc_createObject;
_obj = ["Land_CncBarrierMedium_F",_center,[2.35229,-9.56055,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_CncBarrierMedium_F",_center,[11.535,-9.5166,-0.438],_rotation,270.036] call _fnc_createObject;
_obj = ["Land_Bucket_F",_center,[13.0259,-10.1938,-0.437979],_rotation,270.017] call _fnc_createObject;
_obj = ["Land_Cargo_Tower_V1_F",_center,[-3.06335,0.45166,-0.438],_rotation,270.036] call _fnc_createObject;
_obj allowDamage false;
_obj = ["CargoNet_01_barrels_F",_center,[0.0151367,7.21582,-0.258679],_rotation,357.646] call _fnc_createObject;
_obj = ["Land_PaperBox_closed_F",_center,[-1.58777,7.06006,-0.438],_rotation,180.125] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[17.6509,10.2173,-0.438],_rotation,180.194] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[17.8744,7.43408,-0.438],_rotation,269.948] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.915,10.4473,-0.438],_rotation,180.194] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[14.8976,10.4404,-0.438],_rotation,180.194] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-8.89355,10.4487,-0.438],_rotation,179.881] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[6.91858,10.4614,-0.438],_rotation,180.194] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[3.06287,10.4468,-0.438],_rotation,180.194] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-0.92041,10.4565,-0.438],_rotation,180.194] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-4.91638,10.4658,-0.438],_rotation,180.194] call _fnc_createObject;
_obj = ["FlagPole_F",_center,[-3.01758,-1.54199,17.4515],_rotation,93.69] call _fnc_createObject;
_obj forceFlagTexture A3E_VAR_Flag_Opfor;

_obj = ["Land_DataTerminal_01_F",_center,[-2.86072,-2.64014,17.4515],_rotation,270.036] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[2.2041,-2.43359,17.3408],_rotation,91.4478] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[9.41174,2.63525,-0.418942],_rotation,179.08] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[4.73755,2.5,-0.418019],_rotation,179.08] call _fnc_createObject;
};