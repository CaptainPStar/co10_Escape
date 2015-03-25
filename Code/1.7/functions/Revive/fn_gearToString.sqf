/* 
    This script will allow you to copy to clipboard the current gear of any unit, allowing you to paste it in the init box of another unit in the editor, or use it in another script to equip a unit. 
    It is mainly for customizing your gear using ammo crates or VAS and then being able to use the custom loadout easily in a mission on any unit. All gear and attachments will be in the correct slots! 

    Execute on any unit via init/trigger/other script, replacing [this] with [unitName] or [player] if needed: 

    nul = [this] execVM "copyUnitGearToClipboard.sqf"; 
    nul = [player] execVM "copyUnitGearToClipboard.sqf"; 
    nul = [unit1] execVM "copyUnitGearToClipboard.sqf"; 

    When it executes a hint will be displayed showing the output and it is also copied to clipboard for you to paste somewhere else. 

    !!!***Thank you to NeoArmageddon for the permission to share this, basically most of the working code is his. All I did was modify it to copy to clipboard instead of copying to another unit. I also had to script alternative methods for some things because it doesn't work the same as directly copying the gear to another unit in game as the original script does***!!! 

    Modified from the original Script found at http://forums.bistudio.com/showthread.php?169876-Script-Copy-a-units-loadout 
    Author: NeoArmageddon 
    Website: www.modfact.net 
*/ 
        private["_unit","_weapons","_assigned_items","_primary","_array","_blacklist","_gearText","_headGear","_vest","_uniform","_backpack","_goggles", "_handgun"]; 

        _unit = [_this,0,objnull,[objnull]] call bis_fnc_param; 
        _gearText = ""; 
        //_primary = primaryWeapon _unit; //not used as variable 
        //_weapons = weaponsItems _unit; //not used as variable 
        //_handgun = handgunWeapon _unit; //not used as variable 
        _headGear = ""; 
        _vest = ""; 
        _uniform = ""; 
        _backpack = ""; 
        _goggles = ""; 

        _gearText = _gearText + "removeAllWeapons _unit; "; 
        _gearText = _gearText + "removeAllAssignedItems _unit; "; 
        _gearText = _gearText + "removeAllContainers _unit; "; 
        _gearText = _gearText + "removeHeadgear _unit; "; 
        _gearText = _gearText + "removeGoggles _unit; "; 

        if((headgear _unit)!="") then { 
            _headGear = headgear _unit; 
            _gearText = _gearText + format ["_unit addHeadgear '%1'; ", _headGear]; 
        }; 
        if((goggles _unit)!="") then { 
            _goggles = goggles _unit; 
            _gearText = _gearText + format ["_unit addGoggles '%1'; ", _goggles]; 
        }; 
        if((uniform _unit)!="") then { 
            _uniform = uniform _unit; 
            _gearText = _gearText + format ["_unit addUniform '%1'; ", _uniform]; 
        }; 
        if((vest _unit)!="") then { 
            _vest = vest _unit; 
            _gearText = _gearText + format ["_unit addVest '%1'; ", _vest]; 
        }; 
        if((backpack _unit)!="") then { 
            _backpack = backpack _unit; 
            _gearText = _gearText + format ["_unit addBackPack '%1'; ", _backpack]; 
        }; 

        //_blacklist = ["Rangefinder","Binocular"]; //binoculars and rangefinders don't get copied! 
        _blacklist = [""]; 
        { 
            if((_x select 0)!="" && !((_x select 0) in _blacklist)) then { 
                //_unit will get the current loaded magazine in the weapon 
                if(count(_x)>4) then { 
                    //_gearText = _gearText + format ["_unit addmagazine '%1'; ", [(_x select 4) select 0,(_x select 4) select 1]]; //weapon starts with no magazine! 
                    _gearText = _gearText + format ["_unit addmagazine '%1'; ", ((_x select 4) select 0)]; 
                }; 
                if(count(_x)>5) then { 
                    //_gearText = _gearText + format ["_unit addmagazine '%1'; ", [(_x select 5) select 0,(_x select 5) select 1]]; //weapon starts with no magazine! 
                    _gearText = _gearText + format ["_unit addmagazine '%1'; ", ((_x select 5) select 0)]; 
                }; 
                if((_x select 0) != "")then{_gearText = _gearText + format ["_unit addweapon '%1'; ", (_x select 0)];}; 
                //if((_x select 1) != "")then{_gearText = _gearText + format ["_unit linkItem '%1'; ", (_x select 1)];}; //does not add the attachment 
                //if((_x select 2) != "")then{_gearText = _gearText + format ["_unit linkItem '%1'; ", (_x select 2)];}; //does not add the attachment 
                //if((_x select 3) != "")then{_gearText = _gearText + format ["_unit linkItem '%1'; ", (_x select 3)];}; //does not add the attachment 
            }; 
        } foreach (weaponsItems _unit); 
        //Now the attachments get added! 
        { 
            if(_x != "") then{_gearText = _gearText + format ["_unit addPrimaryWeaponItem '%1'; ", _x];}; 
        } foreach (primaryWeaponItems _unit); 

        { 
            if(_x != "") then{_gearText = _gearText + format ["_unit addHandgunItem '%1'; ", _x];}; 
        } foreach (handgunItems _unit); 

        _array = getItemCargo uniformContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToUniform '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getMagazineCargo uniformContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToUniform '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getWeaponCargo uniformContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToUniform '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getItemCargo vestContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToVest '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getMagazineCargo vestContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToVest '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getWeaponCargo vestContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToBackpack '%1'; ", _x]; ///////WEIRD?????\\\\\\\\\\ 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getItemCargo backpackContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToBackpack '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getMagazineCargo backpackContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToBackpack '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        _array = getWeaponCargo backpackContainer _unit; 
        if(count(_array)>0) then { 
            { 
                for[{_i=0},{_i<((_array) select 1) select _forEachIndex},{_i=_i+1}] do { 
                    _gearText = _gearText + format ["_unit addItemToBackpack '%1'; ", _x]; 
                }; 
            } foreach ((_array) select 0); 
        }; 

        { 
            _gearText = _gearText + format ["_unit linkItem '%1'; ", _x]; 
        } foreach assignedItems _unit; 

        _gearText; 
