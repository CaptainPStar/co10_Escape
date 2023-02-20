private _players = [] call A3E_fnc_getPlayers;
private _maxTraps = missionnameSpace getvariable ["A3E_Trap_MaxCount",4];
private _spawnDistance = missionnameSpace getvariable ["A3E_Trap_SpawnDistance",200];
private _minSpawnDistance = _spawnDistance/2;
private _despawnDistance = 2*_spawnDistance;
private _pathTypes = missionnameSpace getvariable ["A3E_Trap_Pathes" ,["TRACK", "TRAIL"]];
//Despawn
private _tmpTraps = []+A3E_Traps;
{
	private _trap = _x;
	if(!alive _trap) then {
		A3E_Traps deleteAt (A3E_Traps find _trap);
	};
	
	// is one player below despawn distance?
	private _playerNear = false;
	{
		if(_x distance _trap < _despawnDistance) exitWith {
			_playerNear = true;
		};
	} foreach _players;
	if(!_playerNear) then {
		A3E_Traps deleteAt (A3E_Traps find _trap);
		deletevehicle _trap;
	};
} foreach _tmpTraps;

if(_maxTraps > count(A3E_Traps)) then
{
	private _rndPos = [_players,_minSpawnDistance,_spawnDistance] call A3E_fnc_RandomSpawnPos;
	private _nearRoads = _rndPos nearRoads 100;
	private _roadSegment = objNull;
	private _roadStart = [0,0,0];
	private _roadEnd = [0,0,0];
	private _roadWidth = 0;
	while{isNull _roadSegment && count(_nearRoads)>0} do {
		private _tmpSegment = _nearRoads deleteAt (floor(random(count _nearRoads)));
		private _info = getRoadInfo _tmpSegment;
		if(_info # 8) then {continue;};
		if(!((_info # 0) in _pathTypes)) then {continue;};
		_roadSegment = _tmpSegment;
		_roadStart = (_info # 6);
		_roadEnd = (_info # 7);
		_roadWidth = (_info # 1);
	};
	if(!isNull _roadSegment) then {
		private _types = missionnameSpace getvariable ["A3E_Trap_Classes",["APERSMine"]];
		private _type = selectRandom _types;
		private _roadDirection =  (_roadEnd VectorDiff _roadStart);
		_roadDirection set [2,0];
		private _roadDirectionPerpendicular = vectorNormalized [_roadDirection # 1,-(_roadDirection # 0),0];
		private _roadDir = getdir _roadSegment;
		private _roadCenter = (_roadStart VectorAdd _roadEnd) vectorMultiply 0.5;
		//private _sideOfRoad = (getpos _roadSegment) VectorAdd (_roadDirectionPerpendicular vectorMultiply (_roadWidth + random 0.6 - 0.3));
		private _posOnRoad = vectorLinearConversion [0,1,0.4+random 0.2,_roadStart,_roadEnd,false]; 
		private _trapPos = _roadCenter;
		private _trapDir = _roadDir + 90;
		if(typename _type == "ARRAY") then {
			//Custom trigger format
			switch (_type # 0) do {
				case "random": {
					_trapPos = _posOnRoad vectorAdd (_roadDirectionPerpendicular vectorMultiply (_roadWidth*random(0.9)));
					_trapDir = random 360;
				};
				case "roadside": {
					_trapPos = _posOnRoad vectorAdd (_roadDirectionPerpendicular vectorMultiply ((_roadWidth*0.8)+random 0.5-0.25));
				};
				case "roadcenter": {
					//Nothing to do
				};
				default {
					//Equal to random
				};
			};
			_trapPos set [2,0];
			private _trap = createMine [_type # 1, _trapPos, [], 0];
			_trap setdir _trapDir;
			_trap setpos [_trapPos # 0, _trapPos#1,0];
			A3E_Traps pushBack _trap;
			
			//Reveal mine to everbody except players
			A3E_VAR_Side_Opfor revealMine _trap;
			A3E_VAR_Side_Ind revealMine _trap;
			civilian revealMine _trap;
			[format["Spawned a Trap at %1 in %2m",_trapPos, _trapPos distance player],["Traps"]] call A3E_fnc_Log;
		
		} else {
			//Simple class 
			private _trap = createMine [_type # 1, _roadCenter, [], 0];
			_trap setdir _roadDir;
			A3E_Traps pushBack _trap;
		};
		
	} else {
		//systemchat "No road found for spawning a trap";
	}
	
}