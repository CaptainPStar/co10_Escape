!isNull cursorTarget
	&& {isNull (player getVariable ["AT_Revive_isDragging",objNull])}
	&& {alive cursorTarget}
	&& {isPlayer cursorTarget || AT_Revive_Debug}
	&& {(cursorTarget distance player) <= 2}
	&& {cursorTarget getVariable ["AT_Revive_isUnconscious",false]}
	&& {isNull (cursorTarget getVariable ["AT_Revive_isDragged",objNull])}
;
