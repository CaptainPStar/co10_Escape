	private["_group","_markername","_marker","_linemarker"];
	_group = _this select 0;
	
	if(isNil("A3E_Debug_TrackedGroups")) then {
		A3E_Debug_TrackedGroups = [];
	};

	_markername = format["a3e_debug_positionMarker_%1",_group];
	_marker = createmarker [_markername,getposASL (leader _group)];
	_marker setmarkershape "ICON";		
	_marker setmarkertype "mil_dot";
	_marker setMarkerSize [0.4, 0.4];
	_marker setmarkercolor "ColorRed";

	if(isNil("a3e_var_LineMarkerNo")) then {
		a3e_var_LineMarkerNo = 0;
	} else {
		a3e_var_LineMarkerNo = a3e_var_LineMarkerNo +1;
	};
	_markername = format["LineMarker%1",a3e_var_LineMarkerNo];
	_linemarker = createMarker [_markername,getposASL (leader _group)];

	_linemarker setMarkerShape "RECTANGLE";
	_linemarker setMarkerColor "ColorYellow";
	_linemarker setMarkerSize [1,1];

	
	A3E_Debug_TrackedGroups set [count(A3E_Debug_TrackedGroups),[_group,_marker,_linemarker,[]]];