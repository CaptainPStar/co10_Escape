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

[_center,40] call a3e_fnc_cleanupTerrain;

_fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir"];
    private["_object", "_realPos", "_realDir"];

    _fnc_rotatePos = {
        private ["_centerPos", "_pos", "_dir"];
        private ["_px", "_py", "_mpx", "_mpy", "_ma", "_rpx", "_rpy"];
        _centerPos = _this select 0;
        _pos = _this select 1;
        _dir = _this select 2;
        _px = _pos select 0;
        _py = _pos select 1;
        _mpx = _centerPos select 0;
        _mpy = _centerPos select 1;
        _ma = _dir;
        _rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
        _rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
        [_rpx, _rpy, (_pos select 2)];
    };

    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call _fnc_rotatePos);
    _object = createVehicle [_className, _realPos, [], 0, "NONE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
    _object;
};

private _obj = objNull;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[-11.2253,-12.145,-0.438],_rotation,90.0833] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[-11.2572,-17.6646,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[-11.2594,-1.82666,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[3.47327,-17.8696,-0.438],_rotation,359.913] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-0.525513,-17.8691,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-4.53345,-17.8779,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-8.50415,-17.877,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-4.52051,-17.8726,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.4872,8.93262,-0.438],_rotation,90.0833] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.4886,4.94922,-0.438],_rotation,90.0833] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.491,0.95459,-0.438],_rotation,90.0833] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-11.491,-14.8813,-0.438],_rotation,89.7567] call _fnc_createObject;
_obj = ["Land_Bucket_F",_center,[-10.1876,-13.0327,-0.413986],_rotation,359.997] call _fnc_createObject;
_obj = ["Land_ToiletBox_F",_center,[-9.8363,-16.4731,-0.413996],_rotation,269.503] call _fnc_createObject;
_obj = ["Land_ToiletBox_F",_center,[-9.76563,-13.8613,-0.413999],_rotation,269.504] call _fnc_createObject;
_obj = ["Land_ToiletBox_F",_center,[-9.79028,-15.1392,-0.413998],_rotation,269.504] call _fnc_createObject;
_obj = ["Land_Cargo_Tower_V1_F",_center,[0.448608,3.06445,-0.438],_rotation,0] call _fnc_createObject;
_obj allowDamage false;
_obj = ["Land_CncBarrierMedium_F",_center,[-9.55933,-2.3584,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["Land_CncBarrierMedium_F",_center,[-9.50989,-11.54,-0.438],_rotation,0] call _fnc_createObject;
_obj = ["CargoNet_01_barrels_F",_center,[3.14526,-0.0991211,-0.413995],_rotation,88.1961] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[-11.2708,11.6855,-0.438],_rotation,90.0833] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-0.518066,11.9058,-0.438],_rotation,180.088] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-4.51648,11.9141,-0.438],_rotation,179.84] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[-8.48718,11.915,-0.438],_rotation,179.84] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[3.47693,11.9028,-0.438],_rotation,180.088] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[10.2279,-17.6445,-0.438],_rotation,270.156] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.4429,8.90088,-0.438],_rotation,269.845] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[7.44397,-17.8706,-0.438],_rotation,359.913] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.4478,-14.8921,-0.438],_rotation,270.156] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.4542,-10.9087,-0.438],_rotation,270.156] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.4617,-6.91357,-0.438],_rotation,270.156] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.4478,-3.05615,-0.438],_rotation,270.156] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.4542,0.927246,-0.438],_rotation,270.156] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[10.4617,4.92236,-0.438],_rotation,270.156] call _fnc_createObject;
_obj = ["Land_PaperBox_closed_F",_center,[7.05884,1.59229,-0.438],_rotation,270.088] call _fnc_createObject;
_obj = ["CargoNet_01_barrels_F",_center,[7.32483,0.0107422,-0.32554],_rotation,90.1793] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_Corner_F",_center,[10.2134,11.6846,-0.438],_rotation,180.088] call _fnc_createObject;
_obj = ["Land_Mil_WallBig_4m_F",_center,[7.46057,11.9009,-0.438],_rotation,180.088] call _fnc_createObject;

_obj = ["FlagPole_F",_center,[-1.54443,3.01611,17.4515],_rotation,183.655] call _fnc_createObject;
_obj setflagtexture A3E_VAR_Flag_Opfor;

_obj = ["Land_DataTerminal_01_F",_center,[-2.64319,2.85938,17.4515],_rotation,0] call _fnc_createObject;
_obj setvariable ["A3E_isTerminal",true,true];
_obj allowDamage false;
[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;

if (count _staticWeaponClasses > 0) then {
    // Statics

    _gun = selectRandom _staticWeaponClasses;
	_obj = [_gun,_center,[-2.43372,-2.20557,17.3168],_rotation,181.412] call _fnc_createObject;
	[_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[2.64014,-9.41113,-0.446728],_rotation,269.044] call _fnc_createObject;
    
    
    _vehicle = selectRandom _parkedVehicleClasses;
	_obj = [_vehicle,_center,[2.50159,-4.73682,-0.446451],_rotation,269.044] call _fnc_createObject;
};