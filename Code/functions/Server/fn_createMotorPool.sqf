if(!isserver) exitwith {};

private ["_mpPosition", "_createMPcount", "_newPosition", "_mapsize", "_mpc"];

_mpPosition = [];
_createMPcount = 0;

private _mapsize = (getPos NorthEast) distance (getPos SouthWest);
if (_mapsize < 5000) then 
	{
		_mpc = 0;
	}
	else
	{
		if (_mapsize < 10000) then
		{
			_mpc = 1;
		}
		else
		{
			if (_mapsize < 15000) then
			{
				_mpc = 2;
			}
			else
			{
				if (_mapsize < 20000) then
				{
					_mpc = 3;
				}
				else
				{
					if (_mapsize < 25000) then
					{
						_mpc = 4;
					}
					else
					{
						_mpc = 5;
					};
				};
			};
		};
	};

if(isNil("A3E_MotorPoolCount")) then {
        A3E_MotorPoolCount = ((floor random _mpc)+(Param_EnemyFrequency));
    };

while {_createMPcount < A3E_MotorPoolCount} do {
    _createMPcount = (_createMPcount + 1);
    _newPosition = [50, 1000, 0.1] call A3E_fnc_findFlatArea;
	
	private _tooCloseAnotherPos = false;
	//Check if too close to another depot, comcenter or start
	{
        if (_newPosition distance _x < A3E_ClearedPositionDistance) then {
            _tooCloseAnotherPos = true;
        };
    } foreach A3E_Var_ClearedPositions;


    if (!_tooCloseAnotherPos) then {
        _mpPosition pushBack  _newPosition;
		A3E_Var_ClearedPositions pushBack _newPosition;
    };
};

private _playergroup = [] call A3E_fnc_getPlayerGroup;
{
    // Fixme: hard coding to 180° orientation for now
    [_x, 180, a3e_arr_ComCenStaticWeapons,
     a3e_arr_ComCenParkedVehicles, 
     a3e_arr_ComCenDefence_lightArmorClasses + a3e_arr_ComCenDefence_heavyArmorClasses]
     call A3E_fnc_BuildMotorPool;

    [_playergroup, "A3E_MotorPoolPatrolMarker", A3E_VAR_Side_Opfor, "INS", 5, 5, 8,
     Param_EnemySkill, Param_EnemySkill, Param_EnemySpawnDistance, false] spawn drn_fnc_InitGuardedLocations;
} foreach _mpPosition;

a3e_var_Escape_MotorPoolPositions = _mpPosition;
publicVariable "a3e_var_Escape_MotorPoolPositions";