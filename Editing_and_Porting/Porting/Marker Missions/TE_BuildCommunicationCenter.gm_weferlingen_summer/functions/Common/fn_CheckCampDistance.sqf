// Check Camp Distance: checks a positions distance to one of the already spawned camps
// Only ComCenters, MotorPools and AmmoDepots for now (or all of them)
// 
// Parameters:
//   _pos         :  your position to check
//
//   _dis         (default is 100):  distance to a camp pos it checks for
//
//   _checkAgainst   (default is "All"):  Type of camps to check, so far can choose between:
// 											All, Com, MotorPool, Ammo
//
// Returns:
//   false if position is to close to a spawned camp, true when position is ok
///////////////////////////////////////////////////////////
private ["_check", "_pos", "_dis", "_checkAgainst"];

_pos = _this select 0;
_dis = _this select 1;
_checkAgainst = toLower (_this select 2);

if(isNil("_pos")) exitwith {diag_log format ["%1 : Error: fn_CheckCampDistance was unable to find the position.", time];};
if(isNil("_dis")) then {_dis = 100};
if(isNil("_checkAgainst")) then {_checkagainst = "All";};

private _positions = switch (_checkAgainst) do 
{
	case "all": {A3E_Var_ClearedPositions};
	case "com": {a3e_var_Escape_communicationCenterPositions};
	case "motorpool": {a3e_var_Escape_MotorPoolPositions};
	case "ammo": {a3e_var_Escape_AmmoDepotPositions};
};

_check = true;
{
	if ((_pos distance _x) < _dis) exitWith {_check=false;}
} foreach _positions;
	
_check