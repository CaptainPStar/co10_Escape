/*  
randomWeather.sqf v 0.9
- Mission Random Weather Generator
- By Meatball

Script Requirements:

1) Put this code/script in a file named "randomWeather.sqf" in root mission folder.

2) Create a call in init.sqf that will run for the server and all clients.
    execVM "randomWeather.sqf";

3) Have the following code in the "class Params" section of your description.ext to create weather as a selectable parameter for the players.  

class Params
{
// paramsArray[0]
    class initialWeather {
        title = "initialWeather";
        values[] = {1,2,3,4,5,6,7};
        texts[] = {"Clear","Overcast","Light Rain","Heavy Rain","Light Fog","Heavy Fog","Random"};
        default = 7;
    }; 
}; 

*/


// Initial Server Weather Setup

//A variable (array) to syncronize the weather;
A3E_SyncWeather = [];


if(isServer) then {

// Set initial weather values based on parameter choice.  Make sure the # in the select below matches what # in the order of parameters (starting with 0) your initialWeather class is defined in the description.ext
initialWeather = (paramsArray select 3);  
 switch (initialWeather) do{
    case 1: {forecastOvercast = 0;forecastRain = 0;forecastFog = 0;forecastFogAlt = 0;forecastFogDecay = 0;forecastWindE = 1;forecastWindN = 1;};        // Clear
    case 2: {forecastOvercast = .30;forecastRain = .0;forecastFog = 0;forecastFogAlt = 0;forecastFogDecay = 0;forecastWindE = 2;forecastWindN = 2;};    // Overcast
    case 3: {forecastOvercast = .60;forecastRain = .30;forecastFog = .05;forecastFogAlt = 0;forecastFogDecay = 0;forecastWindE = 3;forecastWindN = 3;};  // Light Rain
    case 4: {forecastOvercast = .90;forecastRain = .60;forecastFog = .02;forecastFogAlt = 0;forecastFogDecay = 0;forecastWindE = 4;forecastWindN = 4;};  // Heavy Rain
    case 5: {forecastOvercast = .75;forecastRain = .10;forecastFog = .30;forecastFogAlt = 0;forecastFogDecay = 0;forecastWindE = 1;forecastWindN = 1;};  // Light Fog
    case 6: {forecastOvercast = .85;forecastRain = .20;forecastFog = .50;forecastFogAlt = 0;forecastFogDecay = 0;forecastWindE = 0;forecastWindN = 0;};  // Heavy Fog
    case 7: {forecastOvercast = random(1);forecastRain = random(1);forecastFog = random(.20);forecastFogAlt = 0;forecastFogDecay = 0;forecastWindE = (random(14)-7);forecastWindN = (random(14)-7);};    // Random
};

// Set up variable to track server weather updates.
    serverWeather = 0;

// Broadcast initial weather settings that were set based on parameter choice.
   	    A3E_SyncWeather = [forecastOvercast,forecastRain,forecastFog,forecastFogAlt,forecastFogDecay,forecastWindE,forecastWindN,serverWeather,1];
		publicVariable "A3E_SyncWeather";
};




// Server and Client weather set based on initial weather parameter values.
waitUntil {!isnil "serverWeather"};
	private["_date"];
	_date = date;
	86400 setOvercast forecastOvercast;
    86400 setFog [forecastFog,forecastFogDecay,forecastFogAlt];
    86400 setRain forecastRain;
    setWind [forecastWindE,forecastWindN,true];
    skipTime 24;
    simulWeatherSync;  
	setdate _date;
    
// Debug Hint
//hint "Initial Weather Setup";
    
