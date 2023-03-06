/* Taviana garbage removal script to get rid of all the washing machines in the streets */
VZ_fnc_GarbageHider = {
	private ["_marker", "_allmarkers", "_garbageCounter", "_markerPos", "_markerSize"];
	if (((str allMapMarkers) find "GarbageHider") >= 0) then {
		diag_log "Taviana map garbage removal script has started!";
		"Taviana map garbage removal script has started! Please wait until script has executed before pressing continue to load into the mission!" remoteExec ["systemChat",0,false];
		_marker = "GarbageHider";
		_allmarkers = allMapMarkers;
		_garbageCounter = 0;
		{
		  if (((str _x) find _marker) >= 0) then {
		  _markerPos = markerPos _x;
		  _markerSize = markerSize _x select 0;
			{   
				if ((toUpper(str _x) find "WRECK") >= 0) then { if ((toUpper(str _x) find "SHIP") < 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};}; 
				if ((toUpper(str _x) find "WHEEL") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};  
				if ((toUpper(str _x) find "DEAD") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "ARMY") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "RUBBLE") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "GARB") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "JUNK") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "BARRICADE") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "STANEK") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "BUS") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "WHEEL") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "P_HERA") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "HILUX") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "BAREL") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "PIPES") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "FORT") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "RUINS") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "POSTEL") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "BAGS") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "CART") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "TENT") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "CHAIR") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "ANTENNA") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "STAND_WATER") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "FIRE") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "TOILET") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "POWERGENERATOR") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "CRASH") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "CAMONET") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;}; 
				if ((toUpper(str _x) find "ZIL") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "TYREHEAP") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "SENO") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "JEZEK") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "GUARDSHED") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "STAN_EAST") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "CONTAINER") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "COIL") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "BARRIER") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "MARKET") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "CARGO") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "BOARDS") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "KAMAZ_HASIC") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "CNCBLOCK") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "BEDNA") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "CRATES") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
				if ((toUpper(str _x) find "WAGON_BOX") >= 0) then {hideObjectGlobal _x; _garbageCounter = _garbageCounter + 1;};
			} foreach (nearestTerrainObjects [_markerPos, [], _markerSize, false, true]);
		  };
		} forEach _allmarkers;
		diag_log format["%1 map garbage objects removed.", _garbageCounter];
		[format["%1 map garbage objects removed. Script execution finished!", _garbageCounter]] remoteExec ["systemChat",0,false];
	} else {
		diag_log "No GarbageHider marker found! Probably not playing on Taviana. Script execution skipped.";
		//"Taviana map garbage removal script skipped, no garbage marker found!" remoteExec ["systemChat",0,false];
	};
};