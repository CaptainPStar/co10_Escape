private _roadblocks = missionNamespace getvariable ["A3E_RoadblockTemplates",["rb_bis_rb1","rb_bis_rb2","rb_bis_rb3"]];
private _templates = [];



private _loadTemplatesFromFiles = {
	params["_templates","_missionTemplates"];
	private _successful = 0;
	{
		private _path = "templates\"+_x+".sqf";
		try {
			if(!(fileExists _path)) then {
				throw ("template " + _path + " does not exist");
			};
			private _tpl = call compile preprocessFilelinenumbers _path;
			_missionTemplates pushBack _tpl;
			_successful = _successful + 1;
		} catch {
			diag_log _exception;
			_roadblocks deleteAt (_roadblocks find _x);
		};

	} foreach _templates;
	_successful;
};

//Override missionarray with loaded roadblocks
missionNamespace setvariable ["A3E_RoadblockTemplates",_roadblocks];

private _added = 0;
_added = [_roadblocks,_templates] call _loadTemplatesFromFiles;

if(_added == 0) then {
	["No valid templates for roadblocks found!",["ERROR","Templates","Roadblocks"],[]] call A3E_fnc_Log;
} else {
	[str _added + " Roadblock templates loaded.",["Templates","Roadblocks"],[_roadblocks]] call A3E_fnc_Log;
};


//Set the global template storage

missionNamespace setvariable ["A3E_Templates",_templates];