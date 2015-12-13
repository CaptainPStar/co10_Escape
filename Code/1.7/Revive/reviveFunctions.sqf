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
		if(AT_Revive_Camera==1) then {
			[] spawn ATHSC_fnc_createCam;
		};		
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
		player addAction ["<t size=""1.25"" color=""#C90000"">" + "Revive (with FAK)" + "</t>", "Revive\reviveAction.sqf", ["revivefak"], 19, true, true, "", "call AT_FNC_Revive_Check_Revive_FAK"];
		player addAction ["<t size=""1.25"" color=""#C90000"">" + "Revive" + "</t>", "Revive\reviveAction.sqf", ["revive"], 18, true, true, "", "call AT_FNC_Revive_Check_Revive"];
		player addAction ["<t size=""1.25"" color=""#FFA500"">" + "Drag" + "</t>", "Revive\reviveAction.sqf", ["drag"], 17, false, true, "", "call AT_FNC_Revive_Check_Dragging"];
		player addAction ["<t size=""1.25"" color=""#FFA500"">" + "Put in injured" + "</t>", "Revive\reviveAction.sqf", ["putin"], 17, false, true, "", "call AT_FNC_Revive_Check_Putin"];
		player addAction ["<t size=""1.25"" color=""#FFA500"">" + "Pull out injured" + "</t>", "Revive\reviveAction.sqf", ["pullout"], 17, false, true, "", "call AT_FNC_Revive_Check_Pullout"];
	};

};

