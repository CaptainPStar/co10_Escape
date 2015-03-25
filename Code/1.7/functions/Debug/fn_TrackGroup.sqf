private["_startpos","_endpos","_marker","_width","_length","_distanceY","_distanceX","_markername","_rotation","_text"];
_group = [_this,0] call bis_fnc_param;


	_marker = _group getvariable "a3e_debug_positionMarker";
	if(isNil("_marker")) then {
		_markername = format["a3e_debug_positionMarker_%1",_group];
		_marker = createmarker [_markername,getposASL (leader _group)];
		_marker setmarkershape "ICON";		
		_marker setmarkertype "mil_dot";
		_marker setmarkercolor ([side leader _group] call a3e_fnc_getSideColor);
		_group setvariable ["a3e_debug_positionMarker",_marker,false];
	};
	
	while{!(isNull _group)} do {
		_marker setmarkerpos getposATL (leader _group);
		_text = [_group] call a3e_fnc_GetTaskState;
		_marker setmarkertext _text;
		if(count (units _group) == 0) exitwith {_marker setmarkertext "KIA";sleep 30;};
		sleep 5;
	};
	_group setvariable ["a3e_debug_positionMarker",nil,false];
	deletemarker _marker;