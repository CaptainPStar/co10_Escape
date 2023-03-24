params["_pos",["_radius",50],["_isIndoor",false]];
private _near = nearestObjects [_pos, ["House", "Building"], _radius];
_near = _near call BIS_fnc_arrayShuffle;

private _positions = [];

private _Building = objNull;

{
	_positions = [_x,_isIndoor] call A3E_fnc_getBuildingPositions;
	if(count(_positions) > 0) exitwith {_Building = _x;};
} foreach _near;
_return = [];
if(count(_positions)>0) then {
	_return = [_Building,_positions];
};
_return;