  private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
  _ctrl = _this select 0;
  _dikCode = _this select 1;
  _shift = _this select 2;
  _ctrlKey = _this select 3;
  _alt = _this select 4;
  
  _handled = false;

  if (!_shift && !_ctrlKey && !_alt) then
  {
    if (_dikCode in (actionKeys "ShowMap")) then
    {
		//((finddisplay 12) displayctrl 1202) ctrlshow false;
		((finddisplay 12) displayctrl 1202) ctrlSetText "icon_noplayer_ca.paa";
		((finddisplay 12) displayctrl 1202) ctrlEnable false;
		((finddisplay 12) displayctrl 1202) ctrlSetTooltip "Centering is disabled. Use compass and map!"
    };
  };

  _handled;  

 