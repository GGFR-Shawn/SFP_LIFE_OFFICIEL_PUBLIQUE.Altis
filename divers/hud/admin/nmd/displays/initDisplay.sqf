private [ "_mode", "_params", "_class" ];

with missionNamespace do {

	_mode = [_this,0,"",[""]] call bis_fnc_param;
	_params = [_this,1,[]] call bis_fnc_param;
	_class = [_this,2,"",[""]] call bis_fnc_param;
	_path = [_this,3,"",[""]] call bis_fnc_param;

	switch _mode do {

		case "onLoad": {
		};

	};

	//--- Register script for the first time
	_fncName = _class + "_script";
	
	if ( isNil _fncName ) then {

		//--- Set script path
		_scriptPath = format[ "divers\hud\admin\nmd\displays\%1", _path ];

		//--- Execute
		_fncFile = preprocessFileLineNumbers format [ "%1\script.sqf", _scriptPath ];
		missionNamespace setvariable [
			_fncName,
			compileFinal _fncFile
		];
	};

	[ _mode, _params, _class ] call ( missionNamespace getvariable _fncName );
	
};