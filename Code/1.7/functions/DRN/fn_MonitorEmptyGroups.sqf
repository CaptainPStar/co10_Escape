private ["_totalGroupCount", "_lastTotalGroupCount", "_emptyGroupCount", "_lastEmptyGroupCount"];

_totalGroupCount = 0;
_lastTotalGroupCount = 0;
_emptyGroupCount = 0;
_lastEmptyGroupCount = 0;

if (isNil "drn_var_commonLibInitialized") then {
    [] spawn {
        while {true} do { player sideChat "Script MonitorEmptyGroups.sqf needs CommonLib version 1.02"; sleep 5; };
    };
};

while {true} do {
    _totalGroupCount = count allGroups;
    
    _emptyGroupCount = 0;
    {
        if (count units _x == 0) then {
            _emptyGroupCount = _emptyGroupCount + 1;
        }
        else {
        };        
    } foreach allGroups;
    
    if (_totalGroupCount != _lastTotalGroupCount || _emptyGroupCount != _lastEmptyGroupCount) then {
        ["Group diagnostics: Total groups=" + str _totalGroupCount + ". Empty groups=" + str _emptyGroupCount + ". Total units=" + str count allUnits + "."] call drn_fnc_CL_ShowDebugTextAllClients;
    };
    
    sleep 5;
    
    _lastTotalGroupCount = _totalGroupCount;
    _lastEmptyGroupCount = _emptyGroupCount;
};


