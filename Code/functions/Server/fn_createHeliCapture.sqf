if(!isserver) exitwith {};

diag_log "A3E: Creating helicopter capture objective";

private _playerCount = count ([] call A3E_fnc_GetPlayers);
private _heliTypes = missionNamespace getVariable ["a3e_arr_heli_capture", []];

private _suitableHelis = [];
{
    private _heliType = _x select 0;
    private _heliSeats = _x select 1;
    if (_heliSeats >= _playerCount) then {
        _suitableHelis pushBack _x;
    };
} forEach _heliTypes;

if (count _suitableHelis == 0) then {
    diag_log "A3E: No suitable helicopter found for player count. Falling back to largest.";
    private _largestHeli = ["", 0];
    {
        if ((_x select 1) > (_largestHeli select 1)) then {
            _largestHeli = _x;
        };
    } forEach _heliTypes;
    if ((_largestHeli select 0) != "") then {
        _suitableHelis pushBack _largestHeli;
    };
};

if (count _suitableHelis > 0) then {
    private _heliInfo = selectRandom _suitableHelis;
    private _heliToSpawn = _heliInfo select 0;

    private _spawnPos = [] call a3e_fnc_findFlatArea;
    private _tooClose = false;
    {
        if (_spawnPos distance _x < 1500) then { // Increased distance
            _tooClose = true;
        };
    } forEach A3E_Var_ClearedPositions;

    if (!_tooClose) then {
        A3E_Var_ClearedPositions pushBack _spawnPos;

        private _heli = createVehicle [_heliToSpawn, _spawnPos, [], 0, "NONE"];
        _heli setDir (random 360);
        _heli setVehicleLock "LOCKED";

        // Spawn guards
        private _guardCount = 3 + floor (random 4);
        private _guardGroup = createGroup A3E_VAR_Side_Ind;
        for "_i" from 1 to _guardCount do {
            private _guardPos = [_spawnPos, 25, 60] call BIS_fnc_findSafePos;
            private _unit = _guardGroup createUnit [(selectRandom a3e_arr_Escape_InfantryTypes), _guardPos, [], 0, "FORM"];
        };

        // Create task for players
        private _taskID = "A3E_Task_CaptureHeli_" + str (round (random 1000));
        [
            "A3E_Task_CaptureHeli",
            true,
            [
                "An abandoned helicopter has been spotted. If you can capture it, you might be able to use it for extraction. It is likely guarded, so approach with caution.",
                "Capture Helicopter",
                "Capture Helicopter"
            ],
            _heli,
            "CREATED"
        ] remoteExec ["BIS_fnc_taskCreate",-2, _taskID];

        // Trigger to complete the task
        private _trigger = createTrigger ["EmptyDetector", getPos _heli, false];
        _trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
        _trigger setTriggerArea [20, 20, 0, false];
        _trigger setVariable ["heliToCheck", _heli];
        _trigger setTriggerStatements [
            "this && (locked (thisTrigger getVariable 'heliToCheck')) != 1",
            format["[ ""A3E_Task_CaptureHeli"", ""Succeeded""] remoteExec [""BIS_fnc_taskSetState"", -2, ""%1""]; deleteVehicle thisTrigger;", _taskID],
            ""
        ];

        diag_log format ["A3E: Helicopter capture objective created at %1 with helicopter %2", _spawnPos, _heliToSpawn];
    } else {
        diag_log "A3E: Could not find a suitable spawn position for helicopter capture objective.";
    };
} else {
    diag_log "A3E: No helicopters defined for helicopter capture objective.";
};