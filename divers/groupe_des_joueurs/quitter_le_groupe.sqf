// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call compter_personne_dans_mon_groupe; 
if (nombre_de_personne_dans_mon_group <= 1) exitwith {player globalchat "Vous n'etes pas dans un groupe ...";};

[player] join grpNull;

player globalchat "Votre groupe à bien été quitté ...";
