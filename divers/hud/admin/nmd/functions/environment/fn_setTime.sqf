private[ "_time" ];

_time = [ _this, 0, 0, [0] ] call BIS_fnc_param;

skipTime ( ( _time - daytime + 24 ) % 24 );