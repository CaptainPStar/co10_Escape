private _params = param[3];
private _target = cursortarget;
private _fakUsed = _params param [1,false];
if(!isnull _target) then {
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
			[_target,"amovppnemstpsraswrfldnon"] remoteExec ["playmove", 0, false];
			
			if(AT_Revive_Camera==1) then {
				[] remoteExec ["ATHSC_fnc_exit", _target, false];
			};

		};
		
		if (!isPlayer _target) then
		{
			_target enableSimulation true;
			_target allowDamage true;
			_target setCaptive false;
			[_target,"amovppnemstpsraswrfldnon"] remoteExec ["playmove", 0, false];
		};
		
		private _attendant = [(configfile >> "CfgVehicles" >> typeof player),"attendant",0] call BIS_fnc_returnConfigEntry; 
		if(_attendant == 1 && ("Medikit" in items player)) then {
			_target setDamage 0;
		} else {
			if(_fakUsed) then {
				if("FirstAidKit" in items player) then {
					_target setDamage 0;
					player removeItem "FirstAidKit";
				} else {
					if("FirstAidKit" in items _target) then {
						_target setDamage 0;
						_target removeItem "FirstAidKit";
					} else {
						_target setDamage (random 0.3)+0.1;
					};
				};
			} else {
				_target setDamage (random 0.3)+0.1;
			};
		};
	};
} else {
	systemchat "Target is null";
};