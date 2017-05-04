// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

private ["_parametrage_du_tableau", "_prise_en_compte_du_tableau"];
_parametrage_du_tableau = parametrage_equipement_des_armes_prises_de_gang; 
_prise_en_compte_du_tableau = equipements_des_armes_prises_de_gang;
if (isnil "_parametrage_du_tableau" or isnil "_prise_en_compte_du_tableau") exitwith {hint "Erreur choix du tableau, recommence ...";};

// =======================================================================================================================================================================================
															// !!! LANCEMENT CONFIGURATION NE PAS TOUCHER !!!!!!
// =======================================================================================================================================================================================
_position_choix_dans_le_dialogue = (lbCurSel (_parametrage_du_tableau select 3));
_ou_prendre_l_argent = _parametrage_du_tableau select 1;

_son_nom = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 0;
_choix_de_l_accessoires = (_prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 1) call bis_fnc_selectrandom; 
_son_prix = _prise_en_compte_du_tableau select _position_choix_dans_le_dialogue select 2;

if (isnil "_position_choix_dans_le_dialogue" or isnil "_ou_prendre_l_argent" or isnil "_son_nom" or isnil "_choix_de_l_accessoires" or isnil "_son_prix") exitwith {hint "Erreur sur le choix, recommence ...";};
if (player getVariable _ou_prendre_l_argent < _son_prix) exitwith {Hint format ["Vous avez %1 Euros et il vous faut %2 Euros",(player getVariable _ou_prendre_l_argent),(_son_prix)];};
if !(player canAdd _choix_de_l_accessoires) exitwith {hint "Impossible, vous n'avez plus de place !";};

player setVariable [_ou_prendre_l_argent, (player getvariable _ou_prendre_l_argent) - _son_prix,true]; autorisation_mouvement_argent = true; playSound "son_mouvement_argent_sfp";
hint format['------------------------------------------------ \n ! ACHAT ACCESSOIRES ! \n ------------------------------------------------ \n\n Vous avez acheté : %1. \n Prix : %2 Euros. \n\n Il vous reste %3 Euros. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr',_son_nom, _son_prix, (player getVariable _ou_prendre_l_argent) call retour_formatage_chiffre_sfp];
player addItem _choix_de_l_accessoires;

