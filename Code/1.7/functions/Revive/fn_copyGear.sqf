/*
	Author: NeoArmageddon
	Website: www.modfact.net
	
	Description:
	Copy the complete loadout of a unit to another. Allcontainers, items, gear and magazines (with ammocount) are preserved.

	
	License:
	Feel free to use this script in your mission/addon/script. But be fair and give me some credits of you release something using this script or a derivative of it.
	
	Parameter(s):
		_this select 0: UNIT - Unit to receive the loadout
		_this select 1: UNIT - Unit to copy the loadout
		_this select 2: BOOL (optional) - false: Container of magazines is preserved but ammocount is resetted
										  true: The ammocount of every magazine is preserved but the information about the container is lost

	Returns:
	Nothing
*/

	
private["_u1","_u2","_weapons","_assigned_items","_primary","_array","_blacklist","_magazinesAmmoFull","_keep_ammocount"];

_u1 = [_this,0,objnull,[objnull]] call bis_fnc_param;
_u2 = [_this,1,objnull,[objnull]] call bis_fnc_param;
_keep_ammocount = [_this,2,false,[true]] call bis_fnc_param;

if (isnull _u1) exitwith {
	["Missing first parameter for gear copy!"] call BIS_fnc_error;
};
if (isnull _u2) exitwith {
	["Missing second parameter for gear copy!"] call BIS_fnc_error;
};
//[[format["Copy gear for %1",name _u1]],"at_fnc_debug",true] call BIS_fnc_MP;
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
if((backpack _u2)!="") then {
	_u1 addbackpack (backpack _u2);
};

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
		if(!_keep_ammocount) then {
			if(count(_x)>4) then {
				_u1 addmagazine [(_x select 4) select 0,(_x select 4) select 1];
			};
			if(count(_x)>5) then {
				_u1 addmagazine [(_x select 5) select 0,(_x select 5) select 1];
			};
		};
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

{
	_u1 linkItem _x;
} foreach assignedItems _u2;

_u1 selectWeapon (currentWeapon _u2);
//_zeroing = currentZeroing _u2; 
//weaponState player;