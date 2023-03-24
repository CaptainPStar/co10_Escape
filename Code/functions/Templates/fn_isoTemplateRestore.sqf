params["_center","_rotation",["_templateName",""]];
private _templateIndex = A3E_Templates findIf {([_x,"Name",""] call BIS_fnc_getFromPairs) == _templateName};
if(_templateIndex <0) exitWith {
	systemchat ("Escape Error: Could not find template with name "+_templateName);
	diag_log ("Escape Error: Could not find template with name "+_templateName);
};
private _template = A3E_Templates select _templateIndex;

private _clearance =  [_template,"Clearance",[]] call BIS_fnc_getFromPairs;
if(count(_clearance)>0) then {
	private _tobj =  nearestTerrainObjects [_center, [], (_clearance#0) max (_clearance#1), false, true];
	//[a, b, angle, isRectangle, c]
	private _check = [_center,(_clearance#0),(_clearance#1),(_clearance#2)+_rotation,(_clearance#3)];
	{
		if((getpos _x) inArea _check) then {
			[_x, true] remoteExec ["hideObject", 0, true];
		};
	} forEach _tobj;
};



private _templateObjects =  [_template,"Objects",[]] call BIS_fnc_getFromPairs;
if(count(_templateObjects)==0) exitwith {diag_log ("Escape Error: Template "+_templateName+" contains no objects.");};


private _return = createHashMap;

private _createObject = {
	params["_type","_realPos","_dir","_rotation","_atr"];
	private _obj = _type createvehicle _realPos;
	_obj setdir (_dir+_rotation);
	_obj setPosATL _realPos;
	//A3E_ListOfCreatedObj pushback _obj;
	if(_atr getOrDefault ["terminal",false]) then {
		_obj allowdamage false;
		_obj setvariable ["A3E_isTerminal",true,true];
		[_obj,"green","green","green"] call BIS_fnc_DataTerminalColor;
	};
	if(_atr getOrDefault ["indestructable",false]) then {
		_obj allowdamage false;
	};
	if(_atr getOrDefault ["yeet",false]) then {
		_obj spawn {
			sleep 2;
			_this setvelocity [0,0,100];
		};
	};
	if(_atr getOrDefault ["inflame",false]) then {
		_obj inflame true;
	};
	private _init = _atr getOrDefault ["init",""];
	_obj call compile _init;
	_obj;
};

private _spawn = {
	params["_center","_rotation","_pars",["_parent",objNull]];
	_pars params ["_type","_pos","_dir","_atr",["_childObjects",[]]];
	private _obj = objNull;
	if(typename _atr == "ARRAY") then {
		_atr = createHashMapFromArray _atr;
	};
	
	private _realPos = [_center,_center vectorAdd _pos,_rotation] call A3E_fnc_rotatePosition;
	if(! (isNull _parent)) then {
		private _parpos = getposATL _parent;
		_realPos = [_parpos,_parpos vectorAdd _pos,_rotation] call A3E_fnc_rotatePosition;
	};
	
	
	if(_atr getOrDefault ["spawn",true]) then {
	
		_obj = [_type,_realPos,_dir,_rotation,_atr] call _createObject;
		
		{
			private _cobj = [_center,_rotation,_x,_obj]  call _spawn;
			//_cobj attachTo [_obj];
			//_cobj spawn {sleep 5; detach _this; }
			//detach _cobj;
			//_cobj enableSimulation false;
		} foreach _childObjects;
		
	} else {
		if(_atr getOrDefault ["parkedvehicle",false]) then {
			private _type = _atr getOrDefault ["parkedvehicletype","Unknown"];
			private _init = _atr getOrDefault ["init",""];
			private _parkedVehicles = _return getOrDefault ["parkedvehicles",[]];
			_parkedVehicles pushBack [_type,_realPos,_dir,_init];
			_return set ["parkedvehicles",_parkedVehicles];
		};
		if(_atr getOrDefault ["static",false]) then {
			private _type = _atr getOrDefault ["statictype","Unknown"];
			private _init = _atr getOrDefault ["init",""];
			private _statics = _return getOrDefault ["statics",[]];
			_statics pushBack [_type,_realPos,_dir,_init];
			_return set ["statics",_statics];
		};
		if(_atr getOrDefault ["ammobox",false]) then {
			private _type = _atr getOrDefault ["ammotype","Unknown"];
			private _init = _atr getOrDefault ["init",""];
			private _ammoboxes = _return getOrDefault ["ammoboxes",[]];
			_ammoboxes pushBack [_type,_realPos,_dir,_init];
			_return set ["ammoboxes",_ammoboxes];
			
		};
	};
	_obj
};

{
	[_center,_rotation,_x] call _spawn;
} foreach _templateObjects;


_return;