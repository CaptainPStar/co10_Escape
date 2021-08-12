params["_params","_functions",["_spawn",false]];
private _function = selectRandom _functions;
private _return = objNull;
_return = call compile format["%1 call %2",str _params,_function];
_return;