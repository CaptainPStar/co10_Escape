params["_pos",["_radius",50],["_isIndoor",false]];

private _Building = [_pos,_radius,_isIndoor] call A3E_fnc_getRndBuildingWithPositions; 
private _random = [];
if(count(_Building) != 0) then {
	_random = selectRandom(_Building select 1) select 0;
};
_random;