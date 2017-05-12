private _referenceGroup = call A3E_fnc_getPlayerGroup;
private _minSpawnDistance = missionNamespace getvariable ["MinSpawnDistance",1500];
private _maxSpawnDistance =  missionNamespace getvariable ["MaxSpawnDistance",2000];

private _spawnDistanceDiff = _maxSpawnDistance - _minSpawnDistance;
private _roadSegment = objNull;
private _refUnit = vehicle (call A3E_fnc_getRandomPlayer);

private _isOk = false;
private _tries = 0;
while {!_isOk && _tries < 25} do {
	_isOk = true;
	
	private _dir = random 360;
	private _refPosX = ((getPos _refUnit) select 0) + (_minSpawnDistance + _spawnDistanceDiff) * sin _dir;
	private _refPosY = ((getPos _refUnit) select 1) + (_minSpawnDistance + _spawnDistanceDiff) * cos _dir;
	
	private _roadSegments = [_refPosX, _refPosY] nearRoads (_spawnDistanceDiff);




	if (count _roadSegments > 0) then {
		_roadSegment = selectRandom _roadSegments;
		
		private _tooFarAwayFromAll = true;
		private _tooClose = false;
		{
			private _tooFarAway = false;
			
			if ((vehicle _x) distance2D (getPos _roadSegment) < _minSpawnDistance) then {
				_tooClose = true;
			};
			if ((vehicle _x) distance2D (getPos _roadSegment) > _maxSpawnDistance) then {
				_tooFarAway = true;
			};
			if (!_tooFarAway) then {
				_tooFarAwayFromAll = false;
			};
			
		} foreach units _referenceGroup;
		
		_isOk = true;
		if (_tooClose || _tooFarAwayFromAll) then {
			_isOk = false;
			_tries = _tries + 1;
		};
	}
	else {
		_isOk = false;
		_tries = _tries + 1;
	};
};
private _result = objNull;
if (_isOk) then {
	_result = _roadSegment;
};
_result