//Clouds
private _weatherParamOvercast = if (A3E_Param_WeatherOvercast isEqualTo -1) then {
    selectrandomweighted [0,100,1,400,2,800,3,1000,4,1000,5,700,6,600,7,400,8,300,9,200,10,100];

} else {
    A3E_Param_WeatherOvercast
};

switch _weatherParamOvercast do {
    //Cloudless
    case 0: {
        0 setovercast 0;
	};
    //10% Overcast
    case 1: {
		0 setovercast random [0.05,0.1,0.15];
	};
	//20% Overcast
	case 2: {
		0 setovercast random [0.15,0.2,0.25];
	};
	//30% Overcast
	case 3: {
		0 setovercast random [0.25,0.3,0.35];
	};
	//40% Overcast
	case 4: {
		0 setovercast random [0.35,0.4,0.45];
	};
	//50% Overcast (Mimimum needed for rain to appear)
	case 5: {
        0 setovercast random [0.5,0.525,0.55];
    };
	//60% Overcast
	case 6: {
        0 setovercast random [0.55,0.6,0.65];
    };
	//70% Overcast
	case 7: {
        0 setovercast random [0.65,0.7,0.75];
    };
	//80% Overcast
	case 8: {
        0 setovercast random [0.75,0.8,0.85];
    };
	//90 % Overcast
	case 9: {
        0 setovercast random [0.85,0.90,0.95];
    };
	//100% Overcast
	case 10: {
        0 setovercast 1;
    };
};

//Fog
private _weatherParamFog = if (A3E_Param_WeatherFog isEqualTo -1) then {
    selectrandomweighted [0,10000,1,500,2,400,3,300,4,200,5,100,6,90,7,80,8,70,9,60,10,50];

} else {
    A3E_Param_WeatherFog
};

switch _weatherParamFog do {
    //No Fog
    case 0: {
        0 setFog 0;
	};
    //10% Fog
    case 1: {
		0 setFog random [0.05,0.1,0.15];
	};
	//20% Fog
	case 2: {
		0 setFog random [0.15,0.2,0.25];
	};
	//30% Fog
	case 3: {
		0 setFog random [0.25,0.3,0.35];
	};
	//40% Fog
	case 4: {
		0 setFog random [0.35,0.4,0.45];
	};
	//50% Fog
	case 5: {
        0 setFog random [0.45,0.5,0.55];
    };
	//60% Fog
	case 6: {
        0 setFog random [0.55,0.6,0.65];
    };
	//70% Fog
	case 7: {
        0 setFog random [0.65,0.7,0.75];
    };
	//80% Fog
	case 8: {
        0 setFog random [0.75,0.8,0.85];
    };
	//90 % Fog
	case 9: {
        0 setFog random [0.85,0.90,0.95];
    };
	//100% Fog (I can't see a damn thing!)
	case 10: {
        0 setFog 1;
    };
};

//Wind
private _weatherParamWind = if (A3E_Param_WeatherWind isEqualTo -1) then {
    selectrandomweighted [1,100,2,4000,3,2000,4,1000,5,500,6,400,7,300,8,200,9,100,10,50];

} else {
    A3E_Param_WeatherWind
};

