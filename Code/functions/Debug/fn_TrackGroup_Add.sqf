	private["_markername","_marker","_linemarker"];
	params["_group"];
	
	if(!(missionNamespace getvariable["A3E_Debug",false])) exitwith {};
	
	if(isNil("A3E_Debug_TrackedGroups")) then {
		A3E_Debug_TrackedGroups = [];
	};
	
	["Group "+str _group+" added for debug tracking",["Debugging"]] call a3e_fnc_log;
	private _side = side _group;
	
	_markername = format["a3e_debug_positionMarker_%1",_group];
	_marker = createmarker [_markername,getposASL (leader _group)];
	_marker setmarkershapelocal "ICON";		
	_marker setmarkertypelocal "mil_dot";
	_marker setMarkerSizelocal [0.7, 0.7];
	private _markerColor = "ColorBlack";
	 if (_side == west) then {
		_markerColor = "ColorBlue";
	};
	if (_side == east) then {
		_markerColor = "ColorRed";
	};
	if (_side == civilian) then {
		_markerColor = "ColorWhite";
	};
	if (_side == resistance) then {
		_markerColor = "ColorGreen";
	};
	_marker setmarkercolor _markerColor;

	if(isNil("a3e_var_LineMarkerNo")) then {
		a3e_var_LineMarkerNo = 0;
	} else {
		a3e_var_LineMarkerNo = a3e_var_LineMarkerNo +1;
	};
	_markername = format["LineMarker%1",a3e_var_LineMarkerNo];
	_linemarker = createMarker [_markername,getposASL (leader _group)];

	_linemarker setMarkerShape "RECTANGLE";
	_linemarker setMarkerColor _markerColor;
	_linemarker setMarkerSize [1,1];
	_linemarker setMarkerAlpha 0;

	
	A3E_Debug_TrackedGroups set [count(A3E_Debug_TrackedGroups),[_group,_marker,_linemarker,[]]];