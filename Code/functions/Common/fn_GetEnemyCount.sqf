private["_modifier","_enemyFrequency","_minEnemies","_maxEnemies","_return"];
_modifier = [_this, 0, 1] call BIS_fnc_param;
_enemyFrequency = (Param_EnemyFrequency);
_minEnemies = 8;
_maxEnemies = 12;
switch (_enemyFrequency) do
    {
        case 1: // 1-2 players
        {
            _minEnemies = 2;
            _maxEnemies = 4;
        };
        case 2: // 3-5 players
        {
            _minEnemies = 4;
            _maxEnemies = 6;
        };
        default // 6-8 players
        {
            _minEnemies = 6;
            _maxEnemies = 8;
        };
    };
_minEnemies = _minEnemies * _modifier;
_maxEnemies = _maxEnemies * _modifier;
_return = [_minEnemies,_maxEnemies];
_return