diag_log "init Civilian traffic";

params ["_enemySpawnDistance", "_enemyFrequency"];

private ["_vehiclesPerSqkm", "_radius", "_vehiclesCount", "_fnc_onSpawnCivilian"];

switch (_enemyFrequency) do
{
    case 1: // 1-3 players
    {
        _vehiclesPerSqkm = 1.6;
    };
    case 2: // 4-6 players
    {
        _vehiclesPerSqkm = 1.4;
    };
    default // 7-8 players
    {
        _vehiclesPerSqkm = 1.2;
    };
};

_radius = _enemySpawnDistance + 500;
_vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);

_fnc_onSpawnCivilian = {
    private ["_vehicle", "_crew"];
    _vehicle = _this select 0;
    _crew = _this select 1;
    
    {
        _x removeWeapon "ItemMap";
        
        _x addEventHandler ["killed",{
            if (
                (_this select 1) in (call A3E_fnc_GetPlayers)
                || {
                    isClass(configFile >> "CfgPatches" >> "ACE_Medical")
                    && {
                        _killer = (_this select 0) getVariable ["ace_medical_lastDamageSource", objNull];
                        _killer in (call A3E_fnc_GetPlayers)
                    }
                }
            ) then {
                if(isNil("a3e_var_Escape_SearchLeader_civilianReporting") || {!a3e_var_Escape_SearchLeader_civilianReporting}) then {
                    a3e_var_Escape_SearchLeader_civilianReporting = true;
                    publicVariable "a3e_var_Escape_SearchLeader_civilianReporting";
                    (_this select 1) addScore -5;
                } else {
                    (_this select 1) addScore -1;
                };
                (_this select 1) addRating 1000; //Even out the minus score by killing civilians
                [name (_this select 1) + " has killed a civilian."] call drn_fnc_CL_ShowCommandTextAllClients;
            };
        }];
    } foreach _crew;
    
    clearitemcargoglobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;			
    
    if (random 100 < 20) then {
        private ["_weaponItem"];
        
        _weaponItem = selectRandom a3e_arr_CivilianCarWeapons;
        
        _vehicle addWeaponCargoGlobal [_weaponItem select 0, 1];
        _vehicle addMagazineCargoGlobal [_weaponItem select 1, _weaponItem select 2];
    };	
    if (random 100 < 80) then {
        _vehicle addItemCargoglobal ["firstaidkit", 3];	
    };
    if (random 100 < 80) then {
        _vehicle addMagazineCargoglobal ["smokeshellRed", 2];	
    };
    if (random 100 < 80) then {
        _vehicle addMagazineCargoglobal ["Chemlight_green", 5];	
    };
};

[civilian, [], _vehiclesCount, _enemySpawnDistance, _radius, 0.5, 0.5, _fnc_onSpawnCivilian, A3E_Debug] spawn drn_fnc_MilitaryTraffic;