// Server Loop to create a new weather forecast every 15 minutes.   
if(isServer) then {
    while {serverWeather >= 0} do {  // This will always be true and it will run as long as server runs.
    
	randOCorRain = ceil (random 2);  // Randomly pick a number, 1 or 2 to update Overcast (1) or Rain (2) this cycle since you can't to both.  If random value is Less than or equal to 1 Overcast will be updated this cycle, if value is greater than 1, update rain this cycle.
		
	    // Configure weather settings on server to match next 15 minute weather forecast.
        900 setFog [forecastFog,forecastFogDecay,forecastFogAlt];
		if (randOCorRain <= 1) then {
        900 setOvercast forecastOvercast;} else {
        900 setRain forecastRain;};
        sleep 900;
        setWind [forecastWindE,forecastWindN,true];

	// Create random numbers for next forecast.
		_randOvercast = (round((random(0.15)-0.075)*100))/100;
		_randRain = (round((random(0.15)-0.075)*100))/100;
		_randFog = (round((random(0.1)-0.05)*100))/100;
		_randFogAlt = random 20 - random 40;
		_randFogDecay = random(0.5);
		_randWindE = (round((random(1)-.5)*100))/100;
		_randWindN = (round((random(1)-.5)*100))/100;

	// Create next random overcast level and keep it between 0 and 1
		if (randOCorRain == 1) then {
	//	if (_randOvercast < 0) then {_randOvercast = (2.5*_randOvercast);  // Since Overcast adjusts down about 2.5x slower than it adjusts up, boost the amount of change if it's negative.
		forecastOvercast = forecastOvercast + _randOvercast;
		if (forecastOvercast > 1) then {forecastOvercast = forecastOvercast - (2*_randOvercast)};
		if (forecastOvercast < 0) then {forecastOvercast = forecastOvercast + (abs(2*_randOvercast))};
		}
		};

	// Create next random rain level and keep it between 0 and 1
		if (randOCorRain == 2) then {
	//	if (_randRain < 0) then {_randRain = (2.5*_randRain); // Since Rain adjusts down about 2.5x slower than it adjusts up, boost the amount of change if it's negative.
		forecastRain = forecastRain + _randRain;
		if (forecastRain > 1) then {forecastRain = forecastRain - (2*_randRain)};
		if (forecastRain < 0) then {forecastRain = forecastRain + (abs(2*_randRain))};
		};

	// Create next random fog level and keep between 0 and 0.5
		forecastFog = forecastFog + _randFog;
		if (forecastFog > 0.5) then {forecastFog = forecastFog - (2*_randFog)};
		if (forecastFog < 0) then {forecastFog = forecastFog + (abs(2*_randFog))};
		
	// Create next random E-W Wind level and keep between -10 and 10
		forecastWindE = forecastWindE + _randWindE;
		if (forecastWindE > 10) then {forecastWindE = forecastWindE - (2*_randWindE)};
		if (forecastWindE < -10) then {forecastWindE = forecastWindE + (abs(2*_randWindE))};
		
	// Create next random N-S Wind level and keep between -10 and 10
		forecastWindN = forecastWindN + _randWindN;
		if (forecastWindN > 10) then {forecastWindN = forecastWindN - (2*_randWindN)};
		if (forecastWindN < -10) then {forecastWindN = forecastWindN + (abs(2*_randWindN))};
		
	// Increment variable to track updates to server weather
		serverWeather = serverWeather + 1;

	// Debug Hint - Show Current and Forecast Overcast, Humidity, Fog and Wind Levels on the Server.
	//hint format ["Updating Server Forecast # %1 CO: %2 | CH: %3 | CR: %4 | CF: %5 |CW: %6\nFO: %7 | FR: %8 | FF: %9 | FW: %10,%11\nOC (1) or Rain (2) Next: %12",serverWeather,Overcast,Humidity,Rain,Fog,wind,forecastOvercast,forecastRain,forecastFog,forecastWindE,forecastWindN,randOCorRain];
		
	// Broadcast server weather forecast information to clients.

	    A3E_SyncWeather = [forecastOvercast,forecastRain,forecastFog,forecastFogAlt,forecastFogDecay,forecastWindE,forecastWindN,serverWeather,randOCorRain];
		publicVariable "A3E_SyncWeather";
		};
	};
};

if (!isServer) then {
// Non Server Weather loop

// Set up counter on client to compare local client weather serverWeather counter.
    clientWeather = 0;

// ###Run a continuous loop on the client to look for updated weather values from the server every 10 seconds.

// Add a function and a pubvar-handler to syncronize the weather
	a3e_fnc_syncWeather = {
	private["_newWeather"];
	_newWeather = _this;
	// If client Weather is older than the server weather, set client 15 minute weather forecast to match server.
        if (clientWeather < (_newWeather select 7)) then {
    
	// Set clientWeather counter to match serverWeather counter so local client weather will not update until next server weather update.
        clientWeather = clientWeather + 1;
        
		forecastOvercast = A3E_SyncWeather select 0;
		forecastRain = A3E_SyncWeather select 1;
		forecastFog = A3E_SyncWeather select 2;
		forecastFogAlt = A3E_SyncWeather select 3;
		forecastFogDecay = A3E_SyncWeather select 4;
		forecastWindE = A3E_SyncWeather select 5;
		forecastWindN = A3E_SyncWeather select 6;
		serverWeather = A3E_SyncWeather select 7;
		randOCorRain = A3E_SyncWeather select 8;
		
    // Debug Hint - Show Current and Forecast Overcast, Humidity, Fog and Wind Levels on the Client
     hint format ["Updated Client Forecast # %1 - CO: %2 | CH: %3 | CR: %4 | CF: %5 |CW: %6\nFO: %7 | FR: %8 | FF: %9 | FW: %10,%11\nOC (1) or Rain (2) Next: %12",clientWeather,Overcast,Humidity,Rain,Fog,wind,forecastOvercast,forecastRain,forecastFog,forecastWindE,forecastWindN,randOCorRain];
       
 	// Set 15 minute forecast for the client.
        900 setFog [forecastFog,forecastFogDecay,forecastFogAlt];
		if (randOCorRain == 1) then {
        900 setOvercast forecastOvercast;} else {
        900 setRain forecastRain;};
        sleep 900;
        setWind [forecastWindE,forecastWindN,true];
        };
    };
	"A3E_SyncWeather" addPublicVariableEventHandler {[_this select 1] call a3e_fnc_syncWeather;};
	
	while{count(A3E_SyncWeather)==0} do {
		sleep 1;
		hint "Wait for startup weather sync...";
	};
	[A3E_SyncWeather] call a3e_fnc_syncWeather;
	hint "Weather synced";
	
};
