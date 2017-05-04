private[ "_string", "_stringArray", "_return" ];

_string = [ _this, 0, "", [""] ] call BIS_fnc_param;
_stringArray = toArray( _string );

_return = [];

for "_i" from 0 to ( count _stringArray )-1 do {

	_return = _return + [ toString( [ _stringArray select _i ] ) ];

};

_return