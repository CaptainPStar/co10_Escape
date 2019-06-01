params ["_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
private _handled = false;

if (!_shift && !_ctrlKey && !_alt) then
{
  if (_dikCode in (actionKeys "ShowMap")) then
  {
	//((finddisplay 12) displayctrl 1202) ctrlshow false;
	((finddisplay 12) displayctrl 1202) ctrlSetText "icon_noplayer_ca.paa";
	((finddisplay 12) displayctrl 1202) ctrlEnable false;
	((finddisplay 12) displayctrl 1202) ctrlSetTooltip localize "STR_A3E_KeyDown_centeringDisabled"
  };
};

_handled;  

