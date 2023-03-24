params["_Building",["_isIndoor",false]];

private _fnc_isIndoor = {
	private["_pos","_intersects","_indoors","_insersectObj"];

	_pos = _this select 0;
	_pos = ATLtoASL _pos;
	_intersects = true;
	_insersectObj = lineintersectsobjs [[_pos select 0,_pos select 1,(_pos select 2)+0.1],[_pos select 0,_pos select 1,(_pos select 2)+4],objnull,objnull,false,20];
	if(count(_insersectObj)==0) then {
		_intersects = false;
	};

	_intersects;
};

if(isNil("A3I_BuildingPositions")) then {
	A3E_Buildings = [];
	A3E_BuildingPositions = [];
	A3E_BuildingPositionsIndoor = [];
};
private _BuildingIndex = A3E_Buildings find (_Building);

private _positionsIndoor = [];
private _positions = [];
if(_BuildingIndex<0) then {
	private _hasIndoor = false;
	private _hpos = _Building buildingPos -1;
	{
		private _indoor = [_x] call _fnc_isIndoor;
		_positions pushBack [_x,_indoor];
		if(_indoor) then {
			_positionsIndoor pushBack [_x,true];
		};
	} foreach _hpos;
	A3E_Buildings pushBack _Building;
	A3E_BuildingPositions pushBack _positions;
	A3E_BuildingPositionsIndoor pushBack _positionsIndoor;
} else {
	_positions = A3E_BuildingPositions select _BuildingIndex;
	_positionsIndoor = A3E_BuildingPositionsIndoor select _BuildingIndex;
};
if(_isIndoor) then {
	_positions = _positionsIndoor;
};
_positions;