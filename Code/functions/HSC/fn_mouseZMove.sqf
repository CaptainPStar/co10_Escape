params["_display","_d"];

ATHSC_CamDistance = ATHSC_CamDistance - _d;

if(ATHSC_CamDistance<2) then {
	ATHSC_CamDistance = 2;
};
if(ATHSC_CamDistance > 25) then {
	ATHSC_CamDistance = 25;
};
