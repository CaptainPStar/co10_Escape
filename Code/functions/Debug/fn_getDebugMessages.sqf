params[["_filter","",["",[]]]];

if(isNil("A3E_DebugLog")) then {
	A3E_DebugLog = [];
};
//Get the last 25 messages:

private _length = count (A3E_DebugLog);
private _return = [];

if(_filter == "STRING") then {
	if(_filter == "") then {
		_filter = [];
	} else {
		_filter = [_filter];
	};
};
for[{_i=_length-1},{_i >= 0},{_i = _i-1}] do {
	private _types = (A3E_DebugLog select _i) select 1;
	private _isInFilter = false;
	if(count(_filter)==0) then {
		_isInFilter = true;
	} else {
		{
			if(_x in _filter) exitWith {
				_isInFilter = true;
			};
		} foreach _types;
	};
	if(_isInFilter) then {
		_return append [A3E_DebugLog select _i];
	};
	if(count _return >= 25) exitWith {};
};
_return;