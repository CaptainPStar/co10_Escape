if (!isServer) exitWith {};

private ["_location", "_markerName", "_soldierObjects", "_spawned", "_damage", "_soldier", "_script"];

_location = _this select 0;


_markerName = _location select 0;
_soldierObjects = _location select 2;

if (A3E_Debug) then {
    player sideChat "Depopulating location (" + _markerName + ")";
};

{
    private ["_group", "_soldierObject", "_hasScript"];
	_soldierObject = _x;
    
	//_soldierType = _soldier select 0;
	//_skill = _soldier select 1;
	_spawned = _soldierObject select 2;
	_damage = _soldierObject select 3;
	_soldier = _soldierObject select 4;
	//_script = _soldierObject select 5;
    //_hasScript = _soldierObject select 6;

	if (_spawned) then {
		_damage = damage _soldier;
		if (!canStand _soldier) then {
			_damage = 1;
		};

        
        _group = group _soldier;
        deleteVehicle _soldier;
		
		_script = _group getvariable ["A3E_GroupPatrolScript",nil];
		if(!isNil("_script")) then {
			if (!(scriptDone _script)) then {
				terminate _script;
			};
		};
		
        deleteGroup _group;

        _soldierObject set [2, false];
        _soldierObject set [3, _damage];
        _soldierObject set [4, objNull];
        _soldierObject set [5, objNull];
        _soldierObject set [6, false];
    };

} foreach _soldierObjects;
