if (!isServer) exitWith {};

/*
tort_DynamicWeather
Version: 1.08
Author: tortuosit; derived of a weather script by Meatball and edited by NeoArmageddon
Date: 20140612

Disclaimer: Feel free to use and modify this code. Please report errors and enhancements back so that anybody can profit.

*** Thread and documentation: http://forums.bistudio.com/showthread.php?178674 ***

How to use:
1 - Save this script into your mission directory as tort_DynamicWeather.sqf
2 - Call it with 0 = ["clear", "freeCycle", 0.1, [0.1, 0.3], 0, [0, 0.8]] execVM "\@tort_DynamicWeather\script\tort_DynamicWeather.sqf";
    Arguments and presets see http://forums.bistudio.com/showthread.php?178674.

THIS SCRIPT WON'T RUN ON DEDICATED SERVERS
*/

private ["_ocMin", "_ocMax", "_fogMin", "_fogMax", "_windMin", "_windMax", "_minVari", "_maxVari", "_transitionSpeed", "_fogMinHeight", "_fogMaxHeight", "_fogEnableGroundfog"];

// You can change the following values /////////////////////////////////////////
_fogEnableGroundfog = 1; // 0 or 1
_fogMinHeight = 5;
_fogMaxHeight = 50;
// Do not change anything after this line //////////////////////////////////////

_preset = _this select 0;
_trend = _this select 1;
_probRndChange =  _this select 2;
_variation = _this select 3;
_debugMode =  _this select 4;
_minMax = _this select 5;

if isNil "_preset" then {_preset="sunny"};
if isNil "_trend" then {_trend="freeCycle"};
if isNil "_probRndChange" then {_probRndChange = 0};
if isNil "_variation" then {
   _minVari = 0; _maxVari = 0.2;
} else {
   if (typeName _variation == "ARRAY") then {
      _minVari = _variation select 0; if isNil "_minVari" then {_minVari = 0};
      _maxVari = _variation select 1; if isNil "_maxVari" then {_maxVari = 0.2};
      } else {
      _minVari = 0; _maxVari = _variation;
   };
};
if isNil "_debugMode" then {_debugMode = 0};
if isNil "_minMax" then {
   _ocMin = 0; _ocMax = 1; _fogMin= 0; _fogMax = 1; _windMin = 0; _windMax = 1;
   } else {
   _ocMin = _minMax select 0; if isNil "_ocMin" then {_ocMin = 0};
   _ocMax = _minMax select 1; if isNil "_ocMax" then {_ocMax = 1};
   _fogMin = _minMax select 2; if isNil "_fogMin" then {_fogMin= 0};
   _fogMax = _minMax select 3; if isNil "_fogMax" then {_fogMax = 0.4};
   _windMin = _minMax select 4; if isNil "_windMin" then {_windMin = 0};
   _windMax = _minMax select 5; if isNil "_windMax" then {_windMax = 1};
};

// Set initial random weather presets
if (typeName _preset == "ARRAY") then {
   fOc = _preset select 0; fFogVal = _preset select 1; fWS = _preset select 2; fRain = _preset select 3; fWD = random 360;
   if isNil "fOc" then {fOc = random 1};  if isNil "fRain" then {fRain = round(random(0.35 + fOc)) * random fOc;}; if isNil "fFogVal" then {fFogVal = random 1}; if isNil "fWS" then {fWS = random 1};
} else {
   switch (_preset) do {
      case "clear": {fOc = 0; fRain = 0; fFogVal = 0; fWS = random 0.1; fWD = random 360; fRain = 0};
      case "cloudy": {fOc = 0.4 + random 0.15; fFogVal = random 0.015; fWS = 0.2 + random 0.6; fWD = random 360; fRain = 0};
      case "foggy":  {fOc = 0.3 + random 0.15; fFogVal = 0.7 + random 0.2; fWS = 0.3 + random(0.4); fWD = random 360; fRain = 0};
      case "bad": {fOc = 0.8 + random 0.15; fFogVal = 0.1 + random 0.1; fWS = 0.6 + random 0.4; fWD = random 360; fRain = 0.5 + random 0.5;};
      case "random": {fOc = _ocMin + random (_ocMax - _ocMin); fWS = _windMin + random (_windMax - _windMin); fWD = random(360);
         fFogVal = _fogMin + ((random 1) * random (_fogMax - _fogMin)); fRain = 0;}; // higher probability to lower fog values
      default {fOc = 0.3 + random 0.08; fFogVal = random 0.05; fWS = random 0.5; fWD = random 360; fRain = 0;}; //sunny
   };
};

// ground fog in the morning, only 5% chance of ground fog at other times
fFogDecay = (0.15 - (random 0.05) - (random 0.05) - (random 0.05)) * _fogEnableGroundfog;
fFogBase = (_fogMinHeight + random (_fogMaxHeight - _fogMinHeight)) * _fogEnableGroundfog;
if ((abs((date select 3) - 4) > 3) && (round(random 10) > 0)) then {
   fFogDecay = 0; fFogBase = 0;
};

