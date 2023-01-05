	private["_groups","_newgroups"];
	if(isNil("A3E_Debug_TrackedGroups")) then {
		A3E_Debug_TrackedGroups = [];
	};

	_groups = A3E_Debug_TrackedGroups;
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
			 _marker setmarkerpos getposASL (leader _group);
			[getposASL (units _group select 0),waypointPosition ((waypoints _group) select 1),_linemarker] call A3E_FNC_DrawMapLine;
			private _state = [_group] call a3e_fnc_GetTaskState;
			_text = format["%1 (#U:%2)",_state,count(units _group)];
			_marker setmarkertext _text;
			_unitmarkers = [];
			{
				private["_umarker","_markername"];
				_markername = format["a3e_debug_unitMarker_%1_%2",_group,_foreachindex];
				_umarker = createmarker [_markername,getposASL _x];
				_umarker setmarkershape "ICON";		
				_umarker setmarkertype "mil_dot";
				_umarker setMarkerSize [0.3, 0.3];
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
