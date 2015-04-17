private ["_centerPos", "_rotateDir"];
private ["_object", "_pos", "_dir"];

_centerPos = _this select 0;
_rotateDir = _this select 1;

_dir = _rotateDir;

_pos = [(_centerPos select 0) - 4, (_centerPos select 1) - 6, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


_pos = [(_centerPos select 0) - 0, (_centerPos select 1) - 6, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


_pos = [(_centerPos select 0) + 4, (_centerPos select 1) - 6, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;



/*
_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 8, 0];
_object = "Land_Wall_Tin_4" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;
*/

_dir = 270 + _rotateDir;

_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 4, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 0, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


_pos = [(_centerPos select 0) + 6, (_centerPos select 1) + 4, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


/*
_pos = [(_centerPos select 0) + 8, (_centerPos select 1) + 6, 0];
_object = "Land_Wall_Tin_4" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;
*/

_dir = 180 + _rotateDir;

_pos = [(_centerPos select 0) - 4, (_centerPos select 1) + 6, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


_pos = [(_centerPos select 0) - 0, (_centerPos select 1) + 6, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


/*
_pos = [(_centerPos select 0) + 4, (_centerPos select 1) + 8, 0];
_object = "Land_Wall_Tin_4" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;
*/

// Bar Gate

_pos = [(_centerPos select 0) + 4, (_centerPos select 1) + 6, 0];
//_object = "Land_City_Gate_F" createVehicle _pos;
_object = createVehicle ["Land_City_Gate_F", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir (_dir + 180);
//_object addEventHandler ["AnimStateChanged", {hint "blah";drn_escapeHasStarted = true;publicVariable "drn_escapeHasStarted";}];
_dir = 90 + _rotateDir;

A3E_PrisonGateObject = _object;

_pos = [(_centerPos select 0) - 6, (_centerPos select 1) - 4, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


_pos = [(_centerPos select 0) - 6, (_centerPos select 1) - 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


_pos = [(_centerPos select 0) - 6, (_centerPos select 1) + 4, 0];
//_object = "Land_Wall_Tin_4" createVehicle _pos;
_object = createVehicle ["Land_Wall_Tin_4", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;


/*
_pos = [(_centerPos select 0) - 8, (_centerPos select 1) + 6, 0];
_object = "Land_Wall_Tin_4" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;
*/

// Tunnor

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) + 7, (_centerPos select 1) + 5, 0];
//_object = "MetalBarrel_burning_F" createVehicle _pos;
_object = createVehicle ["MetalBarrel_burning_F", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 5, (_centerPos select 1) + 7, 0];
//_object = "MetalBarrel_burning_F" createVehicle _pos;
_object = createVehicle ["Land_Loudspeakers_F", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;

A3E_PrisonLoudspeakerObject = _object;
publicvariable "A3E_PrisonLoudspeakerObject";
// Flag

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) + 7, (_centerPos select 1) + 5, 0];
//_object = "Flag_AAD_F" createVehicle _pos;
_object = createVehicle ["Flag_AAF_F", _pos, [], 0, "NONE"];
_object setPos ([_centerPos, _pos, _rotateDir] call a3e_fnc_RotatePosition);
_object setDir _dir;