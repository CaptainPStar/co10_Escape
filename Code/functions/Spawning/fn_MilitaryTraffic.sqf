private _maxGroups = missionNamespace getvariable ["A3E_MaxMilitaryTrafficGroups",10];
private _MinSpawnCircleDistance = missionNamespace getvariable ["A3E_MinSpawnCircleDistance",1500];
private _MaxSpawnCircleDistance = missionNamespace getvariable ["A3E_MaxSpawnCircleDistance",2000];

private _groups = missionNamespace getvariable ["A3E_MilitaryTrafficGroups",[]];

if(count(_groups)<_maxGroups) then {
	//New vehicle neded. Spawn it.
	private _spawnpos = [_MinSpawnCircleDistance,_MaxSpawnCircleDistance,"ROAD"] call A3E_fnc_GetCircularSpawnPos;
	if(count(_spawnpos)==3) then {//If spawnpos failed it has <3 elements
		_group = [_spawnpos,selectRandom [A3E_VAR_Side_Opfor,A3E_VAR_Side_Ind,A3E_VAR_Side_Ind,A3E_VAR_Side_Ind]] call A3E_FNC_SpawnMilitaryVehicle;
		["Military vehicle created",["Traffic","Spawning"],[_group,_spawnpos,count(units _group)]] call A3E_fnc_Log;
		_groups pushBack _group;
		[_group] spawn A3E_fnc_MilitaryTrafficPatrol;
		[_group] spawn A3E_fnc_TrackGroup_Add;
	};

};

//Cleanup
{
	
} foreach _groups;
