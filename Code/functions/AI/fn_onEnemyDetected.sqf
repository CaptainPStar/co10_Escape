params ["_grp", "_newTarget"];

["Grp "+str _grp+" spotted enemy "+name _newTarget,["AI","SearchLeader"]] call A3E_fnc_log;

if(!(_newTarget in ([]call A3E_Fnc_GetPlayers))) exitwith {};

if(side _grp == civilian) then {

	private _score = missionNamespace getvariable ["A3E_Warcrime_Score",0];
	private _threshold = missionNamespace getvariable ["A3E_Warcrime_Score_CivilianFear",1000];
	private _lastReported = _grp getvariable ["A3E_LastReportedPlayer",0];

	if(( _grp knowsabout _newTarget)< 2.5) exitwith {};
	if(_score<_threshold) exitwith {};
	if(!(isPlayer _player)) exitwith {};
	if(time < (_lastReported+300)) exitwith {};
	
	private _unitsAbleToRadio = [];
	_unitsAbleToRadio = (units _grp) select {((_x distance _player) > 10) && (getSuppression _x <= 0) && (((stance _x == "STAND") && (_x distance _player) > 100) || (isHidden _x))};

	if(count(_unitsAbleToRadio) > 0) then 
	{
		[_unitsAbleToRadio,_player] call {
			//This is the actual reporting code!
			params["_units","_player"];

				private _reporter = selectRandom _unitsAbleToRadio;
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
							_grp setvariable ["A3E_LastReportedPlayer",time];
						};
					} else {
						[_reporter,_player] call A3E_fnc_recordSighting;
						_grp setvariable ["A3E_LastReportedPlayer",time];
					};
				} else {
					//Report was not successfull. Reset detection states
					if(vehicle _reporter == _reporter) then {
						[_reporter,false] remoteexec ["setRandomLip",0];
					};
				};
		};
	};

};