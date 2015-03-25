/*
 * Summary: Rotates a position around a center position.
 * Arguments:
 *   _centerPos: Center position to rotate around.
 *   _pos: Position that will be rotated.
 *   _dir: Direction (angle) to rotate.
 *   Author: Engima (CommonLib)
 */
private ["_centerPos", "_pos", "_dir"];
private ["_px", "_py", "_mpx", "_mpy", "_ma", "_rpx", "_rpy"];

_centerPos = _this select 0;
_pos = _this select 1;
_dir = _this select 2;

    _px = _pos select 0;
    _py = _pos select 1;
    _mpx = _centerPos select 0;
    _mpy = _centerPos select 1;
    _ma = _dir;

    //Now, rotate point
    _rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
    _rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;

[_rpx, _rpy, 0]
