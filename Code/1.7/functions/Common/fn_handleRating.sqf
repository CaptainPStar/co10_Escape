params["_unit","_rating"];

if(rating _unit <= 0 && _rating<0) then {
	_rating = 0;
	diag_log ("Rating of "+ (str _rating) +" nulled for " + (str _unit));
}; 
_rating;