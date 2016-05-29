params["_vector","_rotations"];
private _aroundX = _rotations select 0; 
private _aroundY = _rotations select 1; 
private _aroundZ = (360 - (_rotations select 2)) - 360; 
private _dirX = _vector select 0; 
private _dirY = _vector select 1; 
private _dirZ = _vector select 2; 

if (_aroundX != 0) then { 
	_dirY = cos _aroundX; 
	_dirZ = sin _aroundX; 
}; 
if (_aroundY != 0) then { 
	_dirX = _dirZ * sin _aroundY; 
	_dirZ = _dirZ * cos _aroundY; 
}; 
if (_aroundZ != 0) then { 
	_dirXTemp = _dirX; 
	_dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
	_dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
}; 
_dir = [_dirX,_dirY,_dirZ]; 
_dir;