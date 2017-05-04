private[ "_time", "_lightning" ];

_time = [ _this, 0, 0, [0] ] call BIS_fnc_param;
_lightning = [ _this, 1, 0, [0] ] call BIS_fnc_param;

_time setLightnings _lightning;