// Presets have to respect borders
if (fOc < _ocMin) then {fOc = _ocMin}; if (fOc > _ocMax) then {fOc = _ocMax};
//if (fRain < _rainMin) then {fRain = _rainMin}; if (fRain > _rainMax) then {fRain = _rainMax};
// rainMin/Max - do they make sense? ArmA engines influence...
if (fFogVal < _fogMin) then {fFogVal = _fogMin}; if (fFogVal > _fogMax) then {fFogVal = _fogMax};
if (fWS < _windMin) then {fWS = _windMin}; if (fWS > _windMax) then {fWS = _windMax};

// set constants
cOc = fOc; cWS=fWS; cFog=fFogVal; cRain=fRain;

// apply initial weather
skiptime -24; 86400 setOvercast fOc; skiptime 24; 0 setRain 0;
sleep 0.5;simulWeatherSync;sleep 0.5;ForceWeatherChange;sleep 0.5;
0 setFog [fFogVal, fFogDecay, fFogBase]; 0 setWindStr fWS; 0 setWindDir fWD;

//if (_debugMode > 0) then {
sleep 5; hint format ["tort_DynamicWeather started. Initial weather: Overcast: %1 | Fog: %2 | Wind: %3 - Trend: %4 DebugMode: %5 / Rain is handled by ArmA",fOc,fFogVal,fWS,_trend,_debugMode];
//};

