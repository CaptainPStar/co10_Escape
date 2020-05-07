// Build start position
private _fenceRotateDir = random 360;

private _backPack = "B_AssaultPack_khk" createvehicle A3E_StartPos;

private _template = selectRandom(["a3e_fnc_BuildPrison", "a3e_fnc_BuildPrison1", "a3e_fnc_BuildPrison2", "a3e_fnc_BuildPrison3"]);

[A3E_StartPos, _fenceRotateDir, _backPack] remoteExec [_template, 0, true];

A3E_FenceIsCreated = true;
publicVariable "A3E_FenceIsCreated";

_backPack;