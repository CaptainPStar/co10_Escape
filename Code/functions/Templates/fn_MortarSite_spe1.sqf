//SPE Mortar 1
//Both sides, dugout

// Eden Object composition to SQF
// Export file
// Script by NeoArmageddon
// Call this script by [Position,Rotation] execVM "filename.sqf"


if(isNil("A3E_MortarMarkerNumber")) then {
	A3E_MortarMarkerNumber = 0;
} else {
	A3E_MortarMarkerNumber = A3E_MortarMarkerNumber +1;
};
_number = A3E_MortarMarkerNumber;

_position = [_this,0] call bis_fnc_param;




private["_obj","_objpos","_dir","_gunner"];

_objpos = _position vectoradd [-4.99316,-3.78418,-0.5];
_obj = "Land_TimberLog_05_F" createvehicle _objpos;
_dir = 0;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-8.02783,-2.6123,-0.5];
_obj = "Land_TimberLog_05_F" createvehicle _objpos;
_dir = 0;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [0.21875,-4.92285,0];
_obj = "Land_SPE_Sandbag_Short" createvehicle _objpos;
_dir = 242.593;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [1.81104,-5.53467,0];
_obj = "Land_SPE_Dugout_Cover" createvehicle _objpos;
_dir = 177.167;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-1.68066,2.80078,0];
_obj = "Land_SPE_Dugout_3m" createvehicle _objpos;
_dir = 320.525;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [1.70557,3.13818,0];
_obj = "Land_SPE_Dugout_3m" createvehicle _objpos;
_dir = 38.3017;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-3.10645,0.203125,0];
_obj = "Land_SPE_Dugout_Decal_03" createvehicle _objpos;
_dir = 18.2648;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-2.43213,-2.74463,0];
_obj = "Land_SPE_Ammobox_German_02_Covered" createvehicle _objpos;
_dir = 14.9079;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-6.37988,-2.94775,0];
_obj = "Land_SPE_Wood_TrenchLogWall_01_4m_v2" createvehicle _objpos;
_dir = 291.239;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-0.00292969,3.14795,0];
_obj = "Land_SPE_Dugout_3m_sandbags" createvehicle _objpos;
_dir = 0;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-2.99023,-0.625977,0];
_obj = "Land_SPE_Dugout_6m_sandbags" createvehicle _objpos;
_dir = 292.646;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-3.32715,-5.71094,0];
_obj = "Land_SPE_Sandbag_Curve" createvehicle _objpos;
_dir = 168.492;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [-0.119629,-6.55127,0];
_obj = "Land_SPE_Sandbag_Short_Low" createvehicle _objpos;
_dir = 126.308;
_obj setdir _dir;
_obj setpos _objpos;

_objpos = _position vectoradd [3.01563,0.0200195,0];
_obj = "Land_SPE_Dugout_6m45_sandbags" createvehicle _objpos;
_dir = 69.3182;
_obj setdir _dir;
_obj setpos _objpos;


//_obj = ["SPE_GrW278_1",_center,[0.519043,-0.146484,0.0243835],_rotation,360] call _fnc_createObject;
_objpos = _position vectoradd [0.519043,-0.146484,0.0243835];
_obj = createVehicle [a3e_arr_MortarSite select(floor(random(count(a3e_arr_MortarSite)))), _objpos, [], 0, "NONE"];
_gunner = [_obj,A3E_VAR_Side_Opfor] spawn A3E_fnc_AddStaticGunner; 
a3e_var_artillery_units pushBack _obj;
_dir = 360;
_obj setdir _dir;
_obj setpos _objpos;


["A3E_MortarSiteMapMarker" + str _number,_position,"o_mortar"] call A3E_fnc_createLocationMarker;


_marker = createMarkerLocal ["A3E_MortarSitePatrolMarker" + str _number, _position];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerAlphaLocal 0;
_marker setMarkerSizeLocal [50, 50];