/*
 * Summary: Rotates a position around a center position.
 * Arguments:
 *   _centerPos: Center position to rotate around.
 *   _pos: Position that will be rotated.
 *   _dir: Direction (angle) to rotate.
 *   Author: Engima modified by NeoArmageddon cleaned up by kuroneko
 */
params ["_centerPos", "_pos", "_dir"];
_pos params ["_px", "_py", ["_pz", 0]];
_centerPos params ["_mpx", "_mpy"];

private _ma = _dir;

//Now, rotate point
private _rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
private _rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;

[_rpx, _rpy, _pz];
