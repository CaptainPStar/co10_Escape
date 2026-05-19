/* CommonLib v1.04
 * Author: Engima of Ostgota Ops
 * History:
 *   2011-01-25: Created.
 *   2011-11-19: Updated to v1.01 - New version of function drn_fnc_CL_PositionIsInsideMarker. Still backward compatible with v1.00.
 *   2011-12-17: Added debug methods and method ShowTitleTextAllClients.
 *   2011-12-23: Added method drn_fnc_CL_InitParams
 */

/******************************************************************************************/
/* Variables */

// Set this variable to true if you want debug info to show only in RTF-file (and not on player's screens).
drn_var_CL_SilentDebugMode = false;

/******************************************************************************************/
/* Functions */

/*
 * Summary: Initializes the paramsArray with default values if played in single player.
 */
drn_fnc_CL_InitParams = {
    if (isNil "paramsArray") then
    {
        private ["_c", "_i", "_paramName"];
        paramsArray=[];
        
        if (isClass (missionConfigFile/"Params")) then
        {
            _c=count (missionConfigFile/"Params");
            for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
            {
                _paramName = (configName ((missionConfigFile >> "Params") select _i));
                paramsArray=paramsArray+[ getNumber (missionConfigFile >> "Params" >> _paramName >> "default") ];
            };
        };
        _c=count paramsArray;
        if (isNil "param1" && _c>0)then{param1=paramsArray select 0};
        if (isNil "param2" && _c>1)then{param2=paramsArray select 1};
    };
};

/*
 * Summary: Checks if a marker exists.
 * Arguments:
 *   _marker: Marker name of marker to test.
 * Returns: true if marker exists, else false.
 */
drn_fnc_CL_MarkerExists = {
	private ["_exists", "_marker"];

	_marker = _this select 0;

	_exists = false;
	if (((getMarkerPos _marker) select 0) != 0 || ((getMarkerPos _marker) select 1 != 0)) then {
		_exists = true;
	};
	_exists
};

/*
 * Summary: Gets a random marker that fulfulls specified name expression and is within a specified range from a reference position.
 * Remarks: Markers sought must have name format 'markerPreNameX', where X is an integer value. Marker number must start with
 * 1 and be an unbroken ascending sequence.
 * Arguments:
 *   _markerPreName: Marker name except the ending integer value.
 *   _position: Reference position.
 *   _minDistance: Marker's minimum distance from reference position.
 *   _maxDistance: Marker's maximum distance from reference position.
 * Returns: Name of found marker. Empty string ("") if no marker was found.
 */
drn_fnc_CL_GetMarkerWithinRange = {
	private ["_markerPreName", "_markerNo", "_markerName", "_minDistance", "_maxDistance", "_markersWithinRange", "_markersOutsideRange", "_position", "_returnValue"];

	_markerPreName = _this select 0;
	_position = _this select 1;
	_minDistance = _this select 2;
	_maxDistance = _this select 3;

	_markersWithinRange = [];
	_markersOutsideRange = [];
	_returnValue = "";

	_markerNo = 1;
	_markerName = _markerPreName + str _markerNo;

	while {[_markerName] call drn_fnc_CL_MarkerExists} do {
		if (_position distance (getMarkerPos _markerName) > _minDistance && _position distance (getMarkerPos _markerName) < _maxDistance) then {
			_markersWithinRange set [count _markersWithinRange, _markerName];
		}
		else {
			if (_position distance (getMarkerPos _markerName) > _minDistance) then {
				_markersOutsideRange set [count _markersOutsideRange, _markerName];
			};
		};

		_markerNo = _markerNo + 1;
		_markerName = _markerPreName + str _markerNo;		
	};

	if (count _markersWithinRange > 0) then {
		_returnValue = _markersWithinRange select floor (random count _markersWithinRange);
	}
	else {
		if (count _markersOutsideRange > 0) then {
			_returnValue = _markersOutsideRange select floor (random count _markersOutsideRange);
		};
	};

	_returnValue
};

