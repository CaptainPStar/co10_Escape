#include "include\defines.hpp"

// create CBA settings from mission parameters
private _category = "co10 Escape";
private _settingCategory = _category;
{
    private _title = getText (_x >> "title");
    private _values = getArray (_x >> "values");
    if (count _values <= 1) then {
        // spacer
        _title = (_title splitString "") - ["="] joinString "";
        // subcategory is cool, but it will sort settings groups :(
        // _settingCategory = [_category, _title];
    } else {
        private _name = configName _x;
        private _texts = getArray (_x >> "texts");
        private _default = getNumber (_x >> "default");
		private _tooltip = [(_x),"tooltip",""] call BIS_fnc_returnConfigEntry;
		private _livechanges = [(_x),"livechanges",0] call BIS_fnc_returnConfigEntry;
		private _code = [(_x),"code",""] call BIS_fnc_returnConfigEntry;
		if(_tooltip == "") then {
			_tooltip = _title;
		};
        private _type = "LIST";
        private _valueInfo = [_values, _texts, _values find _default];
        if (_name == "A3E_Param_Loadparams") then {
            _name = "UseCBASettings";
            _title = "Use CBA settings";
            _type = "CHECKBOX";
            _valueInfo = false;
        } else {
            //if (
            //    _values isEqualTo [0,1]
            //    && {toLower (_texts#0) in ["disabled", "off", "no"]}
            //    && {toLower (_texts#1) in ["enabled", "on", "yes"]}
            //) then {
            //    _type = "CHECKBOX";
             //   _valueInfo = [false, true] select _default;
           // };
        };
		//private _varname = [(_x),"varname","a3e_" + _name] call BIS_fnc_returnConfigEntry;
        [
            _name,
            _type,
            [_title, _tooltip],
            _settingCategory,
            _valueInfo,
            1,
            compile _code,
            ([true, false] select _livechanges)
        ] call CBA_fnc_addSetting;
    };
} forEach ('true' configClasses (missionConfigFile >> "Params"));
