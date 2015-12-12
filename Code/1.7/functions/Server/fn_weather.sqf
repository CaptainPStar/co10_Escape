//[10,0.1,1,1,1,1] spawn {
A3E_fnc_changeWeather = {
	_time = param[0];
	_delta = param[1];
	_overcast = param[2];
	_rain = param[3];
	_fog = param[4];
	_lightning = param[5];
	systemchat "Weatherchange";
	private["_dOvercast","_dRain","_dLightning","_dFog","_steps"];
	_steps = (_time/_delta);
	_dOvercast = (_overcast - overcast)/_steps;
	_dRain = (_rain - rain)/_steps;
	_dFog = (_fog - fog)/_steps;
	_dLightning = (_lightning - lightnings)/_steps;
	
	for "_i" from 0 to _steps do {
		0 setovercast (overcast+_dOvercast);
		0 setrain (rain+_dRain);
		0 setfog (fog+_dFog);
		0 setlightnings (lightnings+_dLightning);
		systemchat str _dOvercast;
		forceWeatherChange;
		sleep _delta;
	};
};