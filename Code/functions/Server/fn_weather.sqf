params[["_initial",true]];
private _weatherTemplates = [];
//[overcast,rain,fog,lightnings]

//Clear
_weatherTemplates pushBack [0,0,0,0];

//Overcast
_weatherTemplates pushBack [0.6,0,0.2,0];
//Rain
_weatherTemplates pushBack [1.0,0,0.2,0];
//Fog
_weatherTemplates pushBack [0.4,0,[0.2+random 0.2,0.01,random 30 + 5],0];
//Storm
_weatherTemplates pushBack [1,0.2,0.1,1];
//Nightmare
_weatherTemplates pushBack [1,0,[0.4,0.01,random 20 + 5],1];
//Partly cloudy
_weatherTemplates pushBack [0.2,0,0,0];
//Cloudy
_weatherTemplates pushBack [0.4,0,0,0];
//Could get rainy
_weatherTemplates pushBack [0.6,0.1,0,0];
//Nice
_weatherTemplates pushBack [0.1,0,0,0];
//Morningmood
_weatherTemplates pushBack [0,0,[0.1+random 0.3,0.05,random 5 + 1],0];
//Morningmood2
_weatherTemplates pushBack [0,0,[0.1+random 0.2,0.075,random 10 + 5],0];
//Clear
_weatherTemplates pushBack [0,0,0,0];
//Clear
_weatherTemplates pushBack [0,0,0,0];
//Clear
_weatherTemplates pushBack [0,0,0,0];
//Overcast
_weatherTemplates pushBack [0.6,0,0.2,0];
//Overcast
_weatherTemplates pushBack [0.6,0,0.2,0];
//Cloudy
_weatherTemplates pushBack [0.4,0,0,0];
//Cloudy
_weatherTemplates pushBack [0.4,0,0,0];
//Make sure all used vars are initialised
if(isNil("A3E_Param_Weather")) then {
	A3E_Param_Weather = -1;
};
if(isNil("A3E_Param_DynamicWeather")) then {
	A3E_Param_DynamicWeather = 1;
};
if(isNil("A3E_Param_TimeMultiplier")) then {
	A3E_Param_TimeMultiplier = 1;
};
private _currentTemplate = [];
if(A3E_Param_Weather<0) then {
	_currentTemplate = _weatherTemplates select floor(random(count(_weatherTemplates)));
} else {
	if(A3E_Param_Weather<count(_weatherTemplates)) then {
		_currentTemplate = _weatherTemplates select A3E_Param_Weather;
	} else {
		_currentTemplate = _weatherTemplates select floor(random(count(_weatherTemplates)));
	};
};

private _weatherTransitionTime = 1800;
private _weatherWaitTime = 600;
private _rainDelay = 120; //Delay rainchange
if(_initial) then {
	_weatherTransitionTime = 0;
};
if(A3E_Param_DynamicWeather == 0) then {
	_weatherWaitTime = 60*60*24*A3E_Param_TimeMultiplier;
};

//Transition in _weatherTransitionTime ingame seconds
_weatherTransitionTime setovercast (_currentTemplate select 0);
if(abs(rain-(_currentTemplate select 1))<0.2 || _initial) then {
	_weatherTransitionTime setrain (_currentTemplate select 1);
} else {
	//Delay rain a bit of rainchange is to heavy. Otherwise rain will start before clouds appear or vice versa
	[(_currentTemplate select 1),_rainDelay/A3E_Param_TimeMultiplier,_weatherTransitionTime-(_rainDelay/A3E_Param_TimeMultiplier)] spawn {
		systemchat ("Delaying rain by "+str _time + " seconds");
		params["_rain","_time","_change"];
		sleep _time;
		_change setrain _rain;
	};
};
_weatherTransitionTime setfog (_currentTemplate select 2);
_weatherTransitionTime setlightnings (_currentTemplate select 3);

systemchat str _currentTemplate;

if(_initial) then {
	skiptime -24;
	skiptime 24;
	forceWeatherChange;
};
//Sleep _weatherTransitionTime ingame seconds
systemchat ("Weatherchange in "+str (_weatherTransitionTime/A3E_Param_TimeMultiplier) + " seconds");
sleep (_weatherTransitionTime/A3E_Param_TimeMultiplier);

//Keep the weather 10 realtime minutes
_weatherWaitTime*A3E_Param_TimeMultiplier setovercast (_currentTemplate select 0);
_weatherWaitTime*A3E_Param_TimeMultiplier setrain (_currentTemplate select 1);
_weatherWaitTime*A3E_Param_TimeMultiplier setfog (_currentTemplate select 2);
_weatherWaitTime*A3E_Param_TimeMultiplier setlightnings (_currentTemplate select 3);

//Keep the weather 10 minutes
systemchat ("Keeping weather for "+str (_weatherWaitTime) + " seconds");
sleep _weatherWaitTime;

if(A3E_Param_DynamicWeather == 1) then {
	systemchat "Restarting weather script";
	[false] spawn A3E_fnc_Weather;
} else {
	systemchat "Keeping weather constant";
};