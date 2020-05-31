// call compile preprocessFileLineNumbers "functions\Common\fn_checkUnitClasses.sqf"

Param_UseDLCApex = 1;
Param_UseDLCLaws = 1;
Param_NoNightvision = 0;
Param_SearchChopper = 2;
[3] call compile preprocessFileLineNumbers "Units\UnitClasses.sqf";

private _arraysVehicle = [
    a3e_arr_Escape_StartPositionGuardTypes,
    a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses,
    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses,
    a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND,
    a3e_arr_Escape_InfantryTypes,
    a3e_arr_Escape_InfantryTypes_Ind,
    a3e_arr_recon_InfantryTypes,
    a3e_arr_recon_I_InfantryTypes,
    a3e_arr_Escape_RoadBlock_MannedVehicleTypes,
    a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind,
    a3e_arr_Escape_ReinforcementTruck_vehicleClasses,
    a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind,
    a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses,
    a3e_arr_ComCenDefence_lightArmorClasses,
    a3e_arr_ComCenDefence_heavyArmorClasses,
    a3e_arr_ComCenStaticWeapons,
    a3e_arr_ComCenParkedVehicles,
    a3e_arr_Escape_EnemyCivilianCarTypes,
    a3e_arr_Escape_AmmoDepot_StaticWeaponClasses,
    a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses,
    a3e_arr_O_attack_heli,
    a3e_arr_O_transport_heli,
    a3e_arr_O_pilots,
    a3e_arr_I_transport_heli,
    a3e_arr_I_pilots,
    a3e_arr_extraction_chopper,
    a3e_arr_extraction_chopper_escort,
    a3e_arr_searchdrone,
    a3e_arr_searchChopperEasy,
    a3e_arr_searchChopperHard,
    a3e_arr_searchChopper_pilot,
    a3e_arr_searchChopper_crew,
    a3e_arr_AquaticPatrols,
    a3e_arr_MortarSite,
    a3e_arr_CASplane,
    a3e_additional_weapon_box_1,
    a3e_additional_weapon_box_2,
    a3e_arr_CrashSiteWrecks,
    a3e_arr_CrashSiteCrew,
    a3e_arr_CrashSiteWrecksCar,
    a3e_arr_CrashSiteCrewCar,
    a3e_arr_AmmoDepotVehicleBackpacks
];

private _fnc_selectFromSet = {
    private _result = [];
    {
        if (_x isEqualType "") then {
            _result pushBackUnique _x;
        } else {
            if (_x isEqualType []) then {
                _result append (_x call _fnc_selectFromSet);
            };
        };
    } forEach _this;
    _result
};

private _cfgVehicles = configFile >> "CfgVehicles";
private _vehicleClasses = _arraysVehicle call _fnc_selectFromSet apply {toLower _x};
{
    if (1 > getNumber (_cfgVehicles >> _x >> "scope")) then {
        diag_log format ["Vehicle %1 doesn't exist or has non-public scope", _x];
    };
} forEach (_vehicleClasses arrayIntersect _vehicleClasses);


private _arraysWeaponMagazine = [ // ["CUP_hgun_Colt1911","CUP_7Rnd_45ACP_1911"]
    a3e_arr_PrisonBackpackWeapons,
    a3e_arr_CivilianCarWeapons
];

private _arraysWeaponWithMagazines = [ // ["CUP_hgun_Makarov", 50, 2, 5, ["CUP_8Rnd_9x18_Makarov_M"], 6]
    a3e_arr_AmmoDepotBasicWeapons,
    a3e_arr_AmmoDepotSpecialWeapons,
    a3e_arr_AmmoDepotLaunchers,
    a3e_arr_AmmoDepotOrdnance,
    a3e_arr_AmmoDepotVehicle,
    a3e_arr_AmmoDepotVehicleItems,
    a3e_arr_AmmoDepotItems,
    a3e_arr_CrashSiteWeapons,
    a3e_arr_CrashSiteItems
];

private _arraysWeapon = [
    a3e_arr_Scopes,
    a3e_arr_Scopes_SMG,
    a3e_arr_Scopes_Sniper,
    a3e_arr_NightScopes,
    a3e_arr_TWSScopes,
    a3e_arr_Bipods
];

private _weaponClasses = [];
private _magazineClasses = [];

{
    {
        _x params [["_weapon", 0], ["_magazine", 0]];
        if (_weapon isEqualType "") then {_weaponClasses pushBackUnique _weapon;};
        if (_magazine isEqualType "") then {_magazineClasses pushBackUnique _magazine;};
    } forEach _x;
} forEach _arraysWeaponMagazine;

{
    {
        _x params [["_weapon", 0], "", "", "", ["_magazines", []]];
        if (_weapon isEqualType "") then {_weaponClasses pushBackUnique _weapon;};
        _magazineClasses append _magazines;
    } forEach _x;
} forEach _arraysWeaponWithMagazines;

{
    _weaponClasses append _x;
} forEach _arraysWeapon;

if (!isNil "a3e_additional_weapon_box_arsenal_weapons") then {
    _weaponClasses append a3e_additional_weapon_box_arsenal_weapons;
};

private _cfgWeapons = configFile >> "CfgWeapons";
_weaponClasses = _weaponClasses apply {toLower _x};
{
    if (2 > getNumber (_cfgWeapons >> _x >> "scope")) then {
        diag_log format ["Weapon %1 doesn't exist or has non-public scope", _x];
    };
} forEach (_weaponClasses arrayIntersect _weaponClasses);

private _cfgMagazines = configFile >> "CfgMagazines";
_magazineClasses = _magazineClasses apply {toLower _x};
{
    if (2 > getNumber (_cfgMagazines >> _x >> "scope")) then {
        diag_log format ["Magazine %1 doesn't exist or has non-public scope", _x];
    };
} forEach (_magazineClasses arrayIntersect _magazineClasses);


if (!isNil "a3e_additional_weapon_box_arsenal_cfgPatches") then {
    private _cfgPatches = configFile >> "CfgPatches";
    {
        if (!isClass (_cfgPatches >> _x)) then {
            diag_log format ["CfgPatch %1 doesn't exist", _x];
        };
    } forEach a3e_additional_weapon_box_arsenal_cfgPatches;
};
