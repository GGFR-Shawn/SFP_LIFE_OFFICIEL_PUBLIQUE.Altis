private[ "_time", "_fog" ];

_time = [ _this, 0, 0, [0] ] call BIS_fnc_param;
_fog = [ _this, 1, 0, [0,[]] ] call BIS_fnc_param;

_time setFog _fog;