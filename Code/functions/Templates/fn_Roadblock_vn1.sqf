//VN Roadblock 1
//Pillbox Tower

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

_obj = ["Land_BarGate_F",_center,[-0.0313721,-0.0307617,0],_rotation,0] call _fnc_createObject;
_obj = ["Land_vn_bagfence_end_f",_center,[-9.11377,-4.15381,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_bagfence_long_f",_center,[-6.60657,-4.17139,0],_rotation,180] call _fnc_createObject;
_obj = ["Land_vn_bagfence_long_f",_center,[-4.38623,-1.76416,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_bagfence_round_f",_center,[4.32605,-1.73975,0],_rotation,44.3151] call _fnc_createObject;
_obj = ["Land_vn_bagfence_corner_f",_center,[-4.64575,-3.81104,0],_rotation,90] call _fnc_createObject;
_obj = ["Land_vn_pillboxbunker_02_hex_f",_center,[8.6261,-0.178223,0],_rotation,270] call _fnc_createObject;


if(!(isNull _static)) then {
	_pos = [_center,_center vectorAdd [8.46472,-1.87305,2.6839],_rotation,179.999] call A3E_fnc_rotatePosition;
	_static setdir ((getdir _static) + _rotation);
	_static setVectorUp surfaceNormal _pos;
	_static setPosATL _pos;
};

if !(isNull _vehicle) then {
	private _pos = [_center,_center vectorAdd [-7.31128,-0.212402,0.0184898],_rotation,180.257] call A3E_fnc_rotatePosition;
	_vehicle setdir (180.256 + _rotation);
	_vehicle setPosATL _pos;
};


_objects;