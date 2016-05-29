/*
	Author: Karel Moricky
	Edited by NeoArmageddon
	Description:
	Set overcast

	Parameter(s):
	NUMBER - overcast

	Returns:
	NUMBER - overcast
*/

private ["_overcast"];
_template = [_this,0,0,[0]] call bis_fnc_param;
//[_overcast * 0.01] call bis_fnc_setOvercast;
//_overcast
//0:Clear,1:Clear + Fog,2:Cloudy,3: Rainy, 4: Storm ,5: Random
if(!isserver) exitwith {};
if(_template>=5) then {
	_template = round(random(4));
};
switch (_template) do {
    case 0: { 
		[0 + random (0.1)] call bis_fnc_setOvercast;
		[0,0,0] call bis_fnc_setFog;
	};
    case 1:  { 
		[0 + random (0.1)] call bis_fnc_setOvercast;
		[1-random(0.2),0.025,random 50] call bis_fnc_setFog;
	};
    case 2:  { 
		[0.3 + random (0.1)] call bis_fnc_setOvercast;
		[0,0,0] call bis_fnc_setFog;
	};
    case 3:  { 
		[0.5 + random (0.2)] call bis_fnc_setOvercast;
		[0,0,0] call bis_fnc_setFog;
	};
	case 4:  { 
		[1.0] call bis_fnc_setOvercast;
		[random(0.5),0.05,random 75] call bis_fnc_setFog;
	};

};