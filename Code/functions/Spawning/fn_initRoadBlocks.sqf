diag_log "init RoadBlocks";

params ["_enemySpawnDistance", "_enemyFrequency"];

private ["_areaPerRoadBlock", "_maxEnemySpawnDistanceKm", "_roadBlockCount"];
private ["_fnc_OnSpawnInfantryGroup", "_fnc_OnSpawnMannedVehicle"];

_fnc_OnSpawnInfantryGroup = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach units _this;};
_fnc_OnSpawnMannedVehicle = {{_x call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;} foreach (_this select 1);};

switch (_enemyFrequency) do {
    case 1: {
        _areaPerRoadBlock = 4.19;
    };
    case 2: {
        _areaPerRoadBlock = 3.14;
    };
    default {
        _areaPerRoadBlock = 2.5;
    };
};

_maxEnemySpawnDistanceKm = (_enemySpawnDistance + 500) / 1000;
_roadBlockCount = round ((_maxEnemySpawnDistanceKm * _maxEnemySpawnDistanceKm * 3.141592) / _areaPerRoadBlock);

if (_roadBlockCount < 1) then {
    _roadBlockCount = 1;
};
//A3E_VAR_Side_Ind
[a3e_arr_Escape_InfantryTypes, a3e_arr_Escape_RoadBlock_MannedVehicleTypes, _fnc_OnSpawnInfantryGroup, _fnc_OnSpawnMannedVehicle, A3E_Debug] spawn A3E_fnc_RoadBlocks;
