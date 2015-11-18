private ["_generatorTrailer", "_unit", "_id","_isUnconscious"];
private ["_marker", "_extractionPointNo", "_count", "_text","_engineer"];

_generatorTrailer = _this select 0;
_unit = _this select 1;
_id = _this select 2;
_generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
_count = 30;
_engineer = [(configFile >> "CfgVehicles" >> typeof _unit),"engineer",0] call BIS_fnc_returnConfigEntry;
if (_engineer == 1) then {
	_count = 10;
};


while {(_count > 0) && (_unit distance _generatorTrailer < 3) && !(_unit getVariable ["AT_Revive_isUnconscious",false])} do
{
	_text = "Hacking " + str _count;

	cutText [_text, "Plain", 1];
	sleep 1;

	_count = _count - 1;
};


_isUnconscious = _unit getVariable ["AT_Revive_isUnconscious",false];
if (_count > 0 && _isUnconscious) exitWith {
    cutText ["Hacking aborted!", "Plain", 1];
	_generatorTrailer setvariable ["A3E_Terminal_Hacked",false,true];
};

if (_count > 0 && _unit distance _generatorTrailer > 3) exitWith {
    cutText ["You must get closer!", "Plain", 1];
	_generatorTrailer setvariable ["A3E_Terminal_Hacked",false,true];
};

cutText ["", "Plain", 1];


//### The Range for extraction is hardcoded at the moment... should be changed to a param
//### mode 0: totally random
//### mode 1: try to pick a close extraction point
//### mode 2: try to pick a extraction far away 
_mode = Param_ExtractionSelection;


if (_count == 0) then {

	_flag = false;
	//If selection fails ten times, a random point is selected-
	
	if(_mode == 0) then {
		_extractionPointNo = floor(random 8) + 1;
		a3e_var_Escape_ExtractionMarkerPos =  getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
	} else {
		_selectedPos = getMarkerPos ("drn_Escape_ExtractionPos1");
		_extractionPointNo = 1;
		for[{_i = 1},{_i<=8},{_i = _i +1}] do {

			_pos = getMarkerPos ("drn_Escape_ExtractionPos" + str _i);
			
			if((getpos _generatorTrailer distance _pos)<(getpos _generatorTrailer distance _selectedPos) AND (_mode == 1)) then {
				_selectedPos = _pos;
				_extractionPointNo = _i;
			};
			if((getpos _generatorTrailer distance _pos)>(getpos _generatorTrailer distance _selectedPos) AND (_mode == 2)) then {
				_selectedPos = _pos;
				_extractionPointNo = _i;
			};
		};
		a3e_var_Escape_ExtractionMarkerPos = getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
	};
    publicVariable "a3e_var_Escape_ExtractionMarkerPos";
    _generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
    if (!isNil "a3e_var_Escape_ExtractionMarker") then {
        deleteMarker a3e_var_Escape_ExtractionMarker;
    };
    a3e_var_Escape_ExtractionMarker = createMarker ["drn_visibleGoalMarker", a3e_var_Escape_ExtractionMarkerPos];
    a3e_var_Escape_ExtractionMarker setMarkerType "Flag_NATO";
	
    [_extractionPointNo] remoteExec ["A3E_fnc_CreateExtractionPoint",2,false];
    
	A3E_Task_ComCenter_Complete = true;
	publicvariable "A3E_Task_ComCenter_Complete";
	
    ["Task complete: Hack Communication Center (Rendezvous point marked on map)"] call drn_fnc_CL_ShowTitleTextAllClients;
    
   // _generatorTrailer removeAction _id;
};
