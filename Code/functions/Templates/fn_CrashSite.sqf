if(!isserver) exitwith {};

private ["_object", "_position", "_marker", "_instanceNo", "_randomNo", "_gun", "_angle", "_car","_dir","_boxpos","_boxType","_TypeOfWreck"];

_position = [_this,0] call bis_fnc_param;

_TypeOfWreck = [];
_typeOfUnit = [];
if (count a3e_arr_CrashSiteWrecksCar >0) then {
	_blah=floor(random 2);
	if (_blah == 0) then {
	_TypeOfWreck = a3e_arr_CrashSiteWrecks;
	_typeOfUnit = a3e_arr_CrashSiteCrew;
	} else {
	_TypeOfWreck = a3e_arr_CrashSiteWrecksCar;
	_typeOfUnit = a3e_arr_CrashSiteCrewCar;
	};
} else { 
	_TypeOfWreck = a3e_arr_CrashSiteWrecks;
	_typeOfUnit = a3e_arr_CrashSiteCrew;
};

//Create a crashed object
_dir = random 360;
_object = createVehicle [_TypeOfWreck select(floor(random(count(_TypeOfWreck)))), _position, [], 0, "NONE"];
_object setPos _position;
_object setDir _dir;

if(isNil("a3e_CrashSiteMarkerNo")) then {
	a3e_CrashSiteMarkerNo = 0;
} else {
	a3e_CrashSiteMarkerNo = a3e_CrashSiteMarkerNo + 1;
};
["a3e_CrashSiteMarker" + str a3e_CrashSiteMarkerNo,_position,"hd_warning","ColorGreen",true] call A3E_fnc_createLocationMarker;


//Create Smoke
private _effect = selectRandom ["SMOKE_SMALL", "SMOKE_MEDIUM", "SMOKE_BIG"];
_fx = [_position, _effect];
_fx remoteExec ["A3E_fnc_FireSmokeFX",0,true];


_boxType = "Box_NATO_Wps_F";
_boxpos = _position findEmptyPosition [3,15,_boxType];
 if(count _boxpos >0) then {
	_box = createVehicle [_boxType, _boxpos, [], 0, "NONE"];
 
	private ["_weapons", "_weaponMagazines", "_box", "_weaponCount","_items"];
	
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
     clearItemCargoGlobal _box;
    // Basic Weapon Box
    _weapons = [];
    _weaponMagazines = [];
    _items = [];
    for "_i" from 0 to (count a3e_arr_CrashSiteWeapons - 1) do {
        private ["_handGunItem", "_weaponClassName", "_probabilityOfPrecence", "_minCount", "_maxCount", "_magazines", "_magazinesPerWeapon"];
        
        _handGunItem = a3e_arr_CrashSiteWeapons select _i;
        
        _weaponClassName = _handGunItem select 0;
        _probabilityOfPrecence = _handGunItem select 1;
        _minCount = _handGunItem select 2;
        _maxCount = _handGunItem select 3;
        _magazines = _handGunItem select 4;
        _magazinesPerWeapon = _handGunItem select 5;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _weaponCount = floor (_minCount + random (_maxCount - _minCount));
            _weapons pushBack [_weaponClassName, _weaponCount];
            
            for "_j" from 0 to (count _magazines) - 1 do {
                _weaponMagazines pushBack [_magazines select _j, _weaponCount * _magazinesPerWeapon];
            };
        };
    };
	 for "_i" from 0 to (count a3e_arr_CrashSiteItems - 1) do {
        private ["_item", "_itemClassName", "_probabilityOfPrecence", "_minCount", "_maxCount"];
        
        _item = a3e_arr_CrashSiteItems select _i;
        
        _itemClassName = _item select 0;
        _probabilityOfPrecence = _item select 1;
        _minCount = _item select 2;
        _maxCount = _item select 3;
        
        if (random 100 <= _probabilityOfPrecence) then {
            _itemCount = floor (_minCount + random (_maxCount - _minCount));
            _items pushback [_itemClassName, _itemCount];
        };
    };      
	{
		_box addWeaponCargoGlobal _x;
	} foreach _weapons;
	
	{
		_box addMagazineCargoGlobal _x;
	} foreach _weaponMagazines;
			{
		_box addItemCargoGlobal _x;
	} foreach _items;
	

	
	_grp = createGroup A3E_VAR_Side_Blufor;
	_deadcrew = _grp createUnit [_typeOfUnit select(floor(random(count(_typeOfUnit)))), getpos _box, [], 15, "FORM"] ;   
	_deadcrew setdammage 1;
	_deadcrew = _grp createUnit [_typeOfUnit select(floor(random(count(_typeOfUnit)))), getpos _box, [], 15, "FORM"] ;   
	_deadcrew setdammage 1;
	
	diag_log format["fn_CrashSite: Camp created at %1", getpos _box];
 };
 