AT_FNC_Revive_HandleDamage = {
	private ["_unit", "_killer", "_amountOfDamage", "_isUnconscious","_bodyPart","_projectile"];
	_unit = _this select 0;
	_bodyPart = _this select 1;
	_amountOfDamage = _this select 2;
	_killer = _this select 3;
	_projectile = _this select 4;
	_isUnconscious = _unit getVariable "AT_Revive_isUnconscious";
	
	if (alive _unit && 
		_amountOfDamage >= 1  
		&& !(_isUnconscious) 
		&& _bodyPart in ["","head","face_hub","head_hit","neck","spine1","spine2","spine3","pelvis","body"]) then 
	{
		_unit setDammage 0;
		_unit allowDammage false;
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
	private["_unit", "_killer","_msg","_pos","_inVehicle"];
	_unit = _this select 0;
	_killer = _this select 1;
	_unit setVariable ["AT_Revive_isUnconscious", true, true];
		
	_msg = format["%1 is unconscious.",name _unit];
	[[_msg],"AT_FNC_Revive_GlobalMsg",true] call bis_fnc_MP;
	
	
	// Eject unit if inside vehicle
	/*while {vehicle _unit != _unit} do 
	{
		unAssignVehicle _unit;
		_unit action ["eject", vehicle _unit];
		
		sleep 0.5;
	};*/
	_inVehicle = false;
	if(vehicle _unit == _unit) then {
		_ragdoll = [_unit] spawn at_fnc_revive_ragdoll;
		waituntil{scriptDone _ragdoll};
	} else {
		private["_vehicle","_EH"];
		_vehicle = vehicle _unit;
		if(getdammage _vehicle < 1) then {
			_inVehicle = true;
			[_unit] call AT_FNC_Revive_SwitchVehicleDeadAnimation;
		} else {
			moveOut _unit;
			_ragdoll = [_unit] spawn at_fnc_revive_ragdoll;
		};
	};
	
	_unit setDamage 0.9;
    _unit setVelocity [0,0,0];
    _unit allowDammage false;
	_unit setCaptive true;
	if(surfaceIsWater getpos _unit && ((getPosASL _unit) select 2)>2 && (vehicle _unit != _unit)) then {
		[_unit] call AT_FNC_Revive_WashAshore;
	};
	
	if(AT_Revive_Camera==1) then {
		[] spawn ATHSC_fnc_createCam;
	};
	sleep 0.5;
	
    if(vehicle _unit == _unit) then {
		[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
	};
	_unit enableSimulation false;
	
	//_unit setVariable ["AT_Revive_isUnconscious", true, true];
	
	// Call this code only on players
	if (isPlayer _unit) then 
	{
		
		while { !isNull _unit && alive _unit && (_unit getVariable "AT_Revive_isUnconscious")} do
		{			
			if(vehicle _unit == _unit && _inVehicle) then {
				_inVehicle = false;
				_unit enableSimulation true;
				_ragdoll = [_unit] spawn at_fnc_revive_ragdoll;
				waituntil{scriptDone _ragdoll};
				sleep 0.25;
				_unit enableSimulation false;
			};
			if(vehicle _unit != _unit && !_inVehicle) then {
				_inVehicle = true;
				_unit enableSimulation true;
				[_unit] call AT_FNC_Revive_SwitchVehicleDeadAnimation;
				sleep 0.25;
				_unit enableSimulation false;
			};
			sleep 0.5;
		};
		_pos = getposATL _unit;
		
		// Player got revived
		//sleep 6;
		

		_unit enableSimulation true;
		_unit allowDamage true;
		_unit setCaptive false;
		
		sleep 0.5;
		_unit setPosATL _pos; //Fix the stuck in the ground bug

	};
};

AT_FNC_Revive_SwitchVehicleDeadAnimation = {
	private["_interpolates"];
	_unit = param[0];
	if(vehicle _unit != _unit) then {
		_interpolates = [(configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit),"interpolateTo",""] call BIS_fnc_returnConfigEntry;
		{
			if(typeName _x == "STRING") then {
				private["_stateAction"];
				if(configName (inheritsFrom (configfile >> "CfgMovesMaleSdr" >> "States" >> _x)) == "DefaultDie") then {
					[[_unit,_x],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
				};
			};
		} foreach _interpolates;
	};
};

AT_FNC_Revive_WatchVehicle = {
	private["_hnd"];
	_vehicle = param[0];
	_unit = param[2];
	if(local _unit && (_unit getVariable ["AT_Revive_isUnconscious",false])) then {
		_hnd = [_unit] spawn at_fnc_revive_ragdoll;
		waituntil{scriptDone _hnd};
		sleep 0.5;
		[[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
	};
};

AT_FNC_Revive_HandleRevive =
{
	private["_attendant"];
	_target = param [0,objNull];
	_fakUsed = param [1,false];
	
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
			
			if(AT_Revive_Camera==1) then {
				[[],"ATHSC_fnc_exit",_target] call BIS_fnc_MP;
			};

		};
		
		if (!isPlayer _target) then
		{
			_target enableSimulation true;
			_target allowDamage true;
			_target setCaptive false;
			[[_target,"amovppnemstpsraswrfldnon"],"at_fnc_revive_playMove",true] call BIS_fnc_MP;
		};
		
		_attendant = [(configfile >> "CfgVehicles" >> typeof player),"attendant",0] call BIS_fnc_returnConfigEntry; 
		if(_attendant == 1 && ("Medikit" in items player)) then {
			_target setDamage 0;
		} else {
			if(_fakUsed && ("FirstAidKit" in items player)) then {
				_target setDamage 0;
				player removeItem "FirstAidKit";
			} else {
				_target setDamage (random 0.3)+0.1;
			};
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
	
	[[player,"AcinPknlMstpSrasWrflDnon"],"at_fnc_revive_switchMove",true] call BIS_fnc_MP;
	
	//player playMoveNow "AcinPknlMstpSrasWrflDnon";
	
	

	_id = player addAction ["<t color=""#FFA500"">" + "Release" + "</t>", "Revive\reviveAction.sqf", ["release"], 10, true, true, "", "true"];
	
	
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
AT_FNC_Revive_AddVehicleWatchdog = {
	_vehicle = param[0];
	_EH = _vehicle getvariable ["AT_Revive_VehicleWatchdog",-1];
	if(_EH>=0) then {
		_EH = _vehicle addEventHandler ["GetOut", {_this spawn AT_FNC_Revive_WatchVehicle;}];
		_vehicle setvariable ["AT_Revive_VehicleWatchdog",_EH,false];
	};
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
AT_FNC_Revive_Check_Revive_FAK = 
{
	private["_return"];
	_return = [] call AT_FNC_Revive_Check_Revive;
	if(_return && ("FirstAidKit" in items player)) then {
		_return = true;
	} else {
		_return = false;
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
AT_FNC_Revive_Check_Putin = {
	private["_vehicle","_isDragging","_freeCargoPositions","_return"];
	_vehicle = cursortarget;
	_isDragging = player getVariable ["AT_Revive_isDragging",false];
	_freeCargoPositions = _vehicle emptyPositions "cargo";
	_return = false;
	if(_freeCargoPositions >0 && !isNull(_isDragging)) then {
		_return = true;
	};
	_return
};

AT_FNC_Revive_Check_Pullout = {
	private["_vehicle","_isDragging","_freeCargoPositions","_return"];
	_vehicle = cursortarget;
	_return = false;
	{
		if((_x getVariable ["AT_Revive_isUnconscious",false]) && (_x != _vehicle)) exitwith {
			_return = true;
		};
	} foreach (crew _vehicle);
	_return
};

AT_FNC_Revive_PutInVehicle = {
	private["_vehicle","_isDragging","_freeCargoPositions"];
	_vehicle = cursortarget;
	_isDragging = player getVariable ["AT_Revive_isDragging",objNull];
	_freeCargoPositions = _vehicle emptyPositions "cargo";
	if(_freeCargoPositions>0 && !isNull(_isDragging)) then {
		[] call AT_FNC_Revive_Release;
		sleep 0.5;
		[_isDragging,_vehicle] remoteExec ["AT_FNC_Revive_MoveInjuredInVehicle", _isDragging];
		[_vehicle] remoteExec ["AT_FNC_Revive_AddVehicleWatchdog", 0]; 
	};
};
AT_FNC_Revive_MoveInjuredInVehicle = {
	_injured = param[0];
	_vehicle = param[1];
	_injured moveInCargo _vehicle;
};
AT_FNC_Revive_PullPutVehicle = {
private["_vehicle","_isDragging","_freeCargoPositions"];
	_vehicle = cursortarget;
	{
		if((_x getVariable ["AT_Revive_isUnconscious",false])) exitwith {
			moveout _x;
		};
	} foreach (crew _vehicle);
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
			player switchCamera "Internal";
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
};

//AT_FNC_Revive_WashAshore = {
//	_player = param[0,objNull];
//	_center = SouthWest vectorAdd (NorthEast vectordiff SouthWest);
//	_radius = 10;
//	_wpos = [];
//	while{count(_wpos)<3 && (_player getVariable "AT_Revive_isUnconscious")} do {
//		_wpos = (position _player) findEmptyPosition [0,_radius];
//		if(count(_wpos)==3) then {
//			_wpos = _wpos isFlatEmpty [1, 0, 0.5, 1, 1, true, _player];
//		};
//		systemchat format["Checking %1 m (%2)",_radius,_wpos];
//		_radius = _radius + 10;
//		sleep 0.1;
//	};
//	if((_player getVariable "AT_Revive_isUnconscious")) then {
//		_player setpos _wpos;
//		_msg = format["%1 body washed ashore.",name _player];
//		[[_msg],"AT_FNC_Revive_GlobalMsg",true] call bis_fnc_MP;
//	};

//};
AT_FNC_Revive_WashAshore = {
	private["_unit","_center","_pos","_distance","_vec","_found","_npos"];

	_unit = param[0];

	_center = (position SouthWest) vectorAdd ((position NorthEast) vectordiff (position SouthWest));
	_pos = getpos _unit;
	_distance = _unit distance _center;
	_vec = [((_center select 0)-(_pos select 0))/_distance,((_center select 1)-(_pos select 1))/_distance];
	_found = false;
	
	for[{_i = 0},{_i<=_distance && !_found},{_i=_i+1}] do {
		_npos = [((_pos select 0)+(_vec select 0)*_i),((_pos select 1)+(_vec select 1)*_i) ,0];
		if(!(surfaceIsWater _npos)) then {
			_found = true;
			_pos = _npos;
		}
	};
	if(_found) then {
		sleep 1;
		if(_unit == player) then {
            titleText ["", "BLACK",1];
        };
		sleep 1;
		_unit setpos _pos; 
		_msg = format["%1's body washed ashore.",name _unit];
		[[_msg],"AT_FNC_Revive_GlobalMsg",true] call bis_fnc_MP;
		sleep 1;
	    if(_unit == player) then {
			titleFadeOut 1;
	    };
	} else {
		systemchat "Can't find dry land.";
	};
};