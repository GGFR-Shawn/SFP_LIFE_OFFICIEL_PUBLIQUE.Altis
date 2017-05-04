private[ "_string", "_old", "_new", "_stringArray", "_length", "_oldLength", "_return", "_tmp" ];

_string = [ _this, 0, "", [""] ] call BIS_fnc_param;
_old = [ _this, 1, "", [""] ] call BIS_fnc_param;
_new = [ _this, 2, "", [""] ] call BIS_fnc_param;

_stringArray = toArray( _string );
_length = count _stringArray;
_oldLength = _old call NMD_fnc_stringLength;

_return = "";

for "_i" from 0 to ( count _stringArray )-1 do {

	_tmp = "";

	if ( _i <= _length - _oldLength ) then {

		for "_j" from _i to ( _i + _oldLength-1 ) do {

			_tmp = _tmp + toString( [ _stringArray select _j ] );

		};
	};
	if ( _tmp == _old ) then {

		_return = _return + _new;
		_i = _i + _oldLength-1;

	} else {

		_return = _return + toString( [ _stringArray select _i ] );

	};
};

_return