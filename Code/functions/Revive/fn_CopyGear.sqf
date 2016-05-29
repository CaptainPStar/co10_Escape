private["_weapons","_assigned_items","_primary","_array","_blacklist","_magazinesAmmoFull"];

params[["_u1",objNull],["_u2",objNull],["_keep_ammocount",false]];

if (isnull _u1) exitwith {
	["Missing first parameter for gear copy!"] call BIS_fnc_error;
};
if (isnull _u2) exitwith {
	["Missing second parameter for gear copy!"] call BIS_fnc_error;
};

_primary = primaryWeapon _u2;
_weapons = weaponsItems _u2;

removeAllAssignedItems _u1;
removeAllContainers _u1;
removeAllWeapons _u1;

removeHeadgear _u1;
if((headgear _u2)!="") then {
	_u1 addHeadgear (headgear _u2);
};
removeGoggles _u1;
if((goggles _u2)!="") then {
	_u1 addGoggles (goggles _u2);
};
//if(true) exitwith {};
if((uniform _u2)!="") then {
	_u1 adduniform(uniform _u2);
};
if((vest _u2)!="") then {
	_u1 addvest (vest _u2);
};
//if((backpack _u2)!="") then {
//	_u1 addbackpack (backpack _u2);
//};

//This keeps the correct amount of ammo in every magazine but the correct distribution will be lost
if(_keep_ammocount) then {
	{
		_u1 addmagazine [(_x select 0),(_x select 1)];
	} foreach magazinesAmmoFull _u2;
};


_blacklist = ["Rangefinder","Binocular"];
{
	
	if((_x select 0)!="" && !((_x select 0) in _blacklist)) then {
	
		//This will add the current loaded magazine in the weapon
		//Nobody needs ammo
		/*if(!_keep_ammocount) then {
			if(count(_x)>4) then {
				_u1 addmagazine [(_x select 4) select 0,(_x select 4) select 1];
			};
			if(count(_x)>5) then {
				_u1 addmagazine [(_x select 5) select 0,(_x select 5) select 1];
			};
		};*/
		_u1 addweapon (_x select 0);
		_u1 linkitem (_x select 1);
		_u1 linkitem (_x select 2);
		_u1 linkitem (_x select 3);
	};
} foreach (weaponsItems _u2);

_array = getItemCargo uniformContainer _u2;
if(count(_array)>0) then {
	{
		for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
			_u1 addItemToUniform _x;
		};
	} foreach ((_array) select 0);
};
//This will restore the the correct magazine amount in each container
if(!_keep_ammocount) then {
	_array = getMagazineCargo uniformContainer _u2;
	if(count(_array)>0) then {
		{
			for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
				_u1 addItemToUniform _x;
			};
		} foreach ((_array) select 0);
	};
};
_array = getWeaponCargo uniformContainer _u2;
if(count(_array)>0) then {
	{
		for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
			_u1 addItemToUniform _x;
		};
	} foreach ((_array) select 0);
};

_array = getItemCargo vestContainer _u2;
if(count(_array)>0) then {
	{
		for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
			_u1 addItemToVest _x;
		};
	} foreach ((_array) select 0);
};
if(!_keep_ammocount) then {
	_array = getMagazineCargo vestContainer _u2;
	if(count(_array)>0) then {
		{
			for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
				_u1 addItemToVest _x;
			};
		} foreach ((_array) select 0);
	};
};
_array = getWeaponCargo vestContainer _u2;
if(count(_array)>0) then {
	{
		for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
			_u1 addItemToBackpack _x;
		};
	} foreach ((_array) select 0);
};

if(false) then {
	_array = getItemCargo backpackContainer _u2;
	if(count(_array)>0) then {
		{
			for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
				_u1 addItemToBackpack _x;
			};
		} foreach ((_array) select 0);
	};
	if(!_keep_ammocount) then {
		_array = getMagazineCargo backpackContainer _u2;
		if(count(_array)>0) then {
			{
				for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
					_u1 addItemToBackpack _x;
				};
			} foreach ((_array) select 0);
		};
	};
	_array = getWeaponCargo backpackContainer _u2;
	if(count(_array)>0) then {
		{
			for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do {
				_u1 addItemToBackpack _x;
			};
		} foreach ((_array) select 0);
	};
};
{
	_u1 linkItem _x;
} foreach assignedItems _u2;

_u1 selectWeapon (currentWeapon _u2);
//_zeroing = currentZeroing _u2; 
//weaponState player;