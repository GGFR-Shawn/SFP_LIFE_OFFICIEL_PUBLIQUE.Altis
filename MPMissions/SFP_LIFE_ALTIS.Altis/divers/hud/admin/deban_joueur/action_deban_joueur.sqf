// =======================================================================================================================================================================================
																// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
																  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private "_l_id_selectionne";
_l_id_selectionne = lbText [1500,lbCurSel 1500];
if (_l_id_selectionne == "Personne n'est banni actuellement.") exitwith {hint "Aucune ID n'est selectionnée ...";};
if (lbCurSel 1500 == -1) exitwith {hint "Aucune ID n'est selectionnée ...";};
if (isnil "listes_joueurs_banni_automatiquement") exitWith {hint "La liste des joueurs banni automatiquement est vide !";};
if (isnil "_l_id_selectionne") exitWith {hint "La liste de selection est vide !";};

listes_joueurs_banni_automatiquement = listes_joueurs_banni_automatiquement - [_l_id_selectionne];
listes_joueurs_banni_automatiquement = listes_joueurs_banni_automatiquement - [""];
publicvariable "listes_joueurs_banni_automatiquement";
publicvariable "rescan_mettre_a_jour_liste_ban_auto";

hint format ["L'ID %1 à bien été débanni. Merci.", _l_id_selectionne];

closedialog 0; 
[] execVM "divers\hud\admin\deban_joueur\menu_deban_joueur.sqf";