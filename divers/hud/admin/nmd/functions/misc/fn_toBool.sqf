private [ "_value", "_exit", "_return" ];

_value = [ _this, 0, "", ["",0,true] ] call BIS_fnc_param;
_exit = false;

switch( typeName _value ) do
{

	case ( typeName "" ): {
	
		_return = ( call compile _value ) call MPF_fnc_toBool;
		
	};
	case ( typeName 0 ): {
	
		if( !( _value in [ 0, 1 ] ) ) then {
		
			[ "Number is too high or low and cannot be converted to boolean value" ] call BIS_fnc_error;
			_exit = true;
			
		} else {
		
			_return = [ false, true ] select _value;
			
		};
		
	};
	case ( typeName true ): {
	
		_return = _value;
		
	};
	
};

if( _exit ) exitWith {};

_return