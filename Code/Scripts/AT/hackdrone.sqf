
at_fnc_dh_init = {
	
	AT_DH_Sides = [east,west,resistance];
	AT_DH_Terminals = ["O_UavTerminal","B_UavTerminal","I_UavTerminal"];
	AT_DH_DronesPacked = ["O_UAV_01_backpack_F","B_UAV_01_backpack_F","I_UAV_01_backpack_F"];
	AT_DH_Drones = ["O_UAV_01_F","B_UAV_01_F","I_UAV_01_F"];
	
	player addAction ["Hack UAV Terminal", at_fnc_dh_hackUAVTerminal, [],1,false,true,"", "_this call at_fnc_dh_terminalCheck"];
	player addAction ["Hack packed UAV", at_fnc_dh_hackUAVBackpack, [],1,false,true,"", "_this call at_fnc_dh_backpackCheck"];
};

at_fnc_dh_hackUAVTerminal = {
	_unit = _this select 1;
	_side = side _unit;
	_sideNumber = AT_DH_Sides find _side;
	if(_sideNumber < 0) exitwith {systemchat "Your side was not found";};
	_unitItems = (items _unit);
	{
		if((_unitItems find _x)!=-1 && _forEachIndex != _sideNumber) exitwith {
			[[_unit,"AinvPknlMstpSlayWrflDnon_medic"],"at_fnc_dh_switchMove",true] call BIS_fnc_MP;
			[_unit,_x,(AT_DH_Terminals select _sideNumber)] spawn {
				sleep 6;
				if(alive (_this select 0)) then {
					(_this select 0) removeitem (_this select 1);
					(_this select 0) additem (_this select 2);
				};
			};
		};
	} foreach AT_DH_Terminals;
};
at_fnc_dh_hackUAVBackpack = {
	_unit = _this select 0;
	_side = side _unit;
	_sideNumber = AT_DH_Sides find _side;
	if(_sideNumber < 0) exitwith {systemchat "Your side was not found";};
	{
		if(backpack _unit == _x && _forEachIndex != _sideNumber) exitwith {
			[[_unit,"AinvPknlMstpSlayWrflDnon_medic"],"at_fnc_dh_switchMove",true] call BIS_fnc_MP;
			[_unit,(AT_DH_DronesPacked select _sideNumber)] spawn {
				sleep 6;
				if(alive (_this select 0)) then {
					removeBackpack (_this select 0);
					(_this select 0) addBackpack (_this select 1);
				};
			};
		};
	} foreach AT_DH_DronesPacked;
};

at_fnc_dh_terminalCheck = {
	_unit = _this;
	_side = side _unit;
	_sideNumber = AT_DH_Sides find _side;
	if(_sideNumber < 0) exitwith {false;};
	_return = false;
	_unitItems = (items _unit);
	{
		if(_forEachIndex != _sideNumber && _x in _unitItems) exitwith {
			_return = true;
		};
	} foreach AT_DH_Terminals;
	_return;
};
at_fnc_dh_backpackCheck = {
	_unit = _this;
	_side = side _unit;
	_sideNumber = AT_DH_Sides find _side;
	if(_sideNumber < 0) exitwith {false;};
	_backpack = (backpack _unit);
	if((AT_DH_DronesPacked find _backpack) != -1 && (AT_DH_DronesPacked find _backpack) != _sideNumber) exitwith {true;};
	false;
};
AT_FNC_dh_Switchmove = {
	private["_unit","_anim"];

	_unit = _this select 0;
	_anim = _this select 1;

	_unit switchmove _anim;	

};
call at_fnc_dh_init;