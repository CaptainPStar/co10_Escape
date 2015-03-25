private["_unit","_id"];
_unit = _this select 0;
if(_unit!=player) then {
	if((_unit getvariable ["AT_Revive_Action",-1])<0) then {
		_id = _unit addaction["<t color='#FF0000'>REVIVE</t>",{_this call at_fnc_revive;},"",6,true,true,"","((_target distance _this)<1.8) && (_target!=_this) && (count(_this getvariable ""AT_isHealing"")==0) && (_this getvariable ""AT_isConscious"")"];
                _unit setvariable ["AT_Revive_Action",_id,false];
                //[[format["Adding reviveaction to %1 for %2",name _unit, name player]],"at_fnc_debug",true] call BIS_fnc_MP;
	} else {
            [_unit] call at_fnc_removeReviveAction;
            [_unit] call at_fnc_addReviveAction;
           // [[format["Replacing reviveaction to %1 for %2",name _unit, name player]],"at_fnc_debug",true] call BIS_fnc_MP;
        };
} else {
    //[[format["No need to add reviveaction to %1 for %2",name _unit, name player]],"at_fnc_debug",true] call BIS_fnc_MP;
};