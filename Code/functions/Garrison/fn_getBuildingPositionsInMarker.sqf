params["_pos",["_radius",70.5]];
private _near = _pos nearObjects ["Building", _radius];
private _positions  = [];
private _positionsIndoor = [];
{
		private _hpos = [_x] call A3E_fnc_getHousePositions;
		{
			if(((_x select 0) select 0)<((_pos select 0)+50) &&
				((_x select 0) select 0)>((_pos select 0)-50) &&
				((_x select 0) select 1)<((_pos select 1)+50) &&
				((_x select 0) select 1)>((_pos select 1)-50)) then {
				if(_x select 1) then {
					_positionsIndoor pushBack (_x select 0);
				};
				_positions pushBack (_x select 0);
			};
		} foreach _hpos;
	
} foreach _near;
private _return = [_positions,_positionsIndoor];
_return;