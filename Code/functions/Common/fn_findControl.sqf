private["_text"];
_text = _this select 0;

for[{_i=0},{_i<3000},{_i=_i+1}] do {
	for[{_c=0},{_c<3000},{_c=_c+1}] do {
		if(ctrltext ((findDisplay _i) displayCtrl _c) == _text) then {
			hint format["%1 %2",_i,_c];
		} else {
			player sidechat format["Nope: %1, %2",_i,_c];
		};
	};
};