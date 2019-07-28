//Load default params for SP && Editor
if (isNil "paramsArray") then {
    paramsArray=[];

    if (isClass (missionConfigFile/"Params")) then {
        private _c = count (missionConfigFile/"Params");
        private _i = 0;
        for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
        {
            private _paramName = (configName ((missionConfigFile >> "Params") select _i));
            paramsArray=paramsArray+[ getNumber (missionConfigFile >> "Params" >> _paramName >> "default") ];
        };
    };
};

AT_fnc_ParamsToVar = {
	//Compile params into real variables:
	private["_c","_paramName"];
	_c = count (missionConfigFile/"Params");
  private _i = 0;
	for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do {
		_paramName = (configName ((missionConfigFile >> "Params") select _i));

    missionNamespace setVariable [_paramName, paramsArray select _i];
    publicVariable _paramName;
	};
};
	
//Compile Params into Variables
call AT_fnc_ParamsToVar;
	
private["_paramLoading","_params"];
_paramLoading = Param_Loadparams;
switch (_paramLoading) do 
{ 
  case 0: 
  {
    ["Saving parameters."] call a3e_fnc_rptLog;
    //uiNamespace setVariable ["A3E_SavedParams", paramsArray]; 
	profileNamespace setVariable ["A3E_SavedParams", paramsArray]; 
	saveProfileNamespace;
  }; 
  case 1: 
  {
      //Load params if existing in UINamespace
      _params = profileNamespace getVariable ["A3E_SavedParams",[]];
      if(count(_params)==0 || count(_params)!=count(paramsArray)) then {
          ["No parameters found or params were updated, loading default."] call a3e_fnc_rptLog;
          //profileNamespace setVariable ["A3E_SavedParams", paramsArray];
      } else {
          ["Parameters loaded"] call a3e_fnc_rptLog;
          paramsArray = _params;
          publicvariable "paramsArray";
      };
  }; 
  case 2: 
  {
      "Using manual parameters." call a3e_fnc_rptLog;
  }; 
};


//FIXME:  This needs to be performed clientside so Localisation can be applied correctly
//Recompile Params into Variables because they may have changed
call AT_fnc_ParamsToVar;

private _paramsBriefing = "Parameters:<br/>"; //An string for the briefing entry every player will receive:
private _c = count (missionConfigFile/"Params");
private _i = 1;
for [ {_i=1}, {_i<_c}, {_i=_i+1} ] do {
	private _param = ((missionConfigFile >> "Params") select _i);
	private _name = getText (_param >> "title");
	private _value = paramsArray select _i;
	private _values = (getArray (_param >> "values"));
	private _index = _values find _value;
	private _valueName = (getArray (_param >> "texts")) select _index;
	private _default = getNumber (_param >> "default");
	private _defaultIndex = _values find _default;
	private _defaultName = (getArray (_param >> "texts")) select _defaultIndex;
	
	if(count _values > 1) then {
		_paramsBriefing = _paramsBriefing + format["<br/>%1:<br/>Current: %2<br/>Default: %3<br/><br/>",_name,_valueName,_defaultName];
	} else {
		//This seems to be a spacer:
		_paramsBriefing = _paramsBriefing + format["<br/>%1<br/>",_name];
	};

	//call compile format["%1 = %2;publicVariable '%1';",_paramName,paramsArray select _i];
};
_paramsBriefing remoteExec ["A3E_fnc_WriteParamBriefing", 0, true]; 
diag_log _paramsBriefing;

A3E_ParamsParsed = true;
publicVariable "A3E_ParamsParsed";

