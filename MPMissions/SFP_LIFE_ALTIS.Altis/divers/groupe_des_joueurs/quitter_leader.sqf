// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

[] call compter_personne_dans_mon_groupe; 
if (nombre_de_personne_dans_mon_group <= 1) exitwith {player globalchat "Vous n'etes pas dans un groupe ...";};

if (name player != name leader (group player)) exitwith {player globalchat format ["Désolé, vous n'etes pas le leader. Le leader est %1 !",name leader (group player)];};

_choix_nouveau_leader = count personne_actuellement_dans_mon_groupe;
_validation_nouveau_leader = personne_actuellement_dans_mon_groupe select (round (random _choix_nouveau_leader));

if (isnil "_validation_nouveau_leader") exitwith {player globalchat "Désolé, vous êtes seul dans votre groupe !";};

group player selectLeader _validation_nouveau_leader;
player globalchat format ["Vous n'êtes plus leader. %1 à été désigné automatiquement ...",name _validation_nouveau_leader];

