private["_unit","_reviver","_changeEH","_doneEH","_abortAction"];

_unit = _this select 0;
_reviver = _this select 1;
if(_unit getvariable "AT_isCrawling") then {
    _unit setvariable ["AT_isCrawling",false,false];
    _unit setcaptive true;
};
[[_unit,"AinjPpneMstpSnonWrflDnon_injuredHealed"],"at_fnc_playMove",true] call BIS_fnc_MP;
[[_reviver,"AinvPknlMstpSnonWrflDr_medic2"],"at_fnc_playMove",true] call BIS_fnc_MP;
_reviver setvariable ["AT_isHealing",[_unit,false,false],true];
_doneEH = _reviver addeventhandler["AnimDone",{_this call at_fnc_animDone;}];
//_changeEH = _reviver addeventhandler["AnimDone",{_this call at_fnc_animChanged;}];
_abortAction = [_reviver,_unit] call compile format["private[""_reviver"",""_revived""]; _reviver = (_this select 0);_revived = (_this select 1);_abortAction = _reviver addaction [""Abort Healing"",{(_this select 1) setvariable [""AT_isHealing"",[_revived,true,false],true];[[(_this select 1),""AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon""],""at_fnc_switchMove"",true] call BIS_fnc_MP;[[(_this select 1),""AmovPknlMstpSrasWrflDnon""],""at_fnc_playMove"",true] call BIS_fnc_MP}];_abortAction;"];
			
_unit attachTo [_reviver,[0,1,0]]; 
_unit setDir (getDir _reviver + 90);
// eventuell das statt dem EH : WaitUntil {animationstate player == "ainjppnemstpsnonwrfldnon"};
[_reviver,_unit] spawn {
    private["_reviver","_dir","_pos","_unit"];
    _reviver = _this select 0;
	_unit = _this select 1;
    _dir = getdir _reviver;
    _pos = getposASL _reviver;
    while{count(_reviver getvariable "AT_isHealing")>0 && !(_unit getvariable "AT_isConscious")} do {
        sleep 0.01;
        _reviver setdir _dir;
        _reviver setposASL _pos;
    };
	//Maybe detach here
};

waituntil{((_reviver getvariable "AT_isHealing") select 1)};
detach _unit;
_reviver removeeventhandler ["AnimDone",_doneEH];
//_reviver removeeventhandler _changeEH;
_reviver removeaction _abortAction;

if((_reviver getvariable "AT_isHealing") select 2) then {
	_unit setvariable  ["AT_IsConscious",true,true];
	player sidechat format["%1 revived by %2",name _unit, name _reviver];

	[[_reviver,"AinvPknlMstpSnonWrflDr_medicEnd"],"at_fnc_playMove",true] call BIS_fnc_MP;
	[[_unit],"at_fnc_removeReviveAction",true] call BIS_fnc_MP;
} else {
	player sidechat "Healing Aborted";
};

_reviver setvariable ["AT_isHealing",[],true];

