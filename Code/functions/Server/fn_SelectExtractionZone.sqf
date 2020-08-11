//### The Range for extraction is hardcoded at the moment... should be changed to a param
//### mode 0: totally random
//### mode 1: try to pick a close extraction point
//### mode 2: try to pick a extraction far away 
params[["_hackPos",[0,0,0]],["_select",-1]];

private _mode = Param_ExtractionSelection;

private _findMarkers = {
	params["_name","_type"];
	private _array = [];
	{
		if(_name in _x && !("_1" in _x)) then {
			private _markerNo = parseNumber (_x select[count _name,count _x]);
			private _pos = getMarkerPos _x;
			private _clear = [_pos,250,"all"] call A3E_fnc_CheckCampDistance;
			_array pushback [_markerNo,_pos,_clear,false,"",_type];
			if(!A3E_Debug) then {_x setMarkerAlpha 0;};
		};
	} foreach allMapMarkers;
	_array;
};

//Fallback for old markers, will use heli extraction
if(isNil("A3E_OldExtractionPositions")) then {
	A3E_OldExtractionPositions = [];
	A3E_OldExtractionPositions = ["A3E_ExtractionPos","air"] call _findMarkers;
};
diag_log format["fn_SelectExtractionZone: Fallback Extraction markers: %1",A3E_OldExtractionPositions];
//New marker types
if(isNil("A3E_HeliExtractionPositions")) then {
	A3E_HeliExtractionPositions = [];
	A3E_HeliExtractionPositions = ["A3E_HeliExtractionPos","air"] call _findMarkers;
};
diag_log format["fn_SelectExtractionZone: Heli Extraction markers: %1",A3E_HeliExtractionPositions];
if(isNil("A3E_BoatExtractionPositions")) then {
	A3E_BoatExtractionPositions = [];
	A3E_BoatExtractionPositions = ["A3E_BoatExtractionPos","sea"] call _findMarkers;
};
diag_log format["fn_SelectExtractionZone: Boat Extraction markers: %1",A3E_BoatExtractionPositions];
if(isNil("A3E_CarExtractionPositions")) then {
	A3E_CarExtractionPositions = [];
	A3E_CarExtractionPositions = ["A3E_CarExtractionPos","land"] call _findMarkers;
};
diag_log format["fn_SelectExtractionZone: Car Extraction markers: %1",A3E_CarExtractionPositions];

if(isNil("A3E_ExtractionPositions")) then {
	A3E_ExtractionPositions = [];
};
if ("air" in a3e_arr_extractiontypes && (count A3E_HeliExtractionPositions > 0)) then {
	A3E_ExtractionPositions append A3E_HeliExtractionPositions;
	};
if ("land" in a3e_arr_extractiontypes && (count A3E_CarExtractionPositions > 0)) then {
	A3E_ExtractionPositions append A3E_CarExtractionPositions;
	};
if ("sea" in a3e_arr_extractiontypes && (count A3E_BoatExtractionPositions > 0)) then {
	A3E_ExtractionPositions append A3E_BoatExtractionPositions;
	};
if(isNil("a3e_arr_extractiontypes") || (count A3E_ExtractionPositions <6)) then {
	A3E_ExtractionPositions = A3E_OldExtractionPositions;
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
diag_log format["fn_SelectExtractionZone: Extraction marker number %1 selected, at position %2",_extraction select 0,_extraction select 1];

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

[(_extraction select 0),(_extraction select 5)] call A3E_fnc_CreateExtractionPoint;

missionNamespace setvariable ["A3E_Task_ComCenter_Complete",true,true];


[[West,"HQ"],"Glad you are still there! We prepared an evacuation point. You should have received the coordinates. Good luck!"] remoteExec ["sideChat",0,false];
