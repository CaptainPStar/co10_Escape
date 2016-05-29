private["_paramsArray","_settings"];
_paramsArray = _this;
_settings = "Parameters:<br/>";
waituntil{!isNull player || isServer};
if(!isNull player) then {
    if (isClass (missionConfigFile/"Params")) then
    {
        _c=count (missionConfigFile/"Params");
        for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
        {
            _paramName = (configName ((missionConfigFile >> "Params") select _i));
            _name = getText (missionConfigFile >> "Params" >> _paramName >> "title");
            _value = _paramsArray select _i;
            _index = (getArray (missionConfigFile >> "Params" >> _paramName >> "values")) find _value;
            _valueName = (getArray (missionConfigFile >> "Params" >> _paramName >> "texts")) select _index;
            _settings = _settings + format["%1 : %2 (%3)<br/>",_name,_valueName,_value];
        };
    };
        
            
    player createDiaryRecord ["Diary", ["Settings", _settings]];
} else {
     hint format["Player is null"];
};