private _knownPositions =  missionNamespace getvariable ["A3E_KnownPositions",[]];
private _legacySearchmarker = missionNamespace getvariable ["A3E_LegacySearchMarker","noMarker"];


//All groups under control
private _groups = allGroups select{(side _x) == A3E_VAR_Side_Ind  || (side _x) == A3E_VAR_Side_Opfor};
private _patrols = (_groups select {(_x getvariable ["A3E_TaskState","IDLE"]) == "PATROL"});
private _maxInvestigationRange = missionNamespace getvariable ["A3E_var_MaxInvestigationRange",1300];

if(count(_knownPositions)==0) then {
	//Nothing to do, order all patrols pack to their original route
	{
		[_x] call A3E_fnc_Patrol;
	} foreach (_groups select {(_x getvariable ["A3E_TaskState","IDLE"]) == "SAD"});
	deleteMarker _legacySearchmarker;
	missionNamespace setvariable ["A3E_LegacySearchMarker","noMarker"];
	
	["No reports."] call A3E_fnc_SearchLeaderRadio;
	
} else {
	//If no Legacy marker. Create one!
	if(_legacySearchmarker == "noMarker") then {
			private _np = (_knownPositions select 0);
			_legacySearchmarker = createMarker [drn_searchAreaMarkerName, getpos _np];
			_legacySearchmarker setMarkerShape "ELLIPSE";
			_legacySearchmarker setMarkerColor "ColorRed";
			_legacySearchmarker setMarkerAlpha 0;
			_legacySearchmarker setMarkerSize [400, 400];
			 missionNamespace setvariable ["A3E_LegacySearchMarker",_legacySearchmarker];
			["Creating legacy searchzone."] call A3E_fnc_SearchLeaderRadio;
	};

	//How many are troops are idling
	private _sad = (_groups select {(_x getvariable ["A3E_TaskState","IDLE"]) == "SAD"});
	private _patrolsWithoutHome = _patrols select {_x getvariable ["a3e_homeMarker","noMarker"] == "noMarker"};
	if(count(_sad)<=count(_patrols)) then {
		if(count(_patrolsWithoutHome)>0) then {
			//There should be more patrols engaging. Command one to a known position!
			private _kpos = (selectRandom _knownPositions);
			//select nearest Patrol
			private _minDis = -1;
			private _grp = grpNull;
			{
				if((leader _x) distance _kpos < _minDis || _minDis < 0) then {_grp = _x; _minDis = ((leader _x) distance _kpos);};
			} foreach (_patrolsWithoutHome select {(leader _x distance _kpos) < _maxInvestigationRange});
			//Order patrol to investigate
			if(!isNull _grp) then {
				[_grp,getpos _kpos] call A3E_fnc_Search;
				["Sending squad " + str(_grp) +" to investigate report!"] call A3E_fnc_SearchLeaderRadio;
			};
		};
	};
	
	
	//Put legacy marker to newest KP
	private _lastUpdate = 0;
	private _kp = objNull;
	{
		if(_x getvariable ["A3E_LastUpdated",0] > _lastUpdate) then {
			_lastUpdate = _x getvariable ["A3E_LastUpdated",0];
			_kp = _x;
		};
	} foreach _knownPositions;
	
	if(!isNull _kp) then {
		_legacySearchmarker setmarkerpos getpos _kp;
	};
	
	//Check if we need to call an arti strike
	private _lastStrike = missionNamespace getvariable ["A3E_var_LastArtilleryStrike",0];
	private _strikeCooldown = missionNamespace getvariable ["a3e_var_artillery_cooldown",200];
	private _strikeTimeThreshold = missionNamespace getvariable ["a3e_var_artilleryTimeThreshold",300];
	if(diag_TickTime > (_lastStrike+_strikeCooldown)) then {
		private _strikeCandidates = _knownPositions select {(((_x getVariable ["A3E_LastUpdated",0]) - (_x getVariable ["A3E_FirstSight",0])) >= _strikeTimeThreshold) && ((diag_tickTime -(_x getVariable ["A3E_LastUpdated",0])) < 60)};
		if(count(_strikeCandidates) > 0) then {
			private _strikePos = getpos selectRandom(_strikeCandidates);
			
			if (a3e_debug_artillery) then {
				["Trying to call artillery on "+ mapGridPosition _strikePos] call A3E_fnc_SearchLeaderRadio;
			};
			private _strikesuccess = false;
			if(random 100 < 80) then {
				diag_log ("Escape Searchleader: Calling for artillery strike!");
				_strikesuccess = [_strikePos] call a3e_fnc_FireArtillery;
			} else {
				diag_log ("Escape Searchleader: Calling for CAS strike!");
				_strikesuccess = [_strikePos] call a3e_fnc_CallCAS;
			};
			
			//if(_strikesuccess) then {
			missionNamespace setvariable ["A3E_var_LastArtilleryStrike",diag_tickTime];
			//};
		};
	};
};
private _grouplist = missionNamespace getvariable ["A3E_StatusOfPatrols",[]];
/*{
	_x params ["_grp","_pos","_units","_despawn"];
	if(isNull _grp || count(units _grp)==0) then {
		["Lost contact with a group. Sending somebody to investigate to "+ mapGridPosition _pos] call A3E_fnc_SearchLeaderRadio;
		private _send =  grpNull;
		private _minDis = -1;
		{
			if((leader _x) distance _pos < _minDis || _minDis < 0) then {_send = _x; _minDis = ((leader _x) distance _pos);};
		} foreach (_patrols select {(leader _x distance _pos) < _maxInvestigationRange && _x getvariable ["a3e_homeMarker","noMarker"] == "noMarker"});
		if(!isNull _send) then {
			[_send,_pos] call A3E_fnc_Search;
			["Sending squad " + str(_send) +" to inve stigate missing squad!"] call A3E_fnc_SearchLeaderRadio;
		};
	};
	
} foreach _grouplist select {!(_x # 3)};*/

//Store an update of all group and their last known position
_grouplist = [];
{
	if(count(units _x) > 0) then {
		_grouplist pushBack [_x, getpos (leader _x), count(units _x), false];
	};
} foreach _groups;
missionNamespace setvariable ["A3E_StatusOfPatrols",_grouplist];