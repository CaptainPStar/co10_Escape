private["_mrk","_list","_pos","_shape","_rotation","_size","_radius"];
_mrk = [_this, 0, "NoName", [""]] call BIS_fnc_param;

_pos = getmarkerpos _mrk;
_shape = markerShape _mrk;
_rotation = markerDir _mrk;
_size = getmarkersize _mrk;
_radius = 0;
if(_shape == "ELLIPSE") then {
    if((_size select 0)>(_size select 1)) then {
        _radius = (_size select 0);
    } else {
        _radius = (_size select 1);
    };
} else {
     if((_size select 0)>(_size select 1)) then {
        _radius = (_size select 0)*sqrt(2);
    } else {
        _radius = (_size select 1)*sqrt(2);
    };
};

//Maybe adding a check if the building is in the trigger (bis_fnc_inTrigger)

private _buildings = nearestObjects [_pos, ["House", "Building"], _radius, true];
private _list = [];
{
	private _positions = (_x buildingPos -1);
	if(count(_positions)> 0) then {
		_list append _positions;
	};
} foreach _buildings;

_list;