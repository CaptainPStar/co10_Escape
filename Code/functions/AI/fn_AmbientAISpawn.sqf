private["_grouplist","_group"];

if(isNil("A3E_AmbientAIGroups")) then {
	A3E_AmbientAIGroups = [];
};
if(isNil("A3E_MaxAmbientAIGroups")) then {
	A3E_MaxAmbientAIGroups = 5;
	A3E_MinSpawnCircleDistance = 500;
	A3E_MaxSpawnCircleDistance = 1000;
};
private _maxAmbientGroups = missionNamespace getvariable ["A3E_MaxAmbientAIGroups",10];
private _MinSpawnCircleDistance = missionNamespace getvariable ["A3E_MinSpawnCircleDistance",1500];
private _MaxSpawnCircleDistance = missionNamespace getvariable ["A3E_MaxSpawnCircleDistance",2000];


if(count(A3E_AmbientAIGroups)>=_maxAmbientGroups) exitwith {};

//Get a spawnpos around the players
private _spawnpos = [_MinSpawnCircleDistance,_MaxSpawnCircleDistance] call A3E_fnc_GetCircularSpawnPos;

if(count(_spawnpos)==3) then {//If spawnpos failed it has <3 elements
	_group = [_spawnpos,selectRandom [A3E_VAR_Side_Opfor,A3E_VAR_Side_Ind,A3E_VAR_Side_Ind,A3E_VAR_Side_Ind],[] call a3e_fnc_getDynamicSquadSize] call A3E_FNC_SpawnPatrol;
	["Ambient AI group created",["AmbientAI","Spawning"],[_group,_spawnpos,count(units _group)]] call A3E_fnc_Log;
	A3E_AmbientAIGroups pushBack _group;
	[_group] spawn A3E_fnc_Patrol;
	[_group] spawn A3E_fnc_TrackGroup_Add;
};


