private["_unit","_selection","_damage","_source","_projectile","_hit","_return"];
//Passed Array  [unit, selectionName, damage, source, projectile]
_unit = _this select 0;
_selection = _this select 1;
_hit = _this select 2;
_source = _this select 3;
_projectile = _this select 4;


if((_unit getvariable "AT_isCrawling")) then {
	_unit setvariable ["AT_isCrawling",false,false]; 
	_unit setcaptive true;
	[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;      
	_hit = 0;
};


_hit;