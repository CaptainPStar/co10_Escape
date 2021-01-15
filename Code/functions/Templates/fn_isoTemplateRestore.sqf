private _center = getposATL recreatePoint;
private _rotation = getdir recreatePoint;

if(!isNil("A3E_ListOfCreatedObj")) then {
	{deletevehicle x;} foreach A3E_ListOfCreatedObj;
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
private _getAttribute = {
	params["_atr","_key","_default"];
	private _index = (_atr # 0) find toLower(_key);
	private _return = _default;
	if(_index>=0) then {
		_return = _atr # 1 # _index;
	};
	_return;
};
A3E_ListOfCreatedObj = [];
{
	_x params ["_type","_pos","_dir","_atr"];
	private _realPos = [_center,_center vectorAdd _pos,_rotation] call A3E_fnc_rotatePosition;
	if([_atr,"Spawn",true] call _getAttribute) then {
		private _obj = _type createvehicle _realPos;
		_obj setdir (_dir+_rotation);
		_obj setPosATL _realPos;
		A3E_ListOfCreatedObj pushback _obj;
		if([_atr,"Terminal"] call _hasAttribute) then {
			_obj addaction ["Hack terminal",{systemchat "Du Hacker du!";}];
		};
		if([_atr,"Yeet"] call _hasAttribute) then {
			_obj spawn {
				sleep 2;
				_this setvelocity [0,0,100];
			};
		};
		if([_atr,"Inflame",false] call _getAttribute) then {
			_obj inflame true;
		};
		_fireplaceOne inflame true;
	};
} foreach A3E_TempTemplate;
