private ["_generatorTrailer", "_unit", "_id"];
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


while {(_count > 0) && (_unit distance _generatorTrailer < 3)} do
{
	_text = "HIJACKING " + str _count;

	cutText [_text, "Plain", 1];
	sleep 1;

	_count = _count - 1;
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
		drn_var_Escape_ExtractionMarkerPos =  getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
	} else {
		_selectedPos = getMarkerPos ("drn_Escape_ExtractionPos1");
		_extractionPointNo = 1;
		for[{_i = 1},{_i<=8},{_i = _i +1}] do {
			_extractionPointNo = _i;
			_pos = getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
			
			if((getpos _generatorTrailer distance _pos)<(getpos _generatorTrailer distance _selectedPos) AND (_mode == 1)) then {
				_selectedPos = _pos;
				_extractionPointNo = _forEachIndex;
			};
			if((getpos _generatorTrailer distance _pos)>(getpos _generatorTrailer distance _selectedPos) AND (_mode == 2)) then {
				_selectedPos = _pos;
				_extractionPointNo = _forEachIndex;
			};
		};
		drn_var_Escape_ExtractionMarkerPos = getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
	};
    publicVariable "drn_var_Escape_ExtractionMarkerPos";
    _generatorTrailer setvariable ["A3E_Terminal_Hacked",true,true];
    if (!isNil "drn_var_Escape_ExtractionMarker") then {
        deleteMarker drn_var_Escape_ExtractionMarker;
    };
    drn_var_Escape_ExtractionMarker = createMarker ["drn_visibleGoalMarker", drn_var_Escape_ExtractionMarkerPos];
    drn_var_Escape_ExtractionMarker setMarkerType "Flag_NATO";
    
    [_extractionPointNo] call drn_fnc_Escape_CreateExtractionPointServer;
    
    ["drn_hijackTasks", "SUCCEEDED"] call drn_SetTaskStateOnAllMachines;
    ["Task complete: Hijack Communication Center (Rendezvous point marked on map)"] call drn_fnc_CL_ShowTitleTextAllClients;
    
    _generatorTrailer removeAction _id;
};
