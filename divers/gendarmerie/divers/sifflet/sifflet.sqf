// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================


if (isnil "jepeuxsifflet") then {jepeuxsifflet = 0;};

if (jepeuxsifflet == 0) then 
{
	if (vehicle player == player) then 
	{
		jepeuxsifflet = 1;
		_player = player;
		[[[_player],"divers\gendarmerie\divers\sifflet\sifflet_synchro.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		sleep 1.67;
		jepeuxsifflet = 0;
	};
};