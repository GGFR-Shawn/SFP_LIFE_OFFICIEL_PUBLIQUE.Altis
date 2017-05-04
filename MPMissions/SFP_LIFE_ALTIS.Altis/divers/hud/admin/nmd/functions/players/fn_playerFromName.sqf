private [ "_name", "_player", "_players" ];

_name = [ _this, 0, "", [""] ] call BIS_fnc_param;
_player = objNull;
_players = call NMD_fnc_listPlayers;

{

	if( name _x == _name ) then {
	
		_player = _x;
	
	};

} foreach _players;

_player