// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call compter_personne_dans_mon_groupe; 
if (nombre_de_personne_dans_mon_group <= 1) exitwith {player globalchat "Vous n'etes pas dans un groupe ...";};

if (name player == name leader (group player)) exitwith {player globalchat "Désolé, vous etes déja le leader du groupe !";};

[[[group player, player],"divers\groupe_des_joueurs\leader_du_groupe_synchronisation.sqf"],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;

player globalchat "Vous êtes passé leader de votre groupe ...";

