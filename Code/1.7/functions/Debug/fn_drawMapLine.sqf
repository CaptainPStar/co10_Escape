private["_startpos","_endpos","_marker","_width","_length","_distanceY","_distanceX","_markername","_rotation"];
_startpos = [_this,0,[0,0],[[]]] call bis_fnc_param;
_endpos = [_this,1,[0,0],[[]]] call bis_fnc_param;
_marker = [_this,2,"noMarker",[""]] call bis_fnc_param;

_width = 4;
_length = [_startpos select 0,_startpos select 1] distance [_endpos select 0,_endpos select 1];
_distanceX = (_startpos select 0) - (_endpos select 0);
_distanceY = (_startpos select 1) - (_endpos select 1);
if(_length==0) then {_length = 1};
_rotation = [_startpos,_endpos] call bis_fnc_DirTo;
	if(_marker=="noMarker") then {
		if(isNil("a3e_var_LineMarkerNo")) then {
			a3e_var_LineMarkerNo = 0;
		} else {
			a3e_var_LineMarkerNo = a3e_var_LineMarkerNo +1;
		};
		_markername = format["LineMarker%1",a3e_var_LineMarkerNo];
		_marker = createMarker [_markername,_startpos];
	};
	_marker setMarkerShape "RECTANGLE";
	_marker setMarkerColor "ColorYellow";
	_marker setMarkerSize [_width,_length/2];
	_marker setMarkerDir _rotation;
	_marker setmarkerpos [(_startpos select 0)-_distanceX/2,(_startpos select 1)-_distanceY/2];
	_marker;