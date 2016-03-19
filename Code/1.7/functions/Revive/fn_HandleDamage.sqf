params["_unit","_bodyPart","_amountOfDamage","_killer","_projectile"];
private _isUnconscious = _unit getVariable "AT_Revive_isUnconscious";
//["HitFace","HitNeck","HitPelvis","HitAbdomen","HitDiaphragm","HitChest","HitArms","HitHead","HitBody","HitHands","HitLegs"]
//["face_hub","neck","pelvis","spine1","spine2","spine3","arms","head","body","hands","legs"]
if (alive _unit && 
	_amountOfDamage >= 1  
	&& !(_isUnconscious) 
	&& _bodyPart in ["","head","face_hub","head_hit","neck","spine1","spine2","spine3","pelvis","body"]) then 
{
	_unit setDammage 0;
	_unit allowDammage false;
	_amountOfDamage = 0;
	[_unit, _killer] spawn ATR_FNC_Unconscious;
};
_amountOfDamage;