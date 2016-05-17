!isNull cursorTarget
	&& {!isNull(player getVariable ["AT_Revive_isDragging",objNull])}
	&& {(cursorTarget distance player) <= 8}
	&& {cursorTarget emptyPositions "cargo" > 0}
;
