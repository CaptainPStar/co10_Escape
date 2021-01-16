_activated = player getVariable ["EarplugsActivated", false];

if (_activated) then {
    1 fadeSound 1;
    player setVariable ["EarplugsActivated", false];
    ctrlDelete (player getVariable "EarplugsImage");
    ctrlDelete (player getVariable "EarplugsText");
} else {
    1 fadeSound 0.4;
    player setVariable ["EarplugsActivated", true];

    with uiNamespace do
    {
        txt = findDisplay 46 ctrlCreate ["RscText", -1];
        txt ctrlSetPosition [1.5, 0.55];
        txt ctrlSetText localize "STR_A3E_toggleEarplugs_inserted";
        txt ctrlCommit 0;
        player setVariable ["EarplugsText", txt];

        img = findDisplay 46 ctrlCreate ["RscPicture", -1];
        img ctrlSetPosition [1.55, 0.5];
        img ctrlSetScale 0.25;
        img ctrlSetText "\A3\ui_f\data\igui\cfg\simpletasks\types\listen_ca.paa";
        img ctrlCommit 0;
        player setVariable ["EarplugsImage", img];
    };
};

true;
