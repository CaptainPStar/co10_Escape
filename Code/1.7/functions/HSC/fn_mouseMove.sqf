params["_display","_x","_y"];

ATHSC_CamAngle = ATHSC_CamAngle + _y*0.3;
ATHSC_CamDir = ATHSC_CamDir + _x*0.6;

if(ATHSC_CamAngle<5) then {
	ATHSC_CamAngle = 5;
};
if(ATHSC_CamAngle > 85) then {
	ATHSC_CamAngle = 85;
};
if(ATHSC_CamDir>=360) then {
	ATHSC_CamDir = ATHSC_CamDir%360;
};
if(ATHSC_CamDir<-360) then {
	ATHSC_CamDir = ATHSC_CamDir%360;
};