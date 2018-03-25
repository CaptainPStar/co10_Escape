private["_enemysNear","_targetUnconscious","_targetName","_line1","_line2","_control","_text"];
disableSerialization;
_enemysNear = [_this,0,false] call bis_fnc_param;
_targetUnconscious = [_this,1,false] call bis_fnc_param;
_targetName = [_this,2,"Respawn"] call bis_fnc_param;
if(ATHSC_CamTarget == player) then {
	_line1 = format["<t color='#ffffff' shadow='2'>You are unconscious!</t>",_targetName];
} else {
	_line1 = format["<t color='#ffffff' shadow='2'>You are watching</t> <t color='#e9630d' shadow='2'>%1</t>",_targetName];
};
_line2 = "";
if(_enemysNear) then {
	_line2 = "<t color='#ff0000' shadow='2'>" + format["Can't spawn. Enemys are near!"] + "</t>";
} else {
	if(_targetUnconscious) then {
		_line2 = "<t color='#ff0000' shadow='2'>" + "Can't spawn. Unit is unconscious!" + "</t>";
	} else {
		if(ATHSC_AttempRespawn) then {
			_line2 = "<t color='#00ff00' shadow='2'>" + format["Respawn in %1",ATHSC_AttempRespawnCounter] + "</t>";
		} else {
			_line2 = "<t color='#00ff00' shadow='2'>" + format["Press space to respawn at %1.",_targetName] + "</t>";
		};
	};
};

_control = (uiNamespace getVariable ['ATHSC_View', displayNull]) displayCtrl 170002;

if(!isNull _control) then {
	if(AT_Revive_enableRespawn) then {
		_control ctrlSetStructuredText parseText (_line1 + "<br/>" + _line2);
	} else {
		_control ctrlSetStructuredText parseText (_line1);
	};
};