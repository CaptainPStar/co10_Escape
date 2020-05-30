diag_log "prepare Aquatic Patrols";

params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_enemyFrequency"];

private ["_playerGroup", "_minEnemiesPerGroup", "_maxEnemiesPerGroup", "_fnc_OnSpawnGroup"];

call drn_fnc_InitAquaticPatrolMarkers;

_playerGroup = [] call A3E_fnc_GetPlayerGroup;

switch (_enemyFrequency) do
{
    case 1: // 1-2 players
    {
        _minEnemiesPerGroup = 2;
        _maxEnemiesPerGroup = 4;
    };
    case 2: // 3-5 players
    {
        _minEnemiesPerGroup = 3;
        _maxEnemiesPerGroup = 6;
    };
    default // 6-8 players
    {
        _minEnemiesPerGroup = 4;
        _maxEnemiesPerGroup = 8;
    };
};

_fnc_OnSpawnGroup = {
    {
        _x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
    } foreach units _this;
};

[(units _playerGroup) select 0, A3E_VAR_Side_Opfor, a3e_arr_Escape_InfantryTypes, _minEnemiesPerGroup, _maxEnemiesPerGroup, 500000, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance + 250, _fnc_OnSpawnGroup, A3E_Debug] call drn_fnc_InitAquaticPatrols;
