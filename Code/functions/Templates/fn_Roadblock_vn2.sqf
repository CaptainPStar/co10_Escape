//VN Roadblock 2
//FOB Tower

// Eden Object composition to SQF
// Export file
// Script by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"

params ["_center", "_rotation", ["_static", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
[_center,25] call a3e_fnc_cleanupTerrain;

private _fnc_createObject = {
    params["_className","_centerPos","_relativePos","_rotateDir","_relativeDir",["_align",true]];
    private _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1),(_relativePos select 2)], _rotateDir] call A3E_fnc_RotatePosition);
    private _object = createVehicle [_className, _realPos, [], 0, "CAN_COLLIDE"];
    _object setdir (_relativeDir + _rotateDir);
    _object setPosATL _realPos;
	if(_align) then {
		_object setVectorUp surfaceNormal _realPos;
	};	
    _object
};

private _objects = [];
private _obj = objNull;

_obj = ["Land_BarGate_F",_center,[-0.103394,-0.0522461,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_90_01",_center,[-5.64771,3.57275,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_tower_01",_center,[-7.31848,1.46436,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[7.77026,-0.588867,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_b_trench_revetment_05_01",_center,[4.89832,2.75195,0],_rotation,90.1133] call _fnc_createObject;


if(!(isNull _static)) then {
	_pos = [_center,_center vectorAdd [-7.47192,1.7417,4.32537],_rotation,180.002] call A3E_fnc_rotatePosition;
	_static setdir ((getdir _static) + _rotation);
	_static setVectorUp surfaceNormal _pos;
	_static setPosATL _pos;
};

if !(isNull _vehicle) then {
	private _pos = [_center,_center vectorAdd [8.37781,3.98389,0.0170741],_rotation,188.858] call A3E_fnc_rotatePosition;
	_vehicle setdir (180.256 + _rotation);
	_vehicle setPosATL _pos;
};


_objects;