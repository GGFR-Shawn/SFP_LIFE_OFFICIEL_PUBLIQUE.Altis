private [ "_players" ];

_players = [];

{

	if( isPlayer _x ) then
	{
	
		[ _players, _x ] call BIS_fnc_arrayPush;
		
	};
	
} foreach ( allUnits + allDead );

_players
