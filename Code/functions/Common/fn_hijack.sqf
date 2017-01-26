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


//check for number of extraction markers
_markerBaseName = "drn_Escape_ExtractionPos";
_arrayName = "drn_arr_ExtractionPosMarkerNumbers";
_markerStartNo = 1;

_markerNo = _markerStartNo;
_markerName = _markerBaseName + str _markerNo;

drn_arr_ExtractionPosMarkerNumbers = [];
	_j = 0;
	while {[_markerName] call drn_fnc_CL_MarkerExists} do {
	_arrayname pushback _markerNo;
	
	_markerNo = _markerNo + 1;
	_markerName = _markerBaseName + str _markerNo;
	_j = _j + 1;
};



	_flag = false;
	//If selection fails ten times, a random point is selected-
	
	if(_mode == 0) then {
		_extractionPointNo = (selectRandom drn_arr_ExtractionPosMarkerNumbers);
		a3e_var_Escape_ExtractionMarkerPos =  getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
	} else {
		_selectedPos = getMarkerPos ("drn_Escape_ExtractionPos1");
		_extractionPointNo = (selectRandom drn_arr_ExtractionPosMarkerNumbers);
		for[{_i = 1},{_i<=_markerNo},{_i = _i +1}] do {

			_pos = getMarkerPos ("drn_Escape_ExtractionPos" + str (selectRandom drn_arr_ExtractionPosMarkerNumbers));
			
			if((getpos _generatorTrailer distance _pos)<(A3E_MinComCenterDistance*3) AND (_mode == 1)) then {
				_selectedPos = _pos;
				_extractionPointNo = _i;
			};
			if((getpos _generatorTrailer distance _pos)>(A3E_MinComCenterDistance*3) AND (_mode == 2)) then {
				_selectedPos = _pos;
				_extractionPointNo = _i;
			};
		};
		a3e_var_Escape_ExtractionMarkerPos = getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
	};
    publicVariable "a3e_var_Escape_ExtractionMarkerPos";
    _generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
    if (!isNil "a3e_var_Escape_ExtractionMarker") then {
		a3e_var_Escape_ExtractionMarker setMarkerType "Empty";
    };
	if (isNil "a3e_var_Escape_ExtractionMarkerNo") then {
        a3e_var_Escape_ExtractionMarkerNo = 0;
    } else {
		a3e_var_Escape_ExtractionMarkerNo = a3e_var_Escape_ExtractionMarkerNo + 1;
	};
	
    a3e_var_Escape_ExtractionMarker = createMarker [format["drn_visibleGoalMarker%1",a3e_var_Escape_ExtractionMarkerNo], a3e_var_Escape_ExtractionMarkerPos];
    a3e_var_Escape_ExtractionMarker setMarkerType "hd_pickup";
	a3e_var_Escape_ExtractionMarker setMarkerColor "ColorGreen";
	a3e_var_Escape_ExtractionMarker setMarkerText "Evac";
    [_extractionPointNo] remoteExec ["A3E_fnc_CreateExtractionPoint",2,false];
    
	A3E_Task_ComCenter_Complete = true;
	publicvariable "A3E_Task_ComCenter_Complete";
	
   [[West,"HQ"],"Glad you are still there! We prepared an evacuation point. You should have received the coordinates. Good luck!"] remoteExec ["sideChat",0,false];
    
   // _generatorTrailer removeAction _id;
};
