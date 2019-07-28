private _out = []; 
{
	if(typename _x == "STRING") then {
		_out append [_x];
	} else {
		if(typename _x == "ARRAY") then {
			_out append [_x call A3E_fnc_expandProbabilities];
		} else {
			if(typename _x == "SCALAR") then {
				if(count _out > 0) then {
					private _i = 1;
					for[{_i = 1},{_i < _x},{_i=_i+1}] do {
						_out append [_out select count(_out)-1];
					};
				};
			} else {
				["Unknown type in probability array"] call a3e_fnc_debugmsg;
			};
		};
	};
} foreach _this;
_out;