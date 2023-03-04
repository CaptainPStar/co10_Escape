	private["_groups","_newgroups"];
	if(isNil("A3E_Debug_TrackedGroups")) then {
		A3E_Debug_TrackedGroups = [];
	};

	_groups = A3E_Debug_TrackedGroups;
	
	if(!(missionNamespace getvariable["A3E_Debug",false])) exitwith {
	{
		{deletemarker _x;} foreach _unitmarkers;
		deletemarker _marker;
		deletemarker _linemarker;
	} foreach _groups;
	A3E_Debug_TrackedGroups = [];
	};
	
	_newgroups = [];
	{

		private["_group","_marker","_linemarker","_unitmarkers"];
		_group = _x select 0;
		_marker = _x  select 1;
		_linemarker = _x  select 2;
		_unitmarkers = _x  select 3;
		{deletemarker _x;} foreach _unitmarkers;
		
		if(!isNull _group) then 
		{
			private _state = [_group] call a3e_fnc_GetTaskState;
			_text = format["%1 (#U:%2)",_state,count(units _group)];
			
			private _markertype = "b_inf";
			if(vehicle (leader _group) isKindOf "Tank") then {
				_markertype = "b_armor";
			} else {
				if(vehicle (leader _group) isKindOf "Car") then {
					_markertype = "b_motor_inf";
				};
			};
			_marker setmarkertextlocal _text;
			_marker setmarkertype _markertype;
			_marker setmarkerpos getposASL (leader _group);
			if(count(waypoints _group)>1) then {
				_linemarker setmarkeralpha 1;
				[getposASL (units _group select 0),waypointPosition ((waypoints _group) select 1),_linemarker] call A3E_FNC_DrawMapLine;
			} else {
				_linemarker setmarkeralpha 0;
			};
			_unitmarkers = [];
			{
				private["_umarker","_markername"];
				_markername = format["a3e_debug_unitMarker_%1_%2",_group,_foreachindex];
				_umarker = createmarker [_markername,getposASL _x];
				_umarker setmarkershapeLocal "ICON";		
				_umarker setmarkertypeLocal "mil_dot";
				_umarker setMarkerSizeLocal [0.5, 0.5];
				//_umarker setmarkercolor ([side leader _group] call a3e_fnc_getSideColor);
				_umarker setmarkercolor "ColorRed";
				_unitmarkers set[count(_unitmarkers),_umarker];
			} foreach units _group;
			if(count(units _group)>0) then {
				_newgroups set [count(_newgroups),[_group,_marker,_linemarker,_unitmarkers]];
			} else {
				deletemarker _marker;
				deletemarker _linemarker;
			};
		} else {
			deletemarker _marker;
			deletemarker _linemarker;
		};
	} foreach _groups;
	A3E_Debug_TrackedGroups = _newgroups;
