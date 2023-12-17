private _localClasses = profileNamespace getVariable "A3E_Classes";
if (isNil "_localClasses") exitWith {};
"parsing local classes" call a3e_fnc_rptLog;

private _allowedArraysNamesLower = [
    "a3e_arr_Escape_StartPositionGuardTypes",
    "a3e_arr_PrisonBackpackWeapons",
    "a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses",
    "a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses",
    "a3e_arr_Escape_InfantryTypes",
    "a3e_arr_Escape_InfantryTypes_Ind",
    "a3e_arr_recon_InfantryTypes",
    "a3e_arr_recon_I_InfantryTypes",
    "a3e_units_civilian_InfantryTypes",
    "a3e_arr_Escape_RoadBlock_MannedVehicleTypes",
    "a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind",
    "a3e_arr_Escape_ReinforcementTruck_vehicleClasses",
    "a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind",
    "a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses",
    "a3e_arr_ComCenDefence_lightArmorClasses",
    "a3e_arr_ComCenDefence_heavyArmorClasses",
    "a3e_arr_ComCenStaticWeapons",
    "a3e_arr_ComCenParkedVehicles",
    "a3e_arr_Escape_EnemyCivilianCarTypes",
    "a3e_arr_Escape_AmmoDepot_StaticWeaponClasses",
    "a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses",
    "a3e_arr_O_attack_heli",
    "a3e_arr_O_transport_heli",
    "a3e_arr_O_pilots",
    "a3e_arr_I_transport_heli",
    "a3e_arr_I_pilots",
    "a3e_arr_AmmoDepotBasicWeapons",
    "a3e_arr_AmmoDepotSpecialWeapons",
    "a3e_arr_AmmoDepotLaunchers",
    "a3e_arr_AmmoDepotOrdnance",
    "a3e_arr_AmmoDepotVehicle",
    "a3e_arr_AmmoDepotVehicleItems",
    "a3e_arr_AmmoDepotVehicleBackpacks",
    "a3e_arr_AmmoDepotItems",
    "a3e_arr_CivilianCarWeapons",
    "a3e_arr_Scopes",
    "a3e_arr_Scopes_SMG",
    "a3e_arr_Scopes_Sniper",
    "a3e_arr_NightScopes",
    "a3e_arr_TWSScopes",
    "a3e_arr_Bipods",
    "a3e_arr_extraction_chopper",
    "a3e_arr_extraction_chopper_escort",
    "a3e_arr_extraction_boat",
    "a3e_arr_extraction_boat_escort",
    "a3e_arr_extraction_car",
    "a3e_arr_extraction_car_escort",
    "a3e_arr_searchdrone",
    "a3e_arr_searchChopperEasy",
    "a3e_arr_searchChopperHard",
    "a3e_arr_searchChopper_pilot",
    "a3e_arr_searchChopper_crew",
    "a3e_arr_AquaticPatrols",
    "a3e_additional_weapon_box_arsenal_cfgPatches",
    "a3e_additional_weapon_box_arsenal_weapons",
    "a3e_arr_MortarSite",
    "a3e_arr_CASplane",
    "A3E_Trap_Classes",
    "A3E_Trap_Pathes"
] apply {toLower _x};

private _mod = getMissionConfigValue "EscapeMod"; // CUP Desert GER vs Taki Army and Taki Rebels
private _localClassesHM = createHashMapFromArray _localClasses;

{
    private _modArrays = _localClassesHM get _x;
    if (isNil "_modArrays") then {continue};

    format ["found classes %1: %2", _x, _modArrays] call a3e_fnc_rptLog;
    {
        _x params ["_arrayName", "_arrayValue"];
        if (isNil "_arrayName") then {continue};
        if !(toLower _arrayName in _allowedArraysNamesLower) then {
            ("found bad array " + _arrayName) call a3e_fnc_rptLog;
            continue;
        };

        private _currentArray = missionNamespace getVariable _arrayName;
        if (isNil "_currentArray") then {
            missionNamespace setVariable [_arrayName, +_arrayValue];
        } else {
            _currentArray append _arrayValue;
        };
    } forEach _modArrays;
} forEach ["global", _mod];
