private [ "_param", "_isBool", "_config", "_return" ];

_param = [ _this, 0, "", [""] ] call BIS_fnc_param;
_isBool = [ _this, 1, false, [true] ] call BIS_fnc_param;
_config = ( missionConfigFile >> "Params" );

if( isClass ( _config ) ) then {

	for "_i" from 0 to ( ( count _config ) -1 ) do {

		if( ( configName ( _config select _i ) ) == _param ) exitWith {
		
			_return = ( paramsArray select _i );
			
		};
		
	};
	
};

if( isNil { _return } ) exitWith {

	[ "Unable to find %1 in mission params", _param ] call BIS_fnc_error;
	nil
	
};

if( _isBool ) then {

	_return = _return call NMD_fnc_toBool;
	
};
	

_return