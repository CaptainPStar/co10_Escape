    private ["_referenceUnits", "_minSpawnDistance", "_maxSpawnDistance"];
    private ["_spawnPos", "_posOk", "_direction", "_distance", "_spawnX", "_spawnY", "_referenceUnit"];
    
    _referenceUnits = _this select 0;
    _maxSpawnDistance = _this select 1;
	
    if(isNil("_referenceUnits")) exitwith {diag_log format ["%1 : Error: fn_RandomPatrolPos was unable to find the referenceUnit.", time];};
	
	if(count(_referenceUnits)>0) then {
		_referenceUnit = _referenceUnits select floor random count _referenceUnits;
		_posOk = false;
		while {!_posOk} do {
			_direction = random 360;
			_distance = random(_maxSpawnDistance);
			_spawnX = (getPos _referenceUnit select 0) + ((sin _direction) * _distance);
			_spawnY = (getPos _referenceUnit select 1) + ((cos _direction) * _distance);
			_spawnPos = [_spawnX, _spawnY, 0];
			
			_posOk = true;

			if (surfaceIsWater _spawnPos) then {
				_posOk = false;
			};
		};
	} else {
		_spawnPos = [0,0,0];
	};
    
    _spawnPos;