/*
 * Summary: Gets the marker closest to a reference position.
 * Remarks: Markers sought must have name format 'markerPreNameX' or format 'markerPreNameX_Y', where X is an integer value
 * specifying a marker number and Y is an integer value specifying a sub marker. Marker number must start with 1 and be an unbroken
 * ascending sequence. The same applies for all submarker sequences.
 * Arguments:
 *   _position: Reference position.
 *   _markerPreName: Marker name except the ending integer value.
 *   [_isTwoDimensional]: true if the marker sequence has sub markers, else false.
 * Returns: Marker name of closest marker. Empty string ("") if no marker was found.
 */
drn_fnc_CL_GetClosestMarker = {
	private ["_position", "_markerPreName", "_isTwoDimensional", "_returnMarkerName"];
	private ["_closestDistance", "_markerNo", "_subMarkerNo", "_markerName", "_distance"];

	_position = _this select 0;
	_markerPreName = _this select 1;
	if (count _this > 2) then {_isTwoDimensional = _this select 2;} else {_isTwoDimensional = false};

	_markerNo = 1;
	_subMarkerNo = 1;
	_closestDistance = 1000000;
	_returnMarkerName = "";

	if (_isTwoDimensional) then {
		_markerName = _markerPreName + str _markerNo + "_" + str _subMarkerNo;
	}
	else {
		_markerName = _markerPreName + str _markerNo;
	};

	while {[_markerName] call drn_fnc_CL_MarkerExists} do {
		if (_isTwoDimensional) then {
			while {[_markerName] call drn_fnc_CL_MarkerExists} do {

				_distance = (GetMarkerPos _markerName) distance _position;
				if (_distance < _closestDistance) then {
					_closestDistance = _distance;
					_returnMarkerName = _markerName;
				};

				_subMarkerNo = _subMarkerNo + 1;
				_markerName = _markerPreName + str _markerNo + "_" + str _subMarkerNo;
			};

			// Get next marker
			_markerNo = _markerNo + 1;
			_subMarkerNo = 1;
			_markerName = _markerPreName + str _markerNo + "_" + str _subMarkerNo;
		}
		else {
			_distance = (GetMarkerPos _markerName) distance _position;
			if (_distance < _closestDistance) then {
				_closestDistance = _distance;
			};		
		};
	};

	_returnMarkerName
};

/*
 * Summary: Rotates a position around a center position.
 * Arguments:
 *   _centerPos: Center position to rotate around.
 *   _pos: Position that will be rotated.
 *   _dir: Direction (angle) to rotate.
 */
drn_fnc_CL_RotatePosition = {
    private ["_centerPos", "_pos", "_dir"];
    private ["_px", "_py", "_mpx", "_mpy", "_ma", "_rpx", "_rpy"];
    
    _centerPos = _this select 0;
    _pos = _this select 1;
    _dir = _this select 2;
    
    	_px = _pos select 0;
	_py = _pos select 1;
	_mpx = _centerPos select 0;
	_mpy = _centerPos select 1;
	_ma = _dir;

	//Now, rotate point
	_rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
	_rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
    
    [_rpx, _rpy, 0]
};

/*
 * Summary: Gets a random position inside a marker of shape RECTANGLE or ELLIPSE with any angle.
 * Arguments:
 *   _markerName: Name of marker to get a random position inside.
 * Returns: A position (array) inside current marker. If marker doesn't exist, [0, 0, 0] is returned.
 * History:
 *   Created in CommonLib v1.00.
 *   Updated in CommonLib v1.01 - Function now supports RECTANGLE and ELLIPSE at any angle, previously only RECTANGLEs with angle 0.
 */
