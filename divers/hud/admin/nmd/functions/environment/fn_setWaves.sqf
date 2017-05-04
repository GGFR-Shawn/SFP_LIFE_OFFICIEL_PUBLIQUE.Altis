private[ "_time", "_waves" ];

_time = [ _this, 0, 0, [0] ] call BIS_fnc_param;
_waves = [ _this, 1, 0, [0] ] call BIS_fnc_param;

_time setWaves _waves;