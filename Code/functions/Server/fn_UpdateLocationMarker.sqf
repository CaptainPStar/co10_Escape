params["_markername",["_reveal",false]]; //This will update the marker. if reveal is true, the question mark is skipped

private _poi = (missionnamespace getvariable ["A3E_POIs",[]] select {_x # 0 == _markername});
if(count(_poi)==0) exitwith {diag_log "Escape warning: Unknown marker "+_markername;};
_poi = _poi # 0;

_poi params ["_marker","_markerType","_color","_markerPosition","_hidden","_unknown","_accuracy"];
private _what = "unknown";

if(_hidden && !_reveal) then {
	_poi set [4, false];
	_marker setMarkerType "hd_unknown";
	_what = "hd_unknown";
	_marker setMarkerAlpha 1;
	_marker setMarkerColor "ColorRed";
	_marker setmarkerPos (_markerPosition vectorAdd [random 250 - 125,random 250 - 125]);
};
if(!_hidden && _unknown || _reveal) then {
	_poi set [4, false];
	_poi set [5, false];
	_marker setmarkerPos (_markerPosition);
	_marker setMarkerType _markerType;
	if(_markerType == "o_hq") then {
		//Update the task to find a comcenter marker
		missionNamespace setvariable ["A3E_Task_LocateComcenter_Complete",true,true];
	};
	_what = _markerType;
	_marker setMarkerColor _color;
	_marker setMarkerAlpha 1;
	
} else {
	diag_log "Escape warning: Marker "+_markername+" was tried to be revealed, but it seems already known";
};
_what;