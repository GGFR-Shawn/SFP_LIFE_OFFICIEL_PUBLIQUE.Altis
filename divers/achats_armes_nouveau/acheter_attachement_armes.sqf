// =======================================================================================================================================================================================
													// By Maxou - www.sfpteam.fr - INTERDICTION DE RECOPIER !! //
													  // Poursuite pénal possible ! Voir amar.arma3.fr //
// =======================================================================================================================================================================================

// Choix 0 = Attachements Gangs.
// Choix 1 = Attachements Civils.
// Choix 2 = Attachements Gendarmes.

// =======================================================================================================================================================================================
														// INITIALISATION DU TABLEAU ET CONFIGURATION AUTOMATIQUE
// =======================================================================================================================================================================================
private ["_numero_choix_accessoires", "_parametrage_du_tableau", "_prise_en_compte_du_tableau", "_liste_recherche_informations_armes", "_prix_de_depart"];
if (player distance (getpos base_gang) < 22) then {_numero_choix_accessoires = 0;};
if (player in list menu_civils_choix_armes_zero or player in list menu_civils_choix_armes_un) then {_numero_choix_accessoires = 1;};
if (player in list menu_gendarmes_choix_armes) then {_numero_choix_accessoires = 2;};
if (player in list menu_gign_choix_armes) then {_numero_choix_accessoires = 3;};
if (player in list reperepourmarchenoir) then {_numero_choix_accessoires = 4;};
if (isnil "_numero_choix_accessoires") exitwith {hint "Erreur numéro du dialogue, recommence !";};

if (_numero_choix_accessoires == 0) then {_parametrage_du_tableau = parametrage_equipement_des_armes_Gangs; _prise_en_compte_du_tableau = equipements_des_armes_SFP_GANG;};
if (_numero_choix_accessoires == 1 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_equipement_des_armes_Civils_Et_Gendarmes; _prise_en_compte_du_tableau = equipements_des_armes_SFP_Civils;};
if (_numero_choix_accessoires == 1 && revive_mon_side == west) then {_parametrage_du_tableau = parametrage_equipement_des_armes_Civils_Et_Gendarmes; _prise_en_compte_du_tableau = equipements_des_armes_SFP_Gendarmes;};
if (_numero_choix_accessoires == 2) then {_parametrage_du_tableau = parametrage_equipement_des_armes_Civils_Et_Gendarmes; _prise_en_compte_du_tableau = equipements_des_armes_SFP_Gendarmes;};
if (_numero_choix_accessoires == 3) then {_parametrage_du_tableau = parametrage_equipement_des_armes_Civils_Et_Gendarmes; _prise_en_compte_du_tableau = equipements_des_armes_SFP_GIGN;};
if (_numero_choix_accessoires == 4 && revive_mon_side == civilian) then {_parametrage_du_tableau = parametrage_equipement_des_armes_Civils_Et_Gendarmes; _prise_en_compte_du_tableau = equipements_des_armes_SFP_Civils_Illegales;};

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
hint format['------------------------------------------------ \n ! ACHAT ACCESSOIRES ! \n ------------------------------------------------ \n\n Vous avez acheté : %1. \n Prix : %2 Euros. \n\n Il vous reste %3 Euros. \n --------------------------------------------- \n By Maxou \n www.sfpteam.fr',_son_nom, (_son_prix) call retour_formatage_chiffre_sfp, (player getVariable _ou_prendre_l_argent) call retour_formatage_chiffre_sfp];
player addItem _choix_de_l_accessoires;

