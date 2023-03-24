
at_fnc_dh_init = {
	
	AT_DH_Sides = [east,west,resistance];
	AT_DH_Terminals = ["O_UavTerminal","B_UavTerminal","I_UavTerminal"];
	AT_DH_DronesPacked = ["O_UAV_01_backpack_F","B_UAV_01_backpack_F","I_UAV_01_backpack_F"];
	AT_DH_Drones = ["O_UAV_01_F","B_UAV_01_F","I_UAV_01_F"];
	
	player addAction ["Hack UAV Terminal", at_fnc_dh_hackUAVTerminal, [],1,false,true,"", "_this call at_fnc_dh_terminalCheck"];
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
AT_FNC_dh_Switchmove = {
	private["_unit","_anim"];

	_unit = _this select 0;
	_anim = _this select 1;

	_unit switchmove _anim;	

};