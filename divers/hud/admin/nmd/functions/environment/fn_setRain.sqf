private[ "_time", "_rain" ];

_time = [ _this, 0, 0, [0] ] call BIS_fnc_param;
_rain = [ _this, 1, 0, [0] ] call BIS_fnc_param;

_time setRain _rain;