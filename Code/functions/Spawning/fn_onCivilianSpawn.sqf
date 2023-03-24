private["_nighttime"];
params["_unit"];


_unit removeItem "FirstAidKit";



private _mapItems = missionNamespace getVariable ["A3E_MapItemsUsedInMission",["ItemMap"]];
{_unit unlinkItem _x;} foreach _mapItems;

_unit unlinkItem "ItemCompass";

private _itemsToRemove = missionNamespace getVariable ["A3E_ItemsToBeRemoved",[]];
{
	_unit unlinkItem _x;
} foreach _itemsToRemove;

_unit unlinkItem "ItemGPS";


_unit unlinkItem "Binocular";

private _score = missionNamespace getvariable ["A3E_Warcrime_Score",0];

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _k = _killer;
	if(isPlayer _instigator) then {
		_k = _instigator;
	};
	
	if(!(isNull _k)) then {
		private _score = missionNamespace getvariable ["A3E_Warcrime_Score",0];
		missionNamespace setvariable ["A3E_Warcrime_Score",_score+500, true];
		[format["%1 killed a civilian.",name _k]] remoteExec ["systemchat"];
		_instigator addScore -5;
		_instigator addRating 1000; 
	};
}];


_unit addEventHandler["FiredNear",{
	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
	private _lastScared = _unit getvariable ["A3E_LastScaredByFire",0];
	private _isScared = _unit getvariable ["A3E_IsScared",false];
	private _group = group _unit;
	if(_isScared) exitwith {};
	_unit setvariable ["A3E_IsScared",true];
	_unit setvariable ["A3E_LastScaredByFire",time];
	if(vehicle _unit == _unit && _distance < 25) then {
		/*switch(selectRandom[0,1,2])do{
			case 0:{[_unit,"ApanPercMstpSnonWnonDnon_G01"] remoteexec ["switchMove",0];};
			case 1:{[_unit,"ApanPknlMstpSnonWnonDnon_G01"] remoteexec ["playMoveNow",_unit];};
			case 2:{[_unit,"ApanPpneMstpSnonWnonDnon_G01"] remoteexec ["playMoveNow",_unit];};
			default{[_unit,"ApanPknlMstpSnonWnonDnon_G01"] remoteexec ["playMoveNow",_unit];};
		};*/
	};
	private _building = [_unit] call A3E_fnc_getRndBuildingWithPositions;


	if(count(_Building)>0 && (vehicle _unit == _unit)) then {
		params["_group","_building"];
		doStop (_unit);
		private _positions = _building buildingPos -1;
		_positions = _positions call BIS_fnc_arrayShuffle;

		if(count(_positions)>0) then {
			private _pos = _positions deleteAt 0;
			_unit doMove _pos;
			_unit setSpeedMode "FULL";
			[_unit] spawn {
				params["_unit"];
				waitUntil {sleep 0.1; moveToCompleted _unit};
				doStop _unit;//Not sure if needed again here
				
				_unit setUnitPos selectRandom["DOWN","MIDDLE"];
				sleep (60+selectRandom[-10,0,10,20,30,40]);
				_unit setvariable ["A3E_IsScared",false];
				[_unit] doFollow (leader (group _unit));
				_unit setUnitPos "AUTO";
			};
		};
			
	} else {
		//Just run or drive away
		private _firePos = getpos _firer;
		private _fireDir = _unit getdir _firer;
		private _dir = _fireDir + 180;
		private _distance =  500;
		private _fleepos  = [(_firePos select 0)+cos(_dir)*_distance,(_firePos select 1)+sin(_dir)*_distance,0];
		_unit doMove _fleepos;
		_unit setSpeedMode "FULL";
		[_unit] spawn {
			params["_unit"];
			waitUntil {sleep 0.1; moveToCompleted _unit};
			doStop _unit;//Not sure if needed again here
			sleep (60+selectRandom[-10,0,10,20,30,40]);
			_unit setvariable ["A3E_IsScared",false];
			[_unit] doFollow (leader (group _unit));
		};
	};
}];
