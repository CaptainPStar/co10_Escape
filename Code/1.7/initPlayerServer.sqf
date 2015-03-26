private["_player","_didJIP","_players","_placed"];

_player = _this select 0;
_didJIP =  _this select 1;

if(name _player == "HC") then {
    ["HC present. Offloading AI."] spawn a3e_fnc_debugmsg;
    A3E_HC_ID = owner _player;
    if(A3E_HC_ID==0) exitwith {
         ["Getting HC ID failed!"] spawn a3e_fnc_debugmsg;
    };
} else {
    [format["%1 joined the Game!",name _player]] spawn a3e_fnc_debugmsg;
	
	if(isNil("A3E_Players")) then {
		A3E_Players = [];
	};
    A3E_Players = A3E_Players + [_player];
    publicVariable "A3E_Players";

    waituntil{sleep 0.1;(!isNil("A3E_FenceIsCreated") && !isNil("A3E_StartPos") && !isNil("A3E_ParamsParsed"))};
	
	_placed = false;
	if(time>10) then {
		_players = [] call A3E_fnc_GetPlayers;
		{
			if(_x != _player) exitwith {
				_player setpos [(getpos _x select 0) + (random 4) - 2, (getpos _x select 1) + (random 6) - 3, 0];
				_placed = true;
			};
		} foreach _players;	
	};
	if(!_placed) then {
		_player setpos [(A3E_StartPos select 0)+random 5.0-2.5,(A3E_StartPos select 1)+random 5.0-2.5,0];
		_player setdir (random 360);
	};

};
