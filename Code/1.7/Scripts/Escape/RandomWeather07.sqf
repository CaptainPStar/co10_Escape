/*  
    randomWeather.sqf v 0.7
    By Meatball

    Script Requirements:

    1) Put this code/script in a file named "randomWeather.sqf" in root mission folder.

    2) Create a call in init.sqf that will run for the server and all clients.
        execVM "randomWeather.sqf";

    3) Have the following code in the "class Params" section of your description.ext to create weather as a selectable parameter for the players.  

        // paramsArray[3]
           class initialWeather {
              title = "Initial Weather";
              values[] = {1,2,3,4,5,6,7};
              texts[] = {"Clear","Overcast","Light Rain","Heavy Rain","Light Fog","Heavy Fog","Random"};
              default = 7;
           }; 
    4) Note: Due to issues with current A3 weather code, overall weather should work correctly, but clouds if overcast will not appear correctly at mission start.
*/



// On server, set forecast Weather from Parameter options chosen by players.
if (isServer) then {
    // Make sure the # in the select below matches what # in the order of parameters your initialWeather class is in the description.ext
    initialWeather = (paramsArray select 3);  
    switch (initialWeather) do {
        case 1: {forecastOvercast = 0; forecastRain = 0; forecastFog = 0; forecastWindE = .5 - random 1; forecastWindN = .5 - random 1;};            // Clear
        case 2: {forecastOvercast = .45; forecastRain = .45; forecastFog = 0; forecastWindE = 1 - random 2; forecastWindN = 1 - random 2;};    // Overcast
        case 3: {forecastOvercast = .70; forecastRain = .70; forecastFog = .05; forecastWindE = 1.5 - random 3; forecastWindN = 1.5 - random 3;};    // Light Rain
        case 4: {forecastOvercast = 1; forecastRain = 1; forecastFog = .05; forecastWindE = 2 - random 4; forecastWindN = 2 - random 4;};        // Heavy Rain
        case 5: {forecastOvercast = .75; forecastRain = .10; forecastFog = .30; forecastWindE = .5 - random 1; forecastWindN = .5 - random 1;};    // Light Fog
        case 6: {forecastOvercast = .85; forecastRain = .20; forecastFog = .50; forecastWindE = 0; forecastWindN = 0;};    // Heavy Fog
        case 7: {forecastOvercast = random(1); forecastRain = random(1); forecastFog = floor(random(2))*random(.80)^2; forecastWindE = (5 - random(10)); forecastWindN = (5 - random(10));};    // Random
    };

    // Set up variable to track server weather updates.
    serverWeather = 0;

    // Broadcast initial weather settings from parameters.    
    publicVariable "forecastOvercast";
    publicVariable "forecastRain";
    publicVariable "forecastFog";
    publicVariable "forecastWindE";
    publicVariable "forecastWindN";
    publicVariable "serverWeather";
};


// Set up initial weather for server and all clients using values from parameters.
waitUntil {!isnil "serverWeather"};
skiptime -24;
86400 setOvercast forecastOvercast;
86400 setFog forecastFog;
86400 setRain forecastRain;

//    simulSetHumidity forecastRain;
skipTime 24;
setWind [forecastWindE, forecastWindN, true];

// Debug Hint
//hint "Initial Weather Setup";


// Begin server loop to create a new weather forecast every 10 minutes.    
if (isServer) then {
    while {serverWeather >= 0} do {  // This will always be true and it will run as long as server runs.
    
        // Configure weather settings on server to match next 10 minute weather forecast.
        600 setOvercast forecastOvercast;
        600 setFog forecastFog;
        600 setRain forecastRain;
        sleep 600;
        setWind [forecastWindE, forecastWindN, true];

        // Create random numbers for next forecast.
        _randOvercast = (round((random(0.4)-0.2)*100))/100;
        _randRain = (round((random(0.4)-0.2)*100))/100;
        _randFog = (round((random(0.2)-0.1)*100))/100;
        _randWindE = (round((random(1)-0.5)*100))/100;
        _randWindN = (round((random(1)-0.5)*100))/100;

        // Create next random overcast level and keep it between 0 and 1
        forecastOvercast = forecastOvercast + _randOvercast;
        if (forecastOvercast > 1) then {forecastOvercast = forecastOvercast - (2*_randOvercast)};
        if (forecastOvercast < 0) then {forecastOvercast = forecastOvercast + (abs(2*_randOvercast))};

        // Create next random rain level and keep it between 0 and 1
        forecastRain = forecastRain + _randRain;
        if (forecastRain > 1) then {forecastRain = forecastRain - (2*_randRain)};
        if (forecastRain < 0) then {forecastRain = forecastRain + (abs(2*_randRain))};

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
        // hint format ["Updating Server Forecast # %1 CO: %2 | CH: %3 | CR: %4 | CF: %5 |CW: %6 | FO: %7 | FH: %8 | FR: %9 | FF: %10 | FW: %11,%12",serverWeather,Overcast,Humidity,Rain,Fog,wind,forecastOvercast,forecastHumidity,forecastRain,forecastFog,forecastWindE,forecastWindN];
        
        // Broadcast server weather forecast information to clients.
        publicVariable "forecastOvercast";
        publicVariable "forecastRain";
        publicVariable "forecastFog";
        publicVariable "forecastWindE";
        publicVariable "forecastWindN";
        publicVariable "serverWeather";
    };
};


if (!isServer) then {
    // Non Server Weather loop

    // Set up counter on client to compare local client weather serverWeather counter.
    clientWeather = 0;

    // Run a continuous loop on the client to look for updated weather values from the server every 10 seconds.
    while {clientWeather >= 0} do {
        sleep 10;

        // If client Weather is older than the server weather, set client 10 minute weather forecast to match server.
        if (clientWeather < serverWeather) then {
            // Set clientWeather counter to match serverWeather counter so local client weather will not update until next server weather update.
            clientWeather = clientWeather + 1;
            
            // Debug Hint - Show Current and Forecast Overcast, Humidity, Fog and Wind Levels on the Client
            // hint format ["Updated Client Forecast # %1 - CO: %2 | CH: %3 | CR: %4 | CF: %5 |CW: %6 | FO: %7 | FH: %8 | FR: %9 | FF: %10 | FW: %11,%12",clientWeather,Overcast,Humidity,Rain,Fog,wind,forecastOvercast,forecastHumidity,forecastRain,forecastFog,forecastWindE,forecastWindN];
            
            // Set 10 minute forecast for the client.
            600 setOvercast forecastOvercast;
            600 setFog forecastFog;
            600 setRain forecastRain;
            sleep 600;
            setWind [forecastWindE, forecastWindN, true];
        };
    };
};

