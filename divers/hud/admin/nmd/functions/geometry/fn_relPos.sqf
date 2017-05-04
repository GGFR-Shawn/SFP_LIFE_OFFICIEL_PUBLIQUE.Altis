private[ "_pos", "_dir", "_dist" ];

_pos = [ _this, 0, [], [[], objNull] ] call BIS_fnc_param;
_dir = [ _this, 1, 0, [0] ] call BIS_fnc_param;
_dist = [ _this, 2, 10, [0] ] call BIS_fnc_param;

if( typename _pos == typename objNull ) then { _pos = getPosATL _pos };
if ( count _pos < 2 ) exitwith { [ "No origin position given" ] call BIS_fnc_error };

if ( count _pos == 3 ) then {

	_pos = [ ( _pos select 0 ) + ( _dist * sin _dir ), ( _pos select 1 ) + ( _dist * cos _dir ), _pos select 2 ];

} else {

	_pos = [ ( _pos select 0 ) + ( _dist * sin _dir ), ( _pos select 1 ) + ( _dist * cos _dir ) ];

};

_pos