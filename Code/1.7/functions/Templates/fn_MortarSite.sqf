

if(isNil("A3E_MortarMarkerNumber")) then {
	A3E_MortarMarkerNumber = 0;
} else {
	A3E_MortarMarkerNumber = A3E_MortarMarkerNumber +1;
};
_number = A3E_MortarMarkerNumber;

_position = [_this,0] call bis_fnc_param;




private["_obj","_objpos","_dir","_gunner"];

_objpos = _position vectoradd [3.78394,-0.563721,-0.00930499];
_obj = "Land_BagFence_End_F" createvehicle _objpos;
_dir = 320.859;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [2.31396,-1.72375,-0.00930499];
_obj = "Land_BagFence_Long_F" createvehicle _objpos;
_dir = 321.086;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [1.56396,3.35632,-0.00930499];
_obj = "Land_BagFence_Long_F" createvehicle _objpos;
_dir = 0.479819;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [-0.0661621,-2.9137,-0.00900411];
_obj = "Land_BagFence_Round_F" createvehicle _objpos;
_dir = 0;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [-0.105957,-0.183716,0.0648341];
_obj = createVehicle [a3e_arr_MortarSite select(floor(random(count(a3e_arr_MortarSite)))), _objpos, [], 0, "NONE"];
_gunner = [_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
a3e_var_artillery_units pushBack _obj;
_dir = 180.555;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [-1.45605,3.44629,-0.00930499];
_obj = "Land_BagFence_Long_F" createvehicle _objpos;
_dir = 179.672;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [-2.36597,-1.42371,-0.00930499];
_obj = "Land_BagFence_Long_F" createvehicle _objpos;
_dir = 47.601;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [-3.66602,0.00622559,-0.00930499];
_obj = "Land_BagFence_End_F" createvehicle _objpos;
_dir = 229.949;
_obj setdir _dir;
_obj setpos _objpos;


["A3E_MortarSiteMapMarker" + str _number,_position,"o_mortar"] call A3E_fnc_createLocationMarker;


_marker = createMarkerLocal ["A3E_MortarSitePatrolMarker" + str _number, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerAlpha 0;
_marker setMarkerSizeLocal [50, 50];