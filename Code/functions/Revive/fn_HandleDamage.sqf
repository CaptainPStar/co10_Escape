params["_unit","_bodyPart","_amountOfDamage","_killer","_projectile"];
//["HitFace","HitNeck","HitPelvis","HitAbdomen","HitDiaphragm","HitChest","HitArms","HitHead","HitBody","HitHands","HitLegs"]
//["face_hub","neck","pelvis","spine1","spine2","spine3","arms","head","body","hands","legs"]
if (alive _unit
	&& {_amountOfDamage >= 1}
	&& {!(_unit getVariable ["AT_Revive_isUnconscious",false])}
	&& {_bodyPart in ["","head","face_hub","head_hit","neck","spine1","spine2","spine3","pelvis","body"]}
) then {
	_unit setDamage 0;
	_unit allowDamage false;
	_amountOfDamage = 0;
	[_unit, _killer] spawn ATR_FNC_Unconscious;
};
_amountOfDamage;
