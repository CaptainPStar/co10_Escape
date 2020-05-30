diag_log "init Enemy military traffic";

params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_enemyFrequency"];

private ["_vehiclesPerSqkm", "_radius", "_vehiclesCount"];

switch (_enemyFrequency) do
{
    case 1: // 1-3 players
    {
        _vehiclesPerSqkm = 0.6;
    };
    case 2: // 4-6 players
    {
        _vehiclesPerSqkm = 0.8;
    };
    default // 7-8 players
    {
        _vehiclesPerSqkm = 1;
    };
};

_radius = _enemySpawnDistance + 500;
_vehiclesCount = round (_vehiclesPerSqkm * (_radius / 1000) * (_radius / 1000) * 3.141592);

sleep 60*15; //Wait 15 Minutes before heavy vehicles may arrive 

[A3E_VAR_Side_Opfor, [], _vehiclesCount/2, _enemySpawnDistance, _radius, _enemyMinSkill, _enemyMaxSkill, drn_fnc_Escape_TrafficSearch, A3E_Debug] spawn drn_fnc_MilitaryTraffic;
[A3E_VAR_Side_Ind, [], _vehiclesCount/2, _enemySpawnDistance, _radius, _enemyMinSkill, _enemyMaxSkill, drn_fnc_Escape_TrafficSearch, A3E_Debug] spawn drn_fnc_MilitaryTraffic;
