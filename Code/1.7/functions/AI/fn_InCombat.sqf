	private["_group","_in_combat","_knows_enemy"];
	_group = _this select 0;
	_in_combat = false;
	{
		_knows_enemy = _x call BIS_fnc_enemyDetected;
		if(_knows_enemy) exitwith {_in_combat = true;};
	} foreach (units _group);
	_in_combat;