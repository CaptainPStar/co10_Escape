//private _obj = (allMissionObjects "") inAreaArray templateArea;
params["_exportName"];
private _allTrigger = (allMissionObjects "EmptyDetector");
private _areaIndex =  _allTrigger findIf { (triggerText _x) == _exportName;};
if(_areaIndex < 0) exitWith {[("Can't find a trigger with name "+_exportName),["ERROR","Templates","Missing"]] call A3E_fnc_Log;};
private _area = _allTrigger select _areaIndex;

private _objects = (allMissionObjects "") inAreaArray _area;
private _export = [];
private _options = [];
private _center = getposATL _area;
private _clearanceZone = triggerArea _area; 
_center set  [2,0];

private _getAttributes = {
	params["_obj"];
	
	private _map = createHashMap;
	
	private _atr = _obj getvariable ["A3E_IsoAttributes",[]];
	{
		_key pushback (toLower(_x # 0));
		//_value pushback _x # 1;
		_map set [toLower(_x#0),_x#1];
	} foreach _atr;
	_map;
};
private _hasAttribute = {
	params["_atr","_key"];
	private _return = false;
	_key = toLower(_key);
	if(_key in _atr) then {
		_return = true;
	};
	_return;
};

private _objectAttributes = [];

{
	private _atr = [_x] call _getAttributes;
	_atr set ["sourceobj",_x];
	_objectAttributes pushBack _atr;
} foreach _objects;



while{count _objectAttributes > 0} do {

	private _curObject = _objectAttributes # 0;
	if("hasbase" in _curObject) then {
		systemchat "skipping child"; 
		_objectAttributes pushback (_objectAttributes deleteAt 0);
		continue;
	};
	if((_curObject get "sourceobj") iskindof "EmptyDetector") then {
		_objectAttributes deleteAt 0;
		continue;
	};
	//private _atr = _curObject call _getAttributes;
	
	//Find all relative objects of this one
	
	private _obj = _curObject get "sourceobj";
	
	private _childObjects = [];
	if("isbase" in _curObject) then {
		private _children = _objectAttributes select {_x getOrDefault ["hasbase",""] == _curObject get "isbase";};
		{
			private _cobj = _x get "sourceobj";
			_x set ["sourceobj", str (_x get "sourceobj")];
			_childObjects pushBack [typeof _cobj, (getposATL _cobj) vectorDiff  (getposATL _obj), getdir _cobj, _x];
			_objectAttributes deleteAt (_objectAttributes find _x);
		} foreach _children;
	};
	
	_curObject set ["sourceobj", str (_curObject get "sourceobj")];
	_export pushBack [typeof _obj, (getposATL _obj) vectorDiff  _center, getdir _obj, _curObject, _childObjects];
	_objectAttributes deleteAt (_objectAttributes find _curObject);
	
	//
	if(count _objectAttributes == {"hasbase" in _x} count _objectAttributes) then
	{
		systemchat "Warning: No base item found for some objects. Relative objects skipped.";
		break;
	}
	
};

private _result = [["Name",_exportName],["Clearance",_clearanceZone],["Objects",_export]];
copyToClipboard str(_result);
missionnamespace setvariable ["A3E_Templates",[_result]];