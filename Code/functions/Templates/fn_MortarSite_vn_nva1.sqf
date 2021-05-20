//VN NVA Mortar 1
//Mortar Pit

if(isNil("A3E_MortarMarkerNumber")) then {
	A3E_MortarMarkerNumber = 0;
} else {
	A3E_MortarMarkerNumber = A3E_MortarMarkerNumber +1;
};
_number = A3E_MortarMarkerNumber;

_position = [_this,0] call bis_fnc_param;




private["_obj","_objpos","_dir","_gunner"];

_objpos = _position vectoradd [-0.127319,-0.296387,0];
_obj = "Land_vn_o_bunker_02" createvehicle _objpos;
_dir = 0;
_obj setdir _dir;
_obj setpos _objpos;
_objpos = _position vectoradd [-1.1637,-1.54541,0.110662];
_obj = "Land_vn_us_ammobox_small_06" createvehicle _objpos;
_dir = 340.921;
_obj setdir _dir;
_obj setpos _objpos;


_objpos = _position vectoradd [-0.108643,-0.273438,0.245724];
_obj = createVehicle [a3e_arr_MortarSite select(floor(random(count(a3e_arr_MortarSite)))), _objpos, [], 0, "NONE"];
_gunner = [_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
a3e_var_artillery_units pushBack _obj;
_dir = 359.995;
_obj setdir _dir;
_obj setpos _objpos;



["A3E_MortarSiteMapMarker" + str _number,_position,"o_mortar"] call A3E_fnc_createLocationMarker;


_marker = createMarkerLocal ["A3E_MortarSitePatrolMarker" + str _number, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerAlphaLocal 0;
_marker setMarkerSizeLocal [50, 50];