params["_side"];
//systemchat ("Trigger for "+_side);

missionnamespace setvariable ["A3E_var_PlayerCanBeDetected",false];

//Stupid workaround for side names, because "resistance" translates to "GUER" but not both ways...
switch(_side) do {
	case "EAST": { _side = east; };
	case "WEST": { _side = west; };
	case "GUER": { _side = resistance; };
	case "CIV": { _side = civilian; };
};
private _knowledgeThreshold = missionnamespace getvariable ["A3E_var_DetectionKnowledgeThreshold",2.5];
private _players = [] call A3E_fnc_GetPlayers;
if(({(_side knowsAbout (vehicle _x)) >= _knowledgeThreshold} count _players)==0) exitWith {
	//Side does not know enough about any player, all units "decided" they are not ready to report any strange sightings
	sleep 5;
	[] call A3E_fnc_PlayerDetection; //Refresh triggers
};
private _knownPlayers = (_players select {(_side knowsAbout (vehicle _x)) >= _knowledgeThreshold}); //All known players to _side
private _groups = allGroups select {side _x == _side};

private _reported = false;
scopeName "main";
{
	private _grp = _x;
	{
		if((_grp knowsAbout (vehicle _x)) >= _knowledgeThreshold && {alive _x} count (units _grp)>0) then {
			//We found a group that knows about a player.
			[_grp,_x] call {
				//This is the actual reporting code!
				params["_grp","_player"];
				private _reporter = selectRandom (units _grp);
				private _useAnim = false;
				private _sound = selectRandom (missionNamespace getvariable ["A3E_Radio_Reporting",["RadioAmbient2","RadioAmbient6","RadioAmbient8"]]);
				//sound[] = {"a3\sounds_f\sfx\radio\ambient_radio8",0.398107,1};
				[_reporter,[_sound,100,1,true,0]] remoteExec ["say3D",0];
				[_reporter,true] remoteexec ["setRandomLip",0];
				if(vehicle _reporter == _reporter) then {
					//Unit is on foot, lets make him play an animation
					//_reporter playmovenow "acts_listeningtoradio_in"
					[_reporter,"acts_listeningtoradio_loop"] remoteExec ["playmovenow", _reporter];
					//_reporter playmovenow "acts_listeningtoradio_loop";
					_useAnim = true;
				};
				private _reportTime = missionNamespace getvariable ["A3E_var_ReportTime",10];
				while{alive _reporter && _reportTime > 0} do {
					sleep 1;
					_reportTime = _reportTime - 1;
				};
				if(alive _reporter && _reportTime == 0) then {
						[_reporter,false] remoteexec ["setRandomLip",0];
					if(vehicle _reporter == _reporter) then {
						if((animationState _reporter) in ["acts_listeningtoradio_in","acts_listeningtoradio_loop","acts_listeningtoradio_out"]) then  {
							[_reporter,"acts_listeningtoradio_out"] remoteExec ["playmovenow", _reporter];
							[_reporter,_player] call A3E_fnc_recordSighting;
						} else {
							[] spawn {
								sleep 2; //Small delay for other people to notice reporter died
								[] call A3E_fnc_PlayerDetection; //Refresh triggers
							};
						};
					} else {
						[_reporter,_player] call A3E_fnc_recordSighting;
					};
				} else {
					//Report was not successfull. Reset detection states
					[] spawn {
						sleep 2; //Small delay for other people to notice reporter died
						[] call A3E_fnc_PlayerDetection; //Refresh triggers
					};
				};
			};
			_reported = true; //some reporting attempt was made
			breakTo "main";
		};
	} foreach _knownPlayers;

} foreach _groups;

if(!_reported) then {
	//Trigger fired but script was unable to make atleast one reporting attempt. Resetting triggers for next try
	sleep 5;
	[] call A3E_fnc_PlayerDetection;
};