params["_position","_size","_side",["_type","Default"]];


private _index = [[_position,0,"ELLIPSE",[_size,_size]],"A3E_FNC_populateLocationZone",_type] call A3E_fnc_initZone;
(A3E_Zones select _index) set ["side",_side];
_index;
