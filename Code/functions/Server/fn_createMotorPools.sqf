if(!isserver) exitwith {};

private ["_mpPosition", "_createMPcount", "_mapsize", "_mpc"];

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
        A3E_MotorPoolCount = ((floor random _mpc)+(A3E_Param_EnemyFrequency));
    };
private _sites = [] + a3e_communicationCenterMarkers;

while {_createMPcount < A3E_MotorPoolCount && count(_sites)>0} do {
    private _siteMarker = _sites deleteAt floor(random (count _sites)); //Get a random position and remove it from possible pos
	private _pos = _siteMarker select 0;
	private _dir = _siteMarker select 1;
	
	private _tooCloseAnotherPos = false;
	//Check if too close to another depot, comcenter or start
	{
        if (_pos distance _x < A3E_ClearedPositionDistance) then {
            _tooCloseAnotherPos = true;
        };
    } foreach A3E_Var_ClearedPositions;


    if (!_tooCloseAnotherPos) then {
        _mpPosition pushBack  _siteMarker;
		_createMPcount = (_createMPcount + 1);
		A3E_Var_ClearedPositions pushBack _pos;
    };
};
if(count(_sites)==0 && _createMPcount<A3E_MotorPoolCount) then {
	diag_log "Escape Warning: Not enough sites left to place all motorpools.";
};

a3e_var_Escape_MotorPoolPositions = [];

private _playergroup = [] call A3E_fnc_getPlayerGroup;
{
    // Fixme: hard coding to 180° orientation for now
    [_x select 0, (_x select 1)-180, a3e_arr_ComCenStaticWeapons,
     a3e_arr_ComCenParkedVehicles, 
     a3e_arr_ComCenDefence_lightArmorClasses + a3e_arr_ComCenDefence_heavyArmorClasses]
     call A3E_fnc_BuildMotorPool;

    [_playergroup, "A3E_MotorPoolPatrolMarker", A3E_VAR_Side_Opfor, "INS", 5, 5, 8, A3E_Param_EnemySkill, A3E_Param_EnemySkill, A3E_Param_EnemySpawnDistance, false] spawn drn_fnc_InitGuardedLocations;
	 a3e_var_Escape_MotorPoolPositions pushBack (_x select 0);
} foreach _mpPosition;

a3e_var_Escape_MotorPoolPositions = _mpPosition;
publicVariable "a3e_var_Escape_MotorPoolPositions";