drn_fnc_CL_GetRandomMarkerPos = {
    private ["_markerName"];
    private ["_isInside", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_ma", "_rpx", "_rpy", "_i"];
    
    _markerName = _this select 0;
    
    _isInside = false;
    _i = 0;
    while {!_isInside} do {
        _mpx = (getMarkerPos _markerName) select 0;
        _mpy = (getMarkerPos _markerName) select 1;
        _msx = (getMarkerSize _markerName) select 0;
        _msy = (getMarkerSize _markerName) select 1;
        _ma = (markerDir _markerName);
        
        _px = _mpx -_msx + random (_msx * 2);
        _py = _mpy -_msy + random (_msy * 2);
        
        //Now, rotate point as marker is rotated
        _rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
        _rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
        
        if ([[_rpx, _rpy, 0], _markerName] call drn_fnc_CL_PositionIsInsideMarker) then {
            _isInside = true;
        };

        _i = _i + 1;
        if (_i > 1000) exitWith {
            _rpx = 0;
            _rpy = 0;
        };
    };
    
    [_rpx, _rpy, 0]
};

/*
 * Summary: Checks if a position is inside a marker.
 * Remarks: Marker can be of shape "RECTANGLE" or "ELLIPSE" and at any angle.
 * Arguments:
 *   _markerName: Name of current marker.
 *   _pos: Position to test.
 * Returns: true if position is inside marker. Else false.
 * History:
 * Created in CommonLib v1.00
 * Updated in CommonLib v1.01 - Function now supports RECTANGLE and ELLIPSE at any angle, previously only RECTANGLEs with angle 0.
 */
drn_fnc_CL_PositionIsInsideMarker = {
    private ["_markerName", "_pos"];
	private ["_isInside", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_ma", "_xmin", "_xmax", "_ymin", "_ymax", "_rpx", "_rpy", "_res"];

	_pos = _this select 0;
	_markerName = _this select 1;

	_px = _pos select 0;
	_py = _pos select 1;
	_mpx = (getMarkerPos _markerName) select 0;
	_mpy = (getMarkerPos _markerName) select 1;
	_msx = (getMarkerSize _markerName) select 0;
	_msy = (getMarkerSize _markerName) select 1;
	_ma = -(markerDir _markerName);

	_xmin = _mpx - _msx;
	_xmax = _mpx + _msx;
	_ymin = _mpy - _msy;
	_ymax = _mpy + _msy;

	//Now, rotate point to investigate around markers center in order to check against a nonrotated marker
	_rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
	_rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;

	_isInside = false;

    if (markerShape _markerName == "RECTANGLE") then {
        if (((_rpx > _xmin) && (_rpx < _xmax)) && ((_rpy > _ymin) && (_rpy < _ymax))) then
        {
            _isInside = true;
        };
    };
    
    if (markerShape _markerName == "ELLIPSE") then {
        _res = (((_rpx-_mpx)^2)/(_msx^2)) + (((_rpy-_mpy)^2)/(_msy^2));
        if ( _res < 1 ) then
        {
            _isInside = true;
        };
    };

	_isInside
};

drn_CL_ShowCommandTextEventArgs = []; // [unit, text]

"drn_CL_ShowCommandTextEventArgs" addPublicVariableEventHandler {
	drn_CL_ShowCommandTextEventArgs call drn_fnc_CL_ShowCommandTextLocal;
};

/*
 * Summary: Shows a text as command text on the local client.
 * Arguments:
 *   _text: Text to show.
 */
drn_fnc_CL_ShowCommandTextLocal = {
    private ["_text"];
    _text = _this select 0;
    
    if (!isNull player) then {
        player globalChat _text;
    };
    
    diag_log ("Title text: " + _text);
};

/*
 * Summary: Shows a text as command text on all clients.
 * Arguments:
 *   _text: Text to show.
 */
drn_fnc_CL_ShowCommandTextAllClients = {
    private ["_text"];
    _text = _this select 0;
    
    drn_CL_ShowCommandTextEventArgs = [_text];
    publicVariable "drn_CL_ShowCommandTextEventArgs";
    drn_CL_ShowCommandTextEventArgs call drn_fnc_CL_ShowCommandTextLocal;
};

drn_CL_ShowTitleTextEventArgs = []; // [text]

"drn_CL_ShowTitleTextEventArgs" addPublicVariableEventHandler {
	drn_CL_ShowTitleTextEventArgs call drn_fnc_CL_ShowTitleTextLocal;
};

/*
 * Summary: Shows a text as a title text on the local client.
 * Arguments:
 *   _text: Text to show.
 *   [_showAsSubTitle]: Optional. true if the text are to be shown as a sub title. false if it's to be shown in the middle of the screen.
 */
drn_fnc_CL_ShowTitleTextLocal = {
    private ["_text", "_showAsSubTitle"];
    _text = _this select 0;
    if (count _this > 1) then {_showAsSubTitle = _this select 1;} else {_showAsSubTitle = false};
    
    if (!isNull player) then {
        if (_showAsSubTitle) then {
            titleText [_text, "PLAIN DOWN"];
        }
        else {
            titleText [_text, "PLAIN"];
        };
    };
    
    diag_log ("Title text: " + _text);
};

/*
 * Summary: Shows a text as a title text on all clients.
 * Arguments:
 *   _text: Text to show.
 *   [_showAsSubTitle]: Optional. true if the text are to be shown as a sub title. false if it's to be shown in the middle of the screen.
 */
drn_fnc_CL_ShowTitleTextAllClients = {
    private ["_text", "_showAsSubTitle"];
    _text = _this select 0;
    if (count _this > 1) then {_showAsSubTitle = _this select 1;} else {_showAsSubTitle = false};
    
    drn_CL_ShowTitleTextEventArgs = [_text, _showAsSubTitle];
    publicVariable "drn_CL_ShowTitleTextEventArgs";
    drn_CL_ShowTitleTextEventArgs call drn_fnc_CL_ShowTitleTextLocal;
};

drn_CL_AddScoreEventArgs = []; // [vehicleVarName, score]

"drn_CL_AddScoreEventArgs" addPublicVariableEventHandler {
    if (isServer) then {
        drn_CL_AddScoreEventArgs call drn_fnc_CL_AddScoreServer; 
    };
};

drn_fnc_CL_AddScoreServer = {
    drn_CL_AddScoreEventArgs call compile format ["%1 addScore %2;", drn_CL_AddScoreEventArgs select 0, drn_CL_AddScoreEventArgs select 1]; 
};

/*
 * Summary: Adds score to a player.
 * Arguments:
 *   _vehicleVarName: Vehicle variable name of unit to add score to.
 *   _score: The score to be added.
 */
drn_fnc_CL_AddScore = {
    private ["_unit", "_score"];
    private ["_vehicleVarName"];
    
    _unit = _this select 0;
    _score = _this select 1;    
    
    _vehicleVarName = vehicleVarName _unit;
    drn_CL_AddScoreEventArgs = [_vehicleVarName, _score];
    
    if (isServer) then {
        drn_CL_AddScoreEventArgs call drn_fnc_CL_AddScoreServer;
    }
    else {
        publicVariable "drn_CL_AddScoreEventArgs";
    };
};

/*
 * Summary: Adds units to garbage collector. Units added to garbage collector (dead or alive) are deleted when on "clean up distance" from reference group.
 * Arguments:
 *   _this: Array of units to add to garbage collector.
 */
drn_fnc_CL_AddUnitsToGarbageCollector = {
    private ["_units"];
    _units = _this;
    
    if (isNil "drn_var_CL_GarbageCollectorUnits") then {
        drn_var_CL_GarbageCollectorUnits = [];
    };
    
    drn_var_CL_GarbageCollectorUnits = drn_var_CL_GarbageCollectorUnits + _units;
};

/*
 * Summary: Starts the garbage collector. Garbage collector removes empty groups and units added by function drn_fnc_CL_AddUnitsToGarbageCollector every 10 seconds.
 * Remarks:
 *   This function must be spawned (not called).
 * Arguments:
 *   _referenceGroup: When distance is at least "clean up distance" to every unit in this group (preferrably player group), objects relevant to garbage collector will be garbage collected.
 *   [_cleanUpDistance]: Optional. Distance in meters at which objects will be garbage collected.
 *   [_debug]: Optional. true to enable debug mode, else false.
 */
drn_fnc_CL_RunGarbageCollector = {
    private ["_referenceGroup", "_cleanUpDistance", "_debug"];
    private ["_emptyGroups", "_groupsToDelete", "_unitsToDelete"];
    
    _referenceGroup = _this select 0;
    if (count _this > 1) then {_cleanUpDistance = _this select 1;} else {_cleanUpDistance = 750};
    if (count _this > 2) then { _debug = _this select 2; } else { _debug = false; };
    
    if (_debug) then {
        ["Garbage collector started."] call drn_fnc_CL_ShowDebugTextAllClients;
    };
    
    if (isNil "drn_var_CL_GarbageCollectorUnits") then {
        drn_var_CL_GarbageCollectorUnits = [];
    };
    
    _emptyGroups = [];
    
    while {true} do {
        
        // Find empty groups
        {
            if (count units _x <= 0) then {
                _emptyGroups set [count _emptyGroups, _x];
            };
        } foreach allGroups;        
        
        if (_debug) then {
            sleep 1;
        }
        else {
            sleep 10;
        };
        
        // Delete empty groups if they are still empty
        _groupsToDelete = [];
        {
            if (count units _x <= 0) then {
                _groupsToDelete set [count _groupsToDelete, _x];
            };
        } foreach _emptyGroups;
        
        _emptyGroups = _emptyGroups - _groupsToDelete;
        
        // Delete the groups
        {
            if (_debug) then {
                ["Group '" + str _x + "' garbage collected."] call drn_fnc_CL_ShowDebugTextAllClients;
            };
            
            deleteGroup _x;
        } foreach _groupsToDelete;
        
        // Delete units that are far away
        _unitsToDelete = [];
        {
            private ["_unit", "_farAway"];
            
            _unit = _x;
            _farAway = true;
            
            {
                if (_x distance _unit < _cleanUpDistance) then {
                    _farAway = false;
                };
            } foreach units _referenceGroup;
            
            if (_farAway) then {
                _unitsToDelete set [count _unitsToDelete, _unit];
            };
        } foreach drn_var_CL_GarbageCollectorUnits;
        
        drn_var_CL_GarbageCollectorUnits = drn_var_CL_GarbageCollectorUnits - _unitsToDelete;
        
        {
            private ["_group"];
            
            _group = group _x;
            
            if (_debug) then {
                ["Unit '" + str _x + "' garbage collected."] call drn_fnc_CL_ShowDebugTextAllClients;
            };
            deleteVehicle _x;
            
            if (str _group != "<NULL-group>") then {
                if (count units _group == 0) then {
                    if (_debug) then {
                        ["Group '" + str _group + "' garbage collected."] call drn_fnc_CL_ShowDebugTextAllClients;
                    };
                    
                    deleteGroup _group;
                };
            };
        } foreach _unitsToDelete;
    };
};

/******************************************************************************************/
// Debug stuff

drn_CL_DebugTextEventArgs = []; // Empty
drn_CL_DebugMarkerEventArgs = []; // [name, position, size, direction, shape ("RECTANGLE" or "ELLIPSE"), markerColor, markerText (optional)] or alternatively [name, position, type, markerColor (optional), markerText (optional)]
drn_CL_DeleteDebugMarkerEventArgs = [];  // [name]

"drn_CL_DebugTextEventArgs" addPublicVariableEventHandler {
    drn_CL_DebugTextEventArgs call drn_fnc_CL_ShowDebugTextLocal;
};

"drn_CL_DebugMarkerEventArgs" addPublicVariableEventHandler {
    drn_CL_DebugMarkerEventArgs call drn_fnc_CL_SetDebugMarkerLocal;
};

"drn_CL_DeleteDebugMarkerEventArgs" addPublicVariableEventHandler {
    drn_CL_DeleteDebugMarkerEventArgs call drn_fnc_CL_DeleteDebugMarkerLocal;
};

/*
 * Summary: Shows debug text on local client.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug text will only be written to RTF-file and not shown on screen.
 * Arguments:
 *   _text: Debug text.
 */
drn_fnc_CL_ShowDebugTextLocal = {
    private ["_minutes", "_seconds"];
    
    if (!isNull player) then {
        if (!drn_var_CL_SilentDebugMode) then {
            player sideChat (_this select 0);
        };
    };
    
    _minutes = floor (time / 60);
    _seconds = floor (time - (_minutes * 60));
    diag_log ((str _minutes + ":" + str _seconds) + " Debug: " + (_this select 0));
};

/*
 * Summary: Shows debug text on all clients.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug text will only be written to RTF-file and not shown on screen.
 * Arguments:
 *   _text: Debug text.
 */
drn_fnc_CL_ShowDebugTextAllClients = {
    drn_CL_DebugTextEventArgs = _this;
    publicVariable "drn_CL_DebugTextEventArgs";
    drn_CL_DebugTextEventArgs call drn_fnc_CL_ShowDebugTextLocal;
};

/*
 * Summary: Shows debug marker on local client.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug marker will not shown.
 * Arguments alternative #1 (Marker representing an area):
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _size: Marker's size on array format [x, y].
 *   _direction: Marker's direction.
 *   _shape: "RECTANGLE" or "ELLIPSE".
 *   _markerColor: Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]: Optional. Marker's text.
 * Arguments alternative #2 (Marker representing an icon).
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _type: Markers icon type (applies to icons in cfgIcons, like "Warning", "Dot" etc.).
 *   [_markerColor]: Optional. Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]. Optional. Marker's text.
 */
drn_fnc_CL_SetDebugMarkerLocal = {
    private ["_markerName", "_position", "_size", "_direction", "_type", "_shape", "_markerColor", "_markerText"];
    private ["_marker"];

    if (!isNull player) then {
        if (!drn_var_CL_SilentDebugMode) then {
            _markerName = _this select 0;
            _position = _this select 1;
            _markerColor = "Default";
            _markerText = "";
            
            if (count _this == 6) then {
                _size = _this select 2;
                _direction = _this select 3;
                _shape = _this select 4;
                _markerColor = _this select 5;
            };
            if (count _this == 7) then {
                _size = _this select 2;
                _direction = _this select 3;
                _shape = _this select 4;
                _markerColor = _this select 5;
                _markerText = _this select 6;
            };
            if (count _this == 3) then {
                _type = _this select 2;
                _shape = "ICON";
            };
            if (count _this == 4) then {
                _type = _this select 2;
                _shape = "ICON";
                _markerColor = _this select 3;
            };
            if (count _this == 5) then {
                _type = _this select 2;
                _shape = "ICON";
                _markerColor = _this select 3;
                _markerText = _this select 4;
            };
            
            // Delete old marker
            if ([_markerName] call drn_fnc_CL_MarkerExists) then {
                deleteMarkerLocal _markerName;
            };
            
            // Set new marker
            _marker = createMarkerLocal [_markerName, _position];
            _marker setMarkerShapeLocal _shape;
            _marker setMarkerColorLocal _markerColor;
            _marker setMarkerTextLocal _markerText;
            
            if (count _this == 6 || count _this == 7) then {
                _marker setMarkerSizeLocal _size;
                _marker setMarkerDirLocal _direction;
            };
            if (count _this == 3 || count _this == 4 || count _this == 5) then {
                _marker setMarkerTypeLocal _type;
            };
        };
    };
};

/*
 * Summary: Shows debug marker on all clients.
 * Remarks:
 *   if global variable "drn_var_CL_SilentDebugMode" is set to true, debug marker will not shown.
 * Arguments alternative #1 (Marker representing an area):
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _size: Marker's size on array format [x, y].
 *   _direction: Marker's direction.
 *   _shape: "RECTANGLE" or "ELLIPSE".
 *   _markerColor: Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]: Optional. Marker's text.
 * Arguments alternative #2 (Marker representing an icon).
 *   _markerName: Marker's name. (must be global unique).
 *   _position: Marker's position.
 *   _type: Markers icon type (applies to icons in cfgIcons, like "Warning", "Dot" etc.).
 *   [_markerColor]: Optional. Marker's color ("Default", "ColorRed", "ColorYellow" etc.).
 *   [_markerText]. Optional. Marker's text.
 */
drn_fnc_CL_SetDebugMarkerAllClients = {
    drn_CL_DebugMarkerEventArgs = _this;
    publicVariable "drn_CL_DebugMarkerEventArgs";
    drn_CL_DebugMarkerEventArgs call drn_fnc_CL_SetDebugMarkerLocal;
};

/*
 * Summary: Deletes a debug marker on local client.
 * Arguments:
 *   _markerName: Name of marker to delete.
 */
drn_fnc_CL_DeleteDebugMarkerLocal = {
    private ["_markerName"];
    _markerName = _this select 0;
    deleteMarkerLocal _markerName;
};

/*
 * Summary: Deletes a debug marker on all clients.
 * Arguments:
 *   _markerName: Name of marker to delete.
 */
drn_fnc_CL_DeleteDebugMarkerAllClients = {
    drn_CL_DeleteDebugMarkerEventArgs = _this;
    publicVariable "drn_CL_DeleteDebugMarkerEventArgs";
    drn_CL_DeleteDebugMarkerEventArgs call drn_fnc_CL_DeleteDebugMarkerLocal;
};

drn_var_CL_CommonLibVersion = 1.04;
drn_var_commonLibInitialized = true;

