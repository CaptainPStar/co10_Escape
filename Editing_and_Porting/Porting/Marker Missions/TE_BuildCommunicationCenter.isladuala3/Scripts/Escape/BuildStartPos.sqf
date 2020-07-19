private ["_centerPos", "_rotateDir"];
private ["_object", "_pos", "_dir"];

_centerPos = _this select 0;
_rotateDir = _this select 1;

_dir = _rotateDir;

_pos = [(_centerPos select 0) - 4, (_centerPos select 1) - 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 0, (_centerPos select 1) - 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) + 4, (_centerPos select 1) - 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 8, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;
*/

_dir = 270 + _rotateDir;

_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 4, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 0, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) + 6, (_centerPos select 1) + 4, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
_pos = [(_centerPos select 0) + 8, (_centerPos select 1) + 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;
*/

_dir = 180 + _rotateDir;

_pos = [(_centerPos select 0) - 4, (_centerPos select 1) + 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 0, (_centerPos select 1) + 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
_pos = [(_centerPos select 0) + 4, (_centerPos select 1) + 8, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;
*/

// Bar Gate

_pos = [(_centerPos select 0) + 4, (_centerPos select 1) + 6, 0];
_object = "Land_BarGate2" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir (_dir + 180);

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) - 6, (_centerPos select 1) - 4, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 6, (_centerPos select 1) - 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 6, (_centerPos select 1) + 4, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
_pos = [(_centerPos select 0) - 8, (_centerPos select 1) + 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;
*/

// Tunnor

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) + 7, (_centerPos select 1) + 5, 0];
_object = "Land_Fire_barrel_burning" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 5, (_centerPos select 1) + 7, 0];
_object = "Land_Fire_barrel_burning" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

// Flag

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) + 7, (_centerPos select 1) + 5, 0];
_object = "FlagCarrierINS" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;


