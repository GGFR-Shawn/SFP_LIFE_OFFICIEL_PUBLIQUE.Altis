private[ "_date", "_overcast", "_fog", "_rain", "_lightning", "_waves" ];

_date = [ _this, 0, date, [[]] ] call BIS_fnc_param;
_overcast = [ _this, 1, overcast, [0] ] call BIS_fnc_param;
_fog = [ _this, 2, fog, [0] ] call BIS_fnc_param;
_rain = [ _this, 3, -1, [0] ] call BIS_fnc_param;
_lightning = [ _this, 4, -1, [0] ] call BIS_fnc_param;
_waves = [ _this, 5, -1, [0] ] call BIS_fnc_param;

// Date

if( !( [ date, _date ] call BIS_fnc_areEqual ) ) then {

	setDate _date;
	
};

// Weather
skipTime -24; 

86400 setOvercast _overcast; 
86400 setFog _fog;


if( _waves != -1 ) then { 86400 setWaves _waves };

skipTime 24;  

[ _rain, _lightning ] spawn {

	sleep 0.3; 
	simulWeatherSync;

	// Set effects after sync
	_rain = ( _this select 0 );
	_lightning = ( _this select 1 );
	
	if( _rain != -1 ) then { 0 setRain _rain };
	sleep 1;
	if( _lightning != -1 ) then { 0 setLightnings _lightning };

};