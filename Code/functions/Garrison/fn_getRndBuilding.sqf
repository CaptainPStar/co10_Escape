params["_pos",["_radius",100]];

private _Building = objNull;
private _near = _pos nearObjects ["Building", _radius];
if(count(_near)>0) then {
	_Building = selectRandom _near;
};
_Building;