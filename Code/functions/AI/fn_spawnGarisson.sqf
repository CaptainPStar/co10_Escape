private["_buildings","_positions","_obj","_group","_side","_unitArray"];
  
_building = [_this, 0, objNull] call BIS_fnc_param;
_side = [_this, 1, 0,[0]] call BIS_fnc_param;


_positions = [_building] call a3e_fnc_findSpawnPosBuilding;
[format["Found %1 positions... initializing",count(_positions)]] spawn a3e_fnc_debugChat;
       
_unitArray = (A3E_GroupMembers select _side);
//Create a Group
_group = creategroup (A3E_Sides select _side);

  {
       _cpos = [_x select 0, _x select 1,_x select 2];
       _unit = _group createUnit [_unitArray select floor(random(count(_unitArray))), _cpos, [], 0, "NONE"];
       _unit setposASL _cpos;
       _unit setdir (_x select 4);
   } foreach _positions;