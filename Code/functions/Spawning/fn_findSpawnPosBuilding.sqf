private["_building","_coef","_coef","_paramsArray","_return"];
_building = _this select 0;
_coef = 1;
_paramsArray = [];
_return = [];
if (!isNil {_building getVariable "occupied"}) exitWith { _paramsArray;};

_building setVariable ["occupied", TRUE];


BIS_getRelPos = {
	_relDir = [_this, player] call BIS_fnc_relativeDirTo;
	_dist = [_this, player] call BIS_fnc_distance2D;
	_elev = ((getPosASL _this) select 2) - ((getPosASL player) select 2);
	_dir = (direction player) - direction _this;
	
	[_relDir, _dist, _elev, _dir];
};

_buildings = [
	"Land_Cargo_HQ_V1_F", [
		[-89.3972,5.45408,-0.724457,-89.757],
		[160.876,5.95225,-0.59613,-0.245575],
		[30.379,5.37352,-3.03543,-32.9396],
		[49.9438,7.04951,-3.03488,1.15405],
		[109.73,7.20652,-3.12396,-273.082],
		[190.289,6.1683,-3.12094,-181.174],
		[212.535,6.83544,-3.1217,-154.507]
	],
	"Land_Cargo_HQ_V2_F", [
		[-89.3972,5.45408,-0.724457,-89.757],
		[160.876,5.95225,-0.59613,-0.245575],
		[30.379,5.37352,-3.03543,-32.9396],
		[49.9438,7.04951,-3.03488,1.15405],
		[109.73,7.20652,-3.12396,-273.082],
		[190.289,6.1683,-3.12094,-181.174],
		[212.535,6.83544,-3.1217,-154.507]
	],
	"Land_Cargo_HQ_V3_F", [
		[-89.3972,5.45408,-0.724457,-89.757],
		[160.876,5.95225,-0.59613,-0.245575],
		[30.379,5.37352,-3.03543,-32.9396],
		[49.9438,7.04951,-3.03488,1.15405],
		[109.73,7.20652,-3.12396,-273.082],
		[190.289,6.1683,-3.12094,-181.174],
		[212.535,6.83544,-3.1217,-154.507]
	],
	"Land_Cargo_Patrol_V1_F", [
		[84.1156,2.21253,-4.3396,88.6112],
		[316.962,3.65801,-4.14061,270.592],
		[31.6563,3.61418,-4.13602,-0.194908]
		
	],
	"Land_Cargo_Patrol_V2_F", [
		[84.1156,2.21253,-4.3396,88.6112],
		[316.962,3.65801,-4.14061,270.592],
		[31.6563,3.61418,-4.13602,-0.194908]
		
	],
	"Land_Cargo_Patrol_V3_F", [
		[84.1156,2.21253,-4.3396,88.6112],
		[316.962,3.65801,-4.14061,270.592],
		[31.6563,3.61418,-4.13602,-0.194908]
		
	],
	"Land_Cargo_Tower_V1_F", [
		[99.5325,3.79597,-4.62543,-271,3285],
		[-65.1654,4.17803,-8.59327,2,79],
		[-50.097,4.35226,-12.7691,2,703],
		[115.749,5.55055,-12.7623,-270,6282],
		[-143.89,7.92183,-12.9027,-180,867],
		[67.2957,6.75608,-15.4993,-270,672],
		[-68.9994,7.14031,-15.507,-88,597],
		[195.095,7.46374,-17.792,-182,651],
		[-144.962,8.67736,-17.7939,-178,337],
		[111.831,6.52689,-17.7889,-271,5161],
		[-48.2151,6.2476,-17.7976,-1,334],
		[-24.622,4.62995,-17.796,1,79]
	],
	"Land_Cargo_Tower_V2_F", [
		[99.5325,3.79597,-4.62543,-271,3285],
		[-65.1654,4.17803,-8.59327,2,79],
		[-50.097,4.35226,-12.7691,2,703],
		[115.749,5.55055,-12.7623,-270,6282],
		[-143.89,7.92183,-12.9027,-180,867],
		[67.2957,6.75608,-15.4993,-270,672],
		[-68.9994,7.14031,-15.507,-88,597],
		[195.095,7.46374,-17.792,-182,651],
		[-144.962,8.67736,-17.7939,-178,337],
		[111.831,6.52689,-17.7889,-271,5161],
		[-48.2151,6.2476,-17.7976,-1,334],
		[-24.622,4.62995,-17.796,1,79]
	],
	"Land_Cargo_Tower_V3_F", [
		[99.5325,3.79597,-4.62543,-271,3285],
		[-65.1654,4.17803,-8.59327,2,79],
		[-50.097,4.35226,-12.7691,2,703],
		[115.749,5.55055,-12.7623,-270,6282],
		[-143.89,7.92183,-12.9027,-180,867],
		[67.2957,6.75608,-15.4993,-270,672],
		[-68.9994,7.14031,-15.507,-88,597],
		[195.095,7.46374,-17.792,-182,651],
		[-144.962,8.67736,-17.7939,-178,337],
		[111.831,6.52689,-17.7889,-271,5161],
		[-48.2151,6.2476,-17.7976,-1,334],
		[-24.622,4.62995,-17.796,1,79]
	],
	"Land_i_Barracks_V1_F", [
		[66.6219,14.8599,-3.8678,94.6476],
		[52.0705,10.0203,-3.86142,4.09206],
		[11.4515,6.26249,-3.85385,1.42117],
		[306.455,10.193,-3.84314,0.0715332],
		[294.846,14.2778,-3.83774,-91.0892],
		[7.04782,1.86908,-0.502411,-90.3917],
		[86.3556,7.98911,-0.510651,129.846]
	],
	"Land_i_Barracks_V2_F", [
		[66.6219,14.8599,-3.8678,94.6476],
		[52.0705,10.0203,-3.86142,4.09206],
		[11.4515,6.26249,-3.85385,1.42117],
		[306.455,10.193,-3.84314,0.0715332],
		[294.846,14.2778,-3.83774,-91.0892],
		[7.04782,1.86908,-0.502411,-90.3917],
		[86.3556,7.98911,-0.510651,129.846]
	]
];