while {true} do {
   _transitionSpeed = 900; // 15 minutes weather cycles
   if ((_trend == "random") || ((random 1) < _probRndChange)) then {
      if (_debugMode > 0) then {hint format ["Next weather: RANDOM!"];};
      // completely random next weather, but inside user specified values
      fOc = _ocMin + random (_ocMax - _ocMin);
      // higher probability for low fog values
      if (abs((date select 3) - 4) > 3) then {
         fFogVal = _fogMin + ((random (_fogMax - _fogMin)) * (random 1) * (random 1));
         // if ((random 1) > (fOc * 0.2)) then {fFogVal = _fogMin};
      } else {
        // Morning: more fog possible
        fFogVal = _fogMin + (random (_fogMax - _fogMin));
      };
      //fFogVal = fFogVal - (_fogEnableGroundfog * 0.9 * fFogVal);
      fWS = _windMin + random (_windMax - _windMin);
      fWD = random(360);
   }
       else
   {
      // Create random numbers for next forecast.
      _randOc =_minVari + random (_maxVari - _minVari);
      _randFog =_minVari + random (_maxVari - _minVari);
      _randWS =_minVari + random (_maxVari - _minVari);
      _randWD = (round((random(90)-45)*10))/10;
      randTurbulence = random 1;

      switch (_trend) do {
         case "pBetter": {// 2/3 chance of weather getting better
            if ((random 3)>1) then {_randOc = -1 * _randOc;_randWS = -1 * _randWS;};
            if ((random 4)>1) then {_randFog = -1 * _randFog};
            // if wrong direction, then soft
            if (_randOc > 0) then {_randOc = _randOc * random 1};
            if (_randWS > 0) then {_randWS = _randWS * random 1};
            if (_randFog > 0) then {_randFog = _randFog * random 1}};
         case "pWorse": {// 2/3 chance of weather getting worse (except fog)
            if ((random 3)<1) then {_randOc = -1 * _randOc;_randWS = -1 * _randWS;};
            if ((random 3)>1) then {_randFog = -1 * _randFog};
            // if wrong direction, then soft
            if (_randOc < 0) then {_randOc = _randOc * random 1};
            if (_randWS < 0) then {_randWS = _randWS * random 1};
            if (_randFog < 0) then {_randFog = _randFog * random 1}};
         case "better":
            {_randOc = -1 * _randOc; _randWS = -1 * _randWS; _randFog = -1 * _randFog};
         case "worse":
            {if ((random 3)>1) then {_randFog = -1 * _randFog};};
         case "freeCycle": {
            if ((random 2)>1) then {_randOc = -1 * _randOc;_randWS = -1 * _randWS;};
            if ((random 3)>1) then {_randFog = -1 * _randFog}};
      };
      if (_trend == "constant")  then {
         if (_maxVari == 0) then {
            // if no variance, immediately return back to constant value
            fOc = cOc; fFogVal = cFog; fWS = cWS;
         } else {
         // move back to constant value in user def. variation steps
            fOcPrev = fOc; fFogValPrev = fFogVal; fWSPrev = fWS;
            if (fOc < (cOc - _maxVari)) then {fOc = fOc + _randOc;
               if (fOc > (cOc + _maxVari)) then {fOc = cOc + random _maxVari};};
            if (fOc > (cOc + _maxVari)) then {fOc = fOc - _randOc;
               if (fOc < (cOc - _maxVari)) then {fOc = cOc - random _maxVari};};
            if (fFogVal < (cFog - _maxVari)) then {fFogVal = fFogVal + _randFog;
               if (fFogVal > (cFog + _maxVari)) then {fFogVal = cFog + random _maxVari};};
            if (fFogVal > (cFog + _maxVari)) then {fFogVal = cFog - _randFog;
               if (fFogVal < (cFog - _maxVari)) then {fFogVal = cFog - random _maxVari};};
            if (fWS < (cWS - _maxVari)) then {fWS = fWS + _randWS;
               if (fWS > (cWS + _maxVari)) then {fWS = cWS + random _maxVari};};
            if (fWS > (cWS + _maxVari)) then {fWS = cWS - _randFog;
               if (fWS < (cWS - _maxVari)) then {fWS = cWS - random _maxVari};};
            if (fOc == fOcPrev) then {fOc = cOc + _minVari - random (2 * _minVari)};
            if (fFogVal == fFogValPrev) then {fFogVal = cFog + _minVari - random (2 * _minVari);};
            if (fWS == fWSPrev) then {fWS = cWS + _minVari - random (2 * _minVari);};
            if (fOc < _ocMin) then {fOc = _ocMin}; if (fOc > _ocMax) then {fOc = _ocMax};
            //if (fRain < _rainMin) then {fRain = _rainMin}; if (fRain > _rainMax) then {fRain = _rainMax};
            if (fFogVal < _fogMin) then {fFogVal = _fogMin}; if (fFogVal > _fogMax) then {fFogVal = _fogMax};
            if (fWS < _windMin) then {fWS = _windMin}; if (fWS > _windMax) then {fWS = _windMax};
         };
      }
      else
      {
         // Create next random overcast level and keep it between borders
         // if value exceeds border, choose a new value between border and _maxVari
         fOc = fOc + _randOc;
         if (fOc > _ocMax) then {fOc = _ocMax - (random(_maxVari))};
         if (fOc < _ocMin) then {fOc = _ocMin + (random(_maxVari))};
         // Create next random fog level  //keep fog rather low
         fFogVal = fFogVal + _randFog;
         if (abs((date select 3) - 4) > 3) then {
            if ((random 1) > (fOc * 0.2)) then {fFogVal = _fogMin};
         } else {
            if ((random 1) < 0.2) then {fFogVal = _fogMin + random(_maxVari)};
         };
         if (fFogVal > _fogMax) then {fFogVal = _fogMax - _minVari - (random(_maxVari))};
         if (fFogVal < _fogMin) then {fFogVal = _fogMin};
         // Create next random Wind level
         fWS = fWS + _randWS;
         if (fWS > _windMax) then {fWS = _windMax - (random(_maxVari))};
         if (fWS < _windMin) then {fWS = _windMin + (random(_maxVari))};
         // Create next random Wind Dir level and keep between [0 .. 360[
         if (randTurbulence > 0.8) then {fWD = random(360);} else {fWD = fWD + _randWD;};
         if (fWD >= 360 ) then {fWD = fWD - 360};
         if (fWD < 0) then {fWD = 360 + fWD};
      };
   };

   // ground fog in the morning, only 5% chance at other times
   fFogDecay = (0.15 - (random 0.05) - (random 0.05) - (random 0.05)) * _fogEnableGroundfog;
   fFogBase = (_fogMaxHeight - random (0.25 * (_fogMaxHeight - _fogMinHeight)) - random (0.25 * (_fogMaxHeight - _fogMinHeight)) - random (0.25 * (_fogMaxHeight - _fogMinHeight)) - random (0.25 * (_fogMaxHeight - _fogMinHeight))) * _fogEnableGroundfog;
   if ((abs((date select 3) - 4) > 3) && (round(random 10) > 0)) then {
      fFogDecay = 0; fFogBase = 0;
   };

   if (_debugMode > 0) then {sleep 1; hint format ["Weather forecast from %1:%2h: Overcast: %3 | Fog: %4 | Decay: %5 | Base: %6 | Wind: %7",date select 3,date select 4,round(fOc*100)/100,round(fFogVal*100)/100,round(fFogDecay*100)/100,round(fFogBase*100)/100,round(fWS*100)/100];};
   if (_debugMode > 1) then {
      // debug apply weather quickly
      1800 setOvercast fOc;
      2 setRain 0;
      2 setFog [fFogVal, fFogDecay, fFogBase];
      2 setWindStr fWS;
      2 setWindDir fWD;
      sleep 2;
      skiptime (1/6);
   } else {
      // apply new weather
      _transitionSpeed setOvercast fOc; floor(5 + random 30) setRain 0;
      floor(_transitionSpeed * (0.3 + random (0.7*_maxVari))) setFog [fFogVal, fFogDecay, fFogBase];
      floor(_transitionSpeed * (0.3 + random (0.7*_maxVari))) setWindStr fWS;
      floor(_transitionSpeed * (0.3 + random (0.7*_maxVari))) setWindDir fWD;
      sleep _transitionSpeed;
   };
};