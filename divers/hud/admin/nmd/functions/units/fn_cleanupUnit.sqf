_this spawn {

	private[ "_unit", "_cleanupWait" ];

	_unit = [ _this, 0, objNull, [objNull] ] call BIS_fnc_param;
	_cleanupWait = [ _this, 1, 120, [0] ] call BIS_fnc_param;

	sleep _cleanupWait;

	if( _unit isKindOf "Man" ) then {

		[ _unit, "NMD_fnc_hideBody" ] spawn BIS_fnc_MP;
		sleep 7;
		
	};

	deleteVehicle _unit;

};