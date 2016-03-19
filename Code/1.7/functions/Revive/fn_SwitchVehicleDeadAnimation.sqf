params["_unit"];
if(vehicle _unit != _unit) then {
	private _interpolates = [(configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit),"interpolateTo",""] call BIS_fnc_returnConfigEntry;
	{
		if(typeName _x == "STRING") then {
			private["_stateAction"];
			if(configName (inheritsFrom (configfile >> "CfgMovesMaleSdr" >> "States" >> _x)) == "DefaultDie") then {
				[_unit,_x] remoteExec ["switchmove", 0, false];
			};
		};
	} foreach _interpolates;
};