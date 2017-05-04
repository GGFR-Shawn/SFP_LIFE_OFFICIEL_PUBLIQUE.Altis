// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_l_id_selectionne";
_l_id_selectionne = lbText [1500,lbCurSel 1500];
if (_l_id_selectionne == "Aucun véhicule détecté." or _l_id_selectionne == "" or lbCurSel 1500 == -1) exitwith {hint "Aucun véhicule n'est selectionné ...";};
if (isnil "liste_des_vehicules_detectes" or isnil "_l_id_selectionne") exitWith {hint "La liste des véhicules est vide !";};

deletevehicle (liste_des_vehicules_detectes select (lbCurSel 1500));

hint format ["%1 à bien été supprimé.", _l_id_selectionne];

_heure_du_log = format ["%1/%2/%3 à %4H%5Min %6:",heure_serveur select 2,heure_serveur select 1,heure_serveur select 0,heure_serveur select 3, heure_serveur select 4, name player];
_detail_log = format ["%1 à supprimé : %2", name player, _l_id_selectionne];
["Historique Vehicule Supprimer Staff", "Historique Vehicule Supprimer Staff", _heure_du_log, _detail_log] call fn_SaveToServer;	

closedialog 0; 

sleep 1;

[] execVM "divers\hud\admin\supprimer_vehicules_joueurs\menu_supprimer_vehicules_des_joueurs.sqf";