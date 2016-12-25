_injured = param[0];
_vehicle = param[1];
_injured setUnconscious false;
_injured moveInCargo _vehicle;
_injured setUnconscious true;