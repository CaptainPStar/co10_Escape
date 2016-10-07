params["_arr","_key"];
private _return = [];
if(typename _arr != "ARRAY" || count _arr != 2) exitwith {["Array is not Assoc Array"] call a3e_fnc_debugmsg;_return;};
private _keys = _arr select 0;
private _values = _arr select 1;
private _index = _keys find _key;
if(_index == -1) exitwith {["Error","Key "+_key+" not found"] call a3e_fnc_log;_return;};
_return = _values select _index;
_return;