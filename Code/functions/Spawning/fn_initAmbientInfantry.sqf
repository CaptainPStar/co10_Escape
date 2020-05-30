diag_log "Initialize ambient infantry groups";

params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_enemyFrequency"];

private ["_fnc_OnSpawnAmbientInfantryGroup", "_fnc_OnSpawnAmbientInfantryUnit"];
private ["_playerGroup", "_minEnemiesPerGroup", "_maxEnemiesPerGroup"];

_playerGroup = [] call A3E_fnc_GetPlayerGroup;

_fnc_OnSpawnAmbientInfantryUnit = {
    _this call drn_fnc_Escape_OnSpawnGeneralSoldierUnit;
};

_fnc_OnSpawnAmbientInfantryGroup = {
    private ["_unit", "_enemyUnit"];
    private ["_scriptHandle"];
    
    _unit = units _this select 0;
    
    while {!(isNull _unit)} do {
        _enemyUnit = _unit findNearestEnemy (getPos _unit);
        if (!(isNull _enemyUnit)) exitWith {
            
            private _i = 0;
            for [{_i = (count waypoints _this) - 1}, {_i >= 0}, {_i = _i - 1}] do {
                deleteWaypoint [_this, _i];
            };
            
            _scriptHandle = [_this, drn_searchAreaMarkerName, (getPos _enemyUnit), A3E_Debug] spawn drn_fnc_searchGroup;
            _this setVariable ["drn_scriptHandle", _scriptHandle];
        };
        
        sleep 5;
    };
};

private ["_infantryGroupsCount", "_radius", "_groupsPerSqkm"];

switch (_enemyFrequency) do
{
    case 1: // 1-2 players
    {
        _minEnemiesPerGroup = 2;
        _maxEnemiesPerGroup = 4;
        _groupsPerSqkm = 1;
    };
    case 2: // 3-5 players
    {
        _minEnemiesPerGroup = 2;
        _maxEnemiesPerGroup = 8;
        _groupsPerSqkm = 1.2;
    };
    default // 6-8 players
    {
        _minEnemiesPerGroup = 2;
        _maxEnemiesPerGroup = 12;
        _groupsPerSqkm = 1.4;
    };
};

_radius = (_enemySpawnDistance + 500) / 1000;
_infantryGroupsCount = round (_groupsPerSqkm * _radius * _radius * 3.141592);

[_playerGroup, A3E_VAR_Side_Opfor, a3e_arr_Escape_InfantryTypes, _infantryGroupsCount, _enemySpawnDistance + 200, _enemySpawnDistance + 500, _minEnemiesPerGroup, _maxEnemiesPerGroup, _enemyMinSkill, _enemyMaxSkill, 750, _fnc_OnSpawnAmbientInfantryUnit, _fnc_OnSpawnAmbientInfantryGroup, A3E_Debug] spawn drn_fnc_AmbientInfantry;
