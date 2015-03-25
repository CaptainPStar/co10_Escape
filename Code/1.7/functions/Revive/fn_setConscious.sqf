private["_unit","_isFlat","_position"];
    _unit = _this select 0;
    _unit setcaptive false;
    if(local _unit) then {
	_unit setdammage 0.3;
	/*_isFlat = (position _unit) isflatempty [
		(sizeof typeof _unit) / 2,	//--- Minimal distance from another object
		0,				//--- If 0, just check position. If >0, select new one
		0.7,				//--- Max gradient
		(sizeof typeof _unit),	//--- Gradient area
		0,				//--- 0 for restricted water, 2 for required water,
		false,				//--- True if some water can be in 25m radius
		_unit			//--- Ignored object
	];
	if(count(_isFlat)>0) then {
		_unit setposASL _isFlat;
	};*/
	[[_unit,"AmovPpneMstpSrasWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
        if(!(isplayer _unit)) then {
            _unit enableAI "ANIM";
        };
	_unit setvariable["AT_IsConscious",true,true];
        if(_unit getvariable "AT_isCrawling") then {
               _unit setvariable ["AT_isCrawling",false,false];
        };
};