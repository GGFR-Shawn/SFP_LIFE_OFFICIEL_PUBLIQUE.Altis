// =====================================================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =====================================================================================================================================================================================================================

if (isnil "le_joueur_selectionne_informations_admin") exitwith {hint "Erreur sur la personne recherché !";};
if (nom_du_menu_informations_des_joueurs select 0 == "Aucun joueur connecté ...") exitwith {hint "Nonnnnn ! Même ici je dois ajouter des sécurités !!! ^^ Tu sais pas lire ?!!! :D";};

_position_a_ce_tp = getPosATL le_joueur_selectionne_informations_admin;

if (_position_a_ce_tp select 2 > 2) exitwith {titletext ["Impossible, le joueur n'est pas au sol !","PLAIN DOWN"];};
if (speed le_joueur_selectionne_informations_admin > 10) exitwith {titletext ["Impossible, le joueur n'est pas a l'arret !","PLAIN DOWN"];};

player setpos _position_a_ce_tp;

titletext [format ["TP réussi, n'abuses pas ou tu sais ce que je ferais monsieur %1 ^^",name player],"PLAIN DOWN"];

_heure_du_log = format ["%1/%2/%3 à %4H%5Min (ARMA :%6): ", heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, daytime];
_detail_du_log = format ["%1 a été tp sur %2",name player, name le_joueur_selectionne_informations_admin];
["Historique action modo", "Historique action modo", _heure_du_log, _detail_du_log] call fn_SaveToServer;