if (!(typeOf _building in _buildings)) exitWith {
	//hint format ["occupyBuilding.sqf:\n\nWARNING:\n\nBuilding type\n%1\nnot supported.", typeOf _building]
        _paramsArray;
};

_paramsArray = (_buildings select ((_buildings find (typeOf _building)) + 1));
_finalCnt = round (count _paramsArray * _coef);

while {count _paramsArray > _finalCnt} do {
	_paramsArray = ([_paramsArray, floor random count _paramsArray] call BIS_fnc_removeIndex)
};

if (_finalCnt > 0) then {
	/*_newGrp = createGroup ([EAST, WEST, RESISTANCE, CIVILIAN] select (getNumber (configFile >> "CfgFactionClasses" >> _faction >> "side")));*/

	{
		_pos =  [_building, _x select 1, (_x select 0) + direction _building] call BIS_fnc_relPos;
		_pos = [_pos select 0, _pos select 1, ((getPosASL _building) select 2) - (_x select 2)];
                _return set [count(_return),[_pos select 0,_pos select 1, _pos select 2,_x select 3]];
		//([_faction, ["rifleman", "autorifleman"] select floor random 2] call BIS_pickSiteUnit) createUnit [_pos, _newGrp, "BIS_currentDude = this"];
		//doStop BIS_currentDude;
		//commandStop BIS_currentDude;
		//BIS_currentDude setPosASL _pos;
		//BIS_currentDude setUnitPos "UP";
		//BIS_currentDude doWatch ([BIS_currentDude, 1000, direction _building + (_x select 3)] call BIS_fnc_relPos);
		//BIS_currentDude setDir direction _building + (_x select 3);
	} forEach _paramsArray;
	
	_site setVariable ["garrison", (_site getVariable "garrison") + [_newGrp]];
	
	//["[SITES] %1 garrisoned by %2", typeOf _building, _newGrp] call BIS_fnc_logFormat;
	
	//_newGrp selectLeader BIS_currentDude;
	
	//BIS_currentDude = nil;
};
_return;