params[["_group",grpNull]];

if(isNull _group) exitwith {};

private _MinSpawnCircleDistance = 0;
private _MaxSpawnCircleDistance = missionNamespace getvariable ["A3E_MaxSpawnCircleDistance",1500];

private _movePos = [getpos (leader _group), 500,_MaxSpawnCircleDistance,"ROAD"] call A3E_fnc_GetRandomCirclePosition;

if(count(_movePos)==0) exitwith {
	[_group] spawn {
		sleep 10;
		[_this select 0] spawn A3E_fnc_MilitaryTrafficPatrol;
	};
};

private _waypoint = [_group,_movePos,"MOVE","COLUMN","LIMITED","AWARE","[group this] spawn A3E_fnc_MilitaryTrafficPatrol;"] call A3E_FNC_Move;

if(!isNil("_waypoint")) then {
	_waypoint setWaypointTimeout [0, 10, 30];
};

[_group,"VEHICLEPATROL"] call a3e_fnc_SetTaskState;