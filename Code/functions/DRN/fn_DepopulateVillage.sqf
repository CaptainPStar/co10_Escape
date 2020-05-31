private ["_village", "_markerName", "_soldiers", "_soldier", "_spawned", "_damage", "_soldierObj"];
private ["_groups", "_soldierPos", "_group", "_hasScript"];
private ["_deleteGroupDelayed"];

_village = _this select 0;


_markerName = _village select 0;
_groups = _village select 2;

if (A3E_Debug) then {
    player sideChat "Depopulating village (" + _markerName + ")";
};

_deleteGroupDelayed = {
    private ["_group"];
    
    _group = _this select 0;

/*
    {
        _x setPos [-1000, -1000, 0];
    } foreach units _group;
    
    sleep 15;
*/
    
    {
        deleteVehicle _x;
    } foreach units _group;
	_script = _group getvariable ["A3E_GroupPatrolScript",nil];
	if(!isNil("_script")) then {
		if (!(scriptDone _script)) then {
			terminate _script;
		};
	};
    deleteGroup _group;
};

{
	_soldiers = _x select 0;

	_soldier = _soldiers select 0;
	_soldierObj = _soldier select 3;
	_group = group _soldierObj;
	_soldierObj = leader _group;
	//_script = _soldierObj getVariable "activeScript";
	//_script = _soldier select 4;
	//_hasScript = _soldier select 9;


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
	} foreach _soldiers;

	//_group setVariable ["UPSMON_exit", true];
	//deleteGroup _group;
    
    [_group] spawn _deleteGroupDelayed;
    sleep 0.5;
} foreach _groups;



