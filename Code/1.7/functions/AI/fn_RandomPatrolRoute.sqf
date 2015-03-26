//Don't do this! Will make HC compatibility a pain! We can rely on calling this function serverside only
//if (!isServer) exitWith {};

private ["_group", "_markerName","_cityradius"];
private ["_in_combat","_knows_enemy","_currentPos", "_destinationPos", "_time", "_leader","_Debugmarker1","_Debugmarker2","_Debugmarkername","_search_for_group","_reportedPositions"];

_group = _this select 0;
_markerName = _this select 1;


if(A3E_Debug) then {
	_leader = (leader _group);
	A3E_Debugmarkername = format["Debugmarker1_Group_%1",_group];
	A3E_Debugmarker1 = createMarker [A3E_Debugmarkername,[0,0]];
	A3E_Debugmarkername = format["Debugmarker2_Group_%1",_group];
	A3E_Debugmarker2 = createMarker [A3E_Debugmarkername, [0,0]];
	A3E_Debugmarker1 setMarkerShape "ICON";
	A3E_Debugmarker1 setMarkerType "mil_dot";
	A3E_Debugmarker2 setMarkerShape "ICON";
	A3E_Debugmarker2 setMarkerType "mil_dot";
	A3E_Debugmarker1 setmarkertext format["Pos %1",_group];
	A3E_Debugmarker2 setmarkertext format["Aim %1",_group];
};



while {true} do {
	_leader = (leader _group);
	{
		if(alive _leader) exitwith {};
		_leader = _x;
	} foreach (units _group);
	
	_currentPos = getPos _leader;
	_in_combat = [_group] call A3E_fnc_InCombat;
	
	if(!_in_combat) then { 
		_reportedPositions = nearestObjects [getpos _leader, [a3e_var_knownPositionHelperObject], a3e_var_maxSearchRange];
		if(count(_reportedPositions)>0) then {
			_nearestPosition = (_reportedPositions select 0);
			{
				if((_x getvariable "A3E_LastUpdated")>(_nearestPosition getvariable "A3E_LastUpdated")) then {
					_nearestPosition = _x;
				};
			} foreach _reportedPositions;
			if(random 100 < a3e_var_investigationChance) then {
				if(isNil("_markerName")) then {
					if(A3E_Debug) then {
						player sidechat format["%1 is investigating the last known position",_group];
					};
					_handle = [_group,_nearestPosition,A3E_Debug] spawn a3e_fnc_EngageReportedGroup;
					waituntil{scriptDone _handle};
					if(A3E_Debug) then {
						player sidechat format["%1 is returning to patrol",_group];
					};
				} else {
					if(((getMarkersize _markerName) select 0)>((getMarkersize _markerName) select 1)) then {
						_cityradius = ((getMarkersize _markerName) select 0);
					} else {
						_cityradius = ((getMarkersize _markerName) select 1);
					};
					if((_leader distance _nearestPosition)<=_cityradius+(random _cityradius/2)) then {
						if(A3E_Debug) then {
							player sidechat format["%1 is investigating the last known position",_group];
						};
						_handle = [_group,_nearestPosition,A3E_Debug] spawn a3e_fnc_EngageReportedGroup;
						waituntil{scriptDone _handle};
						if(A3E_Debug) then {
							player sidechat format["%1 is returning to patrol",_group];
						};
					};
				};
			};			
		};
		if(!isNil("_markerName")) then {
			_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
			while {surfaceIsWater [_destinationPos select 0, _destinationPos select 1]} do {
				_destinationPos = [_markerName] call a3e_fnc_RandomMarkerPos;
			};
		} else {
			private["_searchRange"];
			_searchRange = 2000;
			_destinationPos = [((getPos _leader) select 0) - _searchRange + (random (2* _searchRange)), ((getPos _leader) select 1) - _searchRange + (random (2* _searchRange))];
			while {surfaceIsWater [_destinationPos select 0, _destinationPos select 1]} do {
					_destinationPos = [((getPos _leader) select 0) - _searchRange + (random (2* _searchRange)), ((getPos _leader) select 1) - _searchRange + (random (2* _searchRange))];
			};
		};

		if(A3E_Debug) then {
			A3E_Debugmarker1 setmarkerpos getpos _leader;
			A3E_Debugmarker2 setmarkerpos _destinationPos;
		};
		
		[_group,_destinationPos] call a3e_fnc_move;


		//IIRC walking speed is 101 m/min (this may be from Arma 2)?
		_time = ((_currentPos distance _destinationPos) / 101) * 60 * 1.01;
		_time = _time + random 20;
		sleep _time;
	} else {
		//Place for possible flanking, smoke, etc
		// also we can plug the detection and reporting of the players here as this block is reached at detecting enemys
		if(count (waypoints _group) == 2) then {
			[_group, 1] setWaypointPosition [getPos _leader, 10];
		};
		{
			_x setbehaviour "COMBAT";
			_x setspeedmode "FULL";
		} foreach units (group _leader);
		sleep 30;
	};
};
