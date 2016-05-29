if (!isServer) exitWith {};

private ["_village", "_markerName", "_soldiers", "_soldier", "_spawned", "_damage", "_soldierObj"];
private ["_groups", "_soldierPos", "_group", "_hasScript", "_boats"];
private ["_deleteGroupDelayed","_flag"];

_village = _this select 0;


_markerName = _village select 0;
_groups = _village select 2;
_boats = _village select 3;

if (A3E_Debug) then {
    player sideChat "Depopulating aquatic Patrol (" + _markerName + ")";
};

_deleteBoatDelayed = {
    private ["_boat","_group"];
    _boat = _this select 0;
	_flag = true;
	_group = (group ((crew _boat) select 0));
	if(count(units _group)==0) then {_flag = false;};
    {
        if(isplayer _x) then {_flag = false;};
    } foreach crew _boat;
	
	if(_flag) then {		
		_script = _group getvariable ["A3E_GroupPatrolScript",nil];
		if(!isNil("_script")) then {
			if (!(scriptDone _script)) then {
				terminate _script;
			};
		};
		{
			deleteVehicle _x;
		} foreach crew _boat;
		
		deleteGroup _group;
		deleteVehicle _boat;
	};
};

{
	_boat = _x;
	    
    (_boat) spawn _deleteBoatDelayed;
    sleep 0.5;
} foreach _boats;