switch _weatherParamWind do {
    //Let's the engine decide
    //case 0: {}; leaving this commented out for testing purposes
    //No Wind
    case 1: {
		setwind [0,0,true];
	};
	//Lv 1 Wind
	case 2: {
		setwind selectrandom 
		[[random [0,1,2], random 2, true],
		[random 2, random [0,1,2], true],
		
		[random [0,-1,-2], random -2, true],
		[random -2, random [0,-1,-2], true],
		
		[random [0,1,2], random -2, true],
		[random -2, random [0,1,2], true],
		
		[random [0,-1,-2], random 2, true],
		[random 2, random [0,-1,-2], true]];
	};
	//Lvl 2 Wind
	case 3: {
		setwind selectrandom 
		[[random [1,2,3], random 3, true],
		[random 3, random [1,2,3], true],
		
		[random [-1,-2,-3], random -3, true],
		[random -3, random [-1,-2,-3], true],
		
		[random [1,2,3], random -3, true],
		[random -3, random [1,2,3], true],
		
		[random [-1,-2,-3], random 3, true],
		[random 3, random [-1,-2,-3], true]];
	};
	//Lvl 3 Wind (Start to see the effects on smoke around here)
	case 4: {
		setwind selectrandom 
		[[random [2,3,4], random 4, true],
		[random 4, random [2,3,4], true],
		
		[random [-2,-3,-4], random -4, true],
		[random -4, random [-2,-3,-4], true],
		
		[random [2,3,4], random -4, true],
		[random -4, random [2,3,4], true],
		
		[random [-2,-3,-4], random 4, true],
		[random 4, random [-2,-3,-4], true]];
	};	
	//Lvl 4 Wind 
	case 5: {
		setwind selectrandom 
		[[random [3,4,5], random 5, true],
		[random 5, random [3,4,5], true],
		
		[random [-3,-4,-5], random -5, true],
		[random -5, random [-3,-4,-5], true],
		
		[random [3,4,5], random -5, true],
		[random -5, random [3,4,5], true],
		
		[random [-3,-4,-5], random 5, true],
		[random 5, random [-3,-4,-5], true]];
	};
	//Lvl 5 Wind (Smoke grenades are less effective)
	case 6: {
		setwind selectrandom 
		[[random [4,5,6], random 6, true],
		[random 6, random [4,5,6], true],
		
		[random [-4,-5,-6], random -6, true],
		[random -6, random [-4,-5,-6], true],
		
		[random [4,5,6], random -6, true],
		[random -6, random [4,5,6], true],
		
		[random [-4,-5,-6], random 6, true],
		[random 6, random [-4,-5,-6], true]];
	};
	//Lvl 6 Wind
	case 7: {
		setwind selectrandom 
		[[random [5,6,7], random 7, true],
		[random 7, random [5,6,7], true],
		
		[random [-5,-6,-7], random -7, true],
		[random -7, random [-5,-6,-7], true],
		
		[random [5,6,7], random -7, true],
		[random -7, random [5,6,7], true],
		
		[random [-5,-6,-7], random 7, true],
		[random 7, random [-5,-6,-7], true]];
	};
	//Lvl 7 Wind (Smoke Grenades are useless at this point)
	case 8: {
		setwind selectrandom 
		[[random [6,7,8], random 8, true],
		[random 8, random [6,7,8], true],
		
		[random [-6,-7,-8], random -8, true],
		[random -8, random [-6,-7,-8], true],
		
		[random [6,7,8], random -8, true],
		[random -8, random [6,7,8], true],
		
		[random [-6,-7,-8], random 8, true],
		[random 8, random [-6,-7,-8], true]];
	};
	//Lvl 8 Wind
	case 9: {
		setwind selectrandom 
		[[random [7,8,9], random 9, true],
		[random 9, random [7,8,9], true],
		
		[random [-7,-8,-9], random -9, true],
		[random -9, random [-7,-8,-9], true],
		
		[random [7,8,9], random -9, true],
		[random -9, random [7,8,9], true],
		
		[random [-7,-8,-9], random 9, true],
		[random 9, random [-7,-8,-9], true]];
	};
	//Lvl 9 Wind 
	case 10: {
		setwind selectrandom 
		[[random [8,9,10], random 10, true],
		[random 10, random [8,9,10], true],
		
		[random [-8,-9,-10], random -10, true],
		[random -10, random [-8,-9,-10], true],
		
		[random [8,9,10], random -10, true],
		[random -10, random [8,9,10], true],
		
		[random [-8,-9,-10], random 10, true],
		[random 10, random [-8,-9,-10], true]];
	};
	//Lvl 10 Wind (Game wasn't designed for wind at this point.  Doesn't affect performance, but does affect fun)
	case 11: {
		setwind selectrandom 
		[[random [10,15,20], random 20, true],
		[random 20, random [10,15,20], true],
		
		[random [-10,-15,-20], random -20, true],
		[random -20, random [-10,-15,-20], true],
		
		[random [10,15,20], random -20, true],
		[random -20, random [10,15,20], true],
		
		[random [-10,-15,-20], random 20, true],
		[random 20, random [-10,-15,-20], true]];
	}; 
	//Lvl 11 Wind
	case 12: {
		setwind selectrandom 
		[[random [20,40,60], random 60, true],
		[random 60, random [20,40,60], true],
		
		[random [-20,-40,-60], random -60, true],
		[random -60, random [-20,-40,-60], true],
		
		[random [20,40,60], random -60, true],
		[random -60, random [20,40,60], true],
		
		[random [-20,-40,-60], random 60, true],
		[random 60, random [-20,-40,-60], true]];
	}; 
	//Lvl 1337 Wind
	case 13: {
		setwind selectrandom 
		[[random [60,80,100], random 100, true],
		[random 100, random [60,80,100], true],
		
		[random [-60,-80,-100], random -100, true],
		[random -100, random [-60,-80,-100], true],
		
		[random [60,80,100], random -100, true],
		[random -100, random [60,80,100], true],
		
		[random [-60,-80,-100], random 100, true],
		[random 100, random [-60,-80,-100], true]];
	}; 
	//Lvl 9001 Wind (Doesn't get any higher than this)
	case 14: {
		setwind selectrandom 
		[[100, random 100, true],
		[random 100, 100, true],
		
		[-100, random -100, true],
		[random -100, -100, true],
		
		[100, random -100, true],
		[random -100, 100, true],
		
		[-100, random 100, true],
		[random 100, -100, true]];
	}; 
};

//Rain
private _weatherParamRain = if (A3E_Param_WeatherRain isEqualTo -1) then {
    selectrandomweighted [1,40000,2,500,3,500,4,500,5,500,6,500,7,500,8,500,9,500,10,500,11,500];

} else {
    A3E_Param_WeatherRain
};

switch _weatherParamRain do {
    //Let's the engine decide
   // case 0: {};  leaving this commented out for testing purposes
    //No Rain
    case 1: {
		0 setrain 0;
		999999 setrain 0; //quirk of the engine, if "manual override" in the eden editor is not selected when overcast is high enough rain is all but certain.  setting immediate no rain and then a ridiculously long no rain ensures the engine won't override first immediate no rain command.  doing it this way allows the engine to take over on other settings where there can be rain
	};
    //10% Rain
    case 2: {
		0 setRain random [0.05,0.1,0.15];
	};
	//20% Rain
	case 3: {
		0 setRain random [0.15,0.2,0.25];
	};
	//30% Rain
	case 4: {
		0 setRain random [0.25,0.3,0.35];
	};
	//40% Rain
	case 5: {
		0 setRain random [0.35,0.4,0.45];
	};
	//50% Rain
	case 6: {
        0 setRain random [0.45,0.5,0.55];
    };
	//60% Rain
	case 7: {
        0 setRain random [0.55,0.6,0.65];
    };
	//70% Rain
	case 8: {
        0 setRain random [0.65,0.7,0.75];
    };
	//80% Rain
	case 9: {
        0 setRain random [0.75,0.8,0.85];
    };
	//90 % Rain
	case 10: {
        0 setRain random [0.85,0.90,0.95];
    };
	//100% Rain
	case 11: {
        0 setRain 1;
    };
};
forceWeatherChange;























