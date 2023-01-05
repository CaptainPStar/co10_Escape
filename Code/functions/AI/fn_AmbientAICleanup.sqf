private["_grouplist","_group","_plist","_nearestPlayerDis"];
if(isNil("A3E_AmbientAIGroups")) then {
	A3E_AmbientAIGroups = [];
};
_grouplist = [];
_plist = [] call A3E_fnc_GetPlayers;


private _removalDistance = missionNamespace getvariable ["A3E_UnitRemovalDistance",2500];
{
	if(count(units _x)==0) then {
		[format["Empty Group %1 deleted",_group],["AmbientAI","Spawning"]] call A3E_fnc_Log;
		deletegroup _x;
	} else {
		_leader = ((units _x) select 0);
		private _nearest = [getpos _leader,_plist] call A3E_fnc_NearestObjectDis;
		if(_nearest>_removalDistance) then {
			{
				deletevehicle _x;
			} foreach units _x;
			[format["Group %1 deleted (too far)",_group],["AmbientAI","Spawning"],[["NearestPlayer",_nearest]]] call A3E_fnc_Log;
			deletegroup _x;
		} else {
			_grouplist set [count(_grouplist),_x];
		};
		
	};
	

} foreach A3E_AmbientAIGroups;
A3E_AmbientAIGroups = _grouplist;