private["_unit","_id"];
_unit = _this select 0;

if((_unit getvariable "AT_Revive_Action")!=-1) then {
	_unit removeaction (_unit getvariable "AT_Revive_Action");
	_unit setvariable ["AT_Revive_Action",-1,false];
        [[format["Removing reviveaction from %1 for %2",name _unit, name player]],"at_fnc_debug",true] call BIS_fnc_MP;
}
