    private ["_referenceUnits", "_minSpawnDistance", "_maxSpawnDistance"];
    private ["_spawnPos", "_posOk", "_direction", "_distance", "_spawnX", "_spawnY", "_referenceUnit"];
    
    _referenceUnits = _this select 0;
    _minSpawnDistance = _this select 1;
    _maxSpawnDistance = _this select 2;
    
    _referenceUnit = _referenceUnits select floor random count _referenceUnits;
    
    _posOk = false;
    while {!_posOk} do {
        _direction = random 360;
        _distance = _minSpawnDistance + (random (_maxSpawnDistance - _minSpawnDistance));
        _spawnX = (getPos _referenceUnit select 0) + ((sin _direction) * _distance);
        _spawnY = (getPos _referenceUnit select 1) + ((cos _direction) * _distance);
        _spawnPos = [_spawnX, _spawnY, 0];
        
        _posOk = true;
        {
            if ((surfaceIsWater _spawnPos) || (_spawnPos distance (vehicle _x) < _minSpawnDistance)) then {
                _posOk = false;
            };
        } foreach _referenceUnits;
    };
    
    _spawnPos;
