private["_unit","_flag","_exit","_crawlHandler","_displayHandler","_displayNumber","_unitvar","_run","_respawned","_corpse"];
_unit = _this select 0;
_unitvar = [_unit] call BIS_fnc_objectVar;
disableSerialization;
//This will prevent a unconscious unit from taking more damage while unconscious
_run = true;

_unit setcaptive true;

_crawlHandler = _unit addeventhandler["AnimChanged",{_this call at_fnc_startCrawling}];
//_unit setvariable["AT_isConscious",false,true];
[_unit] spawn {
    sleep 1;
    [[(_this select 0)],"at_fnc_addReviveAction",true] call BIS_fnc_MP;
};
if(_unit == player) then {
    showHud false;
    _displayNumber = [] call BIS_fnc_DisplayMission;
    _displayHandler = _displayNumber displayAddEventHandler 
        [	
                "KeyDown",
                "
                        private ['_actions', '_nrofactions', '_returnvalue', '_actionKeys' ];
                        _returnvalue = _false;
                        _actions = [ 'TimeDec', 'TimeInc', 'Gear', 'Throw', 'Fire', 'ReloadMagazine', 'SwitchWeapon', 'Diary', 'MoveLeft', 'MoveRight' ]; 

                        _actionKeys = [];
                        {
                                _actionkeys = _actionkeys + actionKeys _x;
                        } forEach _actions;

                        if( (_this select 1) in _actionKeys ) then { _returnvalue = true };
                        _returnvalue
                "
        ];
};

while{!(_unit getvariable "AT_isConscious") && (alive _unit)} do {
        sleep 0.1;
};

if(alive _unit) then { 
    [[format["%1 is now conscious again.",name _unit]],"at_fnc_debug",true] call BIS_fnc_MP;
    [[_unit],"at_fnc_setConscious",true] call BIS_fnc_MP;
};
_unit removeAllEventHandlers "AnimChanged"; //This could possibly break something in other scripts

[[_unit],"at_fnc_removeReviveAction",true] call BIS_fnc_MP;
if(_unit == player) then {
    _displayNumber displayRemoveEventHandler [ "keydown", _displayHandler];
    showHud true;
};