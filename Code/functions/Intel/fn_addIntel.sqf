params["_unit"];
private _intelItems = missionnamespace getvariable ["A3E_IntelItems",["Files","FileTopSecret","FilesSecret","FlashDisk","DocumentsSecret","Wallet_ID","FileNetworkStructure","MobilePhone","SmartPhone"]];
private _chance = missionnamespace getvariable ["A3E_Param_IntelChance",20];

if(_chance >= random 100) then {

	private _containers = [];
	if(!isNull(uniformContainer _unit)) then {_containers pushBack 1;};
	if(!isNull(vestContainer _unit)) then {_containers pushBack 2;};
	if(!isNull(backpackContainer _unit)) then {_containers pushBack 3;};
	private _intAmount = selectRandom [1,1,1,1,2];
	for [{ _i = 0 }, { _i < _intAmount }, { _i = _i + 1 }] do {		
		switch (selectRandom _containers) do {
			case 1: { _unit addItemToUniform (selectRandom _intelItems); };
			case 2: { _unit addItemToVest (selectRandom _intelItems);};
			case 3: { _unit addItemToBackpack (selectRandom _intelItems);};
			default { _unit addMagazineGlobal (selectRandom _intelItems);};
		};
	};
};



