private[ "_time", "_overcast" ];

_time = [ _this, 0, 0, [0] ] call BIS_fnc_param;
_overcast = [ _this, 1, 0, [0] ] call BIS_fnc_param;

_time setOvercast _overcast;