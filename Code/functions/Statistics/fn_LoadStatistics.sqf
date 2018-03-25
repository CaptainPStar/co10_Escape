private _statisticsVersion = profileNamespace getVariable ["A3E_Statistics_Version", -1]; 
private _statistics = profileNamespace getVariable ["A3E_Statistics", []]; 


private _played = 0;
private _escaped = 0;
private _failed = 0;
private _longest = 0;
private _shortest = 0;
private _escapedPrison = 0;
private _mapFound = 0;
private _comHacked = 0;
private _kurzvormklo = 0;
private _civskilled = 0;
//[_version,_mod,_island,_endType, count allPlayers, time, A3E_Task_Prison_Complete,A3E_Task_Map_Complete,A3E_Task_ComCenter_Complete,A3E_Task_Exfil_Complete];

{
	_played = _played + 1;
	private _won = false;
	if((_x select 3) in ["end2","end4"]) then {
		_escaped = _escaped +1;
		_won = true;
	} else {
		_failed = _failed + 1;
	};
	if((_x select 3) == "end2","end4") then {
		_civskilled = _civskilled + 1; 
	};
	if((_x select 5)>_longest && _won) then {
		_longest = (_x select 5);
	};
	if(((_x select 5)<_shortest || _shortest == 0) && _won) then {
		_shortest = (_x select 5);
	};
	if(_x select 6) then {
		_escapedPrison = _escapedPrison + 1;
	};
	if(_x select 7) then {
		_mapFound = _mapFound + 1;
	};
	if(_x select 8) then {
		_comHacked = _comHacked + 1;
	};
	if((_x select 9) && !_won) then {
		_kurzvormklo = _kurzvormklo + 1;
	};
} foreach _statistics;

private _statisticText = "Statistics for this Server:<br/><br/>";
_statisticText = _statisticText + format["Escapes played: %1<br/>",_played];
_statisticText = _statisticText + format["Escaped: %1<br/>",_escaped];
_statisticText = _statisticText + format["Failed: %1<br/>",_failed];
if(_longest>0) then {
	_statisticText = _statisticText + format["Longest successful Escape: %1 Minutes<br/>",round(_longest)];
};
if(_shortest>0) then {
	_statisticText = _statisticText + format["Shortest successful Escape: %1 Minutes<br/>",round(_shortest)];
};
if((_escapedPrison)>0) then {
	_statisticText = _statisticText + format["<br/>successfully escape the prison %1 times.<br/>",_escapedPrison];
};
if((_played - _mapFound)>0) then {
	_statisticText = _statisticText + format["<br/>%1 sessions ended before a map was found.<br/>",(_played - _mapFound)];
};
if((_comHacked)>0) then {
	_statisticText = _statisticText + format["<br/>%1 times a ComCenter was hacked.<br/>",_comHacked];
};
if((_kurzvormklo)>0) then {
	_statisticText = _statisticText + format["<br/>The mission failed %1 times even though the the helicopters were reached.<br/>",_kurzvormklo];
};
if((_civskilled)>0) then {
	_statisticText = _statisticText + format["<br/>%1 times the players escaped but were court-martialed for conducting war crimes.<br/>",_civskilled];
};
_statisticText remoteExec ["A3E_fnc_WriteStatisticsToBriefing", 0, true]; 