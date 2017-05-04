private[ "_array", "_value", "_index" ];

_array = [ _this, 0, [], [[]] ] call BIS_fnc_param;
_value = [ _this, 1 ] call BIS_fnc_param;
_index = -1;


{

	if( _x == _value ) exitWith {

		_index = _forEachIndex;

	};

} forEach _array;

_index