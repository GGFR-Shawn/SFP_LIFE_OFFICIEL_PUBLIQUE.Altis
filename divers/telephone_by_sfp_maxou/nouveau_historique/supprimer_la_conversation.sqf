// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

_le_tableau_selectionne = [1500,lbCurSel 1500] select 1;

if (_le_tableau_selectionne == -1) exitwith {hint "Désolé, aucun nom selectionné ...";};
if (lbtext ([1500,0]) == "Aucun message reçu") exitwith {hint "Vos conversations sont vides ...";};

historique_messages_nom_joueur_by_maxou = historique_messages_nom_joueur_by_maxou - [historique_messages_nom_joueur_by_maxou select _le_tableau_selectionne];
execvm "divers\telephone_by_sfp_maxou\nouveau_historique\recompter_historique.sqf";

lbClear 1500;lbClear 1501; lbClear 1502;

[] call initialisation_du_chat;