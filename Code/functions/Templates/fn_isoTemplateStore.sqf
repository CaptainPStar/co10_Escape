//private _obj = (allMissionObjects "") inAreaArray templateArea;
params["_exportName"];
private _allTrigger = (allMissionObjects "EmptyDetector");
private _areaIndex =  _allTrigger findIf { (triggerText _x) == _exportName;};
if(_areaIndex < 0) exitWith {systemchat ("Can't find a trigger with name "+_exportName);};
private _area = _allTrigger select _areaIndex;

private _obj = (allMissionObjects "") inAreaArray _area;
private _export = [];
private _options = [];
private _center = getposATL _area;
private _clearanceZone = triggerArea _area; 
_center set  [2,0];

private _getAttributes = {
	params["_obj"];
	private _atr = _obj getvariable ["A3E_IsoAttributes",[]];
	private _key = [];
	private _value = [];
	{
		_key pushback (toLower(_x # 0));
		_value pushback _x # 1;
	} foreach _atr;
	[_key,_value];
};
private _hasAttribute = {
	params["_atr","_key"];
	private _index = _atr # 0 find toLower(_key);
	private _return = false;
	if(_index>=0) then {
		_return = true;
	};
	_return;
};

{
	private _atr = _x call _getAttributes;
	_export pushBack [typeof _x, (getposATL _x) vectorDiff  _center, getdir _x, _atr];
} foreach _obj;

private _result = [["Name",_exportName],["Clearance",_clearanceZone],["Objects",_export]];
copyToClipboard str(_result);