if (!isServer) exitWith {};

private ["_village", "_markerName", "_debug", "_soldiers", "_soldier", "_skill", "_soldierType", "_spawned", "_damage", "_soldierObj"];
private ["_villagePos", "_script", "_groups", "_newGroup", "_soldierPos", "_rank", "_villageSide"];

_village = _this select 0;
if (count _this > 1) then {_debug = _this select 1;} else {_debug = false;};

_markerName = _village select 0;
_villagePos = _village select 1;
_groups = _village select 2;
_villageSide = _village select 3;

if (_debug) then {
    player sideChat "Populating village (" + _markerName + " No of groups: " + str count _groups + ")";
};

if (count _groups == 0) exitWith {};

{
	_soldiers = _x select 0;
	_side = _x select 1;
	_newGroup = createGroup _side;

	{
		_soldier = _x;

		//_soldier = [_soldierType, _damage, _spawned, _soldierObj, _script, _soldierPos, _skill, _ammo, _rank, _hasScript];

		_soldierType = _soldier select 0;
		_damage = _soldier select 1;
		_spawned = _soldier select 2;
		_soldierPos = _soldier select 5;
		_skill = _soldier select 6;
		//_ammo = _soldier select 7;	
		_rank = _soldier select 8;

		if ((!_spawned) && _damage < 0.75) then {
			_markerName setMarkerPos _villagePos;

		 	_soldierObj = _newGroup createUnit [_soldierType, _soldierPos, [], 0, "FORM"];
			//_soldierObj setSkill _skill;
//			[_soldierObj, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;
			_soldierObj setDamage _damage;
			//_soldierObj setVehicleAmmo _ammo;
			_soldierObj setUnitRank _rank;

			_soldier set [2, true];
			_soldier set [3, _soldierObj];
			
			if (_rank == "SERGEANT") then {
				_script = [_newGroup, _markerName] spawn A3E_fnc_Patrol;
				_newGroup setvariable["A3E_GroupPatrolScript",_script];

			};
		};
	} foreach _soldiers;
    
    //sleep 0.25;
    _newGroup spawn drn_fnc_VillagePatrols_OnSpawnGroup;

	sleep 1;
} foreach _groups;


