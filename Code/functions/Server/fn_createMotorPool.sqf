if(!isserver) exitwith {};

private ["_mpPosition", "_createMPcount", "_newPosition"];

_mpPosition = [];
_createMPcount = 0;

if(isNil("A3E_MotorPoolCount")) then {
        A3E_MotorPoolCount = ((floor random 3)+(Param_EnemyFrequency));
    };

while {_createMPcount < A3E_MotorPoolCount} do
    {
    _createMPcount = (_createMPcount + 1);
    _newPosition = [50, 1000, 0.1] call A3E_fnc_findFlatArea;
    _mpPosition pushBack _newPosition;
    };

_playergroup = [] call A3E_fnc_getPlayerGroup;
{
    // Fixme: hard coding to 180° orientation for now
    [_x, 180, a3e_arr_ComCenStaticWeapons,
     a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses, 
     a3e_arr_ComCenDefence_lightArmorClasses + a3e_arr_ComCenDefence_heavyArmorClasses]
     call A3E_fnc_BuildMotorPool;

    [_playergroup, "A3E_MotorPoolPatrolMarker", A3E_VAR_Side_Opfor, "INS", 5, 5, 8,
     Param_EnemySkill, Param_EnemySkill, Param_EnemySpawnDistance, false] spawn drn_fnc_InitGuardedLocations;
} foreach _mpPosition;

