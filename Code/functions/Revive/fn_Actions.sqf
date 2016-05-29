if (alive player) then 
{
	player addAction ["<t size=""1.25"" color=""#C90000"">" + "Revive (with FAK)" + "</t>", "_this spawn ATR_FNC_HandleRevive;", [cursorTarget,true], 19, true, true, "", "call ATR_FNC_Check_Revive_FAK"];
	player addAction ["<t size=""1.25"" color=""#C90000"">" + "Revive" + "</t>", "_this spawn ATR_FNC_HandleRevive;", [cursorTarget], 18, true, true, "", "call ATR_FNC_Check_Revive"];
	player addAction ["<t size=""1.25"" color=""#FFA500"">" + "Drag" + "</t>", "_this spawn ATR_FNC_Drag;", [cursorTarget], 17, false, true, "", "call ATR_FNC_Check_Revive"];
	player addAction ["<t size=""1.25"" color=""#FFA500"">" + "Put in injured" + "</t>", "_this spawn ATR_FNC_PutInVehicle;", [], 17, false, true, "", "call ATR_FNC_Check_Putin"];
	player addAction ["<t size=""1.25"" color=""#FFA500"">" + "Pull out injured" + "</t>", "_this spawn ATR_FNC_PullOutVehicle;", [], 17, false, true, "", "call ATR_FNC_Check_Pullout"];
};
