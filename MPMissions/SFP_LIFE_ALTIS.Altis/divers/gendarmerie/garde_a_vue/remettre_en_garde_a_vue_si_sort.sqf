// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_position_de_depart = getPosATL player;

while {!isnil {player getvariable "joueur_arreter"}} do
{
	if (player distance _position_de_depart > 15) then 
	{
		sleep 1; 
		jai_le_droit_de_me_tp = 1; 
		player setPosATL _position_de_depart; 
		hint "Tu es retourné en garde a vue !";
	};
	sleep 2;
	waituntil {sleep 0.1; alive player};
};