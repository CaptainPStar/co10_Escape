private ["_isUnconscious","_generatorTrailer"];
private ["_marker", "_extractionPointNo", "_count", "_text","_engineer"];
params["_target","_unit","_id"];
_generatorTrailer = cursorTarget;
//BIS_fnc_DataTerminalAnimate
if((_generatorTrailer getvariable ["A3E_Terminal_Hacked",false])) exitwith {systemchat "Terminal already used!";};

_generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
[_generatorTrailer,"red","red","red"] spawn BIS_fnc_DataTerminalColor;
_count = 36;
_engineer = [(configFile >> "CfgVehicles" >> typeof _unit),"engineer",0] call BIS_fnc_returnConfigEntry;
if (_engineer == 1) then {
	_count = 12;
};


_stateSteps = floor(_count/3);
_state1 = _count-(_stateSteps)*0;
_state2 = _count-(_stateSteps)*1;
_state3 = _count-(_stateSteps)*2;
while {(_count > 0) && (_unit distance _generatorTrailer < 3) && !(_unit getVariable ["AT_Revive_isUnconscious",false])} do
{
	_text = "Hacking " + str _count;
	if(_count==_state1) then {
		[_generatorTrailer,1] spawn BIS_fnc_DataTerminalAnimate;
	};
	if(_count==_state2) then {
		[_generatorTrailer,2] spawn BIS_fnc_DataTerminalAnimate;
	};
	if(_count==_state3) then {
		[_generatorTrailer,3] spawn BIS_fnc_DataTerminalAnimate;
	};
	cutText [_text, "Plain", 1];
	sleep 1;

	_count = _count - 1;
};

[_generatorTrailer,0] spawn BIS_fnc_DataTerminalAnimate;
_isUnconscious = _unit getVariable ["AT_Revive_isUnconscious",false];
if (_count > 0 && _isUnconscious) exitWith {
    cutText ["Hacking aborted!", "Plain", 1];
	_generatorTrailer setvariable ["A3E_Terminal_Hacked",false,true];
	[_generatorTrailer,"green","green","green"] spawn BIS_fnc_DataTerminalColor;
};

if (_count > 0 && _unit distance _generatorTrailer > 3) exitWith {
    cutText ["You must get closer!", "Plain", 1];
	_generatorTrailer setvariable ["A3E_Terminal_Hacked",false,true];
	[_generatorTrailer,"green","green","green"] spawn BIS_fnc_DataTerminalColor;
};

cutText ["", "Plain", 1];


//### The Range for extraction is hardcoded at the moment... should be changed to a param
//### mode 0: totally random
//### mode 1: try to pick a close extraction point
//### mode 2: try to pick a extraction far away 
_mode = Param_ExtractionSelection;


if (_count == 0) then {


//check for number of extraction markers and sort them
_markerBaseName = "drn_Escape_ExtractionPos";
drn_arr_ExtractionPosMarkerNumbers = [];
drn_arr_ExtractionPosMarkerNumbersClose = [];
drn_arr_ExtractionPosMarkerNumbersFar = [];

_markerNo = 1;
_markerName = _markerBaseName + str _markerNo;

	_j = 0;
	while {[_markerName] call drn_fnc_CL_MarkerExists} do {
	drn_arr_ExtractionPosMarkerNumbers pushback _markerNo;
	
	//sorting
	_pos = getMarkerPos ("drn_Escape_ExtractionPos" + str _markerNo);
	if((getpos _generatorTrailer distance _pos)<(A3E_MinComCenterDistance*2)) then {
				drn_arr_ExtractionPosMarkerNumbersClose pushback _markerNo;
			};
	if((getpos _generatorTrailer distance _pos)>(A3E_MinComCenterDistance*2)) then {
				drn_arr_ExtractionPosMarkerNumbersFar pushback _markerNo;
			};
	
	_markerNo = _markerNo + 1;
	_markerName = _markerBaseName + str _markerNo;
	_j = _j + 1;
};
//_numberOfMarkers = (count drn_arr_ExtractionPosMarkerNumbers);

	if(_mode == 0) then {
		_extractionPointNo = (selectRandom drn_arr_ExtractionPosMarkerNumbers);
		a3e_var_Escape_ExtractionMarkerPos =  getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
		diag_log format["fn_hijack: Extraction marker number %1 selected, at position %2",_extractionPointNo,a3e_var_Escape_ExtractionMarkerPos];
	} else {
		
	if(_mode == 1) then {
		if ((count drn_arr_ExtractionPosMarkerNumbersClose)>0) then {
		_extractionPointNo = (selectRandom drn_arr_ExtractionPosMarkerNumbersClose);
		} else {
			_extractionPointNo = (selectRandom drn_arr_ExtractionPosMarkerNumbers);
			diag_log format["fn_hijack: no close Extraction marker available, using all markers"];
		};
		a3e_var_Escape_ExtractionMarkerPos =  getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
		diag_log format["fn_hijack: Extraction marker number %1 selected, at position %2",_extractionPointNo,a3e_var_Escape_ExtractionMarkerPos];
	} else {
		
		if(_mode == 2) then {
			if ((count drn_arr_ExtractionPosMarkerNumbersFar)>0) then {
			_extractionPointNo = (selectRandom drn_arr_ExtractionPosMarkerNumbersFar);
			} else {
				_extractionPointNo = (selectRandom drn_arr_ExtractionPosMarkerNumbers);
				diag_log format["fn_hijack: no far Extraction marker available, using all markers"];
			};
			a3e_var_Escape_ExtractionMarkerPos =  getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
			diag_log format["fn_hijack: Extraction marker number %1 selected, at position %2",_extractionPointNo,a3e_var_Escape_ExtractionMarkerPos];
		};
		
		};
	};
    publicVariable "a3e_var_Escape_ExtractionMarkerPos";
    _generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
	//make old marker invisible if hacking again
    if (!isNil "a3e_var_Escape_ExtractionMarker") then {
		a3e_var_Escape_ExtractionMarker setMarkerType "Empty";
    };
	
    a3e_var_Escape_ExtractionMarker = createMarker [format["drn_visibleGoalMarker%1",_extractionPointNo], a3e_var_Escape_ExtractionMarkerPos];
    a3e_var_Escape_ExtractionMarker setMarkerType "hd_pickup";
	a3e_var_Escape_ExtractionMarker setMarkerColor "ColorGreen";
	a3e_var_Escape_ExtractionMarker setMarkerText "Evac";
	diag_log format["fn_hijack: Extraction marker created %1",a3e_var_Escape_ExtractionMarker];
    [_extractionPointNo] remoteExec ["A3E_fnc_CreateExtractionPoint",2,false];
    
	A3E_Task_ComCenter_Complete = true;
	publicvariable "A3E_Task_ComCenter_Complete";
	
   [[West,"HQ"],"Glad you are still there! We prepared an evacuation point. You should have received the coordinates. Good luck!"] remoteExec ["sideChat",0,false];
    
   // _generatorTrailer removeAction _id;
};
