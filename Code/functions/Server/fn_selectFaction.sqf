params[["_side","Enemy"],["_special",[],["",[]]],["_merge",false]];

private _sideArr = [];

switch (_side) do {
    case "Player": {
		_sideArr = +A3E_PlayerFaction;
	};
    case "Enemy": {
		_sideArr = +A3E_EnemyFactions;
	};
	case "Indep": {
		_sideArr = +A3E_IndepFactions;
	};
	case "Civilian": {
		_sideArr = +A3E_CivilianFactions;
	};
	case "Enemy+Indep": {
		_sideArr = +A3E_EnemyFactions;
		_sideArr append A3E_IndepFactions;		
	};
	case "All": {
		_sideArr = +A3E_EnemyFactions;
		_sideArr append A3E_IndepFactions;
		_sideArr append A3E_PlayerFaction;		
	};
	default {
		["Error",str _side +" is an unknown side"] call a3e_fnc_log;
	};
};

private _faction  = [];

if(count _sideArr == 0) exitwith {["Error",_side + " doesn't have any factions."] call a3e_fnc_log;_faction;};
if(_merge) then {
	private _resultKeys = [];
	private _resultValues = [];
	{
		private _subarr = _x;
		{
			private _index = _resultKeys find _x;
			if(_index == -1) then {
				_resultKeys append [_x];
				_resultValues append [(_subarr select 1) select _forEachIndex];
			} else {
				if(typename (_resultValues select _index) == "ARRAY") then {
					(_resultValues select _index) append ((_subarr select 1) select _forEachIndex);
				};
			};
		} foreach (_subarr select 0);
	} foreach _sideArr;
	_faction = [_resultKeys,_resultValues];
	
} else {
	if(typename _special == "ARRAY") then {
		if(count(_special) == 0) then {
			//No special stuff. Just select a random faction.
			_faction = selectRandom _sideArr;
		} else {
			//ToDo: Add positional faction selection here:
			//######
			//For now select a random faction
			_faction = selectRandom _sideArr;
		};
	} else {
		if(typename _special == "STRING") then {
			//We want to get a special faction. Look for it
			{
				if([_x,"FactionName"] call A3E_fnc_getAssocArrayEntry == _special) exitwith {_faction = _x;};
			} foreach _sideArr;
			if(count _faction == 0) then {
				//Something here went wrong
				["Error","Unable to find faction "+_special+" on side "+_side] call A3E_fnc_log;
			};
		};
	};
};
_faction;
