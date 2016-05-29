params["_unit","_object","_score"];
private _return = true;
if(((side _object == civilian && !isNil("a3e_var_Escape_SearchLeader_civilianReporting")) && _score<0) || (score _unit <= 0 && _score<0)) then {
	_return = false;
	diag_log ("Score of "+ (str _score) +" nulled for " + (str _unit) + " ("+ (str _object)+")");
};
_return;