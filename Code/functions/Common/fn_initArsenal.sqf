params ["_box"];

if (isNil "a3e_additional_weapon_box_arsenal_cfgPatches") exitWith {};

private _cfgPatchesLower = a3e_additional_weapon_box_arsenal_cfgPatches apply {toLower _x};
private _cfgWeapons = configFile >> "CfgWeapons";
private _magazineClasses = [];

private _weaponClasses = '
    getNumber (_x >> "scope") == 2
    && {-1 < configSourceAddonList _x findIf {toLower _x in _cfgPatchesLower}}
    && {_magazineClasses append (getArray (_x >> "magazines") apply {toLower _x}); true}
' configClasses _cfgWeapons apply {configName _x};

if (!isNil "a3e_additional_weapon_box_arsenal_weapons") then {
    _weaponClasses append a3e_additional_weapon_box_arsenal_weapons;
    {
        _magazineClasses append (getArray (_cfgWeapons >> _x >> "magazines") apply {toLower _x});
    } forEach a3e_additional_weapon_box_arsenal_weapons;
};

private _cfgMagazines = configFile >> "CfgMagazines";
_magazineClasses = _magazineClasses arrayIntersect _magazineClasses apply {configName (_cfgMagazines >> _x)};

["AmmoboxInit", _box] call BIS_fnc_arsenal;
[_box, _weaponClasses, true, false] call BIS_fnc_addVirtualWeaponCargo;
[_box, _magazineClasses, true, false] call BIS_fnc_addVirtualMagazineCargo;
