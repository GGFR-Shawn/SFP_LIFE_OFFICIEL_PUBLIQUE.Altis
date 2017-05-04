private[ "_time", "_gust" ];

_time = [ _this, 0, 0, [0] ] call BIS_fnc_param;
_gust = [ _this, 1, 0, [0] ] call BIS_fnc_param;

_time setGusts _gust;