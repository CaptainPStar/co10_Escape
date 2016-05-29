private["_side","_color"];
_side = [_this,0] call bis_fnc_param;

switch(_side) do {
	case (civilian):{_color = "ColorWhite";};
	case (west):{_color = "ColorBlue";};
	case (east):{_color = "ColorRed";};
	case (resistance):{_color = "ColorGreen";};
	default {_color = "ColorBlack";};
};
_color;
