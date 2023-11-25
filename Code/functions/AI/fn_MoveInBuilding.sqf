private["_group","_position","_type","_formation","_speed","_combatmode","_onComplete","_script","_marker","_markername","_house","_housePosition"];

_group = [_this,0,grpNull,[grpNull]] call bis_fnc_param;
_position = [_this,1,[0,0,0],[[]]] call bis_fnc_param;
_house = [_this,2,objNull,[objNull]] call bis_fnc_param; 
_housePosition = [_this,3,-1,[1]] call bis_fnc_param; 
_type = [_this,4,"MOVE",[""]] call bis_fnc_param;
_formation = [_this,5,"COLUMN",[""]] call bis_fnc_param;
_speed = [_this,6,"LIMITED",[""]] call bis_fnc_param;
_combatmode = [_this,7,"SAFE",[""]] call bis_fnc_param;
_onComplete = [_this,8,"",[""]] call bis_fnc_param;

(units _group) doFollow (leader _group);

if(count (waypoints _group) <= 1) then {
	_group addWaypoint [[0,0,0], 1];
};


[_group, 1] setWaypointPosition [_position, 1];
//[_group, 1] waypointAttachObject _house;
[_group, 1] setWaypointHousePosition _housePosition;
[_group, 1] setWaypointBehaviour _combatmode;
[_group, 1] setWaypointSpeed _speed;
[_group, 1] setWaypointFormation _formation;
[_group, 1] setWaypointType _type;
[_group, 1] setWaypointCompletionRadius 10;
[_group, 1] setWaypointStatements ["true", _onComplete];
_group setCurrentWaypoint [_group, 1];

//Function to move units in group to different house positions:
[_group,_position,_house] spawn {

	params["_group","_targetPos","_house"];
	waituntil{sleep 5;(((leader _group) distance _targetPos) < 30)};
	doStop (units _group);
	private _positions = _house buildingPos -1;
	_positions = _positions call BIS_fnc_arrayShuffle;
	{
		if(count(_positions)>0) then {
			private _pos = _positions deleteAt 0;
			_x doMove _pos;
			[_x] spawn {
				params["_unit"];
				waitUntil {sleep 0.1; moveToCompleted _unit};
				doStop _unit;//Not sure if needed again here
			};
		}
	} foreach (units _group);
	
	//sleep random [10,30,60];
};

//Return Waypoint
[_group, 1];
