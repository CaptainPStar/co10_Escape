private ["_debugMarkerColor","_debugMarkers","_debugMarkerName","_debugMarkerNo","_side","_unit"];
	_debugMarkers = [];
	_debugMarkerNo = 0;
    while{true} do { 
        {
            [_x] call drn_fnc_CL_DeleteDebugMarkerAllClients;
        } foreach _debugMarkers;

		_debugMarkers = [];
		_debugMarkerNo = 0;
        {
            _group = _x;
			_side = side _group;
            _debugMarkerNo = _debugMarkerNo + 1;
            
            _debugMarkerName = "drn_debugMarker" + str _side + str _debugMarkerNo;
            if (_side == west) then {
                _debugMarkerColor = "ColorBlue";
            };
            if (_side == east) then {
                _debugMarkerColor = "ColorRed";
            };
            if (_side == civilian) then {
                _debugMarkerColor = "ColorWhite";
            };
            if (_side == resistance) then {
                _debugMarkerColor = "ColorYellow";
            };
            
            [_debugMarkerName, getPos (leader _group), "mil_dot", _debugMarkerColor] call drn_fnc_CL_SetDebugMarkerAllClients;
            
            _debugMarkers set [count _debugMarkers, _debugMarkerName];
			sleep 0.01;
        } foreach allgroups;
	sleep 1;
	};	