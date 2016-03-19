private _return = false;
private _target = cursorTarget;
private _isPlayerUnconscious = player getVariable ["AT_Revive_isUnconscious", false];
private _isDragging = player getVariable ["AT_Revive_isDragging",false];

if( !alive player || _isPlayerUnconscious || !isNull(_isDragging) || isNil "_target" || !alive _target || (!isPlayer _target && !AT_Revive_Debug) || (_target distance player) > 2 ) exitWith
{
	_return;
};

// Target of the action
private _isTargetUnconscious = _target getVariable ["AT_Revive_isUnconscious",false];
private _isDragged = _target getVariable ["AT_Revive_isDragged",false]; 

if(_isTargetUnconscious && isNull(_isDragged)) then
{
	_return = true;
};
	
_return;