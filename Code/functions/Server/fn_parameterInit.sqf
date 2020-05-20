private _cfgParams = missionConfigFile >> "Params";
private _paramNames = 'true' configClasses _cfgParams apply {configName _x};

//Load default params for SP && Editor
if (isNil "paramsArray") then {
    paramsArray = _paramNames apply {getNumber (_cfgParams >> _x >> "default")};
};

private _paramLoading = "Param_Loadparams" call BIS_fnc_getParamValue;
switch _paramLoading do {
    case 0: {
        ["Saving parameters."] call a3e_fnc_rptLog;
        profileNamespace setVariable ["A3E_SavedParams", paramsArray];
        saveProfileNamespace;
    };
    case 1: {
        if (missionNamespace getVariable ["a3e_UseCBASettings", false]) then {
            "Using CBA settings" call a3e_fnc_rptLog;
            paramsArray = _paramNames apply {
                private _value = missionNamespace getVariable ["a3e_" + _x, 0];
                if (_value isEqualType false) then {
                    _value = [0, 1] select _value;
                };
                _value
            };
            publicVariable "paramsArray";
        } else {
            private _params = profileNamespace getVariable ["A3E_SavedParams",[]];
            if(count(_params)==0 || count(_params)!=count(paramsArray)) then {
                ["No parameters found or params were updated, loading default."] call a3e_fnc_rptLog;
            } else {
                ["Parameters loaded"] call a3e_fnc_rptLog;
                paramsArray = _params;
                publicVariable "paramsArray";
            };
        };
    };
    case 2: {
        "Using manual parameters." call a3e_fnc_rptLog;
    };
};

//FIXME:  This needs to be performed clientside so Localisation can be applied correctly
//Recompile Params into Variables because they may have changed
private _paramsBriefing = "Parameters:<br/>"; //An string for the briefing entry every player will receive:
{
    private _param = _cfgParams >> _x;
    private _name = getText (_param >> "title");
    private _value = paramsArray select _forEachIndex;
    missionNamespace setVariable [_x, _value, true];
    private _values = getArray (_param >> "values");
    private _texts = getArray (_param >> "texts");
    private _valueName = _texts select (_values find _value);
    private _default = getNumber (_param >> "default");
    private _defaultName = _texts select (_values find _default);

    if (count _values > 1) then {
        _paramsBriefing = _paramsBriefing + format["<br/>%1:<br/>Current: %2<br/>Default: %3<br/><br/>",_name,_valueName,_defaultName];
    } else {
        //This seems to be a spacer:
        _paramsBriefing = _paramsBriefing + format["<br/>%1<br/>",_name];
    };
} forEach _paramNames;

_paramsBriefing remoteExec ["A3E_fnc_WriteParamBriefing", 0, true];
diag_log _paramsBriefing;

A3E_ParamsParsed = true;
publicVariable "A3E_ParamsParsed";

