AT_FNC_Revive_InitPlayer = {
	private["_init","_anotherPlayer"];
	_init = _this select 0;
	player removeAllEventHandlers "HandleDamage";
	player removeAllEventHandlers "Killed";
	
	if(isNil("AT_Revive_WeaponsOnRespawn")) then {
		AT_Revive_WeaponsOnRespawn = true;
	};
	
	player addEventHandler ["HandleDamage", AT_FNC_Revive_HandleDamage];
	player addEventHandler 
	[
		"Killed",
		{
			_body = _this select 0;
			[_body] spawn 
			{
			
				waitUntil { alive player };
				_body = _this select 0;
				deleteVehicle _body;
			}
		}
	];
	
	player setVariable ["AT_Revive_isUnconscious", false, true];
	player setVariable ["AT_Revive_isDragged", objNull, true];
	player setVariable ["AT_Revive_isDragging", objNull, true];
	player setCaptive false;
	
	[] spawn AT_FNC_Revive_Actions;
	
	//systemchat "AT Revive started";
	if(!_init) then {
		//Player used respawn.. remove all his stuff and thread him like JIP
		if(!AT_Revive_WeaponsOnRespawn) then {
			removeallweapons player;
			removeAllItems player;
			removeBackpack player;
			
			player unassignItem "ItemMap";
			player removeItem "ItemMap";
			player unassignItem "ItemCompass";
			player removeItem "ItemCompass";
			player unassignItem "itemGPS";
			player removeItem "itemGPS";
			player unassignItem "NVGoggles";
			player removeItem "NVGoggles";
		
		};
		
		if(count(AT_Revive_StaticRespawns)>0) then {
			player setpos getpos (AT_Revive_StaticRespawns select 0);
		};
		[] spawn ATHSC_fnc_createCam;
		//_anotherPlayer = (call drn_fnc_Escape_GetPlayers) select 0;
        //if (player == _anotherPlayer) then {
        //    _anotherPlayer = (call drn_fnc_Escape_GetPlayers) select 1;
        //};
        //_pos = [((getPos vehicle _anotherPlayer) select 0) + 3, ((getPos vehicle _anotherPlayer) select 1) + 3, 0];
		//player setpos _pos;
		
		
	};
};

AT_FNC_Revive_Actions = {
	if (alive player) then 
	{
		player addAction ["<t size=""1.25"" color=""#C90000"">" + "Revive" + "</t>", "Revive\reviveAction.sqf", ["revive"], 18, true, true, "", "call AT_FNC_Revive_Check_Revive"];
		player addAction ["<t size=""1.25"" color=""#C90000"">" + "Drag" + "</t>", "Revive\reviveAction.sqf", ["drag"], 17, false, true, "", "call AT_FNC_Revive_Check_Dragging"];
	};

};

AT_FNC_Revive_HandleDamage = {
	private ["_unit", "_killer", "_amountOfDamage", "_isUnconscious"];
	_unit = _this select 0;
	_amountOfDamage = _this select 2;
	_killer = _this select 3;
	_isUnconscious = _unit getVariable "AT_Revive_isUnconscious";
	
	if (alive _unit && _amountOfDamage >= 1  && !(_isUnconscious)) then 
	{
		_unit setDamage 0;
		_unit allowDamage false;
		_amountOfDamage = 0;
		[_unit, _killer] spawn AT_FNC_Revive_Unconscious;
	};
	
	_amountOfDamage

};
AT_FNC_Revive_GlobalMsg =
{
	systemchat (_this select 0);
};

