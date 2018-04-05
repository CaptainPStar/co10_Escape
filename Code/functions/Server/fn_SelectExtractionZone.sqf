//### The Range for extraction is hardcoded at the moment... should be changed to a param
//### mode 0: totally random
//### mode 1: try to pick a close extraction point
//### mode 2: try to pick a extraction far away 
params[["_hackPos",[0,0,0]],["_select",-1]];

private _mode = Param_ExtractionSelection;



if(isNil("A3E_ExtractionPositions")) then {
	//check for number of extraction markers and sort them
	_markerBaseName = "A3E_ExtractionPos";
	A3E_ExtractionPositions = [];

	private _markerNo = 1;
	private _markerName = _markerBaseName + str _markerNo;
	private _j = 0;
	while {markerType _markerName != ""} do {
		//sorting
		private _pos = getMarkerPos _markerName;
		private _clear = [_pos,250,"all"] call A3E_fnc_CheckCampDistance;
		A3E_ExtractionPositions pushback [_markerNo,_pos,_clear,false,""];
		_markerNo = _markerNo + 1;
		_markerName = _markerBaseName + str _markerNo;
		_j = _j + 1;
	};
};

private _extractions = A3E_ExtractionPositions select {(_x select 2) && ! (_x select 3)};
if(count _extractions == 0) then {
	_extractions = A3E_ExtractionPositions;
};
private _extraction = [];
if(_select > 0) then {
	_extraction = selectRandom A3E_ExtractionPositions;
	{
		if(_x select 0 == _select) exitwith {_extraction = _x;};
	} foreach A3E_ExtractionPositions;
} else {
	if(_mode == 0) then {
		_extraction = selectRandom _extractions;
	} else {
		if(_mode == 1) then {
			if(({((_x select 1) distance _hackPos) < (A3E_MinComCenterDistance*2)} count _extractions) > 0) then {
				_extraction = selectRandom (_extractions select {((_x select 1) distance _hackPos) < (A3E_MinComCenterDistance*2)});
			} else {
				_extraction = selectRandom _extractions;
			};
		} else {
			
			if(_mode == 2) then {
				if(({((_x select 1) distance _hackPos) > (A3E_MinComCenterDistance*2)} count _extractions) > 0) then {
					_extraction = selectRandom (_extractions select {((_x select 1) distance _hackPos) > (A3E_MinComCenterDistance*2)});
				} else {
					_extraction = selectRandom _extractions;
				};
			};
			
		};
	};
};
_extraction set [3,true]; //Set zone as used
missionNamespace setvariable ["a3e_var_Escape_ExtractionMarkerPos",_extraction select 1,true];
diag_log format["fn_hijack: Extraction marker number %1 selected, at position %2",_extraction select 0,_extraction select 1];

if(_extraction select 4 == "") then {
	private _extractGoalMarker = createMarker [format["a3e_extractionGoalMarker%1",_extraction select 0], _extraction select 1];
	_extractGoalMarker setMarkerType "hd_pickup";
	_extractGoalMarker setMarkerColor "ColorGreen";
	_extractGoalMarker setMarkerText "Evac";
	_extraction set [4,_extractGoalMarker];
} else {
	(_extraction select 4) setMarkerType "hd_pickup";
	(_extraction select 4) setMarkerColor "ColorGreen";
	(_extraction select 4) setMarkerText "Evac";
};

[(_extraction select 0)] call A3E_fnc_CreateExtractionPoint;

missionNamespace setvariable ["A3E_Task_ComCenter_Complete",true,true];


[[West,"HQ"],"Glad you are still there! We prepared an evacuation point. You should have received the coordinates. Good luck!"] remoteExec ["sideChat",0,false];
