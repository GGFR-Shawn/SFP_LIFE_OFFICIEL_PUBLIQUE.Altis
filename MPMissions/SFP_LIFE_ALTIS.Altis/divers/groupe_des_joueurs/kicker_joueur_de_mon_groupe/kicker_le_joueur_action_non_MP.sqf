// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_qui_kicker = lbtext [1500, lbcursel 1500];

[[[_qui_kicker,name player],"divers\groupe_des_joueurs\kicker_joueur_de_mon_groupe\kicker_le_joueur_action_MP.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