AT_FNC_Revive_Hide = {
	private["_unit","_hide"];
	_unit = _this select 0;
	_hide = _this select 1;
	
	if(_hide) then {
		//_unit enableSimulation false;
		_unit hideobject true;
	} else {
		//_unit enableSimulation true;
		_unit hideobject false;	
	};
};
AT_FNC_Revive_Playmove = {
	private["_unit","_anim"];

	_unit = _this select 0;
	_anim = _this select 1;

	_unit playmovenow _anim;	

};
AT_FNC_Revive_FixRotation= {
	private["_unit"];

	_unit = _this select 0;
	_unit setdir 180;

};
AT_FNC_Revive_Switchmove = {
	private["_unit","_anim"];

	_unit = _this select 0;
	_anim = _this select 1;

	_unit switchmove _anim;	

};
AT_FNC_Revive_Unconscious =
{
	private["_unit", "_killer","_msg","_pos"];
	_unit = _this select 0;
	_killer = _this select 1;
	
	_unit setVariable ["AT_Revive_isUnconscious", true, true];
		
	_msg = format["%1 is unconscious.",name _unit];
	[[_msg],"AT_FNC_Revive_GlobalMsg",true] call bis_fnc_MP;
	
	
	// Eject unit if inside vehicle
	while {vehicle _unit != _unit} do 
	{
		unAssignVehicle _unit;
		_unit action ["eject", vehicle _unit];
		
		sleep 0.5;
	};
	
	_ragdoll = [_unit] spawn at_fnc_revive_ragdoll;
	
	waituntil{scriptDone _ragdoll};
	
	[] spawn ATHSC_fnc_createCam;
	
	_unit setDamage 0;
    _unit setVelocity [0,0,0];
    _unit allowDamage false;
	_unit setCaptive true;

	
	
	sleep 0.5;
    
	[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
	_unit enableSimulation false;
	
	//_unit setVariable ["AT_Revive_isUnconscious", true, true];
	
	// Call this code only on players
	if (isPlayer _unit) then 
	{
		
		while { !isNull _unit && alive _unit && (_unit getVariable "AT_Revive_isUnconscious")} do
		{			
			sleep 0.5;
		};
		_pos = getposATL _unit;
		
		// Player got revived
		//sleep 6;
		

		_unit enableSimulation true;
		_unit allowDamage true;
		_unit setDamage 0;
		_unit setCaptive false;
		
		sleep 0.5;
		_unit setPosATL _pos; //Fix the stuck in the ground bug

	};
};


AT_FNC_Revive_HandleRevive =
{
	private ["_target"];

	_target = _this select 0;

	if (alive _target) then
	{
		if(primaryWeapon player != "") then {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
		} else {
			player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		};

		_target setVariable ["AT_Revive_isDragged", objNull, true];
		
		sleep 6;
		
		if(!(player getVariable ["AT_Revive_isUnconscious",false])) then {
			_target setVariable ["AT_Revive_isUnconscious", false, true];
			[[_target,"amovppnemstpsraswrfldnon"],"at_fnc_revive_playMove",true] call BIS_fnc_MP;
			[[],"ATHSC_fnc_exit",_target] call BIS_fnc_MP;
		};
		
		if (!isPlayer _target) then
		{
			_target enableSimulation true;
			_target allowDamage true;
			_target setDamage 0;
			_target setCaptive false;
			
			[[_target,"amovppnemstpsraswrfldnon"],"at_fnc_revive_playMove",true] call BIS_fnc_MP;
		};
	};
};
AT_FNC_Revive_InstantRevive = 
{
	private ["_target"];

	_target = _this select 0;
	_target enableSimulation true;
	_target allowDamage true;
	_target setDammage 0;
	_target setFatigue 0;
	_target setCaptive false;
	_target setVariable ["AT_Revive_isUnconscious", false, true];
	_target setVariable ["AT_Revive_isDragged", objNull, true];
	_target setVariable ["AT_Revive_isDragging",objNull,true];
	[[_target,""],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
};

AT_FNC_Revive_Drag =
{
	private ["_target", "_id"];
	
	_target = _this select 0;
		

	player setVariable ["AT_Revive_isDragging",_target,true];
	_target setVariable ["AT_Revive_isDragged",player,true];


	_target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;

	[[_target],"AT_FNC_Revive_FixRotation",true] call BIS_fnc_MP;
	
	[[player,"AcinPknlMstpSrasWrflDnon"],"at_fnc_revive_playMove",true] call BIS_fnc_MP;
	
	//player playMoveNow "AcinPknlMstpSrasWrflDnon";
	
	

	_id = player addAction ["<t color=""#C90000"">" + "Release" + "</t>", "Revive\reviveAction.sqf", ["release"], 10, true, true, "", "true"];
	
	
	waitUntil 
	{ 
		!alive player || (player getVariable "AT_Revive_isUnconscious") || !alive _target || !(_target getVariable "AT_Revive_isUnconscious") || isNull((player getVariable "AT_Revive_isDragging")) || isNull((_target getVariable "AT_Revive_isDragged")) 
	};

	player setVariable ["AT_Revive_isDragging",objNull,true];
	
	if (!isNull _target && alive _target) then
	{
		[[_target,"AinjPpneMstpSnonWrflDnon"],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
		_target setVariable ["AT_Revive_isDragged", objNull, true];
		detach _target;
	};
	
	player removeAction _id;
};

AT_FNC_Revive_Release =
{

	[[player,"amovpknlmstpsraswrfldnon"],"at_fnc_revive_playMove",true] call BIS_fnc_MP;
	player setVariable ["AT_Revive_isDragging",objNull,true];
	
};



AT_FNC_Revive_Check_Revive = 
{
	private ["_target","_isPlayerUnconscious", "_isTargetUnconscious", "_isDragging", "_isDragged","_return"];

	_return = false;
	
	_isPlayerUnconscious = player getVariable "AT_Revive_isUnconscious";
	_isDragging = player getVariable "AT_Revive_isDragging";
	_target = cursorTarget;


	if( !alive player || _isPlayerUnconscious || !isNull(_isDragging) || isNil "_target" || !alive _target || (!isPlayer _target && !AT_Revive_Debug) || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable "AT_Revive_isUnconscious";
	_isDragged = _target getVariable "AT_Revive_isDragged"; 
	
	// Make sure target is unconscious and player is a medic 
	if (_isTargetUnconscious && isNull(_isDragged)) then
	{
		_return = true;

	};
	
	_return
};


AT_FNC_Revive_Check_Dragging =
{
	private ["_target","_isPlayerUnconscious", "_isTargetUnconscious", "_isDragging", "_isDragged","_return"];
	
	_return = false;
	_target = cursorTarget;
	_isPlayerUnconscious = player getVariable "AT_Revive_isUnconscious";
	_isDragging = player getVariable "AT_Revive_isDragging";

	if( !alive player || _isPlayerUnconscious || !isNull(_isDragging) || isNil "_target" || !alive _target || (!isPlayer _target && !AT_Revive_Debug) || (_target distance player) > 2 ) exitWith
	{
		_return;
	};
	
	// Target of the action
	_isTargetUnconscious = _target getVariable "AT_Revive_isUnconscious";
	_isDragged = _target getVariable "AT_Revive_isDragged"; 
	
	if(_isTargetUnconscious && isNull(_isDragged)) then
	{
		_return = true;
	};
		
	_return
};

AT_FNC_Revive_Ragdoll = {
	private["_unit","_dummy","_state"];
	_unit = _this select 0;
	
	if(((eyepos _unit) select 2)>0.4) then {
		_group = creategroup (side _unit);
		[[_unit,true],"at_fnc_revive_hide",true] call BIS_fnc_MP;
		_dummy = _group createUnit [typeof _unit, [0,0,0], [], 0, "FORM"];
		if(!isNull _dummy) then {
			_dummy setposASL getPosASL _unit;
			_dummy setdir getdir _unit;
			_dummy setVelocity velocity _unit;
			_state = animationState _unit;
			[_dummy,_unit] spawn at_fnc_copyGear;
			[[_dummy,_state],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
			_dummy setdammage 1;
			if(_unit==player) then {
				_dummy switchCamera "Internal";
			};
			for[{_i=0},{_i<50},{_i=_i+1}] do {
				if(((_dummy selectionPosition "Neck") select 2)<0.2) then {
					_i = 50;
					sleep 0.5;
				};
				sleep 0.1;
			};
			
			[[_unit,false],"at_fnc_revive_hide",true] call BIS_fnc_MP;
			[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
			_dummy setpos [0,0,0];
			deletevehicle _dummy;
		} else {
			[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
		};
	} else {
		[[_unit,"AinjPpneMstpSnonWrflDnon_rolltoback"],"at_fnc_revive_playMove",true] call BIS_fnc_MP;
	};
};

AT_FNC_CopyGear = {
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
};