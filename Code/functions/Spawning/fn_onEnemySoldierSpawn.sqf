private["_nighttime"];
params["_unit"];
_unit setVehicleAmmo (0.2 + random 0.4);
if(daytime > 19 OR daytime < 8) then {
	_nighttime = true;
} else {
	_nighttime = false;
};   

//Hopefully fixing BIS broken scripts:
private _AISkill = 0.1;
switch (Param_EnemySkill) do {
	case 0: { _AISkill = 0.1; };
	case 1: { _AISkill = 0.2; };
	case 2: { _AISkill = 0.3; };
	case 3: { _AISkill = 0.4; };
	case 4: { _AISkill = 0.5; };
	default { _AISkill = 0.2; };
};
_unit setskill _AISkill;
_unit setskill ["spotdistance", _AISkill];
_unit setskill ["aimingaccuracy", _AISkill]; 
_unit setskill ["aimingshake", _AISkill]; 
_unit setskill ["spottime", _AISkill];
_unit setskill ["commanding", _AISkill];


_unit removeItem "FirstAidKit";

//Chance for a random scope (and no scope):
if(random 100 < 70) then {

	removeAllPrimaryWeaponItems _unit;
	if((random 100 < 30)) then {
		_scopes = A3E_arr_Scopes;
		if(Param_NoNightvision==0) then {
			_scopes = _scopes + A3E_arr_TWSScopes;
		};
		if(_nighttime) then {
			_scopes = _scopes + A3E_arr_NightScopes;
		};
		_scope = _scopes call A3E_fnc_selectRandomWeightedFromSet;
		_unit addPrimaryWeaponItem _scope;
	};
};

private["_nvgs"];
_nvgs = hmd _unit; //NVGoggles
if(_nvgs != "") then {
	if((_nighttime) && (random 100 > 40) || !(_nighttime) && (random 100 > 5) || (Param_NoNightvision>0)) then {
		_unit unlinkItem _nvgs;
	};
} else {
	if((((_nighttime) && (random 100 < 40)) || (!(_nighttime) && (random 100 < 5))) && (Param_NoNightvision==0)) then {
		_unit linkItem "NVGoggles_OPFOR";
	};
};


//Chance for random attachment
if((random 100 < 15) OR (_nighttime)) then {
	if(random 100 < 70 || (Param_NoNightvision>0)) then {
		_unit addPrimaryWeaponItem "acc_flashlight";
	} else {
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit linkItem "NVGoggles_OPFOR";
	};
};

//Bipod chance
if((random 100 < 20)) then {
	_unit addPrimaryWeaponItem (a3e_arr_Bipods call A3E_fnc_selectRandomWeightedFromSet);
};

//Chance for silencers
if(((random 100 < 10) && (!_nighttime)) OR ((random 100 < 40) && (_nighttime))) then {
	//Not yet
};
if (random 100 > 20) then {
	//_unit additem "ItemMap";
	//_unit assignItem "ItemMap";
	_unit unlinkItem "ItemMap";
};
if (random 100 > 30) then {
	//_unit additem "ItemCompass";
	//_unit assignItem "ItemCompass";
	_unit unlinkItem "ItemCompass";
};
if (random 100 > 5) then {
	//_unit additem "ItemGPS";
   // _unit assignItem "ItemGPS";
	_unit unlinkItem "ItemGPS";
};
if ("Binocular" in (assignedItems _unit)) then {
	if (random 100 > 30) then {
		//_unit additem "ItemGPS";
	   // _unit assignItem "ItemGPS";
		_unit unlinkItem "Binocular";
	};
};
if ("Rangefinder" in (assignedItems _unit)) then {
	if (random 100 > 30) then {
		//_unit additem "ItemGPS";
	   // _unit assignItem "ItemGPS";
		_unit unlinkItem "Rangefinder";
	};
};
