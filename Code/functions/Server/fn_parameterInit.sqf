//Load default params for SP && Editor
if (isNil "paramsArray") then
{
    private ["_c", "_i", "_paramName"];
    paramsArray=[];

    if (isClass (missionConfigFile/"Params")) then
    {
        _c=count (missionConfigFile/"Params");
        for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
        {
            _paramName = (configName ((missionConfigFile >> "Params") select _i));
            paramsArray=paramsArray+[ getNumber (missionConfigFile >> "Params" >> _paramName >> "default") ];
        };
    };
};
	AT_fnc_ParamsToVar = {
		//Compile params into real variables:
		private["_c","_paramName"];
		_c=count (missionConfigFile/"Params");
		for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
		{
			_paramName = (configName ((missionConfigFile >> "Params") select _i));
			call compile format["%1 = %2;publicVariable '%1';",_paramName,paramsArray select _i];

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


	//Reompile Params into Variables because they may have changed
	call AT_fnc_ParamsToVar;


A3E_ParamsParsed = true;
publicVariable "A3E_ParamsParsed";
//[paramsArray,"a3e_fnc_WriteParamBriefing",true,true] call BIS_fnc_MP;
