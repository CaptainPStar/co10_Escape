params ["_position"];

diag_log ("Calling CAS to "+ str _position);

private _vehicle = selectRandom a3e_arr_CASplane;

private _allowedWeaponTypes = ["machinegun", "missilelauncher", -1, "bomblauncher"];
private _cfgWeapons = configFile >> "cfgWeapons";

private _vehicleWeaponTypeIDs = [];
{
    private _weaponType = toLower (_x call BIS_fnc_itemType select 1);
    private _index = _allowedWeaponTypes find _weaponType;
    if (_index > -1) then {
        private _modes = getarray (_cfgWeapons >> _x >> "modes");
        if !(_modes isEqualTo []) then {
            _vehicleWeaponTypeIDs pushBack _index;
        };
    };
} forEach (_vehicle call BIS_fnc_weaponsEntityType);

if (_vehicleWeaponTypeIDs isEqualTo []) exitWith {
    format ["Vehicle %1 has no CAS weapons", _vehicle] call A3E_fnc_rptLog;
    false
};

if (0 in _vehicleWeaponTypeIDs && {1 in _vehicleWeaponTypeIDs}) then {
    _vehicleWeaponTypeIDs pushBack 2;
};

private _cas = createGroup sideLogic createUnit ["Logic", _position, [], 0, "NONE"];
_cas setDir random 360;
_cas setPos _position;
_cas setVariable ["vehicle", _vehicle];

private _type = selectRandom ([0,0,1,2,3] select {_x in _vehicleWeaponTypeIDs});
_cas setVariable ["type", _type];

{
    if (
        side _x in [A3E_VAR_Side_Opfor, A3E_VAR_Side_Ind]
        && {units _x select 0 distance _position < a3e_var_artillery_fleeingDistance}
    ) then {
        private _pos = getposATL (units _x select 0);
        private _rotation = [_position, getposATL (units _x select 0)] call BIS_fnc_DirTo;
        private _fleepos = [
            (_pos select 0) + sin(_rotation)*2*a3e_var_artillery_fleeingDistance,
            (_pos select 1) + cos(_rotation)*2*a3e_var_artillery_fleeingDistance,
            0
        ];
        [_x, _fleepos] spawn a3e_fnc_Flee;
    };
} forEach allGroups;

[_cas, [], true] spawn BIS_fnc_moduleCAS;

true
