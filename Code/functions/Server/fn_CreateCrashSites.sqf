private _crashSiteCount = ceil(random(missionNamespace getvariable["CrashSiteCountMax",3]));
for "_i" from 1 to _crashSiteCount step 1 do {
	private _pos = [] call A3E_fnc_findFlatArea;
	[_pos] spawn A3E_fnc_crashSite;
};