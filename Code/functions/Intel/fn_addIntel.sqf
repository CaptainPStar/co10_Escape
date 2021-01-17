params["_unit"];
private _intelItems = missionnamespace getvariable ["A3E_IntelItems",["Files","FileTopSecret","FilesSecret","FlashDisk","DocumentsSecret","Wallet_ID","FileNetworkStructure","MobilePhone","SmartPhone"]];
private _chance = missionnamespace getvariable ["A3E_Param_IntelChance",10];

if(_chance >= random 100) then {
	_unit addMagazine selectRandom _intelItems;
};



