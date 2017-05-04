private[ "_interval" ];

_interval = [ _this, 0, getNumber ( missionConfigFile >> "respawnDelay" ), [0] ] call BIS_fnc_param;

setPlayerRespawnTime _interval;