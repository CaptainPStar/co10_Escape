params["_player"];
private["_placed"];


diag_log format["fn_initPlayer run for %1", name _player];


//[format["%1 joined the Game!",name _player]] spawn a3e_fnc_debugmsg;
//if(!isNil("paramsArray")) then {
//paramsArray call A3E_fnc_WriteParamBriefing;
//};


_player addeventhandler["HandleScore","_this call A3E_FNC_handleScore;"];

[_player, true] remoteExec ["setCaptive", _player, false];
diag_log format["Escape debug: %1 is waiting for prison creation.", name _player];

//Wait until most of the mission is loaded and the player is locally ready (means no weapons etc)
waituntil{uiSleep 0.5;(!isNil("A3E_FenceIsCreated") && !isNil("A3E_StartPos") && !isNil("A3E_ParamsParsed"))};

diag_log format["Escape debug: Player %1 is ready and will be placed by the server.", name _player];
_placed = false;
if(!isNil("A3E_EscapeHasStarted")) then {
	private _players = [] call A3E_fnc_GetPlayers;
	//Remove player from list
	_players deleteAt (_players find _player); 
	while{(count _players) > 0 && !_placed} do {
		private _refPlayer = selectRandom _players;
		private _refVehicle = vehicle _refPlayer;
		if((_refVehicle != _refPlayer) && ((_refVehicle) emptyPositions "Commander">0 || (_refVehicle) emptyPositions "Driver">0 || (_refVehicle) emptyPositions "Gunner">0 || (_refVehicle) emptyPositions "Cargo">0)) then {
				//_player moveInAny _refVehicle;
				//Teleports the player remotely into the Vehicle, needs to be called local at player
				[_player,_refVehicle] remoteExec ["moveInAny", _player]; 
				sleep 0.5;
				if(_player in _refVehicle) then {
					_placed = true;
					diag_log format["Escape debug: %1 placed at %2 in cargo of vehicle.", name _player, name _refPlayer];
				} else {
					diag_log format["Escape debug: Unable to playe %1 in cargo of %2", name _player, name _refPlayer];
					_placed = false;
				};
			} else {
				_player setpos [(getpos _refPlayer select 0) + (random 4) - 2, (getpos _refPlayer select 1) + (random 6) - 3, 0];
				_placed = true;
				diag_log format["Escape debug: %1 placed at %2.", name _player, name _refPlayer];
			};
		//Remove the player to test another one
		_players deleteAt (_players find _refPlayer); 				
	};
};
if(!_placed) then {
	_player setpos [(A3E_StartPos select 0)+random 3.0-1.5,(A3E_StartPos select 1)+random 3.0-1.5,0];
	_player setdir (random 360);
	diag_log format["Escape debug: %1 placed at prison.", name _player];
};
uiSleep 0.5;
diag_log format["Escape debug: %1 is now ready (serverside).", name _player];

//A3E_PlayerInitializedServer means the player was placed in Prison and is ready for the "Intro"
_player setvariable["A3E_PlayerInitializedServer",true,true];

waituntil{!isNil("A3E_EscapeHasStarted")};

[_player, false] remoteExec ["setCaptive", _player, false];

